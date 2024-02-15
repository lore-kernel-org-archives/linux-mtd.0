Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6353C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcAUF0sBPLokAUagtR/EIiTBaqGAWB9P6MJ6AwcVSLM=; b=f3CsNOr+oyqoYk
	EFaHh6UXr3L8wOa02FB8t8NSDNm9FAqQlNMzImfo5qhmWqoOsQM/rdud1fam2si4YHfm8uFWeJyaB
	l1UR6z3NgiOgb6aDczHf/X9oPTWX96DCIdJZc6v+eodwjOA0rL+/k/PjFP1G/RqG0nFQRxc9fPWec
	j+swqaNB4NPgsYUmafd/uluMyKRCKNaozRjByzsYJX1o3jckxjHcj+eDgrKgEKzEH/dEOmcNy5OQd
	9kv79kVozsUZ7ipxpWjAut7JYVpeEKXzEvGTqVLqdL+XTNyE69k6b1VWPyighuOmoSGS8q9lU58EY
	ePrFwQyIorWPXJT4/IIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radDp-0000000Ge6k-03aB;
	Thu, 15 Feb 2024 15:00:21 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1radDl-0000000Ge52-2bt3
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 15:00:18 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso858236276.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 07:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708009212; x=1708614012; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RadMiDe92m4brTDSBbZrQSBMUCpi10GCJT9OlMPEwXY=;
        b=F0/f9DQ65/wVrqrfWib8OK2BZ20uFPNH6Zi+/rmGW8dvlRR6FIahc9qYrxK4/taDyE
         vDk9StJdGeg/+psPlbhNXw/UX3hIGC1g+4ykI202vaALi2Vp5zLxyb1OL0EVwA5iSKm1
         pC4CWYo8dxb0JeeosVrG6SnquId/IZf9FNaSXNSGUsW7t/he9oFh2d8FYqm48DqPkFHt
         sseeMAz3fTytC8RJ2RZk/MzhF2B8ooYVGUGzkIuVf1pLe91LZF5rd3DSrSfHcOnGh8q1
         fokhT4rjLHelkEJIr8UVmHiaeS3gL3Y6BExCU6+tfjK30cNfSQh3L+yGUkeWRQsGgUBz
         SDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708009212; x=1708614012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RadMiDe92m4brTDSBbZrQSBMUCpi10GCJT9OlMPEwXY=;
        b=lvQZB177mmc2im4qR6hNBYFtfFCvdoDOg8d9Olvnwf9novJdsonmoh1ClF2/3kefCT
         JJiWZAfiOB4Thd3GTTWaNnLKmmngQ0xVlj9TnHoQL44/1r/sQ6xkLxG894K9GUu48LxD
         7Zr4P/osW10FIqbP9kPqJYgaJbs9+8bbjZwSTqjpErBJr9uANxlaKmM6jjmEFZHHGhuj
         JzRSndVv/VwY0Qyn+lQdacyjxid2mfRsnONOu2jYnpl5iH5fabAa4ecLnx1lFbhoaDbP
         VfIdEKl9X7Q6maaOEqGhNPFSVjEFQY/aY9wvaRtK57t1SWBe2D5vKbB+9Z8d6ztkzbvL
         rK9w==
X-Forwarded-Encrypted: i=1; AJvYcCXhcG7emyC3DVaRTtJjR0JqDSk1WXeFMq4ZZlWQ1gt1Vw0CvkuANqLmgDE3rDuftLQRsaTtFVy9X+MpaOTjsUmVQhqI7cLQNMfR/eK93g==
X-Gm-Message-State: AOJu0YwM2wUCJppRFo8DPOQOtObli4FTIHvWfN4s1j+rGP2WKgaWlN9l
	JtS50z3ZRENINDRkv1ps9JcouWztkrjfzEZ9O2mM+wZ75KNGpNiyHCUnL+iaA2I+6GSek+pdi0P
	Ng94HT/SmOp65/BIbCIaGdjq04QL6H/z9P6dd/w==
