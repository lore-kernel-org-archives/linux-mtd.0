Return-Path: <SRS0=rMW0=J7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DDDC433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 05:39:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C90C613B3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 05:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C90C613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:Cc:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WUOVky6YHIev3/KNSdQoFHLp+eY7uaLEXM8XwH8nDZ4=; b=UjLAOCUSmgQOTXP3B1hULKHbl
	iC5xC7CxOUJR0jwEAjaruBMp/0EVNeJP6uNruTlx4/yu9uLQwCBMrd3TwScZFAJBFpfATeE2ZVLMn
	Y5jOGxQhgdwCdxCuq/pnDPgiep/M19gCwj54fSCMyBs6dwiNGjZfrayGD/cf6lyrMsm4fnPElxicX
	BiBlczJRjeox4hainZiymiwsgmAv2PQrls5tNShZEJvv50PP2uhryBOEEixBlBsa2w0O31zs9M9q8
	OT9k+Xf8mS7Gv7A1pMvfFUn3KuNZ0L81aZmJ6zO0meiYhcpJ3vtNn834X0w50g2fMeRqbDT7dLerQ
	1lqA6hG9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldnlo-00FUSk-Gg; Tue, 04 May 2021 05:38:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldnlj-00FUSN-UQ
 for linux-mtd@desiato.infradead.org; Tue, 04 May 2021 05:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Date:From:Message-ID:
 MIME-Version:Subject:Cc:To:References:In-Reply-To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ruhOlqlpFV4+JJ07uXd1R0zYfDRdR8DKEsZhu+OfuUM=; b=UEpysL3fgTLzJQuXSMs2vdl95k
 jcLM2BdXvuZ6P2Jb6fwtwyWJ6I2nV5qZgb6h2Hmt4b+ReXWGETNFnP5WmabLSR6dKz9DhccIeDMGe
 kgqXExnCPe/KwSSygGDhVl1GdhFtsSNkDAEaV69Zk+MCWfEScBjdL3tDnOZp53/GvcERL0uDLhqiV
 mDIj+tkV6qpKdvclHYYqAAvrQRYOmcL8/jRmFAqZNVIOquXQrnD3xtU5ESHa78l/i76PbNdQ3pvhO
 RKgHaNOKnOn4CYWwpsRondPi8DGulYoyLXLUcauPEFKb+GfxMjax0TgMgBRLy4rCzRlmQhZUqVPph
 47e0bZbg==;
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldnlf-003htq-Sf
 for linux-mtd@lists.infradead.org; Tue, 04 May 2021 05:38:50 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 1445cYs0003421;
 Tue, 4 May 2021 13:38:34 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 88B4794EB83C30D05EC4;
 Tue,  4 May 2021 13:38:34 +0800 (CST)
In-Reply-To: <20210427024707.hrr5r74apwghwsaj@ti.com>
References: <1618900179-14546-1-git-send-email-zhengxunli@mxic.com.tw>
 <1618900179-14546-3-git-send-email-zhengxunli@mxic.com.tw>
 <20210427024707.hrr5r74apwghwsaj@ti.com>
To: "Pratyush Yadav" <p.yadav@ti.com>
Cc: broonie@kernel.org, jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org, 
 linux-spi@vger.kernel.org, miquel.raynal@bootlin.com,
 tudor.ambarus@microchip.com
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: macronix: add support for Macronix
 octaflash series
MIME-Version: 1.0
X-KeepSent: B742AAB3:BE2A05EA-482586CB:001E84DF;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OFB742AAB3.BE2A05EA-ON482586CB.001E84DF-482586CB.001EFF57@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Tue, 4 May 2021 13:38:34 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/05/04 PM 01:38:34,
 Serialize complete at 2021/05/04 PM 01:38:34
X-MAIL: TWHMLLG3.macronix.com 1445cYs0003421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_223848_212333_5BED6BD5 
X-CRM114-Status: GOOD (  22.00  )
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


Hi,

> 
> On 20/04/21 02:29PM, Zhengxun Li wrote:
> > Add 1.8V and 3V Octal NOR Flash IDs.
> > MX25 series : Serial NOR Flash.
> > MX66 series : Serial NOR Flash with stacked die.
> 
> I only looked briefly at the datasheet, but I don't see any mention of 
> stacked dies. I assume the stacked die part is transparent from software 

