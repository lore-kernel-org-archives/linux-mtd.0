Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519FBC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 13:58:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 219DC218F0
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 13:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNfV9OC6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="DvZZ8gec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 219DC218F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ccAvYnj978+Xx4Hi6aDl43lmWqPqO+lyu8SInqEPfoE=; b=TNfV9OC6HYSIgxG3rMmoGdyrb
	kwrHKdF1gkpLQL6bB8UMFUPZOIJS5hXedtKul3OBa47GKr0nMZOCbujqf26CrdZ03xx83FYRCynvQ
	9kMfTkTeOUm+P4S68lv5nIdtN1vgUkQjyxGp05WLx95+4kHWkSQbLhyapcDXKXQ0M9kd2+1lXR0je
	hikxXjit7JcCfILPWIQNVWJvswJPFJ9k24ueoQAKjC5pzeBdzC6ssl0okKu5M4nOGW7Gr/4pDX9MA
	w9PhOF4NM9U5a0ou7VV0WskyEnf/eOigzRk7SpI4Z5Hs+Sd+APz5UPkdLmwd2tkXX7Duc4ObEz/Du
	XRBMm3Tdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqII4-0004Vl-P6; Sun, 03 Feb 2019 13:58:32 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqII1-0004V2-7v
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 13:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549202307; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7B7LEY980IIsei+l9lmIK+ExFqBl1PxHGIm6tvKNi1M=;
 b=DvZZ8gecrOfvbI+1sah1H+rsQs6fRynf9AONU5B07/a9kx+KKjEafNirRrP9D4OsoGj+Bi
 iyIpYo57T3nY14eP12O2cZfiIjoK+6TFdkpInOA4Z44XvvO7WdRcW8G+mIuTy4eMWEWVft
 cU+KbLAPXSozWhv541aDuxO044JPLo4=
Date: Sun, 03 Feb 2019 10:58:13 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 9/9] mtd: rawnand: jz4780-bch: Add support for the
 JZ4740
To: Boris Brezillon <bbrezillon@kernel.org>
Message-Id: <1549202293.1950.2@crapouillou.net>
In-Reply-To: <20190203083505.4dc52278@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-10-paul@crapouillou.net>
 <20190203083505.4dc52278@bbrezillon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_055829_670236_357A97AC 
