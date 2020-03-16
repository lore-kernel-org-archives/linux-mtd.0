Return-Path: <SRS0=Xhow=5B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351FC0044D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 09:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A5A20658
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 09:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FaecZwF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A5A20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7oUqmZRax1a43cj7XencPvBvTd/xvOYZ2E30R/KlNs=; b=FaecZwF75RWKvS
	LsGUujdQh2Vn6rvlmLodOl9lfjAfFGUro1r4iPvCVE/li7wBHA8QTwzNKqNhhIv9PhiRO1W1SrY/o
	pw3GP08PcnLB1spJu5jEokTzOlWrr9/PcVtTvANh1o7pqj7FqXTOU4bWJJqFhC4IZ3sF3aFlciTTJ
	yaCkVED8GNKEIhe7zV4rjbOZ93wFpiPTFY9VtGN98w6iIPBHW4xiGtVJpg2uMUpZOOlnQNFcRnN/6
	aTbvaeKJuyAvxhK/6SyZ3P7BiLWc/KQaOQUe8jne+w/b+9WSZdrXI1zDOIqDcuSaLFfKSDXwp53Qu
	itZ77w+ZEjbpXJvIj6sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDm4d-0005U1-Pb; Mon, 16 Mar 2020 09:30:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDm4N-0003yH-H6; Mon, 16 Mar 2020 09:30:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7D59C28DE96;
 Mon, 16 Mar 2020 09:29:56 +0000 (GMT)
Date: Mon, 16 Mar 2020 10:29:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 24/25] mtd: spi-nor: Drop the MFR definitions
Message-ID: <20200316102953.3f656d67@collabora.com>
In-Reply-To: <20200313194130.342251-25-tudor.ambarus@microchip.com>
References: <20200313194130.342251-1-tudor.ambarus@microchip.com>
 <20200313194130.342251-25-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_022959_701348_F46C61DB 
X-CRM114-Status: GOOD (  14.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 13 Mar 2020 19:42:52 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Cross manufacturer code is unlikely and discouraged, get rid of the
> MFR definitions.
> 
> Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/spi-nor/core.c  |  2 --
>  include/linux/mtd/spi-nor.h | 17 -----------------
>  2 files changed, 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index baee58fd8b04..b07e66f10995 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -40,8 +40,6 @@
>  
>  #define SPI_NOR_MAX_ADDR_WIDTH	4
>  
> -#define JEDEC_MFR(info)        ((info)->id[0])
> -
>  /**
>   * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the data
>   *                           transfer
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index bf37bfc68797..2f7725525460 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -11,23 +11,6 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/spi/spi-mem.h>
>  
> -/*
> - * Manufacturer IDs
> - *
> - * The first byte returned from the flash after sending opcode SPINOR_OP_RDID.
> - * Sometimes these are the same as CFI IDs, but sometimes they aren't.
> - */
> -#define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
> -#define SNOR_MFR_GIGADEVICE	0xc8
> -#define SNOR_MFR_INTEL		CFI_MFR_INTEL
> -#define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
> -#define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
> -#define SNOR_MFR_ISSI		CFI_MFR_PMC
> -#define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
> -#define SNOR_MFR_SPANSION	CFI_MFR_AMD
> -#define SNOR_MFR_SST		CFI_MFR_SST
> -#define SNOR_MFR_WINBOND	0xef /* Also used by some Spansion */
> -
>  /*
>   * Note on opcode nomenclature: some opcodes have a format like
>   * SPINOR_OP_FUNCTION{4,}_x_y_z. The numbers x, y, and z stand for the number


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
