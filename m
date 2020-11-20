Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B25C388F9
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 01:11:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA9D22254
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 01:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itvnLnrq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA9D22254
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zt+Ejy4ZXBpbnfoIr1ELiKI15eoeHWIsDUVOVMtQcG0=; b=itvnLnrqY6pKB+leFIOWLAcCN
	XO7m2fMVwDDZHzEDSz555AIojiESne6Bps/D/H39L7FztnBmErp0i1RZMmxb3+BSU+SXomNhIqHXZ
	9TOeWFJfr/7IHxV19OGg+LB80If7v0FIJkBuxqA5CjLn+OsW0wHW2ZSIYCIar7QbLSUSaLOa1OQcs
	bfacDDPi6WUKlY62hnUlSRfOy6w4ErDjzESB30ueYiS3cZ4k9QA9Xk8NA3kBasurSTzryaAb2FfsA
	PQXLoXC39tf6hffUHwWtNisi1s6vE/JrzEqEPXR5T8GMHb+mtUoXcx+u70XpBqltpXlIVvR6zANN5
	4pl0eT7fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfux6-0000NE-8y; Fri, 20 Nov 2020 01:11:04 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfux1-0000M1-PW
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 01:11:01 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 0AK1Aeb6016744;
 Fri, 20 Nov 2020 09:10:40 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id C63533B68BD7F94D29D7;
 Fri, 20 Nov 2020 09:10:40 +0800 (CST)
In-Reply-To: <20201119221558.7b484949@xps13>
References: <1604490442-9052-1-git-send-email-ycllin@mxic.com.tw>	<20201119211133.31590-1-miquel.raynal@bootlin.com>
 <20201119221558.7b484949@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: =?Big5?B?pl6rSDogUmU6IFtQQVRDSF0gbXRkOiBzcGluYW5kOiBtYWNyb25peDogQWRk?=
 =?Big5?B?IHN1cHBvcnQgZm9yIE1YMzVMRnhHRTRBRA==?=
MIME-Version: 1.0
X-KeepSent: 13142059:F2BB13E4-48258626:00062B35;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF13142059.F2BB13E4-ON48258626.00062B35-48258626.00067881@mxic.com.tw>
From: ycllin@mxic.com.tw
Date: Fri, 20 Nov 2020 09:10:40 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/11/20 AM 09:10:40,
 Serialize complete at 2020/11/20 AM 09:10:40
X-MAIL: TWHMLLG4.macronix.com 0AK1Aeb6016744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_201100_283391_8D33F065 
X-CRM114-Status: UNSURE (   4.82  )
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
Cc: juliensu@mxic.com.tw, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vigneshr@ti.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 19 Nov 2020
> 22:11:33 +0100:
> =

> > On Wed, 2020-11-04 at 11:47:22 UTC, YouChing Lin wrote:
> > > The Macronix MX35LF2GE4AD / MX35LF4GE4AD are 3V, 2G / 4Gbit serial
> > > SLC NAND flash device (with on-die ECC).
> > > =

> > > Validated by read, erase, read back, write, read back and nandtest
> > > on Xilinx Zynq PicoZed FPGA board which included Macronix SPI Host
> > > (drivers/spi/spi-mxic.c).
> > > =

> > > Signed-off-by: YouChing Lin <ycllin@mxic.com.tw> =

> > =

> > Applied to =

https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git =

> nand/next, thanks.
> =

> Please use "v2" as prefix next time you change something in your patch
> instead of "RESEND", it confuses me. I applied the wrong patch, I will
> drop this one and take the "RESEND, v1" instead.
 =

  OK, I got it, sorry for the mistake!

  Thanks for your time.

  YouChing.

> =

> Thanks,
> Miqu=E8l


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
