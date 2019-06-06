Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91E5C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC62820673
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9rpOFjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC62820673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8c7NQkUQkAGXquLhC6EYq/pKIAEWJdHyq0747kjM1Y=; b=q9rpOFjHMdLIoW
	T9fpX7waIzszWRHjJcT7NB1SsB8g20JqIRUge55OVUx5dxwcjSucCQMl+ONKA6URWbk+CPGq9kX+l
	5NooZ9dXWM1XFE7i0bYYVX3xFumuxSXixvyIgxKYxL9SiTjLQ6jS+lVs0JDsdywlo4UqclJDp4Ris
	PNn6NncoVX9hSkfBtESG1EnBe7EX27ycZ1lNV71XseBFcj75fKkdpIAQz0ic71a2jJiraKOQrI+Sx
	Gmuy8lE7AyDK1NJYR0CmnucrILChjFZKrDRgDLaigSBw1SH4laPQOcG1/TCPx0BX6lgDB2sdL8rnd
	ZqCqUUvEpldw2l8Ykjdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYnb2-0007it-PJ; Thu, 06 Jun 2019 08:18:04 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYnay-0007i0-Kc
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2019 08:18:03 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 9F04262A850;
 Thu,  6 Jun 2019 10:17:53 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Jun 2019
 09:47:51 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 6 Jun 2019 09:47:51 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jeff Kletsky <lede@allycomm.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spinand: Support Paragon PN26G01A and PN26G02A
Thread-Topic: [PATCH] mtd: spinand: Support Paragon PN26G01A and PN26G02A
Thread-Index: AQHVG+agkH++bI3yOUCuzo9PxHivRqaOHvMA
Date: Thu, 6 Jun 2019 07:47:50 +0000
Message-ID: <c19d952a-d34c-e211-88d8-052293277a0a@kontron.de>
References: <20190605213516.13516-1-lede@allycomm.com>
In-Reply-To: <20190605213516.13516-1-lede@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <CA3F1A743A31BA48B3C500AF6164CF2F@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9F04262A850.AF30B
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: computersforpeace@gmail.com, dwmw2@infradead.org,
 git-commits@allycomm.com, lede@allycomm.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_011801_001134_6A98B6FD 
