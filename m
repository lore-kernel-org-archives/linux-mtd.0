Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39510C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 08:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C3E20708
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 08:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TJLif/By"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02C3E20708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1L3CVsQEyIDVkM1XpUEtlyYGvTNQQuLdTqseOGxfJI=; b=TJLif/By4SjLrO
	ZQl/6UIsrNKiqNQEPTdcFRV6L7gC5xxLOANrqZmCw+J3eoNKM2Npmh2qwYhUQjA5D7PsfAsOi8EwD
	ev0t+C/OsskNgUHC7lgLfhXMdvJvZ0b8YKxupPjbdvKu2R9yMAAy2ythYMxcLLUgymORyn/8MHibk
	G26mVRm8EMjpbuaIwLaRjzPaOPSvEE/tdB2xhci4MQYoYO96IY9kyedb+g5oDZQA4O2ar/PVxx01u
	PJmbnseAAHd4kI1DE86+9jH5YatP2MhQK/W9R0e8oRmxLpWGZSqMM3Q/yqEfCQu1opbe4LE2c0CAY
	GH0FojiAkrUrix58hypw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbJe3-0004hv-2I; Wed, 20 May 2020 08:00:07 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbJdz-00047e-W7; Wed, 20 May 2020 08:00:05 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 04K7xUdE096136;
 Wed, 20 May 2020 15:59:30 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id B9D79C5271EE9FAE1410;
 Wed, 20 May 2020 15:59:30 +0800 (CST)
In-Reply-To: <20200519142642.24131-10-p.yadav@ti.com>
References: <20200519142642.24131-1-p.yadav@ti.com>
 <20200519142642.24131-10-p.yadav@ti.com>
To: "Pratyush Yadav" <p.yadav@ti.com>
Subject: Re: [PATCH v5 09/19] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
MIME-Version: 1.0
X-KeepSent: 83616464:480FA751-4825856E:002A4483;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF83616464.480FA751-ON4825856E.002A4483-4825856E.002BE6AF@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 20 May 2020 15:59:31 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/05/20 PM 03:59:30,
 Serialize complete at 2020/05/20 PM 03:59:30
X-MAIL: TWHMLLG3.macronix.com 04K7xUdE096136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_010004_287484_6A8D0C85 
X-CRM114-Status: GOOD (  10.66  )
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
> + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> + * @nor:      pointer to a 'struct spi_nor'
> + * @param_header:   pointer to the 'struct sfdp_parameter_header' 
describing
> + *         the 4-Byte Address Instruction Table length and version.
> + * @params:      pointer to the 'struct spi_nor_flash_parameter' to be.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_profile1(struct spi_nor *nor,
> +              const struct sfdp_parameter_header *profile1_header,
> +              struct spi_nor_flash_parameter *params)
> +{
> +   u32 *table, opcode, addr;
> +   size_t len;
> +   int ret, i;
> +
> +   len = profile1_header->length * sizeof(*table);
> +   table = kmalloc(len, GFP_KERNEL);
> +   if (!table)
> +      return -ENOMEM;
> +
> +   addr = SFDP_PARAM_HEADER_PTP(profile1_header);
> +   ret = spi_nor_read_sfdp(nor, addr, len, table);
> +   if (ret)
> +      goto out;
> +
> +   /* Fix endianness of the table DWORDs. */
> +   for (i = 0; i < profile1_header->length; i++)
> +      table[i] = le32_to_cpu(table[i]);
> +
> +   /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> +   opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, table[0]);
> +
> +   /*
> +    * Update the fast read settings. We set the default dummy cycles to 
20
> +    * here. Flashes can change this value if they need to when enabling
> +    * octal mode.
> +    */
> +   spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +              0, 20, opcode,
> +              SNOR_PROTO_8_8_8_DTR);
> +


I thought we have a agreement that only do parse here, no other read 
parameters setting.

Driver should get dummy cycles used for various frequencies 
from 4th and 5th DWORD of xSPI table.[1]
 
[1] 
https://patchwork.ozlabs.org/project/linux-mtd/patch/1587451187-6889-3-git-send-email-masonccyang@mxic.com.tw/ 


In addition, 20 dummy cycles is for 200MHz but not for 100MHz, 133MHz and 
166MHz
in case of read performance concern.

Given a correct dummy cycles for a specific device. [2] 

[2] 
https://patchwork.ozlabs.org/project/linux-mtd/patch/1587451187-6889-5-git-send-email-masonccyang@mxic.com.tw/ 



> +   /*
> +    * Set the Read Status Register dummy cycles and dummy address 
bytes.
> +    */
> +   if (table[0] & PROFILE1_DWORD1_RDSR_DUMMY)
> +      params->rdsr_dummy = 8;
> +   else
> +      params->rdsr_dummy = 4;
> +
> +   if (table[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
> +      params->rdsr_addr_nbytes = 4;
> +   else
> +      params->rdsr_addr_nbytes = 0;
> +
> +out:
> +   kfree(table);
> +   return ret;
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
