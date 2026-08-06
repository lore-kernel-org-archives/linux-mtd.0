Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02330C55ABF
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2026 05:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmVlLSqoGaV6IKHGHQbLuweKb7P7BerJv86ZvQeXd20=; b=V+2t5oEicwRq0y
	+3Z9IabcklcN/CprWVaNwd0FduMOBq0v2gBGn9bcFZitUB4qnTIi06pA2usHVXLsYvKORq1RqC37v
	z5qPmZ1JaZdyu4eZE28t6e+p8eWezZqw/4TCsHwb5HAuyAE4J1kPhcqTk2q9Ah4e2LRR/wHaLY5WW
	E4Kmervvlfj3i1nhVh1lJfoHZrH3g2cKYRfSz7s4SAy8o3k5d1cuPnt/iSxoMBFFV9rs2Jo0zTkD+
	1I3Cgk42lIi0v26G6MpV2DcueLi2I7oqv6wF4j5jBkA/MG2rB/nxR9opv6WheMBst6DTX+CidHSuC
	QsV4n1TKQqXDvtr1cNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqr8-00000004zpZ-15ek;
	Thu, 06 Aug 2026 05:41:26 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqr5-00000004zox-3kNO
	for linux-mtd@lists.infradead.org;
	Thu, 06 Aug 2026 05:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1785994884; x=1817530884;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y19W6dQYCEXXZL0LHrKYeszxVu2tNtDAiuHWLpyBbW0=;
  b=YhQhEeh89V8L/PsqWtvAjOU7k69iF5ftWCfXzv7X6XIqGe3+nBrMwBSG
   1o3Q6h0kBTRHR+zOqgm9azxtHuN9hk5vpqcbYsfQT3oROyHEyjODr3tvK
   RM436YVlMHasnlbR6V2jfn1mUm0Rfy9JxKHr8KS6FyWjIL4S+ceabvtRg
   c=;
X-CSE-ConnectionGUID: J1lpMjJQRwKpcgYHidA+5Q==
X-CSE-MsgGUID: uEb19Y0qS4mXF7Di/7t6lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="154750381"
X-IronPort-AV: E=Sophos;i="6.25,207,1779141600"; 
   d="scan'208";a="154750381"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:41:19 +0200
Received: from KLUSE816.infineon.com (172.28.156.170) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 6 Aug
 2026 07:41:18 +0200
Received: from KLUSE816.infineon.com (172.28.156.170) by KLUSE816.infineon.com
 (172.28.156.170) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 6 Aug
 2026 07:41:18 +0200
Received: from KLUSE816.infineon.com ([fe80::4a3d:fdb5:843:3451]) by
 KLUSE816.infineon.com ([fe80::4a3d:fdb5:843:3451%19]) with mapi id
 15.02.2562.045; Thu, 6 Aug 2026 07:41:18 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <ptpt52@gmail.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: allow force unlocking via DT property
Thread-Topic: [PATCH] mtd: spi-nor: allow force unlocking via DT property
Thread-Index: AQHdJP2XX1L+08ylx0S4qLK3gdXlO7aQcjdQ
Date: Thu, 6 Aug 2026 05:41:18 +0000
Message-ID: <c0205980208a489598f4cdbdb5c8d271@infineon.com>
References: <20260805171214.2934-1-ptpt52@gmail.com>
In-Reply-To: <20260805171214.2934-1-ptpt52@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_224124_253800_D4BFE5A9 
X-CRM114-Status: GOOD (  22.78  )
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

Hi,
 
> Some SPI NOR flash chips (such as generic or unlisted chips used in vendor
> devices like Tenda AX12L Pro) have Block Protection (BP) bits set in the
> Status Register by bootloaders or factory settings, locking flash blocks.
> 
> Because vendors frequently switch between various generic SPI NOR flash
> chips ("Flash Lottery"), it is impractical to upstream explicit chip ID
> flags (SNOR_F_HAS_LOCK) for every possible generic chip variant.
> 
> This patch introduces support for the "linux,force-sr-unlock" Device Tree
> property:
> 1. In spi_nor_init(), trigger spi_nor_try_unlock_all() if "linux,force-sr-unlock"
>    is present in the flash DT node, even when CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE
>    is active and the chip is non-volatile.
> 2. In spi_nor_try_unlock_all(), bypass the SNOR_F_HAS_LOCK flag check when
>    "linux,force-sr-unlock" is specified, ensure locking_ops are initialized,
>    and invoke Linux kernel's native spi_nor_unlock() mechanism.

Does this work for generic(unlisted) SPI NOR flash chips with 4-bit BP
and/or CMP bit? I think we need to rely on ID database to know what block
protection bits are available in the chip.

> 
> Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 ++-
>  drivers/mtd/spi-nor/swp.c  | 7 ++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd0..ef0bdc1254bb 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3332,7 +3332,8 @@ static int spi_nor_init(struct spi_nor *nor)
>         spi_nor_cache_sr_lock_bits(nor, NULL);
>         if (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE) ||
>             (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE) &&
> -            nor->flags & SNOR_F_SWP_IS_VOLATILE)) {
> +            nor->flags & SNOR_F_SWP_IS_VOLATILE) ||
> +           of_property_read_bool(spi_nor_get_flash_node(nor), "linux,force-sr-unlock")) {
>                 spi_nor_try_unlock_all(nor);
>         }
> 
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 235070b215d1..a190d10c1630 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -628,11 +628,16 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, u64 len)
>   */
>  void spi_nor_try_unlock_all(struct spi_nor *nor)
>  {
> +       struct device_node *np = spi_nor_get_flash_node(nor);
> +       bool force_unlock = of_property_read_bool(np, "linux,force-sr-unlock");
>         int ret;
> 
> -       if (!(nor->flags & SNOR_F_HAS_LOCK))
> +       if (!(nor->flags & SNOR_F_HAS_LOCK) && !force_unlock)
>                 return;
> 
> +       if (!nor->params->locking_ops)
> +               spi_nor_init_default_locking_ops(nor);
> +
>         dev_dbg(nor->dev, "Unprotecting entire flash array\n");
> 
>         ret = spi_nor_unlock(&nor->mtd, 0, nor->params->size);
> --
> 2.17.1

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
