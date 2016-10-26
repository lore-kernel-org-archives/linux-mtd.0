Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzMSf-0007g5-4r
 for linux-mtd@lists.infradead.org; Wed, 26 Oct 2016 11:33:39 +0000
Message-ID: <581093C5.7080105@huawei.com>
Date: Wed, 26 Oct 2016 19:30:13 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Dan Carpenter
 <dan.carpenter@oracle.com>
CC: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
Subject: Re: [bug report] UBI: Fastmap: Do not add vol if it already exists
References: <20161025204607.GA27826@elgon.mountain>	<58100B0B.3030906@huawei.com>	<20161026082536.GP4418@mwanda>
 <20161026112346.40588a81@bbrezillon>
In-Reply-To: <20161026112346.40588a81@bbrezillon>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 10/26/2016 5:23 PM, Boris Brezillon wrote:
> + Richard
> 
> On Wed, 26 Oct 2016 11:25:36 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
>> On Wed, Oct 26, 2016 at 09:46:51AM +0800, Sheng Yong wrote:
>>> Hi Dan,
>>>
>>> On 10/26/2016 4:46 AM, Dan Carpenter wrote:  
>>>> Hello shengyong,
>>>>
>>>> The patch e96a8a3bb671: "UBI: Fastmap: Do not add vol if it already
>>>> exists" from May 26, 2015, leads to the following static checker
>>>> warning:
>>>>
>>>> 	drivers/mtd/ubi/fastmap.c:712 ubi_attach_fastmap()
>>>> 	warn: PTR_ERR(av) is never (-22)
>>>>
>>>> drivers/mtd/ubi/fastmap.c
>>>>    703  
>>>>    704                  av = add_vol(ai, be32_to_cpu(fmvhdr->vol_id),
>>>>    705                               be32_to_cpu(fmvhdr->used_ebs),
>>>>    706                               be32_to_cpu(fmvhdr->data_pad),
>>>>    707                               fmvhdr->vol_type,
>>>>    708                               be32_to_cpu(fmvhdr->last_eb_bytes));
>>>>    709  
>>>>    710                  if (!av)
>>>>    711                          goto fail_bad;
>>>>    712                  if (PTR_ERR(av) == -EINVAL) {
>>>>
>>>> av is either -EEXIST or -ENOMEM.  It's never -EINVAL.  
>>> The commit e96a8a3bb671 ("UBI: Fastmap: Do not add vol if it already exists")
>>> adds a "return ERR_PTR(-EINVAL);" to add_vol(). So I think av could be -EINVAL.
>>> You mean add_vol should return -EEXIST instead of -EINVAL?
>>>  
>>
>> Oh, ah.  I'm on linux-next.  Commit de4c455b3e9f ("UBI: factorize code
>> used to manipulate volumes at attach time") removed the -EINVAL.
>>
>> It's really Boris to blame for this warning.  I'm not sure what the fix
>> is.
> 
> Yes, sorry, I didn't notice the caller was explicitly testing for
> -EINVAL.
> 
> Here is a patch fixing the problem:
> 
> --->8---
>>From 66d46bb212a8fcdcdd54def051492abb1668f1b2 Mon Sep 17 00:00:00 2001
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> Date: Wed, 26 Oct 2016 11:17:03 +0200
> Subject: [PATCH] UBI: fastmap: Fix add_vol() return value test in
>  ubi_attach_fastmap()
> 
> Commit e96a8a3bb671 ("UBI: Fastmap: Do not add vol if it already
> exists") introduced a bug by changing the possible error codes returned
> by add_vol():
> - this functions no longer returns NULL in case of allocation failure
>   but return ERR_PTR(-ENOMEM)
> - when a duplicate entry in the volume RB tree is found it returns
>   ERR_PTR(-EEXIST) instead of ERR_PTR(-EINVAL)
> 
> Fix the tests done of add_vol() return value accordingly.
> 
> Fixes: e96a8a3bb671 ("UBI: Fastmap: Do not add vol if it already exists")
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/ubi/fastmap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index d6384d965788..eb39c44726e3 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -707,11 +707,11 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  			     fmvhdr->vol_type,
>  			     be32_to_cpu(fmvhdr->last_eb_bytes));
>  
> -		if (!av)
> -			goto fail_bad;
> -		if (PTR_ERR(av) == -EINVAL) {
> -			ubi_err(ubi, "volume (ID %i) already exists",
> -				fmvhdr->vol_id);
> +		if (IS_ERR(av)) {
> +			if (PTR_ERR(av) == -EEXIST)
> +				ubi_err(ubi, "volume (ID %i) already exists",
> +					fmvhdr->vol_id);
> +
>  			goto fail_bad;
>  		}
> 
> .
> 
Acked-by: Sheng Yong <shengyong1@huawei.com>

thanks,
Sheng
