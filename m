Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5FCC3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 08:02:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97C7624699
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 08:02:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdzNyfwP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97C7624699
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyeYvy0ksvdlmr9wP1VaZnxREYo9aU1iXd+pFto8SFA=; b=qdzNyfwPcfHIcF
	wDJQA8o/G0NSXOVrBvx3E/lb45N5g1ip5e8xWf4mbQnGqvyo9fi5+NaCrnsaklfXoFiW46ofDxI9h
	+wpiIPzdCSTt7WZFeu0GgQp9EeVbG8agRGW2MIOcfmd2zbmyyAZp8i2R0so3/85TcEWDavR//E+ot
	0GoZH91zMj6z/H2Hlq8NUofSydXJS2b9p4nTzyM1En8iQcXwb7JPU22tFs7FW0OJPMsCrLk6bb94K
	85XoXcS/HRr22CI8mwfdfVahl2hWEGKZcuVrSQe67p26KgwzOk9ObmXgmmsQ6aa0QWI0mVfng+bdP
	uq6no80Bedd+89o8dfaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8g26-0000dy-CO; Mon, 02 Mar 2020 08:02:34 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8g23-0000dI-KC
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 08:02:33 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 8244767A863;
 Mon,  2 Mar 2020 09:02:26 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 2 Mar 2020
 09:02:25 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Mon, 2 Mar 2020 09:02:25 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "vigneshr@ti.com"
 <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/2] mtd: spinand: toshiba: Rename function name to
 change suffix and prefix (8Gbit)
Thread-Topic: [PATCH v2 1/2] mtd: spinand: toshiba: Rename function name to
 change suffix and prefix (8Gbit)
Thread-Index: AQHV7eTlRd9hc/zyAkCXSXtt7ixwU6g05USA
Date: Mon, 2 Mar 2020 08:02:25 +0000
Message-ID: <d2837c89-c9b2-fd18-d090-567f2a90cf75@kontron.de>
References: <cover.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
 <41b30e2d308ec7f252d71970a2ed1c29cd25c0d7.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
In-Reply-To: <41b30e2d308ec7f252d71970a2ed1c29cd25c0d7.1582603241.git.ytc-mb-yfuruyama7@kioxia.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <9B3931318D729441BBDCA09726B59C7A@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 8244767A863.ACF19
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 vigneshr@ti.com, ytc-mb-yfuruyama7@kioxia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_000231_991997_70F6040E 
X-CRM114-Status: GOOD (  18.34  )
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

On 28.02.20 04:11, Yoshio Furuyama wrote:
> The suffix was changed to classify from "g" to "j" between 1st generation
> device and 2nd generation device that's new Serial NAND of Kioxia brand.

I had to read this sentence multiple times to understand it. Maybe 
something like this would be better:

   The suffix was changed from "g" to "j" to classify between 1st
   generation and 2nd generation serial NAND devices (which now belong to
   the Kioxia brand).

> As reference that's
> 1st generation device of 1Gbit product is "tc58cvg0s3hraig"
> 2nd generation device of 1Gbit product is "tc58cvg0s3hraij".
> 
> The 8Gbit product "TH58CxG3S0HRAIJ" is new line up of Kioxia's serial nand
> and changed the prefix from tc58 to th58.
> Thus it was changed argument to the function from "tc58cxgxsx" to
> "tx58cxgxsxraix".

Same here. It is very hard to read. I would write something like this:

   The 8Gbit type "TH58CxG3S0HRAIJ" is new to Kioxia's serial NAND lineup
   and the prefix was changed from "TC58" to "TH85".

   Thus the functions were renamed from tc58cxgxsx_*() to
   tx58cxgxsxraix_*().