X-CRM114-Status: GOOD (  21.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le dim. 3 f=E9vr. 2019 =E0 4:35, Boris Brezillon <bbrezillon@kernel.org> =

a =E9crit :
> On Sat,  2 Feb 2019 20:19:26 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
> =

>>  Add the backend code for the jz4780-bch driver to support the JZ4740
>>  SoC from Ingenic.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>> =

>>  Changes:
>> =

>>  v2: New patch
>> =

>>   drivers/mtd/nand/raw/ingenic/Makefile         |   2 +-
>>   drivers/mtd/nand/raw/ingenic/jz4740_bch.c     | 173 =

>> ++++++++++++++++++
>>   .../mtd/nand/raw/ingenic/jz4780_bch_common.c  |   1 +
>>   .../nand/raw/ingenic/jz4780_bch_internal.h    |   1 +
>>   4 files changed, 176 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_bch.c
>> =

>>  diff --git a/drivers/mtd/nand/raw/ingenic/Makefile =

>> b/drivers/mtd/nand/raw/ingenic/Makefile
>>  index f38b467490cf..d16c96113a93 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/Makefile
>>  +++ b/drivers/mtd/nand/raw/ingenic/Makefile
>>  @@ -1,3 +1,3 @@
>>   obj-$(CONFIG_MTD_NAND_JZ4740) +=3D jz4740_nand.o
>>   obj-$(CONFIG_MTD_NAND_JZ4780) +=3D jz4780_nand.o jz4780_bch_common.o =

>> \
>>  -				 jz4780_bch.o jz4725b_bch.o
>>  +				 jz4780_bch.o jz4725b_bch.o jz4740_bch.o
> =

> I still don't see the point of the jz4780_bch_common/jz47xxx_bch
> separation. You seem to always embed all objects anyway, so you can
> just put the code for both engines in the same source file and decide
> which one to use based on the compat (which you already do anyway).

Each SoC has a different set of registers for the BCH hardware. I can =

try to
cram everything into one file, but it won't be that much cleaner.

>>  diff --git a/drivers/mtd/nand/raw/ingenic/jz4740_bch.c =

>> b/drivers/mtd/nand/raw/ingenic/jz4740_bch.c
>>  new file mode 100644
>>  index 000000000000..61ea109cee9d
>>  --- /dev/null
>>  +++ b/drivers/mtd/nand/raw/ingenic/jz4740_bch.c
>>  @@ -0,0 +1,173 @@
>>  +// SPDX-License-Identifier: GPL-2.0
>>  +/*
>>  + * JZ4740 backend code for the jz4780-bch driver
>>  + * based on jz4740-nand.c
>>  + *
>>  + * Copyright (c) 2019 Paul Cercueil <paul@crapouillou.net>
>>  + */
>>  +
>>  +#include <linux/bitops.h>
>>  +#include <linux/device.h>
>>  +
>>  +#include "jz4780_bch.h"
>>  +#include "jz4780_bch_internal.h"
>>  +
>>  +#define JZ_REG_NAND_ECC_CTRL	0x00
>>  +#define JZ_REG_NAND_DATA	0x04
>>  +#define JZ_REG_NAND_PAR0	0x08
>>  +#define JZ_REG_NAND_PAR1	0x0C
>>  +#define JZ_REG_NAND_PAR2	0x10
>>  +#define JZ_REG_NAND_IRQ_STAT	0x14
>>  +#define JZ_REG_NAND_IRQ_CTRL	0x18
>>  +#define JZ_REG_NAND_ERR(x)	(0x1C + ((x) << 2))
>>  +
>>  +#define JZ_NAND_ECC_CTRL_PAR_READY	BIT(4)
>>  +#define JZ_NAND_ECC_CTRL_ENCODING	BIT(3)
>>  +#define JZ_NAND_ECC_CTRL_RS		BIT(2)
>>  +#define JZ_NAND_ECC_CTRL_RESET		BIT(1)
>>  +#define JZ_NAND_ECC_CTRL_ENABLE		BIT(0)
>>  +
>>  +#define JZ_NAND_STATUS_ERR_COUNT	(BIT(31) | BIT(30) | BIT(29))
>>  +#define JZ_NAND_STATUS_PAD_FINISH	BIT(4)
>>  +#define JZ_NAND_STATUS_DEC_FINISH	BIT(3)
>>  +#define JZ_NAND_STATUS_ENC_FINISH	BIT(2)
>>  +#define JZ_NAND_STATUS_UNCOR_ERROR	BIT(1)
>>  +#define JZ_NAND_STATUS_ERROR		BIT(0)
>>  +
>>  +static const uint8_t empty_block_ecc[] =3D {
>>  +	0xcd, 0x9d, 0x90, 0x58, 0xf4, 0x8b, 0xff, 0xb7, 0x6f
>>  +};
>>  +
>>  +static void jz4740_bch_init(struct jz4780_bch *bch, bool encode)
>>  +{
>>  +	uint32_t reg;
>>  +
>>  +	/* Clear interrupt status */
>>  +	writel(0, bch->base + JZ_REG_NAND_IRQ_STAT);
>>  +
>>  +	/* Initialize and enable BCH */
>>  +	reg =3D readl(bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +	reg |=3D JZ_NAND_ECC_CTRL_RESET;
>>  +	reg |=3D JZ_NAND_ECC_CTRL_ENABLE;
>>  +	reg |=3D JZ_NAND_ECC_CTRL_RS;
>>  +	if (encode)
>>  +		reg |=3D JZ_NAND_ECC_CTRL_ENCODING;
>>  +	else
>>  +		reg &=3D ~JZ_NAND_ECC_CTRL_ENCODING;
>>  +
>>  +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +}
>>  +
>>  +static int jz4740_bch_calculate(struct jz4780_bch *bch,
>>  +				struct jz4780_bch_params *params,
>>  +				const u8 *buf, u8 *ecc_code)
>>  +{
>>  +	uint32_t reg, status;
>>  +	unsigned int timeout =3D 1000;
>>  +	int i;
>>  +
>>  +	jz4740_bch_init(bch, true);
>>  +
>>  +	do {
>>  +		status =3D readl(bch->base + JZ_REG_NAND_IRQ_STAT);
>>  +	} while (!(status & JZ_NAND_STATUS_ENC_FINISH) && --timeout);
>>  +
>>  +	if (timeout =3D=3D 0)
>>  +		return -ETIMEDOUT;
>>  +
>>  +	reg =3D readl(bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +	reg &=3D ~JZ_NAND_ECC_CTRL_ENABLE;
>>  +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +
>>  +	for (i =3D 0; i < params->bytes; ++i)
>>  +		ecc_code[i] =3D readb(bch->base + JZ_REG_NAND_PAR0 + i);
>>  +
>>  +	/* If the written data is completely 0xff, we also want to write =

>> 0xff as
>>  +	 * ecc, otherwise we will get in trouble when doing subpage =

>> writes.
>>  +	 */
>>  +	if (memcmp(ecc_code, empty_block_ecc, =

>> ARRAY_SIZE(empty_block_ecc)) =3D=3D 0)
>>  +		memset(ecc_code, 0xff, ARRAY_SIZE(empty_block_ecc));
>>  +
>>  +	return 0;
>>  +}
>>  +
>>  +static void jz_nand_correct_data(uint8_t *buf, int index, int mask)
>>  +{
>>  +	int offset =3D index & 0x7;
>>  +	uint16_t data;
>>  +
>>  +	index +=3D (index >> 3);
>>  +
>>  +	data =3D buf[index];
>>  +	data |=3D buf[index + 1] << 8;
>>  +
>>  +	mask ^=3D (data >> offset) & 0x1ff;
>>  +	data &=3D ~(0x1ff << offset);
>>  +	data |=3D (mask << offset);
>>  +
>>  +	buf[index] =3D data & 0xff;
>>  +	buf[index + 1] =3D (data >> 8) & 0xff;
>>  +}
>>  +
>>  +static int jz4740_bch_correct(struct jz4780_bch *bch,
>>  +			      struct jz4780_bch_params *params,
>>  +			      u8 *buf, u8 *ecc_code)
>>  +{
>>  +	int i, error_count, index;
>>  +	uint32_t reg, status, error;
>>  +	unsigned int timeout =3D 1000;
>>  +
>>  +	jz4740_bch_init(bch, false);
>>  +
>>  +	for (i =3D 0; i < params->bytes; ++i)
>>  +		writeb(ecc_code[i], bch->base + JZ_REG_NAND_PAR0 + i);
>>  +
>>  +	reg =3D readl(bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +	reg |=3D JZ_NAND_ECC_CTRL_PAR_READY;
>>  +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +
>>  +	do {
>>  +		status =3D readl(bch->base + JZ_REG_NAND_IRQ_STAT);
>>  +	} while (!(status & JZ_NAND_STATUS_DEC_FINISH) && --timeout);
>>  +
>>  +	if (timeout =3D=3D 0)
>>  +		return -ETIMEDOUT;
>>  +
>>  +	reg =3D readl(bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +	reg &=3D ~JZ_NAND_ECC_CTRL_ENABLE;
>>  +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +
>>  +	if (status & JZ_NAND_STATUS_ERROR) {
>>  +		if (status & JZ_NAND_STATUS_UNCOR_ERROR)
>>  +			return -EBADMSG;
>>  +
>>  +		error_count =3D (status & JZ_NAND_STATUS_ERR_COUNT) >> 29;
>>  +
>>  +		for (i =3D 0; i < error_count; ++i) {
>>  +			error =3D readl(bch->base + JZ_REG_NAND_ERR(i));
>>  +			index =3D ((error >> 16) & 0x1ff) - 1;
>>  +			if (index >=3D 0 && index < params->size)
>>  +				jz_nand_correct_data(buf, index, error & 0x1ff);
>>  +		}
>>  +
>>  +		return error_count;
>>  +	}
>>  +
>>  +	return 0;
>>  +}
>>  +
>>  +static void jz4740_bch_disable(struct jz4780_bch *bch)
>>  +{
>>  +	u32 reg;
>>  +
>>  +	writel(0, bch->base + JZ_REG_NAND_IRQ_STAT);
>>  +	reg =3D readl(bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +	reg &=3D ~JZ_NAND_ECC_CTRL_ENABLE;
>>  +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
>>  +}
>>  +
>>  +const struct jz4780_bch_ops jz4780_bch_jz4740_ops =3D {
>>  +	.disable =3D jz4740_bch_disable,
>>  +	.calculate =3D jz4740_bch_calculate,
>>  +	.correct =3D jz4740_bch_correct,
>>  +};
>>  diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c =

>> b/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
>>  index f505816193a8..c2326286abb2 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
>>  +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
>>  @@ -157,6 +157,7 @@ static int jz4780_bch_probe(struct =

>> platform_device *pdev)
>>   }
>> =

>>   static const struct of_device_id jz4780_bch_dt_match[] =3D {
>>  +	{ .compatible =3D "ingenic,jz4740-bch", .data =3D =

>> &jz4780_bch_jz4740_ops},
>>   	{ .compatible =3D "ingenic,jz4725b-bch", .data =3D =

>> &jz4780_bch_jz4725b_ops},
>>   	{ .compatible =3D "ingenic,jz4780-bch", .data =3D =

>> &jz4780_bch_jz4780_ops },
>>   	{},
>>  diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h =

>> b/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
>>  index 462aded811b1..7909a49c57db 100644
>>  --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
>>  +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
>>  @@ -30,6 +30,7 @@ struct jz4780_bch {
>>   	struct mutex lock;
>>   };
>> =

>>  +extern const struct jz4780_bch_ops jz4780_bch_jz4740_ops;
>>   extern const struct jz4780_bch_ops jz4780_bch_jz4725b_ops;
>>   extern const struct jz4780_bch_ops jz4780_bch_jz4780_ops;
>> =

> =



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
