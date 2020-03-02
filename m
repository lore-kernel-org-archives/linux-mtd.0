Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF92C3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 08:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62341246B6
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 08:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EdNDbwE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62341246B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7ZvA955Zadot3XPxGSvUhnzlU7J9gQvAqLw0LNDrEk=; b=EdNDbwE4VzGUPy
	CeTWbI14CMgViO1XS4pn5feGa3230db8w5GlsiMmI0nMmrfLFpaLEei1+sPum3umziiD0imT+VdmX
	G96IuUtzaKjBEjPE9sLZPz6j3pInFnxS6Gp1dzLmDMnwqYFC/e9Yv0lcyk0EbMFwI8/EG/gM0uGAw
	A0Ry1xQ6QON8yUbJ+HrHRwmVxzIqIts5XeeLgOUqvtpObvInq4bzFtp0zVu0mz5+vkXHMO91ZWq9m
	XUGscTzeRnDlci0EDa8qU68Y0xinSc1T+OBLLcuBgm6tujlBSK8Xy7RUAe7+F6LmAVzDGxnMkBnhf
	5LMWMxqJyvO6EO+U624g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8g2q-0000vA-Me; Mon, 02 Mar 2020 08:03:20 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8g2n-0000tx-72
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 08:03:19 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id EFB4A67A7C0;
 Mon,  2 Mar 2020 09:03:11 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 2 Mar 2020
 09:03:11 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Mon, 2 Mar 2020 09:03:11 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "vigneshr@ti.com"
 <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spinand: toshiba: Support for new Kioxia
 Serial NAND
Thread-Topic: [PATCH v2 2/2] mtd: spinand: toshiba: Support for new Kioxia
 Serial NAND
Thread-Index: AQHV7eTvkI1f5o4CokC7e4BcEaxQtKg05XkA
Date: Mon, 2 Mar 2020 08:03:11 +0000
Message-ID: <2dd7f6e4-f5d7-f28e-f4cb-9bb2bef0949b@kontron.de>
References: <cover.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
 <9080db5a16d0fae0b0e04245e8aacc774107222c.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
In-Reply-To: <9080db5a16d0fae0b0e04245e8aacc774107222c.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <4E79C54295FB13428777C3CDE1FA30B7@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: EFB4A67A7C0.A2DE0
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 vigneshr@ti.com, ytc-mb-yfuruyama7@kioxia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_000317_577872_33229599 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28.02.20 04:12, Yoshio Furuyama wrote:
> Add support for new Kioxia products.
> The new Kioxia products support program load x4 command, and have
> HOLD_D bit which is equivalent to QE bit.
> 
> Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
> changelog[v2]:Split 2 patches.
> 
>   drivers/mtd/nand/spi/toshiba.c | 119 +++++++++++++++++++++++++++++++++++------
>   1 file changed, 103 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
> index 700d86f..505f9f5 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -19,6 +19,18 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>   		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
>   		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
>   
> +static SPINAND_OP_VARIANTS(write_cache_x4_variants,
> +		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(update_cache_x4_variants,
> +		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
> +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> +
> +/**
> + * Backward compatibility for 1st generation Serial NAND devices
> + * which don't support Quad Program Load operation.
> + */
>   static SPINAND_OP_VARIANTS(write_cache_variants,
>   		SPINAND_PROG_LOAD(true, 0, NULL, 0));
>   
> @@ -94,7 +106,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
>   }
>   
>   static const struct spinand_info toshiba_spinand_table[] = {
> -	/* 3.3V 1Gb */
> +	/* 3.3V 1Gb (1st generation) */
>   	SPINAND_INFO("TC58CVG0S3HRAIG", 0xC2,
>   		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
> @@ -104,7 +116,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
>   		     0,
>   		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>   				     tx58cxgxsxraix_ecc_get_status)),
> -	/* 3.3V 2Gb */
> +	/* 3.3V 2Gb (1st generation) */
>   	SPINAND_INFO("TC58CVG1S3HRAIG", 0xCB,
>   		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
> @@ -114,7 +126,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
>   		     0,
>   		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>   				     tx58cxgxsxraix_ecc_get_status)),
> -	/* 3.3V 4Gb */
> +	/* 3.3V 4Gb (1st generation) */
>   	SPINAND_INFO("TC58CVG2S0HRAIG", 0xCD,
>   		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
> @@ -124,17 +136,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
>   		     0,
>   		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>   				     tx58cxgxsxraix_ecc_get_status)),
> -	/* 3.3V 4Gb */
> -	SPINAND_INFO("TC58CVG2S0HRAIJ", 0xED,
> -		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> -		     NAND_ECCREQ(8, 512),
> -		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> -					      &write_cache_variants,
> -					      &update_cache_variants),
> -		     0,
> -		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> -				     tx58cxgxsxraix_ecc_get_status)),
> -	/* 1.8V 1Gb */
> +	/* 1.8V 1Gb (1st generation) */
>   	SPINAND_INFO("TC58CYG0S3HRAIG", 0xB2,
>   		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
> @@ -144,7 +146,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
>   		     0,
>   		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>   				     tx58cxgxsxraix_ecc_get_status)),
> -	/* 1.8V 2Gb */
> +	/* 1.8V 2Gb (1st generation) */
>   	SPINAND_INFO("TC58CYG1S3HRAIG", 0xBB,
>   		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
> @@ -154,7 +156,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
>   		     0,
>   		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>   				     tx58cxgxsxraix_ecc_get_status)),
> -	/* 1.8V 4Gb */
> +	/* 1.8V 4Gb (1st generation) */
>   	SPINAND_INFO("TC58CYG2S0HRAIG", 0xBD,
>   		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
> @@ -164,6 +166,91 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
>   		     0,
>   		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>   				     tx58cxgxsxraix_ecc_get_status)),
> +
> +	/*
> +	 * 2nd generation serial nand has HOLD_D which is equivalent to
> +	 * QE_BIT.
> +	 */
> +	/* 3.3V 1Gb (2nd generation) */
> +	SPINAND_INFO("TC58CVG0S3HRAIJ", 0xE2,
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
> +	/* 3.3V 2Gb (2nd generation) */
> +	SPINAND_INFO("TC58CVG1S3HRAIJ", 0xEB,
> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
> +	/* 3.3V 4Gb (2nd generation) */
> +	SPINAND_INFO("TC58CVG2S0HRAIJ", 0xED,
> +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
> +	/* 3.3V 8Gb (2nd generation) */
> +	SPINAND_INFO("TH58CVG3S0HRAIJ", 0xE4,
> +		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
> +	/* 1.8V 1Gb (2nd generation) */
> +	SPINAND_INFO("TC58CYG0S3HRAIJ", 0xD2,
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
> +	/* 1.8V 2Gb (2nd generation) */
> +	SPINAND_INFO("TC58CYG1S3HRAIJ", 0xDB,
> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
> +	/* 1.8V 4Gb (2nd generation) */
> +	SPINAND_INFO("TC58CYG2S0HRAIJ", 0xDD,
> +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
> +	/* 1.8V 8Gb (2nd generation) */
> +	SPINAND_INFO("TH58CYG3S0HRAIJ", 0xD4,
> +		     NAND_MEMORG(1, 4096, 256, 64, 4096, 80, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_x4_variants,
> +					      &update_cache_x4_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   };
>   
>   static int toshiba_spinand_detect(struct spinand_device *spinand)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