With an easier to understand commit message:

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> 
> Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
> ---
> changelog[v2]:Split 2 patches, and add patch description.
> 
>   drivers/mtd/nand/spi/toshiba.c | 60 +++++++++++++++++++++---------------------
>   1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
> index 0db5ee4..700d86f 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -25,8 +25,8 @@ static SPINAND_OP_VARIANTS(write_cache_variants,
>   static SPINAND_OP_VARIANTS(update_cache_variants,
>   		SPINAND_PROG_LOAD(false, 0, NULL, 0));
>   
> -static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
> -				     struct mtd_oob_region *region)
> +static int tx58cxgxsxraix_ooblayout_ecc(struct mtd_info *mtd, int section,
> +					struct mtd_oob_region *region)
>   {
>   	if (section > 0)
>   		return -ERANGE;
> @@ -37,8 +37,8 @@ static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> -static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
> -				      struct mtd_oob_region *region)
> +static int tx58cxgxsxraix_ooblayout_free(struct mtd_info *mtd, int section,
> +					 struct mtd_oob_region *region)
>   {
>   	if (section > 0)
>   		return -ERANGE;
> @@ -50,13 +50,13 @@ static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> -static const struct mtd_ooblayout_ops tc58cxgxsx_ooblayout = {
> -	.ecc = tc58cxgxsx_ooblayout_ecc,
> -	.free = tc58cxgxsx_ooblayout_free,
> +static const struct mtd_ooblayout_ops tx58cxgxsxraix_ooblayout = {
> +	.ecc = tx58cxgxsxraix_ooblayout_ecc,
> +	.free = tx58cxgxsxraix_ooblayout_free,
>   };
>   
> -static int tc58cxgxsx_ecc_get_status(struct spinand_device *spinand,
> -				      u8 status)
> +static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
> +					 u8 status)
>   {
>   	struct nand_device *nand = spinand_to_nand(spinand);
>   	u8 mbf = 0;
> @@ -95,75 +95,75 @@ static int tc58cxgxsx_ecc_get_status(struct spinand_device *spinand,
>   
>   static const struct spinand_info toshiba_spinand_table[] = {
>   	/* 3.3V 1Gb */
> -	SPINAND_INFO("TC58CVG0S3", 0xC2,
> +	SPINAND_INFO("TC58CVG0S3HRAIG", 0xC2,
>   		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
>   		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
> -				     tc58cxgxsx_ecc_get_status)),
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   	/* 3.3V 2Gb */
> -	SPINAND_INFO("TC58CVG1S3", 0xCB,
> +	SPINAND_INFO("TC58CVG1S3HRAIG", 0xCB,
>   		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
>   		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
> -				     tc58cxgxsx_ecc_get_status)),
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   	/* 3.3V 4Gb */
> -	SPINAND_INFO("TC58CVG2S0", 0xCD,
> +	SPINAND_INFO("TC58CVG2S0HRAIG", 0xCD,
>   		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
>   		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
> -				     tc58cxgxsx_ecc_get_status)),
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   	/* 3.3V 4Gb */
> -	SPINAND_INFO("TC58CVG2S0", 0xED,
> +	SPINAND_INFO("TC58CVG2S0HRAIJ", 0xED,
>   		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
>   		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
> -				     tc58cxgxsx_ecc_get_status)),
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   	/* 1.8V 1Gb */
> -	SPINAND_INFO("TC58CYG0S3", 0xB2,
> +	SPINAND_INFO("TC58CYG0S3HRAIG", 0xB2,
>   		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
>   		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
> -				     tc58cxgxsx_ecc_get_status)),
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   	/* 1.8V 2Gb */
> -	SPINAND_INFO("TC58CYG1S3", 0xBB,
> +	SPINAND_INFO("TC58CYG1S3HRAIG", 0xBB,
>   		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
>   		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
> -				     tc58cxgxsx_ecc_get_status)),
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   	/* 1.8V 4Gb */
> -	SPINAND_INFO("TC58CYG2S0", 0xBD,
> +	SPINAND_INFO("TC58CYG2S0HRAIG", 0xBD,
>   		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
>   		     NAND_ECCREQ(8, 512),
>   		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
> -				     tc58cxgxsx_ecc_get_status)),
> +		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> +				     tx58cxgxsxraix_ecc_get_status)),
>   };
>   
>   static int toshiba_spinand_detect(struct spinand_device *spinand)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
