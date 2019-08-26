Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954FAC3A5A1
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 02:53:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D07206BB
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 02:53:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUrMkfeP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66D07206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ommreTKxYAvaj2TYXl+SQnNk+8UZqFw1iG8FWwyciE=; b=eUrMkfePBrdKkt
	XC3vSe74Jq9YQ+ikuJZtI1IFVXL0EjHyvnVzQpr0UG8LqL6wFzCbfs2QKYPI/tKmFi8IuXirdupqb
	xIuqVHDMBUosdKS0/ynKKwgmowtUcEBNJCyVZPxKXEapMKE42BUY14dTynUj9mbcmWHmYh+Vx6ZRP
	cqIxskBZQ/3KzaUeYrvWF0XvsJ+wTFCY1PzLRfDTZcZvr5+FYE7PS0YzypGAM0xaFkr8MUF5HHHTP
	JW0pdEn6yWkwSzgZ35sVaHUvoMvLsCLrtBGWZi5HUR8VbOixEYoD3T7x9TIoVAWYk7NZ3LIMHU79U
	kzT5Z4j8lLYVuhHxmLeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i258V-0005nm-2n; Mon, 26 Aug 2019 02:53:39 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i258R-0005ZO-5g
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 02:53:36 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x7Q2qVgB013400;
 Mon, 26 Aug 2019 10:52:31 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id A33EC7ED935DD5A4AF75;
 Mon, 26 Aug 2019 10:52:31 +0800 (CST)
In-Reply-To: <20190824130329.68f310aa@xps13>
References: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
 <20190824130329.68f310aa@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] Add support for Macronix NAND randomizer
MIME-Version: 1.0
X-KeepSent: F725800E:8B26D2E9-48258462:000B94B2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFF725800E.8B26D2E9-ON48258462.000B94B2-48258462.000FCB85@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 26 Aug 2019 10:52:31 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/08/26 AM 10:52:31,
 Serialize complete at 2019/08/26 AM 10:52:31
X-MAIL: TWHMLLG3.macronix.com x7Q2qVgB013400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_195335_478237_CD8938D0 
X-CRM114-Status: UNSURE (   4.99  )
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
Cc: kstewart@linuxfoundation.org, vigneshr@ti.com, bbrezillon@kernel.org,
 juliensu@mxic.com.tw, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,
> =

> Mason Yang <masonccyang@mxic.com.tw> wrote on Tue, 20 Aug 2019 13:53:48
> +0800:
> =

> > Macronix NANDs support randomizer operation for user data scrambled,
> > which can be enabled with a SET_FEATURE.
> > =

> > User data written to the NAND device without randomizer is still =

readable
> > after randomizer function enabled.
> > The penalty of randomizer are NOP =3D 1 instead of NOP =3D 4 and more t=
ime =

period
> =

> please don't use 'NOP' here, use 'subpage accesses' instead, otherwise
> people might not understand what it means while it has a real impact.
> =


okay, understood. =

will fix it by next submitting.

> > is needed in program operation and entering deep power-down mode.
> > i.e., tPROG 300us to 340us(randomizer enabled)
> > =

> > If subpage write not available with hardware ECC, for example,
> > NAND chip options NAND_NO_SUBPAGE_WRITE be set in driver and
> > randomizer function is recommended for high-reliability.
> > Driver checks byte 167 of Vendor Blocks in ONFI parameter page table
> > to see if this high-reliability function is supported.
> > =

> =

> You did not flagged this patch as a v2 and forgot about the changelog.

will fix, thank you.

> You did not listen to our comments in the last version neither. I was
> open to a solution with a specific DT property for warned users but I
> don't see it coming.

Sorry I missed the previous version of "read-retry and randomizer support" =

patch. =

Specific DT property is a good method to control it.

For more high-reliability concern, randomizer is recommended to enable by =

default,
but sub-page write is not allowed when randomizer is enabled.

Since most of HW ECC did not support sub-page write and we think driver to =

check
chip options flags is another simple and good way to enable randomizer.

> =

> =

> Thanks,
> Miqu=E8l

thanks for your time and comments.

best regards,
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
