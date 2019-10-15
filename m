Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D50ECE587
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 06:48:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1453120854
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 06:48:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAgdHlT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1453120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrVlctxnCwTiJFmjfHH48svSvuYphfs7zRpFikY9xsA=; b=MAgdHlT1bsrseG
	9PU6US3jKnOto7EWVvCilUL2GlgtKsWJ8ZHQGaCKEHcgNopChbkLBPHOJzcdAzdAyU4bGIIOk7Ors
	xEC0Yb18LXjLE0w0VNwmhx5f59D5zNGjMGLMKPkRbU908tTdL5iRWmJkrO48gZehFaxmGkwZZcDKL
	cLqr+x+jYOZSCUXB+7UXa46GQ4z9J3VTS78kwKAg1DmQo7aFeGH5WAVmnwd0DpLPtWdFqYdvY/nQW
	nlgIrGgaeRDzPsLpQ9e4XeXmdNifLlc0VkpE4JUPo46eMiAUa0CjgSuV8ZOEob7wbBw7tvmM3cetp
	TvGXHpDVuR2M9Bkp+9Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKGd7-0007B5-Rm; Tue, 15 Oct 2019 06:48:25 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKGd3-0007Aa-Qi
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 06:48:23 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x9F6lZp4062733;
 Tue, 15 Oct 2019 14:47:35 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 7FCE536401869601D56D;
 Tue, 15 Oct 2019 14:47:35 +0800 (CST)
In-Reply-To: <20191008170249.06bd45ce@xps13>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>	<1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
 <20191007104511.5aa7b8f2@xps13>	<20191007112442.783e4fbe@xps13>	<OFEDE76FEE.8BC48D9E-ON4825848D.000BCC94-4825848D.000E0643@mxic.com.tw>
 <20191008170249.06bd45ce@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block
 Protection function
MIME-Version: 1.0
X-KeepSent: B4F10613:467EB346-48258494:0020403E;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFB4F10613.467EB346-ON48258494.0020403E-48258494.002550A2@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 15 Oct 2019 14:47:34 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/10/15 PM 02:47:35,
 Serialize complete at 2019/10/15 PM 02:47:35
X-MAIL: TWHMLLG3.macronix.com x9F6lZp4062733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_234822_136313_E0B2B003 
X-CRM114-Status: GOOD (  14.34  )
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
 linux-mtd@lists.infradead.org, richard@nod.at, tglx@linutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> > > > 
> > > > > Macronix AC series support using SET/GET_FEATURES to change
> > > > > Block Protection and Unprotection.
> > > > > 
> > > > > MTD default _lock/_unlock function replacement by manufacturer
> > > > > postponed initialization. 
> > > > 
> > > > Why would we do that?
> > > > 
> > > > Anyway your solution looks overkill, if we ever decide to
> > > > implement these hooks for raw nand, it is better just to not
> > > > overwrite them in nand_scan_tail() if they have been filled
> > > > previously (ie. by the manufacturer code). 
> > > 
> > > Actually you should add two NAND hooks that do the interface with 
the
> > > MTD hooks. In the NAND hooks, check that the request is to lock all 
the
> > > device, otherwise return -ENOTSUPP. 
> > 
> > sorry, can't get your point.
> > 
> > Because the NAND entire chip will be protected if PT(protection) pin 
> > is active high at power-on.
> 
> In your implementation of the locking, you should check that the
> locking request is over the entire device, unless you can lock a
> smaller portion of course.

yes, I can lock a smaller portion.
And at the power-on of device with PT pin at high voltage, all blocks are 
locked.
They have to be unlocked by set feature command.

> 
> > 
> > > 
> > > Then fill-in these two hooks from the manufacturer code, without the
> > > postponed init.
> > > 
> > 
> > But in the final of nand_scan_tail(), mtd->_lock/_unlock will be
> > filled by NULL, right ?
> 
> The NAND core should set mtd->_lock/_unlock() to NAND specific hooks so
> that the MTD layer is abstracted and and drivers do not see it. Then,
> in the NAND helper, either there is no specific hook defined by a
> manufacturer driver and you return -ENOTSUPP, or you execute the
> defined hook.

okay, patch specific manufacturer _lock/_unlock driver
in nand_manufacturer_init();

and in the final of nand_scan_tail()
if (!mtd->_lock)
        mtd->_lock = NULL;
if (!mtd->_unlock)
        mtd->_unlock = NULL;

thanks for your time and comments.
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
