Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3033BC31E5B
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 01:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA552082C
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 01:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTvsZXtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAA552082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kypSEsko6EbCetny+yRi5FWjjfI1OnBagoYx2rELyFk=; b=iTvsZXtXj9k85G
	BE7l8FrB3vugWGrNmi/f5U5Oq+W2f1NknVzchZgujKv+eQBrPbS05Vf6mOzOD9pVgGTqTr7bpU59F
	eauPi76GCbloQ+YssKjFs/1OvWUq+q/R/lgxFOIW2X3TkhB+/yGc4O8rVsUrZZut37gwnrRnlN00u
	XiiYOj6NGW/pY0HWdsqYu2yGU9lDaAHHecq/bS44n6MFSmHA1YKuqVFtED/3610Ee3rs8l+GSUsER
	1vAdQ4HR1swwW7P7IvJT24FtB+DSTzp5RcY39l3B1lKqtCPPrNEYb8r1jpGOCIj/stBrinWFWZjtP
	9eB02rOSnDtVHya8A2Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd2sb-0000qA-Dx; Tue, 18 Jun 2019 01:25:45 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd2sX-0000p8-Lj
 for linux-mtd@lists.infradead.org; Tue, 18 Jun 2019 01:25:43 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x5I1OD5R094554;
 Tue, 18 Jun 2019 09:24:14 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id CD86B7F724E890CDD5EA;
 Tue, 18 Jun 2019 09:24:13 +0800 (CST)
In-Reply-To: <20190617143510.4ded5728@xps13>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>	<1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>	<OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
 <20190520142333.390091d5@xps13>	<OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>
 <20190527144250.71908bd9@xps13>	<OFE923A8E5.50375C30-ON48258409.0009AE1B-48258409.00119767@mxic.com.tw>
 <20190617143510.4ded5728@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
MIME-Version: 1.0
X-KeepSent: 1C1397B4:241DC339-4825841D:000482A2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF1C1397B4.241DC339-ON4825841D.000482A2-4825841D.0007B67E@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 18 Jun 2019 09:24:14 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/06/18 AM 09:24:13,
 Serialize complete at 2019/06/18 AM 09:24:13
X-MAIL: TWHMLLG4.macronix.com x5I1OD5R094554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_182541_988839_1E803289 
X-CRM114-Status: UNSURE (   4.22  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 marcel.ziswiler@toradex.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 richard@nod.at, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> =

> > > > > > > > +static void mxic_nand_select_chip(struct nand_chip *chip, =

int =

> > =

> > > > chipnr) =

> > > > > > > =

> > > > > > > _select_target() is preferred now =

> > > > > > =

> > > > > > Do you mean I implement mxic_nand_select_target() to control =

#CS ?
> > > > > > =

> > > > > > If so, I need to call mxic_nand_select_target( ) to control =

#CS ON
> > > > > > and then #CS OFF in _exec_op() due to nand_select_target()<in  =


> > > > nand_base,c> =

> > > > > > is still calling chip->legacy.select_chip ? =

> > > > > =

> > > > > You must forget about the ->select_chip() callback. Now it =

should be
> > > > > handled directly from the controller driver. Please have a look =

at =

> > the
> > > > > commit pointed against the marvell_nand.c driver. =

> > > > =

> > > > I have no Marvell NFC datasheet and have one question.
> > > > =

> > > > In marvell_nand.c, there is no xxx_deselect_target() or =

> > > > something like that doing #CS OFF.
> > > > marvell_nfc_select_target() seems always to make one of chip or =

die
> > > > #CS keep low.
> > > > =

> > > > Is it right ? =

> > > =

> > > Yes, AFAIR there is no "de-assert" mechanism in this controller.
> > > =

> > > > =

> > > > How to make all #CS keep high for NAND to enter =

> > > > low-power standby mode if driver don't use "legacy.select_chip()" =

? =

> > > =

> > > See commit 02b4a52604a4 ("mtd: rawnand: Make ->select_chip() =

optional
> > > when ->exec_op() is implemented") which states:
> > > =

> > >         "When [->select_chip() is] not implemented, the core is =

assuming
> > >    the CS line is automatically asserted/deasserted by the driver =

> > >    ->exec_op() implementation." =

> > > =

> > > Of course, the above is right only when the controller driver =

supports
> > > the ->exec_op() interface. =

> > =

> > Currently, it seems that we will get the incorrect data and error
> > operation due to CS in error toggling if CS line is controlled in =

> > ->exec_op(). =

> =

> Most of the chips today are CS-don't-care, which chip are you using?

I think CS-don't-care means read-write operation for NAND device to reside
on the same memory bus as other Flash or SRAM devices. Other devices on =

the =

memory bus can then be accessed while the NAND Flash is busy with internal =


operations. This capability is very important for designs that require =

multiple
NAND Flash devices on the same bus.

> =

> Is this behavior publicly documented?
> =


CS# pin goes High enter standby mode to reduce power consumption,
i.e,. standby mode w/ CS# keep High, standby current: 10 uA (Typ for 3.3V =

NAND)
        otherwise, current is more than 1 mA.
i.e,. page read current, 25 mA (Typ for 3.3V NAND)
 =


> Is this LPM mode always activated?
> =

> > i.e,. =

> > =

> > 1) In nand_onfi_detect() to call nand_exec_op() twice by =

> > nand_read_param_page_op() and annd_read_data_op()
> > =

> > 2) In nand_write_page_xxx to call nand_exec_op() many times by
> > nand_prog_page_begin_op(), nand_write_data_op() and =

> > nand_prog_page_end_op().
> > =

> > =

> > Should we consider to add a CS line controller in struct =

nand_controller
> > i.e,.
> > =

> > struct nand_controller {
> >          struct mutex lock;
> >          const struct nand_controller_ops *ops;
> > +          void (*select_chip)(struct nand_chip *chip, int cs);
> > };
> > =

> > to replace legacy.select_chip() ?
> > =

> =

> No, if really needed, we could add a "macro op done" flag in the nand
> operation structure.
> =


Is this "macron op done" flag good for multiple NAND devices on
the same bus ?

Any other way to control CS# pin? if user application is really
care of power consumption, i.e,. loT.

> =

> Thanks,
> Miqu=E8l

thanks & best regards,
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
