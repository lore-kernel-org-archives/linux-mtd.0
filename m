Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C9BCA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 07:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A99B2089C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 07:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="imhOEiNn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A99B2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:References:In-Reply-To:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KK7CZj618LSsyYGSjvZraksSPfmDxxjpXkVnRnlscbA=; b=imhOEiNnguSjn1
	Zlr13KsFmJt64M+vV94HzYVvKn7nOIXIJNby/caLvuPjg/hjhZwax7K0kEqH2ftWdCFde+/KskE6K
	7uyYgC/Lub4TVDXtwYBulGFyUrUkLjf1DuW4mPWSJzMBdObnuHmuPJWix8p77WPCNDPhr8vMRl6QX
	4nuWjjDvcBaAmm5MTrSc8ALmfRgvqsHWNVeIunmS8OBEkotCn0cCrV9+1n6zLDr0iqvgS68FnqLSe
	s9aZ3B+rWM3UwCN2IHxgeeDmE24+tetmfJp/0Ex/EVKkcTGcPgQjV2GwPcOi3SDQzFhqLlLC2uRB6
	BHCSQiycT3/Yq4APUmow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMS46-0001tY-Od; Mon, 21 Oct 2019 07:25:18 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMS43-0001rH-78
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 07:25:17 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x9L7NsEP063347;
 Mon, 21 Oct 2019 15:23:54 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 871A5A0A7356F4B7AAD3;
 Mon, 21 Oct 2019 15:23:55 +0800 (CST)
In-Reply-To: <OFB4F10613.467EB346-ON48258494.0020403E-48258494.002550A2@LocalDomain>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>	<1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
 <20191007104511.5aa7b8f2@xps13>	<20191007112442.783e4fbe@xps13>	<OFEDE76FEE.8BC48D9E-ON4825848D.000BCC94-4825848D.000E0643@mxic.com.tw>
 <20191008170249.06bd45ce@xps13>
 <OFB4F10613.467EB346-ON48258494.0020403E-48258494.002550A2@LocalDomain>
Subject: Re: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block
 Protection function
MIME-Version: 1.0
X-KeepSent: 894937F3:4B6774EB-4825849A:0027B2DF;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF894937F3.4B6774EB-ON4825849A.0027B2DF-4825849A.0028A53F@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 21 Oct 2019 15:23:57 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/10/21 PM 03:23:55,
 Serialize complete at 2019/10/21 PM 03:23:55
X-MAIL: TWHMLLG4.macronix.com x9L7NsEP063347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_002515_555513_22111788 
X-CRM114-Status: GOOD (  10.33  )
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


Hi Miquel,


> > > > Then fill-in these two hooks from the manufacturer code, without 
the
> > > > postponed init.
> > > > 
> > > 
> > > But in the final of nand_scan_tail(), mtd->_lock/_unlock will be
> > > filled by NULL, right ?
> > 
> > The NAND core should set mtd->_lock/_unlock() to NAND specific hooks 
so
> > that the MTD layer is abstracted and and drivers do not see it. Then,
> > in the NAND helper, either there is no specific hook defined by a
> > manufacturer driver and you return -ENOTSUPP, or you execute the
> > defined hook.
> 
> okay, patch specific manufacturer _lock/_unlock driver
> in nand_manufacturer_init();
> 
> and in the final of nand_scan_tail()
> if (!mtd->_lock)
>  mtd->_lock = NULL;
> if (!mtd->_unlock)
>  mtd->_unlock = NULL;
 

I'm still considering of post_init() in nand_scan_tail() for
MTD layer default call-back function replacement because
there would be more call-back functions need it.
i.e., 
MTD->_lock/_unlokc
MTD->_suspend/_resume
NTD->_point/_unpoint
...


actually, my patch series are including MTD->_locl/_unlock and 
MTD->_suspend/_resume. how do you think ?


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
