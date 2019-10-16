Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41506C4360C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 06:57:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1065A20854
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 06:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFSKIOcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1065A20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Us1m1Oxfi4ZBUXPR6uaVKbTlZpbJiFWB3hdF4Ui0/o=; b=pFSKIOcdKyxnrC
	zNv1VvyKTGAWvXrCrfLnQzC0uyO3+qhBh2nXt3TFWrRKTUAcGmELVWgyQlAeI+2BzC90CDLgsZTPO
	3Do1TtFVaQvGtgo439rX8LkVlDA+28xOhMh5wbpeLu7AuS3DqgAQw01Med9YEjJ18h8hRxqeRb7Of
	oADz3hXXh7jnOE9eiQr9gLoy+OsXd7YQZIFiBdJbeIRJHOdxs/hS5fDQ93Vc/mesiQBPu5xebTEc9
	+/xO0qmoQVc4vxZqhErcHNRH0byt1iO5CdlwDfklrzv6iNmfuopCGyaVTeO6KQS/73DS3zysSeaVR
	KFM/RBT0Lcl8vB3sJZKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKdFC-0003sM-2f; Wed, 16 Oct 2019 06:57:14 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKdF7-0003hx-Pd
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 06:57:11 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x9G6trgN044342;
 Wed, 16 Oct 2019 14:55:53 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 0FAB2E5F2E903446FFBA;
 Wed, 16 Oct 2019 14:55:53 +0800 (CST)
In-Reply-To: <20191015095637.142e6db7@xps13>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>	<1568793387-25199-3-git-send-email-masonccyang@mxic.com.tw>
 <20191007104501.1b4ed8ed@xps13>	<OF147D635A.8968CD6B-ON4825848D.00088AD5-4825848D.000B9D06@mxic.com.tw>
 <20191008092832.54492696@dhcp-172-31-174-146.wireless.concordia.ca>	<OF6D5429CF.876DE422-ON48258494.000D641F-48258494.000E0D4C@mxic.com.tw>
 <20191015095637.142e6db7@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH RFC 3/3] mtd: rawnand: Add support Macronix power down mode
MIME-Version: 1.0
X-KeepSent: 7A229151:50591C54-48258495:00249AAF;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF7A229151.50591C54-ON48258495.00249AAF-48258495.002612F1@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 16 Oct 2019 14:55:52 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/10/16 PM 02:55:53,
 Serialize complete at 2019/10/16 PM 02:55:53
X-MAIL: TWHMLLG3.macronix.com x9G6trgN044342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_235710_088388_9A8F5A21 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marcel.ziswiler@toradex.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 richard@nod.at, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> > 
> > > > > > +   nand_select_target(chip, 0); 
> > > > > 
> > > > > On several NAND controllers there is no way to act on the CS 
line
> > > > > without actually writing bytes to the NAND chip. So basically 
this
> > > > > is very likely to not work. 
> > > > 
> > > > any other way to make it work ? GPIO ?
> > > > or just have some comments description here.
> > > > i.e,.
> > > > 
> > > > /* The NAND chip will exit the deep power down mode with #CS 
toggling, 
> > 
> > > >  * please refer to datasheet for the timing requirement of tCRDP 
and 
> > tRDP.
> > > >  */
> > > > 
> > > 
> > > Good luck with that. As Miquel said, on most NAND controllers
> > > select_target() is a dummy operation that just assigns 
nand_chip->target
> > > to the specified value but doesn't assert the CS line. You could 
send a
> > > dummy command here, like a READ_ID, but I guess you need CS to be
> > > asserted for at least 20ns before asserting any other signals 
(CLE/ALE)
> > > which might be an issue. 
> > 
> > okay, got it.
> > But if possible, I think adding CS line control in 
nand_select_target()
> > is a simple and generic way for MTD and all raw NAND controllers.
> 
> The problem is not that we do not want to; the problem is that
> controllers are not capable of doing it reliably if no byte is sent
> over the NAND bus.

okay,  it's kind of pity even though our raw NAND controller is capable of 

doing it with no byte is sent over the NAND bus.

As you mentioned that other controllers are not capable of doing it 
reliably 
if no byte is sent over the NAND bus.
if so, does it work by adding a NAND_OP_DUMMY_INSTR ? (as Boris's 
comments)

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
