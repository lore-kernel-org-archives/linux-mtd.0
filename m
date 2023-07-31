Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56418C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 21:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQm5KOR6UzvNfKZ/DbPReHnHClY8L0ccbvAwWAryWfk=; b=czVgkNTl0rzv4y
	NOFwcuc4POJIDImr8lkcM9tY6C3Rf61QKkj3c7gokVF3GbdsxlzsurtK8nv1qy10VGY7FKk96Ec5j
	heaWd/m9xDZ5suF/Fr09pIaTAWmAG6e+2Z3bOqE7WLhr8O/Jx46LzKDBv1Jw3+jKlygPuNrdlAB/m
	C1zByWE/L+vh22lRaARDCkX2rdsYWpAo6K2OqbEu0aC5Xmd87owg3Ues6/x7O4JQOPDoZg4vyRUH/
	mAZ3uGhms97mErFUI0sFinnNZ4yyoidhqFcaEXIpviqyXBDUpgdm3oTPQWr187fa2bJZhDmzCeefQ
	WKw7bkqLVI/p9Hgxzc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQar6-00HR8e-08;
	Mon, 31 Jul 2023 21:55:08 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qQaqz-00HR71-1d;
	Mon, 31 Jul 2023 21:55:03 +0000
Message-ID: <59512f64-6d7c-14d7-579a-a04572b27cff@infradead.org>
Date: Mon, 31 Jul 2023 14:54:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/6] mtd: ubi: provide NVMEM layer over UBI volumes
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <cover.1690823629.git.daniel@makrotopia.org>
 <2bd2368ff137dbac2282f366efa9b5d16046f2f1.1690823629.git.daniel@makrotopia.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2bd2368ff137dbac2282f366efa9b5d16046f2f1.1690823629.git.daniel@makrotopia.org>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 7/31/23 12:14, Daniel Golle wrote:
> diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
> index 2ed77b7b3fcb5..45d939bbfa853 100644
> --- a/drivers/mtd/ubi/Kconfig
> +++ b/drivers/mtd/ubi/Kconfig
> @@ -104,4 +104,16 @@ config MTD_UBI_BLOCK
>  
>  	   If in doubt, say "N".
>  
> +config MTD_UBI_NVMEM
> +	tristate "UBI virtual NVMEM"
> +	default n
> +	depends on NVMEM
> +	help
> +	   This option enabled an additional driver exposing UBI volumes as NVMEM

	               enables

> +	   providers, intended for platforms where UBI is part of the firmware
> +	   specification and used to store also e.g. MAC addresses or board-
> +	   specific Wi-Fi calibration data.
> +
> +	   If in doubt, say "N".

and Kconfig help text should be indented with one tab + 2 spaces
according to coding-style.rst.

> +
>  endif # MTD_UBI

-- 
~Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
