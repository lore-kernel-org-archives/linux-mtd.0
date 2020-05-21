Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09298C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 08:10:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE135207D3
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 08:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dnsWAbyz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE135207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGiqllBXqliqKawGuynWkP0DMPzxteE7Z2O6i68REKo=; b=dnsWAbyz+2Rxyw
	8c/91AhD3F/kPyL3qdlY1YF23aQlhxSc5RJqNcgqnsBnPHv3k09TZaPpUm5u+BN+ONR/E0MmfJikE
	ewHD6OYLoXRHzDM9KxmKj8aPNZ2yb7t51s4Bl5ypwh1zybQFJlP5V0zlfTBBgNWwxHbCH0gHmHT3L
	fPc/q+lNcLt1XuA1C5I+fl4qwXSlZkl3/ReigDrxfNiBcVXVV22S/IWB4JoKwILOYED0GISsJqyhm
	oYjNq/2R9A/xwWM2RXYQGtAKkN3QyLHbKNGrk2oiui0e9T0fo3TkbrweRv0Ir3eJnwht4nNbGf8l1
	7OSbdgGRxpduZPQcBm0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbgHp-0000Xg-OQ; Thu, 21 May 2020 08:10:41 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbgHf-0000NA-Dt; Thu, 21 May 2020 08:10:37 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 04L89rJP053197;
 Thu, 21 May 2020 16:09:53 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 7422D97B974B4667C822;
 Thu, 21 May 2020 16:09:53 +0800 (CST)
In-Reply-To: <20200520103728.jtbslowdfrv3o5yz@ti.com>
References: <20200519142642.24131-1-p.yadav@ti.com>
 <20200519142642.24131-10-p.yadav@ti.com>
 <OF83616464.480FA751-ON4825856E.002A4483-4825856E.002BE6AF@mxic.com.tw>
 <20200520085534.yra4f5ww5xs23c4j@ti.com>
 <OF98344913.4BF4C313-ON4825856E.0032A810-4825856E.00352141@mxic.com.tw>
 <20200520103728.jtbslowdfrv3o5yz@ti.com>
To: "Pratyush Yadav" <p.yadav@ti.com>
Subject: Re: [PATCH v5 09/19] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
MIME-Version: 1.0
X-KeepSent: F5A6BA99:395182B5-4825856F:002B2F98;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFF5A6BA99.395182B5-ON4825856F.002B2F98-4825856F.002CD973@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 21 May 2020 16:09:52 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/05/21 PM 04:09:53,
 Serialize complete at 2020/05/21 PM 04:09:53
X-MAIL: TWHMLLG3.macronix.com 04L89rJP053197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_011031_809726_8C959B48 
X-CRM114-Status: GOOD (  21.48  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Pratyush, 

> > 
> > > > > +/**
> > > > > + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> > > > > + * @nor:      pointer to a 'struct spi_nor'
> > > > > + * @param_header:   pointer to the 'struct 
sfdp_parameter_header' 
> > > > describing
> > > > > + *         the 4-Byte Address Instruction Table length and 
version.
> > > > > + * @params:      pointer to the 'struct 
spi_nor_flash_parameter' to 
> > be.
> > > > > + *
> > > > > + * Return: 0 on success, -errno otherwise.
> > > > > + */
> > > > > +static int spi_nor_parse_profile1(struct spi_nor *nor,
> > > > > +              const struct sfdp_parameter_header 
*profile1_header,
> > > > > +              struct spi_nor_flash_parameter *params)
> > > > > +{
> > > > > +   u32 *table, opcode, addr;
> > > > > +   size_t len;
> > > > > +   int ret, i;
> > > > > +
> > > > > +   len = profile1_header->length * sizeof(*table);
> > > > > +   table = kmalloc(len, GFP_KERNEL);
> > > > > +   if (!table)
> > > > > +      return -ENOMEM;
> > > > > +
> > > > > +   addr = SFDP_PARAM_HEADER_PTP(profile1_header);
> > > > > +   ret = spi_nor_read_sfdp(nor, addr, len, table);
> > > > > +   if (ret)
> > > > > +      goto out;
> > > > > +
> > > > > +   /* Fix endianness of the table DWORDs. */
> > > > > +   for (i = 0; i < profile1_header->length; i++)
> > > > > +      table[i] = le32_to_cpu(table[i]);
> > > > > +
> > > > > +   /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> > > > > +   opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, table[0]);
> > > > > +
> > > > > +   /*
> > > > > +    * Update the fast read settings. We set the default dummy 
> > cycles to 
> > > > 20
> > > > > +    * here. Flashes can change this value if they need to when 
> > enabling
> > > > > +    * octal mode.
> > > > > +    */
> > > > > + 
spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> > > > > +              0, 20, opcode,
> > > > > +              SNOR_PROTO_8_8_8_DTR);
> > > > > +
> > > > 
> > > > 
> > > > I thought we have a agreement that only do parse here, no other 
read 
> > > > parameters setting.
> > > 
> > > Yes, and I considered it. But it didn't make much sense to me to 
> > > introduce an extra member in struct spi_nor just to make this call 
in 
> > > some other function later.
> > > 
> > > Why exactly do you think doing this here is bad? The way I see it, 
we 
> > > avoid carrying around an extra member in spi_nor and this also 
allows 
> > > flashes to change the read settings easily in a post-sfdp hook. The 
> > > 4bait parsing function does something similar.
> > 
> > I think it's not a question for good or bad. 
> > 
> > 4bait parsing function parse the 4-Byte Address Instruction Table
> > and set up read/pp parameters there for sure.
> > 
> > Here we give the function name spi_nor_parse_profile1() but also 
> 
> But the function that parses 4bait table is also called 
> spi_nor_parse_4bait(). 
> 
> > do others setting that has nothing to do with it, 
> 
> Why has setting read opcode and dummy cycles got nothing to do with it? 
> The purpose of the Profile 1.0 table is to tell us the Read Fast command 

> and dummy cycles, among other things. I think it _does_ have something 
> to do with it.

As you know I mean this function just do parse parameter of profile 1 
table
and keep these value data for later usage.

A device supports xSPI profile table could work in either 8S-8S-8S or 
8D-8D-8D mode.
It seems to setup these parameters somewhere out here is betters.

> 
> Just like the 4bait table tells us the 4-byte opcodes and we set them up 

> in our data structures, the profile 1.0 table tells us the 8D read 
> opcode and dummy cycles, and we set them up in our data structures.
> 
> > it seems not good for SW module design. 
> > oh, it's my humble opinion.
> > 
> > > 
> > > What are the benefits of doing it otherwise?
> > 
> > For other Octal Flash like mx25*
> 
> I mean from a design perspective. How does it make the code better, or 
> the job of people who need to read/change it easier?

yes, agreed.
I also need to patch for 8S-8S-8S mode, not only 8D-8D-8D mode.
That's why we have some discussions.

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