X-CRM114-Status: GOOD (  22.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Jeff Kletsky <git-commits@allycomm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05.06.19 23:35, Jeff Kletsky wrote:
> From: Jeff Kletsky <git-commits@allycomm.com>
> 
> These Paragon chips are very similar to other 1Gb/2Gb chips
> in terms of their layout and command timings.
> 
> One notable difference is that "Minimum number of valid blocks"
> (Nvb) is 1003 per Gb, rather than the common 1004. As a result,
> the bad-block reservation is 21 per Gb, rather than 20 per Gb.

Nitpick: Actually the maximum number of bad blocks is not "21 * capacity 
in Gb", but "(20 * capacity in Gb) + 1". So the 1Gb type has a maximum 
of 21 and the 2Gb type of 41 bad blocks.

> 
> Datasheets available at
> http://www.xtxtech.com/upfile/2016082517274590.pdf
> http://www.xtxtech.com/upfile/2016082517282329.pdf
> 
> Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>
> ---
>   drivers/mtd/nand/spi/Makefile  |   2 +-
>   drivers/mtd/nand/spi/core.c    |   1 +
>   drivers/mtd/nand/spi/paragon.c | 142 +++++++++++++++++++++++++++++++++
>   include/linux/mtd/spinand.h    |   1 +
>   4 files changed, 145 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/mtd/nand/spi/paragon.c
> 
> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
> index 753125082640..9662b9c1d5a9 100644
> --- a/drivers/mtd/nand/spi/Makefile
> +++ b/drivers/mtd/nand/spi/Makefile
> @@ -1,3 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0
> -spinand-objs := core.o gigadevice.o macronix.o micron.o toshiba.o winbond.o
> +spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o
>   obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 556bfdb34455..f0f3528aab8f 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -757,6 +757,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
>   	&gigadevice_spinand_manufacturer,
>   	&macronix_spinand_manufacturer,
>   	&micron_spinand_manufacturer,
> +	&paragon_spinand_manufacturer,
>   	&toshiba_spinand_manufacturer,
>   	&winbond_spinand_manufacturer,
>   };
> diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
> new file mode 100644
> index 000000000000..dd863dbc593a
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/paragon.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 Jeff Kletsky
> + *
> + * Author: Jeff Kletsky <git-commits@allycomm.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mtd/spinand.h>
> +
> +
> +#define SPINAND_MFR_PARAGON	0xa1
> +
> +
> +#define PN26G0XA_STATUS_ECC_BITMASK		(3 << 4)
> +
> +#define PN26G0XA_STATUS_ECC_NONE_DETECTED	(0 << 4)
> +#define PN26G0XA_STATUS_ECC_1_7_CORRECTED	(1 << 4)
> +#define PN26G0XA_STATUS_ECC_ERRORED		(2 << 4)
> +#define PN26G0XA_STATUS_ECC_8_CORRECTED		(3 << 4)
> +
> +
> +static SPINAND_OP_VARIANTS(read_cache_variants,
> +		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(write_cache_variants,
> +		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(update_cache_variants,
> +		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
> +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> +
> +
> +static int pn26g0xa_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *region)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	region->offset = 64;
> +	region->length = 64;
> +
> +	return 0;
> +}
> +
> +static int pn26g0xa_ooblayout_free(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *region)
> +{
> +	if (section)
> +		return -ERANGE;
> +
> +	region->offset = 1;	/* Reserved byte for BBM */
> +	region->length = 63;
> +
> +	return 0;
> +}

The OOB layout above seems to suggest, that each OOB area has one half 
of user data and one half of ECC data. But the table in the datasheet 
shows a separation into four sections, each consisting of 2 bytes user 
data and 13 bytes ECC data, following one 64 byte block of unprotected 
user data.

Also the table shows 4 bytes reserved for the bad block marker instead 
of only 1.

> +
> +static int pn26g0xa_ecc_get_status(struct spinand_device *spinand,
> +				   u8 status)
> +{
> +	switch (status & PN26G0XA_STATUS_ECC_BITMASK) {
> +	case PN26G0XA_STATUS_ECC_NONE_DETECTED:
> +		return 0;
> +
> +	case PN26G0XA_STATUS_ECC_1_7_CORRECTED:
> +		return 7;	/* Return upper limit by convention */
> +
> +	case PN26G0XA_STATUS_ECC_8_CORRECTED:
> +		return 8;
> +
> +	case PN26G0XA_STATUS_ECC_ERRORED:
> +		return -EBADMSG;
> +
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct mtd_ooblayout_ops pn26g0xa_ooblayout = {
> +	.ecc = pn26g0xa_ooblayout_ecc,
> +	.free = pn26g0xa_ooblayout_free,
> +};
> +
> +
> +static const struct spinand_info paragon_spinand_table[] = {
> +	SPINAND_INFO("PN26G01A", 0xe1,
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 21, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     0,
> +		     SPINAND_ECCINFO(&pn26g0xa_ooblayout,
> +				     pn26g0xa_ecc_get_status)),
> +	SPINAND_INFO("PN26G02A", 0xe2,
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 21, 1, 1, 1),

I think this is the 2G type and it should have twice as much blocks as 
the 1G type, so 2048 instead of 1024. And the maximum number of bad 
blocks should be 41 instead of 21.

> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     0,
> +		     SPINAND_ECCINFO(&pn26g0xa_ooblayout,
> +				     pn26g0xa_ecc_get_status)),
> +};
> +
> +static int paragon_spinand_detect(struct spinand_device *spinand)
> +{
> +	u8 *id = spinand->id.data;
> +	int ret;
> +
> +	/* Read ID returns [0][MID][DID] */
> +
> +	if (id[1] != SPINAND_MFR_PARAGON)
> +		return 0;
> +
> +	ret = spinand_match_and_init(spinand, paragon_spinand_table,
> +				     ARRAY_SIZE(paragon_spinand_table),
> +				     id[2]);
> +	if (ret)
> +		return ret;
> +
> +	return 1;
> +}
> +
> +static const struct spinand_manufacturer_ops paragon_spinand_manuf_ops = {
> +	.detect = paragon_spinand_detect,
> +};
> +
> +const struct spinand_manufacturer paragon_spinand_manufacturer = {
> +	.id = SPINAND_MFR_PARAGON,
> +	.name = "Paragon",
> +	.ops = &paragon_spinand_manuf_ops,
> +};
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index fbc0423bb4ae..4ea558bd3c46 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -227,6 +227,7 @@ struct spinand_manufacturer {
>   extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
>   extern const struct spinand_manufacturer macronix_spinand_manufacturer;
>   extern const struct spinand_manufacturer micron_spinand_manufacturer;
> +extern const struct spinand_manufacturer paragon_spinand_manufacturer;
>   extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
>   extern const struct spinand_manufacturer winbond_spinand_manufacturer;
>   
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
