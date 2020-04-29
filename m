Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E794C83007
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35171206D6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lSOfEtOo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35171206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rO7d5NitvN2sDCSG/6txtbvwqIBnJHmuRVxSFfiTvwQ=; b=lSOfEtOoGVZc8I
	KuMlponXz/XA9sAA6RR3ddKYJ/Z6sLpLgjcOpJF0PfzB8f8S24KupS7hiKwT+ekAV765RKC7wUEL4
	P2pgVrm+X8j22JPm5aRnh2o2PbeQrhqXHqlyPkplyXSsmjwDdbM9JEOLvKM6n48d9rRgiYDajgkax
	cZaPvNnX/SI4rhuFfqdbCpRO69oBCRXbtyncGpsdOKv9OE+fgX3h8wplKRT6FlC1R4vFYq3iFo1cs
	1fdKbzDZW9OiD56MX61nKOhtAkjHN+mYw4FaY8ScrU3fbKBMGuA3IrrHV+Cw2pkmltqt+b2dgpuU0
	sHrxDI4zBszu1hl2hvdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTflK-0007oB-Kk; Wed, 29 Apr 2020 06:00:02 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTflH-0007lH-J2
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 06:00:01 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 03T5xaO9000906;
 Wed, 29 Apr 2020 13:59:36 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id D119FB1EA87A141E4B92;
 Wed, 29 Apr 2020 13:59:36 +0800 (CST)
In-Reply-To: <20200428083423.4fafd187@collabora.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>	<20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>	<OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
 <20200428083423.4fafd187@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
MIME-Version: 1.0
X-KeepSent: C28C41CE:C7A0DF28-48258559:00209CD2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFC28C41CE.C7A0DF28-ON48258559.00209CD2-48258559.0020EC27@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 29 Apr 2020 13:59:36 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/04/29 PM 01:59:36,
 Serialize complete at 2020/04/29 PM 01:59:36
X-MAIL: TWHMLLG3.macronix.com 03T5xaO9000906
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_225959_907526_C48E5F07 
X-CRM114-Status: GOOD (  21.00  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, Pratyush Yadav <me@yadavpratyush.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Boris,

> > > > On Tue, 21 Apr 2020 14:39:42 +0800
> > > > Mason Yang <masonccyang@mxic.com.tw> wrote:
> > > > 
> > > > > Hello,
> > > > > 
> > > > > This is repost of patchset from Boris Brezillon's
> > > > > [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1]. 
> > > > 
> > > > I only quickly went through the patches you sent and saying it's a
> > > > repost of the RFC is a bit of a lie. You completely ignored the 
state
> > > > tracking I was trying to do to avoid leaving the flash in 8D mode 
when
> > > > suspending/resetting the board, and I think that part is crucial. 
If I
> > > > remember correctly, we already had this discussion so I must say 
I'm a
> > > > bit disappointed.
> > > > 
> > > > Can you sync with Pratyush? I think his series [1] is better in 
that 
> > it
> > > > tries to restore the flash in single-SPI mode before suspend (it's
> > > > missing the shutdown case, but that can be easily added I think). 
Of
> > > > course that'd be even better to have proper state tracking at the 
SPI
> > > > NOR level. 
> > > 
> > > Hi Mason,
> > > 
> > > I posted a re-roll of my series here [0]. Could you please base your 

> > > changes on top of it? Let me know if the series is missing something 
you 
> > 
> > > need.
> > > 
> > > [0] 
> > 
https://lore.kernel.org/linux-mtd/20200424184410.8578-1-p.yadav@ti.com/
> > 
> > 
> > Our mx25uw51245g supports BFPT DWORD-18,19 and 20 data and xSPI 
profile 
> > 1.0,
> > and it comply with BFPT DWORD-19, octal mode enable sequences by write 
CFG 
> > Reg2 
> > with instruction 0x72. Therefore, I can't apply your patches.
> > 
> > I quickly went through your patches but can't reply them in each your 
> > patches.
> 
> Why?!! Aren't you registered to the MTD mailing list? Sorry but having
> reviews outside of the original thread is far from ideal. Please find a
> way to reply to the original patchset.
> 
> > 
> > i.e,.
> > 1) [v4,03/16] spi: spi-mem: allow specifying a command's extension
> > 
> > -                                u8 opcode;
> > +                                u16 opcode;
> > 
> > big/little Endian issue, right?
> 
> There's no endianness issue since it's SPI controller responsibility to
> interpret this field.
> 
> > why not just u8 ext_opcode;
> 
> Because I see the ext_ext_code comimg, and it's also more consistent
> with the addr field if we use an u16 and a number of cmd cycles.
> 
> > No any impact for exist code and actually only xSPI device use 
extension 
> > command.
> 
> And extending the opcode field to an u16 has no impact either.
> 

okay, got your point.

thanks for your time & comments.
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