X-Google-Smtp-Source: AGHT+IG9VjWm3vrwjladOxmvn95+Q9vBX02+e37fghrXCVUWsX2DFBhY2VjHQFCFnjilBT/8d54Qvp6HvXvaehGIGn0=
X-Received: by 2002:a25:ae28:0:b0:dc2:4fff:75ee with SMTP id
 a40-20020a25ae28000000b00dc24fff75eemr1336871ybj.3.1708009211944; Thu, 15 Feb
 2024 07:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com> <20240215134856.1313239-3-quic_mdalam@quicinc.com>
In-Reply-To: <20240215134856.1313239-3-quic_mdalam@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 17:00:00 +0200
Message-ID: <CAA8EJpquDwDg+OrZKeJrTWEtokCF7uyHMyzCFK2etSsDip8_6Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers: mtd: nand: Add qpic_common API file
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_070017_710633_035C5178 
X-CRM114-Status: GOOD (  23.93  )
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

On Thu, 15 Feb 2024 at 15:53, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>
> Add qpic_common.c file which hold all the common
> qpic APIs which will be used by both qpic raw nand
> driver and qpic spi nand driver.
>
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
>  drivers/mtd/nand/Makefile            |    1 +
>  drivers/mtd/nand/qpic_common.c       |  786 +++++++++++++++++
>  drivers/mtd/nand/raw/qcom_nandc.c    | 1226 +-------------------------
>  include/linux/mtd/nand-qpic-common.h |  488 ++++++++++
>  4 files changed, 1291 insertions(+), 1210 deletions(-)
>  create mode 100644 drivers/mtd/nand/qpic_common.c
>  create mode 100644 include/linux/mtd/nand-qpic-common.h
>
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 19e1291ac4d5..131707a41293 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -12,3 +12,4 @@ nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
>  nandcore-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
> +obj-y += qpic_common.o
> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
> new file mode 100644
> index 000000000000..4d74ba888028
> --- /dev/null
> +++ b/drivers/mtd/nand/qpic_common.c
> @@ -0,0 +1,786 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * QPIC Controller common API file.
> + * Copyright (C) 2023  Qualcomm Inc.
> + * Authors:    Md sadre Alam           <quic_mdalam@quicinc.com>
> + *             Sricharan R             <quic_srichara@quicinc.com>
> + *             Varadarajan Narayanan   <quic_varada@quicinc.com>

This is a bit of an exaggeration. You are moving code, not writing new
code. Please retain the existing copyrights for the moved code.

> + *
> + */
> +
> +#include <linux/mtd/nand-qpic-common.h>
> +
> +struct qcom_nand_controller *
> +get_qcom_nand_controller(struct nand_chip *chip)
> +{
> +       return container_of(chip->controller, struct qcom_nand_controller,
> +                           controller);
> +}
> +EXPORT_SYMBOL(get_qcom_nand_controller);

NAK for adding functions to the global export namespace without a
proper driver-specific prefix.

Also, a bunch of the code here seems not so well thought. It was fine
for an internal interface, but it doesn't look so good as a common
wrapper. Please consider defining a sensible common code module
interface instead.

At least each function that is being exported should get a kerneldoc.

Last, but not least, please use EXPORT_SYMBOL_GPL.

> +
> +/*
> + * Helper to prepare DMA descriptors for configuring registers
> + * before reading a NAND page.
> + */
> +void config_nand_page_read(struct nand_chip *chip)
> +{
> +       struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> +
> +       write_reg_dma(nandc, NAND_ADDR0, 2, 0);
> +       write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> +       if (!nandc->props->qpic_v2)
> +               write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
> +       write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
> +       write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
> +                     NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
> +}
> +EXPORT_SYMBOL(config_nand_page_read);
> +
> +/* Frees the BAM transaction memory */
> +void free_bam_transaction(struct qcom_nand_controller *nandc)
> +{
> +       struct bam_transaction *bam_txn = nandc->bam_txn;
> +
> +       devm_kfree(nandc->dev, bam_txn);

devm_kfree is usually a bad sign. Either the devm_kfree should be
dropped (because the memory area is allocated only during probe / init
and doesn't need to be freed manually) or use kalloc/kfree directly
without devres wrapping.

> +}
> +EXPORT_SYMBOL(free_bam_transaction);
> +

[skipped the rest]

> --
> 2.34.1
>
>


--
With best wishes
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
