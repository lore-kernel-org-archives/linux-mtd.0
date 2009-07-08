Received: from bear.ext.ti.com ([192.94.94.41])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOQaf-0006Qu-V3
	for linux-mtd@lists.infradead.org; Wed, 08 Jul 2009 06:25:20 +0000
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id n686P7Nn001887
	for <linux-mtd@lists.infradead.org>; Wed, 8 Jul 2009 01:25:12 -0500
Received: from webmail.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id n686P4Mt007513
	for <linux-mtd@lists.infradead.org>;
	Wed, 8 Jul 2009 01:25:06 -0500 (CDT)
Message-ID: <57353.192.168.10.89.1247034306.squirrel@dbdmail.itg.ti.com>
In-Reply-To: <61715.192.168.10.89.1246967805.squirrel@dbdmail.itg.ti.com>
References: <61715.192.168.10.89.1246967805.squirrel@dbdmail.itg.ti.com>
Date: Wed, 8 Jul 2009 11:55:06 +0530 (IST)
Subject: Re: [PATCH][MTD][NAND] nand_base.c: Fixing past end of the page
	read,      in nand_do_read_oob
From: "vimal singh" <vimalsingh@ti.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please ignore this patch... I missed the scenario of scanning OOBs for several
pages.

My apologizes.

-vimal

> Check for reading past end of the page, in the function 'nand_do_read_oob', was
> missing. This patch fixes it.
>
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
> This bug was found while testing with 'NAND test modules: oobtest' (maintained
> by Adrian Hunter).
> http://git.infradead.org/users/ahunter/nand-tests.git
>
>
> --- a/drivers/mtd/nand/nand_base.c	2009-07-07 15:40:35.000000000 +0530
> +++ b/drivers/mtd/nand/nand_base.c	2009-07-07 15:40:51.000000000 +0530
> @@ -1427,6 +1427,13 @@ static int nand_do_read_oob(struct mtd_i
>  		return -EINVAL;
>  	}
>
> +	/* Do not allow read past end of page */
> +	if ((ops->ooboffs + ops->ooblen) > len) {
> +		DEBUG(MTD_DEBUG_LEVEL0, "%s: Attempt to read "
> +				"past end of page\n", __func__);
> +		return -EINVAL;
> +	}
> +
>  	/* Do not allow reads past end of device */
>  	if (unlikely(from >= mtd->size ||
>  		     ops->ooboffs + readlen > ((mtd->size >> chip->page_shift) -
>
>
