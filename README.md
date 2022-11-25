sls-ad-blocking-cloudflare-gateway
====

Codes are from the blog below,

- [Serverless Ad Blocking with Cloudflare Gateway | Marco Lancini](https://blog.marcolancini.it/2022/blog-serverless-ad-blocking-with-cloudflare-gateway/)

## tl;dr

This is a serverless ad blocking solution with Cloudflare Gateway.
If you use static IP address on your home, then you set your IP address to the `DNS Locations` and set the Cloudflare Gateway's DNS servers to your router's DNS servers.


```bash
export CLOUDFLARE_API_TOKEN=xxx
$ echo cloudflare_account_id="$YOUR_CLOUDFLARE_ACCOUNT_ID" > terraform.tfvars
$ terraform plan

# or use environment variables
# $ TF_VAR_cloudflare_account_id=$YOUR_CLOUDFLARE_ACCOUNT_ID terraform plan
```
