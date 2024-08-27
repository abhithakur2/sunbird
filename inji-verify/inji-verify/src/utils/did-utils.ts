import {getResolver} from 'web-did-resolver';
import {Resolver} from 'did-resolver';
import {SUPPORTED_DID_METHODS} from "./config";

const getDIDMethod = (did: string) => {
    const regex = /^did:([^:]+):/;
    const match = did?.match(regex);
    return match ? match[1] : "";
}

export const resolveDid = async (did: string)  => {
    console.log("===ee33====")
    const didMethod = getDIDMethod(did);
    console.log("===didMethod===",didMethod)
    console.log("===SUPPORTED_DID_METHODS===",SUPPORTED_DID_METHODS)

    if (SUPPORTED_DID_METHODS.indexOf(didMethod) === -1)
        throw new Error(`Unsupported DID method: ${didMethod}. DID: ${did}`);
    const webResolver = getResolver();
    let didResolver = new Resolver({
        ...webResolver
    });

    return await didResolver.resolve(did);
}
