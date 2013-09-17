Received: from mail-db9lp0251.outbound.messaging.microsoft.com
 ([213.199.154.251] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLklN-00074p-SJ
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 02:11:38 +0000
Message-ID: <5237BAA9.6000606@freescale.com>
Date: Tue, 17 Sep 2013 10:12:57 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: fix memory leak in ONFI extended parameter page
References: <1379381512-2007-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1379381512-2007-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA09=D4=C217=C8=D5 09:31, Brian Norris =D0=B4=B5=C0:
> This fixes a memory leak in the ONFI support code for detecting the
> required ECC levels from this commit:
>
>   commit 6dcbe0cdd83fb5f77be4f44c9e06c535281c375a
>   Author: Huang Shijie <b32955@freescale.com>
>   Date:   Wed May 22 10:28:27 2013 +0800
>
>       mtd: get the ECC info from the Extended Parameter Page
>
> In the success case, we never freed the 'ep' buffer.
>
> Also, this fixes an oversight in the same commit where we (harmlessly)
> freed the NULL pointer.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Huang Shijie <b32955@freescale.com>
> ---
> David, if there are no objections, can you send this to Linus for 3.12?
>
> If this doesn't make it into 3.12, then it will be -stable material.
>
>  drivers/mtd/nand/nand_base.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index d4578a1..00022b4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2869,10 +2869,8 @@ static int nand_flash_detect_ext_param_page(stru=
ct mtd_info *mtd,
> =20
>  	len =3D le16_to_cpu(p->ext_param_page_length) * 16;
>  	ep =3D kmalloc(len, GFP_KERNEL);
> -	if (!ep) {
> -		ret =3D -ENOMEM;
> -		goto ext_out;
> -	}
> +	if (!ep)
> +		return -ENOMEM;
> =20
>  	/* Send our own NAND_CMD_PARAM. */
>  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> @@ -2920,7 +2918,7 @@ static int nand_flash_detect_ext_param_page(struc=
t mtd_info *mtd,
>  	}
> =20
>  	pr_info("ONFI extended param page detected.\n");
> -	return 0;
> +	ret =3D 0;
> =20
>  ext_out:
>  	kfree(ep);
good catch!

Acked-by: Huang Shijie <b32955@freescale.com>
