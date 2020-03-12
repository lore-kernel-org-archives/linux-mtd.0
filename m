Return-Path: <SRS0=7qHi=45=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D87DC0044D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 01:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408D720739
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2020 01:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5QPQjxN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408D720739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHHyS9hy4vj2F2ZA8BcYFHq5TwjoRMweW7LwrzbLO0E=; b=b5QPQjxNLCzQtV
	52WlYFo7beYzegp4tuMQJsJYx43T89vv/TNx9k7C8moWbhNYaR9oSaBnVY8EfUASZzDmhSWO928O4
	bxD0xIgFoDCEyF55bq75cGwEs+dxS/vHhiuDqCrQbOhi5cMBLsFv32xIW7A9NBlBB+eabNWwyFs2H
	BJv0891GKhX2HSuYxlzNsnnvrQhYLaBQp3alE8fBuzIg2A+o/BBqrcacV6yyKOoIMDY5ARVD2M4nf
	gqvJgf26t77lSXjMxRPtLzuZiOCNEjsP6MLtqN805LjrgPgqWJOXA91UWX4BwkmmbfflAGwsyifch
	9Ey/b6xDLttD9Xmt0X5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCCvo-0006gD-4k; Thu, 12 Mar 2020 01:46:40 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCCvj-0006fq-Le
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2020 01:46:38 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 02C1jGWP063299;
 Thu, 12 Mar 2020 09:45:16 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id A7DE8C6B7C8838238773;
 Thu, 12 Mar 2020 09:45:16 +0800 (CST)
In-Reply-To: <20200311084304.580bec79@xps13>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>	<1583220084-10890-4-git-send-email-masonccyang@mxic.com.tw>
 <20200310203310.5fe74c57@collabora.com>	<OF5C883176.AD73134D-ON48258528.000F5185-48258528.001F3544@mxic.com.tw>
 <20200311084304.580bec79@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: Add support manufacturer specific
 suspend/resume operation
MIME-Version: 1.0
X-KeepSent: A42184FE:1BAA0BF4-48258529:000916D9;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFA42184FE.1BAA0BF4-ON48258529.000916D9-48258529.0009A361@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 12 Mar 2020 09:45:16 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/03/12 AM 09:45:16,
 Serialize complete at 2020/03/12 AM 09:45:16
X-MAIL: TWHMLLG4.macronix.com 02C1jGWP063299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_184637_567911_8265CFAB 
X-CRM114-Status: UNSURE (   4.64  )
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
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de, rfontana@redhat.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 stefan@agner.ch, tglx@linutronix.de, allison@lohutok.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,
 =

> > > > diff --git a/include/linux/mtd/rawnand.h =

b/include/linux/mtd/rawnand.h
> > > > index bc2fa3c..c0055ed 100644
> > > > --- a/include/linux/mtd/rawnand.h
> > > > +++ b/include/linux/mtd/rawnand.h
> > > > @@ -1064,6 +1064,8 @@ struct nand_legacy {
> > > >   * @lock:      lock protecting the suspended field. Also used to
> > > >   *         serialize accesses to the NAND device.
> > > >   * @suspended:      set to 1 when the device is suspended, 0 when =

 =

> > it's not.
> > > > + * @_suspend:      [REPLACEABLE] specific NAND device suspend =

> > operation
> > > > + * @_resume:      [REPLACEABLE] specific NAND device resume =

operation
> > > >   * @bbt:      [INTERN] bad block table pointer
> > > >   * @bbt_td:      [REPLACEABLE] bad block table descriptor for =

flash
> > > >   *         lookup.
> > > > @@ -1119,6 +1121,8 @@ struct nand_chip {
> > > > =

> > > >     struct mutex lock;
> > > >     unsigned int suspended : 1;
> > > > +   int (*_suspend)(struct nand_chip *chip);
> > > > +   void (*_resume)(struct nand_chip *chip); =

> > > =

> > > I thought we agreed on not prefixing new hooks with _ ? =

> > =

> > For [PATCH v2] series, you mentioned to drop the _ prefix =

> > of _lock/_unlock only and we finally patched to lock_area/unlock_area.
> > =

> =

> I missed this _, this is not something we want to add.
> =

> Also, when applying your patches I had several issues because they
> where not base on the last -rc1.
> =

> Finally, I think I forgot a line when patching manually so it produces
> a warning now.
> =

> I am dropping patch 3 and 4, I keep patch 1 and 2 which seem fine.
> =

> Please send a rebased and edited v4 for these, don't forget to drop the
> kbuildtest robot tag and please also follow these slightly edited
> commit logs:
> =

> 2/4
> =

>     mtd: rawnand: Add support for manufacturer specific suspend/resume =

operation
> =

>     Patch nand_suspend() & nand_resume() to let manufacturers overwrite
>     suspend/resume operations.
> =

> 3/4
> =

>     mtd: rawnand: macronix: Add support for deep power down mode
> =

>     Macronix AD series support deep power down mode for a minimum
>     power consumption state.
> =

>     Overlaod nand_suspend() & nand_resume() in Macronix specific code to
>     support deep power down mode.

okay, will resend [PATCH v4 xx/2] for suspend/resume operation with these =

commit logs.

> =

> Thanks,
> Miqu=E8l

thanks for your review & comments.
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information =

and/or personal data, which is protected by applicable laws. Please be =

reminded that duplication, disclosure, distribution, or use of this e-mail =

(and/or its attachments) or any part thereof is prohibited. If you receive =

this e-mail in error, please notify us immediately and delete this mail as =

well as its attachment(s) from your system. In addition, please be =

informed that collection, processing, and/or use of personal data is =

prohibited unless expressly permitted by personal data protection laws. =

Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or=
 personal data, which is protected by applicable laws. Please be reminded t=
hat duplication, disclosure, distribution, or use of this e-mail (and/or it=
s attachments) or any part thereof is prohibited. If you receive this e-mai=
l in error, please notify us immediately and delete this mail as well as it=
s attachment(s) from your system. In addition, please be informed that coll=
ection, processing, and/or use of personal data is prohibited unless expres=
sly permitted by personal data protection laws. Thank you for your attentio=
n and cooperation.

Macronix International Co., Ltd.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
