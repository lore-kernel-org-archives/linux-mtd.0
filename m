Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A39BC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 02:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FAD4204EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 02:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WbuwzMNF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FAD4204EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klVhjjKX0RWEvLRPm/TnqKIn+FHCCnWCMn5sJ65vdzw=; b=WbuwzMNFyMfVdd
	ZrDBzfmZXYigwNgf7yaXTeSqHkh2KWtz8hs/dYwXvhqwkhdJ2TfQZkszs5c9juCH68zKIkaGB/Ik9
	iVWLLTltilSsHVlLlRW5kaPI3qf8yXrozxXUK7WVRxbHqOv9B3ZCTrVLEzWFiPgSYy1evk+r5T96t
	t9p0pHWHyAr/ZKJVikOeoOUbeBDJnf/ZITwaZ6jETt46CHZOkIynJyMSisYjRfJHF4MoYgddiiTae
	KrNtQyNr/OsWeUUvArJmmFh0ioLed19DHShbGzJkLKj/U1RDPkwHZxI9ki0F6bNHx8FbNDNyxCYAQ
	ajkgr4G05Sj1UIJd4bBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZQ45-0004cK-BK; Fri, 15 May 2020 02:27:09 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZQ42-0004SG-T6
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 02:27:08 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 04F2Q5pA045600;
 Fri, 15 May 2020 10:26:05 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 8019D69F055CB487B644;
 Fri, 15 May 2020 10:26:05 +0800 (CST)
In-Reply-To: <20200506094028.2asq56goslfd2ngo@yadavpratyush.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
 <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
 <20200428085401.574wmo6qddmumd7q@yadavpratyush.com>
 <OF04289CE2.B346916F-ON48258559.002280BD-48258559.00295800@mxic.com.tw>
 <20200429181856.kkavelcczylg4yxf@yadavpratyush.com>
 <OF28AE0642.4F34D6BB-ON4825855F.002D6E58-4825855F.003458C9@mxic.com.tw>
 <20200506094028.2asq56goslfd2ngo@yadavpratyush.com>
To: "Pratyush Yadav" <me@yadavpratyush.com>
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
MIME-Version: 1.0
X-KeepSent: 03B5329E:56965A70-48258569:000878CE;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF03B5329E.56965A70-ON48258569.000878CE-48258569.000D5FFD@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 15 May 2020 10:26:05 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/05/15 AM 10:26:05,
 Serialize complete at 2020/05/15 AM 10:26:05
X-MAIL: TWHMLLG4.macronix.com 04F2Q5pA045600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_192707_237564_EB3A6DE4 
X-CRM114-Status: GOOD (  11.76  )
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
 richard@nod.at, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Pratyush,

> > > > I can't apply your patches to enable xSPI Octal mode for 
> > > > mx25uw51245g because your patches set up Octal protocol first and 
> > > > then using Octal protocol to write Configuration Register 2(CFG 
> > > > Reg2). I think driver
> > > > should write CFG Reg2 in SPI 1-1-1 mode (power on state) and make 
sure
> > > > write CFG Reg 2 is success and then setup Octa protocol in the 
last.
> > > 
> > > Register writes should work in 1S mode, because nor->reg_proto is 
only 
> > > set _after_ 8D mode is enabled (see spi_nor_octal_dtr_enable()). In 
> > > fact, both patch 15 and 16 in my series use register writes in 1S 
mode.
> > 
> > but I didn't see driver roll back "nor->read/write_proto = 1" 
> > if xxx->octal_dtr_enable() return failed!
> 
> I copied what spi_nor_quad_enable() did, and made failure fatal. So if 
> xxx->octal_dtr_enable() fails, the probe would fail and the flash would 
> be unusable. You can try your hand at a fallback system where you try 

IMHO, it's not a good for system booting from SPI-NOR, 
driver should still keep system alive in SPI 1-1-1 mode in case of 
enable Octal/Quad failed.

Therefore, my patches is to setup nor->read/write_proto = 8 in case 
driver enable Octal mode is success. And to enable Octal mode in
spi_nor_late_init_params()rather than as spi_nor_quad_enable()did.

> all possible protocols available, but I think that should be a different 

> patchset.
> 
> -- 
> Regards,
> Pratyush Yadav

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
