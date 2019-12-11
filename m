Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E443BC43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 02:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B608A2077B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 02:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fTBOse7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B608A2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRMrSyj//S18Hy7YqnYy98h7v62poJwXN2usH39pxVg=; b=fTBOse7WYESO71
	KkJ5xObvi+yuDiUVrgXRjUDrICS2qXCCZk9ShbRRifnyLpUM4l0VvOteTNGjNbrRXMD82pjMPbBCV
	aAHRnbV+9JptgxeB6csmk1tJdB3/tkPo1YKgbqpoPnh7SZPlVMP3N78ec4tkWYRXi3Qd1vYpJhkv2
	NVm6iuo+bxny6nkm8kATn6Vn/IPQ0GodTUPELk5wn38htQK/Tjv9/rMRI/uJFMnZ7H7k4X3I+0a+s
	3sbxfV7vgNvDa4rabT6IghWKi2ALU/BBpkPshFi9mGTxo5zBabCExg5+jKOAM8E2MWx7zydZnzcvx
	+Ea+7wazyUCiFZM74t9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ierX9-0006mc-W6; Wed, 11 Dec 2019 02:15:23 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ierX6-0006lx-80
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 02:15:22 +0000
Received: from twhfm1p2.macronix.com (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id xBB2EbJC009562;
 Wed, 11 Dec 2019 10:14:37 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id EE442EC2E2E051ECB764;
 Wed, 11 Dec 2019 10:14:37 +0800 (CST)
In-Reply-To: <8f2908ec-6e17-dad1-7f2a-ec22647caecb@microchip.com>
References: <1573808288-19365-1-git-send-email-masonccyang@mxic.com.tw>
 <8f2908ec-6e17-dad1-7f2a-ec22647caecb@microchip.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
MIME-Version: 1.0
X-KeepSent: B2FEF12D:A2B77CBE-482584CD:000C20E3;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFB2FEF12D.A2B77CBE-ON482584CD.000C20E3-482584CD.000C5393@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 11 Dec 2019 10:14:38 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/12/11 AM 10:14:37,
 Serialize complete at 2019/12/11 AM 10:14:37
X-MAIL: TWHMLLG4.macronix.com xBB2EbJC009562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_181521_349608_97CA8AC1 
X-CRM114-Status: UNSURE (   7.81  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, broonie@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Tudor,

> 
> Re: [PATCH 0/4] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
> 
> Hi, Mason,
> 
> From the discussion you had with Vignesh, I understand that a v2 will 
follow. A
> nit below.
> 
> On 11/15/19 10:58 AM, Mason Yang wrote:
> > Hello,
> > 
> > This is repost of patchset from Boris Brezillon's
> > [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].
> > 
> 
> [cut]
> 
> > Mason Yang (4):
> 
> Did you intentionally overwrite Boris's authorship? If yes, would you 
please
> describe what changed from Boris's patch set?

okay, sure.
I will describe it in v2 patch set.

> 
> Cheers,
> ta

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
