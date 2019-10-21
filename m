Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B35CA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 09:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99F820873
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 09:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdPBS5/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99F820873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFDZlo4fzf8KhqZR5F6VkOs7PfQynMOCvH+PALeAjWQ=; b=pdPBS5/ju0LpR7
	apJZL+YgZ+cBPbcjA0CZq5b/BXIOvqLLQYYpdM4V/jbVVrAZcUOTDlpBEFf4Omk48g6tuALQM1ePY
	hoDr5OKaFKQvXQd+7tKDlPVxUw8dbFFpQ4U1GxJG9x3fEynJ7JoUOikzU/tYQWpIw3HZAdJioJ3HI
	h3xSj8ONFpqUj3Vrl7FGmPb8SFz/WhK5xvYJrIHK90Wc/KB67TV4H9REPyogXW98s/N8iTnT+Bbqx
	inSv2+4XPtwtKNaTxGZSpPMJqLCYw02uPdUzmPBnOUvsJYKq1JmBB3dNHl7s5ad14q/+wY3qWJAUn
	gZ65XoN1ndrrkCf/C1QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTfh-0005sF-Lw; Mon, 21 Oct 2019 09:08:13 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMTfe-0005rN-B4
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 09:08:11 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x9L96xaO034780;
 Mon, 21 Oct 2019 17:06:59 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 70FE86F08B94F96178FA;
 Mon, 21 Oct 2019 17:07:00 +0800 (CST)
In-Reply-To: <20191021105632.3fa7b3ce@collabora.com>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>	<1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
 <20191007104511.5aa7b8f2@xps13>	<20191007112442.783e4fbe@xps13>	<OFEDE76FEE.8BC48D9E-ON4825848D.000BCC94-4825848D.000E0643@mxic.com.tw>
 <20191008170249.06bd45ce@xps13>	<OFB4F10613.467EB346-ON48258494.0020403E-48258494.002550A2@LocalDomain>
 <OF894937F3.4B6774EB-ON4825849A.0027B2DF-4825849A.0028A53F@mxic.com.tw>	<20191021094435.78f4b16e@collabora.com>
 <OF94EDFFB1.AFAD9C25-ON4825849A.002E2815-4825849A.002FB1CE@mxic.com.tw>
 <20191021105632.3fa7b3ce@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block
 Protection function
MIME-Version: 1.0
X-KeepSent: B0158E79:2CC08A0A-4825849A:0031CDE3;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFB0158E79.2CC08A0A-ON4825849A.0031CDE3-4825849A.0032153E@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 21 Oct 2019 17:07:02 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/10/21 PM 05:07:00,
 Serialize complete at 2019/10/21 PM 05:07:00
X-MAIL: TWHMLLG4.macronix.com x9L96xaO034780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_020810_650303_3993A650 
X-CRM114-Status: UNSURE (   6.60  )
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

> 
> Assign mtd lock/unlock/is_locked hooks to the generic wrappers in
> nand_scan_tail():
> 
>    mtd->_lock = nand_lock;
>    mtd->_unlock = nand_unlock;
>    mtd->_is_locked = nand_is_locked;
> 
> Seriously, we've almost implemented the thing for you with all the
> details we've given. At some point you have to look more closely at how
> things are done/designed in the NAND framework if you want to
> contribute core changes. I'm fine giving hints but we're far beyond
> that point here.

got your point & idea.

thanks a lot for your time & opinions.
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