> point of view, and is only a hardware implementation detail. Correct?
> 
> > LM/UM series : Up to 250MHz clock frequency with both DTR/STR 
operation.
> > LW/UW series : Support simultaneous Read-while-Write operation in 
multiple
> >           bank architecture. Read-while-write feature which means read
> >           data one bank while another bank is programing or erasing.
> 
> AFAIK, this feature is not currently supported in SPI NOR.
>
> > 
> > MX25LM : 3.0V Octal I/O
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/
> MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
> > 
> > MX25UM : 1.8V Octal I/O
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/
> MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf
> > 
> > MX66LM : 3.0V Octal I/O with stacked die
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/
> MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
> > 
> > MX66UM : 1.8V Octal I/O with stacked die
> >  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/
> MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf
> > 
> > MX25LW : 3.0V Octal I/O with Read-while-Write
> > MX25UW : 1.8V Octal I/O with Read-while-Write
> > MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> > MX66UW : 1.8V Octal I/O with Read-while-Write and stack die
> > 
> > About LW/UW series, please contact us freely if you have any
> > questions. For adding Octal NOR Flash IDs, we have validated
> > each Flash on plateform zynq-picozed.
> > 
> > Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 100 ++++++++++++++++++++++++++++
> +++++++++++++
> >  1 file changed, 100 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/macronix.c 
b/drivers/mtd/spi-nor/macronix.c
> > index 881eaf8..8c1cf1b 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -203,6 +203,106 @@ static void octaflash_post_sfdp_fixup(struct
> spi_nor *nor)
> >     { "mx66u2g45g",    INFO(0xc2253c, 0, 64 * 1024, 4096,
> >                 SECT_4K | SPI_NOR_DUAL_READ |
> >                 SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> > +   { "mx66lm2g45g", INFO(0xc2853c, 0, 64 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66lm1g45g", INFO(0xc2853b, 0, 32 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66lw1g45g", INFO(0xc2863b, 0, 32 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25lm51245g", INFO(0xc2853a, 0, 16 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25lw51245g", INFO(0xc2863a, 0, 16 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25lm25645g", INFO(0xc28539, 0, 8 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25lw25645g", INFO(0xc28639, 0, 8 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66um2g45g", INFO(0xc2803c, 0, 64 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66uw2g345gx0", INFO(0xc2943c, 0, 64 * 1024, 4096,
> > +             SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +             SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66um1g45g", INFO(0xc2803b, 0, 32 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66um1g45g40", INFO(0xc2808b, 0, 32 * 1024, 4096,
> > +            SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +            SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx66uw1g45g", INFO(0xc2813b, 0, 32 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25um51245g", INFO(0xc2803a, 0, 16 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw51245g", INFO(0xc2813a, 0, 16 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw51345g", INFO(0xc2843a, 0, 16 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25um25645g", INFO(0xc28039, 0, 8 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw25645g", INFO(0xc28139, 0, 8 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25um25345g", INFO(0xc28339, 0, 8 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw25345g", INFO(0xc28439, 0, 8 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw12845g", INFO(0xc28138, 0, 4 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw12a45g", INFO(0xc28938, 0, 4 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw12345g", INFO(0xc28438, 0, 4 * 1024, 4096,
> > +                SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +                SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw6445g", INFO(0xc28137, 0, 2 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> > +   { "mx25uw6345g", INFO(0xc28437, 0, 2 * 1024, 4096,
> > +               SECT_4K | SPI_NOR_OCTAL_DTR_READ |
> > +               SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
> > +      .fixups = &octaflash_fixups },
> 
> Reminder to self: Check if there are any ID collisions here. I have seen 

> a couple of them show up recently on Macronix flashes.

Yes, we have checked for ID conflicts before sending the patch.

> Anyway, not much to see here. I suggest you merge this with patch 1.

I will merge this to patch 1 in the next version.

> >  };
> > 
> >  static void macronix_default_init(struct spi_nor *nor)
> 

Thanks,
Zhengxun


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
