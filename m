Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405FCC48BD6
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 09:41:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19634214DA
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 09:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ajty4UOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19634214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGO7f9+rW20qDUcz14opVUpIT4gv+ce+2reu2P4VKao=; b=ajty4UOP9YuEYh
	0cdvRfIQkZmzsbuzAML/5AXCspwLlu/2gmp0NZoKTsFtchAo4cypG7TgKsuypa7yx5i97joCatLPB
	EgM/9V7zBZnU6roM9zOE2ixS9F+emICpeT/dpbdc/zOMiVZlVeeX9gM4xvYzRMFzISe3M6ZY8tU40
	StLId58sCQuU7WlxPJxiJVlKGAOnW74rTy4B6IjE77/Ny1wYbaU444EFEOpaSy+w5XGxAimYnWD1M
	b+WxJMDORMVb1RFgwI6uRgvryIGQlYLTDvvouIfuoNho8m3ZTYLn8iVymq1SEpUei/89kUKNOM+B0
	qZMjIxW86+Bvtd9gRfpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfhxC-0006uI-UA; Tue, 25 Jun 2019 09:41:30 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfhx7-0006t8-Vt
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 09:41:28 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id B42B867A8C9;
 Tue, 25 Jun 2019 11:41:16 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 25 Jun
 2019 11:41:16 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 25 Jun 2019 11:41:16 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jeff Kletsky <lede@allycomm.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add initial support for Paragon PN26G0xA
Thread-Topic: [PATCH v2] mtd: spinand: Add initial support for Paragon PN26G0xA
Thread-Index: AQHVJfhz1ShSN5acYE2KqnOsUXxJMqasBsuA
Date: Tue, 25 Jun 2019 09:41:16 +0000
Message-ID: <d614767b-7787-b8c7-f8f0-5083e4922b93@kontron.de>
References: <20190618170805.7187-1-lede@allycomm.com>
In-Reply-To: <20190618170805.7187-1-lede@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <586B7E0AE71D8441B0F46998E96636F8@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: B42B867A8C9.A1104
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
X-CRM114-CacheID: sfid-20190625_024126_361405_ACBDD403 
X-CRM114-Status: GOOD (  21.66  )
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
 Jeff Kletsky <git-commits@allycomm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jeff,

On 18.06.19 19:08, Jeff Kletsky wrote:
> From: Jeff Kletsky <git-commits@allycomm.com>
> 
> Add initial support for Paragon Technology
> PN26G01Axxxxx and PN26G02Axxxxx SPI NAND
> 
> Datasheets available at
> http://www.xtxtech.com/upfile/2016082517274590.pdf
> http://www.xtxtech.com/upfile/2016082517282329.pdf
> 
> Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>
> ---

Can you please add a changelog here with a list of things that changed 
from v1 to v2?

Thanks,
Frieder

>   drivers/mtd/nand/spi/Makefile  |   2 +-
>   drivers/mtd/nand/spi/core.c    |   1 +
>   drivers/mtd/nand/spi/paragon.c | 147 +++++++++++++++++++++++++++++++++
>   include/linux/mtd/spinand.h    |   1 +
>   4 files changed, 150 insertions(+), 1 deletion(-)
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
> index 000000000000..52307681cbd0
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/paragon.c
> @@ -0,0 +1,147 @@
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
> +	if (section > 3)
> +		return -ERANGE;
> +
> +	region->offset = 6 + (15 * section); /* 4 BBM + 2 user bytes */
> +	region->length = 13;
> +
> +	return 0;
> +}
> +
> +static int pn26g0xa_ooblayout_free(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *region)
> +{
> +	if (section > 4)
> +		return -ERANGE;
> +
> +	if (section == 4) {
> +		region->offset = 64;
> +		region->length = 64;
> +	} else {
> +		region->offset = 4 + (15 * section);
> +		region->length = 2;
> +	}
> +
> +	return 0;
> +}
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
> +		     NAND_MEMORG(1, 2048, 128, 64, 2048, 41, 1, 1, 1),
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
