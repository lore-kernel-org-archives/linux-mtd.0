Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E66CC433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 06:31:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04BAF2087E
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 06:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PjZKmGOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04BAF2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qeqG3TdSkgJkzoJJMiIk/TzRcFKpP+52P8TzjQzb00=; b=PjZKmGOlw0wsab
	gMehAnPmX+Jmg193Lqs28AumQgXR8yvw36dKGeg8im7EMFwNwFQgCLeZWLN/p/Nxa8l55SmZt/c1y
	tjbzT7TCd79e28G8I9cRc5eqDLU509D9o1qRXexzGirY0VHeKP5tLmbMAWqBJaau7gMVfvhaxKgPP
	2Aa70gAO0fl0FfEve+fHWKb3KoIYmChSpseJig/MS3toE3R5FmCk9ZJR8yFpJZiwbTExxUvdmhawU
	OsEjpoF4TCCsO33AVxLw834otaRgPcqU0gze/dsk9NPlc5cg0s+SRBy9b7CFx+ZhMbEZM9LFevEXS
	PsoL2qQ6DJZTkMqOBycw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc1DS-0006uD-27; Fri, 22 May 2020 06:31:34 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc1DP-0006t8-C9; Fri, 22 May 2020 06:31:32 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 04M6Uv0L024143;
 Fri, 22 May 2020 14:30:57 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 392FE906D490C16CE7F1;
 Fri, 22 May 2020 14:30:58 +0800 (CST)
In-Reply-To: <20200519142642.24131-6-p.yadav@ti.com>
References: <20200519142642.24131-1-p.yadav@ti.com>
 <20200519142642.24131-6-p.yadav@ti.com>
To: "Pratyush Yadav" <p.yadav@ti.com>
Subject: Re: [PATCH v5 05/19] mtd: spi-nor: add support for DTR protocol
MIME-Version: 1.0
X-KeepSent: AC48157A:F337A12A-48258570:0021F23B;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFAC48157A.F337A12A-ON48258570.0021F23B-48258570.0023CB62@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 22 May 2020 14:30:58 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/05/22 PM 02:30:58,
 Serialize complete at 2020/05/22 PM 02:30:58
X-MAIL: TWHMLLG4.macronix.com 04M6Uv0L024143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_233131_676622_28B0BCEF 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Pratyush,


> +/**
> + * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem 
op.
> + * @nor:      pointer to a 'struct spi_nor'
> + * @op:         pointer to the 'struct spi_mem_op' whose properties
> + *         need to be initialized.
> + * @proto:      the protocol from which the properties need to be set.
> + */
> +void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> +              struct spi_mem_op *op,
> +              const enum spi_nor_protocol proto)
> +{
> +   u8 ext;
> +
> +   op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
> +
> +   if (op->addr.nbytes)
> +      op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +
> +   if (op->dummy.nbytes)
> +      op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +
> +   if (op->data.nbytes)
> +      op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
> +
> +   if (spi_nor_protocol_is_dtr(proto)) {

As mentioned before that I am also patching mx25* which supports 8S-8S-8S 
and 
8D-8D-8D mode.

please patch to spi_nor_protocol_is_8_8_8(proto) for 8S-8S-8S mode 
support.

> +      /*
> +       * spi-mem supports mixed DTR modes, but right now we can only
> +       * have all phases either DTR or STR. IOW, spi-mem can have
> +       * something like 4S-4D-4D, but spi-nor can't. So, set all 4
> +       * phases to either DTR or STR.
> +       */

        if (spi_nor_protocol_is_8D_8D_8D(proto) {

> +      op->cmd.dtr = op->addr.dtr = op->dummy.dtr
> +                = op->data.dtr = true;
> +
> +      /* 2 bytes per clock cycle in DTR mode. */
> +      op->dummy.nbytes *= 2;

        }

> +
> +      ext = spi_nor_get_cmd_ext(nor, op);
> +      op->cmd.opcode = (op->cmd.opcode << 8) | ext;
> +      op->cmd.nbytes = 2;
> +   }
> +}
> +

thanks & best regards,
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
