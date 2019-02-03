Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116C5C169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC98F2075B
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HIBx5hCt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x+80ocae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC98F2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyeUyw7WTkWVPoqOZafYtKYrW6L/fphOWaH2YrTDsCw=; b=HIBx5hCtjNlvEV
	faT6AyREtavNUDgWFhjNSw53DnKxvnTx3PkiKlvvOCBBnEGQE64xTZ4m4UTxN4p6PPDFisFULcvVv
	B/GlWPmhQWRTSHOP3g6Ye2EXzt2gFZXgD6OG11nW2fnnm6O5xvNyKd3iR39ibTPUJdbydf9MDdjMF
	e2ymb1Mppbi9rjWPR2inPhCuIUYNHe4v6m8jVWrtz+uOvX4fOMx9gSaqG3PBaMGyjOQhFh4Zt6Qfn
	kFIwPCFZYur6iK57jBRYp17Tj0s9wf2jF6hhoZZlQkH3FxsMhQuYb0em9yofjTuUlBGfPFGbsEZsJ
	2qKDz/q6B2dOMxU2V3PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqCJD-00053b-Gz; Sun, 03 Feb 2019 07:35:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqCJB-00053G-1y
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 07:35:18 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D97C42075B;
 Sun,  3 Feb 2019 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549179316;
 bh=oTR9s6qvfrcP8iTi7jJSmWe+Z4LNKbrkx3DeU0QAUS0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=x+80ocaeMMfqDe+9I7G98jh/P45qoKrZ/89sjZRnLpcrGNAHucZeNoaG64t4qajNb
 fHwdoQrGLzeYYJ4e0GbBIPD8JlK7MlUx4bsjzOiXlgu5RbvLnkA+bqsatHnRiqf/os
 kPs2qeP1KX092X+9jNltIG+c7nX5C1P4U832wfi4=
Date: Sun, 3 Feb 2019 08:35:05 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 9/9] mtd: rawnand: jz4780-bch: Add support for the
 JZ4740
