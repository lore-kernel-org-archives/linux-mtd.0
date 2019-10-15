Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D776ECE58F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 02:34:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5464021835
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 02:34:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iujYt/a0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5464021835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTnGKdwHe4umbW1jzZnz8Z6x1choLaS0zQcW5nyMMWE=; b=iujYt/a0qKPBWl
	2V3lntc6KiG+BlAs94WnadMHtEnv+9TeoEybWN6vbG5E0JUhj/MsUnD2MnQ3S0vgmME2Xq9I9fL+A
	K2x2vW4AME+o8sTu8st0vMqnE985F1f6AKZHK7NjZzVPJDFePyXAqnIaWoRvKfr9iyYDfeeR+LjvF
	Ee5gGDBQADdNpVIcws5r66ZeJA/9oSfQL/WvttBd71QOYQHqBXNLO8+9UdYNyst59MjY5TigSOiwm
	STyGjf3bl12X5OVG4yxA9Z8p5xLkmCtKVwXD6UAzeel51bRjNtKQLW3dywHRLNI6OngE7W+3XIPJz
	6ipLEMUSHj6VMVKsfrsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKCfX-00041r-PX; Tue, 15 Oct 2019 02:34:39 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKCfT-00041D-5O
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 02:34:38 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x9F2XTk0000198;
 Tue, 15 Oct 2019 10:33:29 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 55A4E269D4706F862BA5;
 Tue, 15 Oct 2019 10:33:29 +0800 (CST)
In-Reply-To: <20191008092832.54492696@dhcp-172-31-174-146.wireless.concordia.ca>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>	<1568793387-25199-3-git-send-email-masonccyang@mxic.com.tw>
 <20191007104501.1b4ed8ed@xps13>	<OF147D635A.8968CD6B-ON4825848D.00088AD5-4825848D.000B9D06@mxic.com.tw>
 <20191008092832.54492696@dhcp-172-31-174-146.wireless.concordia.ca>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH RFC 3/3] mtd: rawnand: Add support Macronix power down mode
MIME-Version: 1.0
X-KeepSent: 6D5429CF:876DE422-48258494:000D641F;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF6D5429CF.876DE422-ON48258494.000D641F-48258494.000E0D4C@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 15 Oct 2019 10:33:29 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/10/15 AM 10:33:29,
 Serialize complete at 2019/10/15 AM 10:33:29
X-MAIL: TWHMLLG3.macronix.com x9F2XTk0000198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_193435_459649_B2242995 
X-CRM114-Status: GOOD (  21.50  )
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
Cc: richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 tglx@linutronix.de, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Boris,

 
> > > > +   nand_select_target(chip, 0); 
> > > 
> > > On several NAND controllers there is no way to act on the CS line
> > > without actually writing bytes to the NAND chip. So basically this
> > > is very likely to not work. 
> > 
> > any other way to make it work ? GPIO ?
> > or just have some comments description here.
> > i.e,.
> > 
> > /* The NAND chip will exit the deep power down mode with #CS toggling, 

> >  * please refer to datasheet for the timing requirement of tCRDP and 
tRDP.
> >  */
> > 
> 
> Good luck with that. As Miquel said, on most NAND controllers
> select_target() is a dummy operation that just assigns nand_chip->target
> to the specified value but doesn't assert the CS line. You could send a
> dummy command here, like a READ_ID, but I guess you need CS to be
> asserted for at least 20ns before asserting any other signals (CLE/ALE)
> which might be an issue.

okay, got it.
But if possible, I think adding CS line control in nand_select_target()
is a simple and generic way for MTD and all raw NAND controllers.

> 
> > > 
> > > > +   ndelay(20); 
> > > 
> > > Is this delay known somewhere? Is this purely experimental? 
> > 
> > it's timing requirement tCRDP 20 ns(min) to release device
> > from deep power-down mode. 
> > You may download datasheet at
> > 
https://www.macronix.com/zh-tw/products/NAND-Flash/SLC-NAND-Flash/Pages/
> spec.aspx?p=MX30LF4G28AD&m=SLC%20NAND&n=PM2579 
> 
> Just looked at the datasheet, and there's actually more than tCRDP:
> 
> - you have to make sure you entered power-down state for at least tDPDD
>   before you try to wake up the device
> - the device goes back to stand-by state tRDP after the CS pin has been
>   deasserted.
> 
> I guess we can use ndelay() for those, since they happen before/after
> the CS pin is asserted/de-asserted. Be careful with ndelay() though,
> it's not guaranteed to wait the the time you pass, it can return
> before (maybe we should add a helper to deal with that).
> Another solution would be to describe CS assertion/de-assertion in
> the instruction flow, but that requires patching all exec_op() drivers.
> 
> For the tCRDP timing, I think we should use a nand_operation, this way
> we can check if the controller is able to deal with dummy CS-assertion
> before entering deep-power mode.
> In order to do that you'll have to add a NAND_OP_DUMMY_INSTR (or
> NAND_OP_DELAY_INSTR), and then have something like:
> 
> struct nand_op_instr instrs[] = {
>    NAND_OP_DUMMY(tCRDP),
> };

got it.

thanks for your time and comments.

best regards,
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