Message-ID: <20190203083505.4dc52278@bbrezillon>
In-Reply-To: <20190202231926.2444-10-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-10-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_233517_137150_C235DA0F 
X-CRM114-Status: GOOD (  29.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  2 Feb 2019 20:19:26 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Add the backend code for the jz4780-bch driver to support the JZ4740
> SoC from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: New patch
> 
>  drivers/mtd/nand/raw/ingenic/Makefile         |   2 +-
>  drivers/mtd/nand/raw/ingenic/jz4740_bch.c     | 173 ++++++++++++++++++
>  .../mtd/nand/raw/ingenic/jz4780_bch_common.c  |   1 +
>  .../nand/raw/ingenic/jz4780_bch_internal.h    |   1 +
>  4 files changed, 176 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_bch.c
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/Makefile b/drivers/mtd/nand/raw/ingenic/Makefile
> index f38b467490cf..d16c96113a93 100644
> --- a/drivers/mtd/nand/raw/ingenic/Makefile
> +++ b/drivers/mtd/nand/raw/ingenic/Makefile
> @@ -1,3 +1,3 @@
>  obj-$(CONFIG_MTD_NAND_JZ4740) += jz4740_nand.o
>  obj-$(CONFIG_MTD_NAND_JZ4780) += jz4780_nand.o jz4780_bch_common.o \
> -				 jz4780_bch.o jz4725b_bch.o
> +				 jz4780_bch.o jz4725b_bch.o jz4740_bch.o

I still don't see the point of the jz4780_bch_common/jz47xxx_bch
separation. You seem to always embed all objects anyway, so you can
just put the code for both engines in the same source file and decide
which one to use based on the compat (which you already do anyway). 

> diff --git a/drivers/mtd/nand/raw/ingenic/jz4740_bch.c b/drivers/mtd/nand/raw/ingenic/jz4740_bch.c
> new file mode 100644
> index 000000000000..61ea109cee9d
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/ingenic/jz4740_bch.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ4740 backend code for the jz4780-bch driver
> + * based on jz4740-nand.c
> + *
> + * Copyright (c) 2019 Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +
> +#include "jz4780_bch.h"
> +#include "jz4780_bch_internal.h"
> +
> +#define JZ_REG_NAND_ECC_CTRL	0x00
> +#define JZ_REG_NAND_DATA	0x04
> +#define JZ_REG_NAND_PAR0	0x08
> +#define JZ_REG_NAND_PAR1	0x0C
> +#define JZ_REG_NAND_PAR2	0x10
> +#define JZ_REG_NAND_IRQ_STAT	0x14
> +#define JZ_REG_NAND_IRQ_CTRL	0x18
> +#define JZ_REG_NAND_ERR(x)	(0x1C + ((x) << 2))
> +
> +#define JZ_NAND_ECC_CTRL_PAR_READY	BIT(4)
> +#define JZ_NAND_ECC_CTRL_ENCODING	BIT(3)
> +#define JZ_NAND_ECC_CTRL_RS		BIT(2)
> +#define JZ_NAND_ECC_CTRL_RESET		BIT(1)
> +#define JZ_NAND_ECC_CTRL_ENABLE		BIT(0)
> +
> +#define JZ_NAND_STATUS_ERR_COUNT	(BIT(31) | BIT(30) | BIT(29))
> +#define JZ_NAND_STATUS_PAD_FINISH	BIT(4)
> +#define JZ_NAND_STATUS_DEC_FINISH	BIT(3)
> +#define JZ_NAND_STATUS_ENC_FINISH	BIT(2)
> +#define JZ_NAND_STATUS_UNCOR_ERROR	BIT(1)
> +#define JZ_NAND_STATUS_ERROR		BIT(0)
> +
> +static const uint8_t empty_block_ecc[] = {
> +	0xcd, 0x9d, 0x90, 0x58, 0xf4, 0x8b, 0xff, 0xb7, 0x6f
> +};
> +
> +static void jz4740_bch_init(struct jz4780_bch *bch, bool encode)
> +{
> +	uint32_t reg;
> +
> +	/* Clear interrupt status */
> +	writel(0, bch->base + JZ_REG_NAND_IRQ_STAT);
> +
> +	/* Initialize and enable BCH */
> +	reg = readl(bch->base + JZ_REG_NAND_ECC_CTRL);
> +	reg |= JZ_NAND_ECC_CTRL_RESET;
> +	reg |= JZ_NAND_ECC_CTRL_ENABLE;
> +	reg |= JZ_NAND_ECC_CTRL_RS;
> +	if (encode)
> +		reg |= JZ_NAND_ECC_CTRL_ENCODING;
> +	else
> +		reg &= ~JZ_NAND_ECC_CTRL_ENCODING;
> +
> +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
> +}
> +
> +static int jz4740_bch_calculate(struct jz4780_bch *bch,
> +				struct jz4780_bch_params *params,
> +				const u8 *buf, u8 *ecc_code)
> +{
> +	uint32_t reg, status;
> +	unsigned int timeout = 1000;
> +	int i;
> +
> +	jz4740_bch_init(bch, true);
> +
> +	do {
> +		status = readl(bch->base + JZ_REG_NAND_IRQ_STAT);
> +	} while (!(status & JZ_NAND_STATUS_ENC_FINISH) && --timeout);
> +
> +	if (timeout == 0)
> +		return -ETIMEDOUT;
> +
> +	reg = readl(bch->base + JZ_REG_NAND_ECC_CTRL);
> +	reg &= ~JZ_NAND_ECC_CTRL_ENABLE;
> +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
> +
> +	for (i = 0; i < params->bytes; ++i)
> +		ecc_code[i] = readb(bch->base + JZ_REG_NAND_PAR0 + i);
> +
> +	/* If the written data is completely 0xff, we also want to write 0xff as
> +	 * ecc, otherwise we will get in trouble when doing subpage writes.
> +	 */
> +	if (memcmp(ecc_code, empty_block_ecc, ARRAY_SIZE(empty_block_ecc)) == 0)
> +		memset(ecc_code, 0xff, ARRAY_SIZE(empty_block_ecc));
> +
> +	return 0;
> +}
> +
> +static void jz_nand_correct_data(uint8_t *buf, int index, int mask)
> +{
> +	int offset = index & 0x7;
> +	uint16_t data;
> +
> +	index += (index >> 3);
> +
> +	data = buf[index];
> +	data |= buf[index + 1] << 8;
> +
> +	mask ^= (data >> offset) & 0x1ff;
> +	data &= ~(0x1ff << offset);
> +	data |= (mask << offset);
> +
> +	buf[index] = data & 0xff;
> +	buf[index + 1] = (data >> 8) & 0xff;
> +}
> +
> +static int jz4740_bch_correct(struct jz4780_bch *bch,
> +			      struct jz4780_bch_params *params,
> +			      u8 *buf, u8 *ecc_code)
> +{
> +	int i, error_count, index;
> +	uint32_t reg, status, error;
> +	unsigned int timeout = 1000;
> +
> +	jz4740_bch_init(bch, false);
> +
> +	for (i = 0; i < params->bytes; ++i)
> +		writeb(ecc_code[i], bch->base + JZ_REG_NAND_PAR0 + i);
> +
> +	reg = readl(bch->base + JZ_REG_NAND_ECC_CTRL);
> +	reg |= JZ_NAND_ECC_CTRL_PAR_READY;
> +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
> +
> +	do {
> +		status = readl(bch->base + JZ_REG_NAND_IRQ_STAT);
> +	} while (!(status & JZ_NAND_STATUS_DEC_FINISH) && --timeout);
> +
> +	if (timeout == 0)
> +		return -ETIMEDOUT;
> +
> +	reg = readl(bch->base + JZ_REG_NAND_ECC_CTRL);
> +	reg &= ~JZ_NAND_ECC_CTRL_ENABLE;
> +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
> +
> +	if (status & JZ_NAND_STATUS_ERROR) {
> +		if (status & JZ_NAND_STATUS_UNCOR_ERROR)
> +			return -EBADMSG;
> +
> +		error_count = (status & JZ_NAND_STATUS_ERR_COUNT) >> 29;
> +
> +		for (i = 0; i < error_count; ++i) {
> +			error = readl(bch->base + JZ_REG_NAND_ERR(i));
> +			index = ((error >> 16) & 0x1ff) - 1;
> +			if (index >= 0 && index < params->size)
> +				jz_nand_correct_data(buf, index, error & 0x1ff);
> +		}
> +
> +		return error_count;
> +	}
> +
> +	return 0;
> +}
> +
> +static void jz4740_bch_disable(struct jz4780_bch *bch)
> +{
> +	u32 reg;
> +
> +	writel(0, bch->base + JZ_REG_NAND_IRQ_STAT);
> +	reg = readl(bch->base + JZ_REG_NAND_ECC_CTRL);
> +	reg &= ~JZ_NAND_ECC_CTRL_ENABLE;
> +	writel(reg, bch->base + JZ_REG_NAND_ECC_CTRL);
> +}
> +
> +const struct jz4780_bch_ops jz4780_bch_jz4740_ops = {
> +	.disable = jz4740_bch_disable,
> +	.calculate = jz4740_bch_calculate,
> +	.correct = jz4740_bch_correct,
> +};
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
> index f505816193a8..c2326286abb2 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch_common.c
> @@ -157,6 +157,7 @@ static int jz4780_bch_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id jz4780_bch_dt_match[] = {
> +	{ .compatible = "ingenic,jz4740-bch", .data = &jz4780_bch_jz4740_ops},
>  	{ .compatible = "ingenic,jz4725b-bch", .data = &jz4780_bch_jz4725b_ops},
>  	{ .compatible = "ingenic,jz4780-bch", .data = &jz4780_bch_jz4780_ops },
>  	{},
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h b/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
> index 462aded811b1..7909a49c57db 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch_internal.h
> @@ -30,6 +30,7 @@ struct jz4780_bch {
>  	struct mutex lock;
>  };
>  
> +extern const struct jz4780_bch_ops jz4780_bch_jz4740_ops;
>  extern const struct jz4780_bch_ops jz4780_bch_jz4725b_ops;
>  extern const struct jz4780_bch_ops jz4780_bch_jz4780_ops;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
