Return-Path: <SRS0=GAhz=T5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06296C04AB6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2019 03:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAEE62173B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2019 03:13:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jc76tIOJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAEE62173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJoqqYpJH0B4geTtu8MQ17pZ2uERQp0Xpzmfe2zG4uE=; b=Jc76tIOJLDqaSw
	4DKD1T48WueDuenLzhZgNSmVaOWur+KGr331/2dJ1rNlyyuBBTiIfkjUSB38pNEIzQ2buGZlWZJlF
	8rcmST1xJeY25blK/Q5zuSjSlDTiD9iPKqH5WBKEEVdgIfqrOLrZRPDsHNJzMhBAV0rkkFq0nEOsR
	WEDoaURO3ckDHt2Bjdjy20nhCGcabAiWDDnBJePGYQnNRQGxAgr+pTDIXBWnNw43bzoIOLtVsasDt
	6M8sSeVIAK1eySiR7y/8FOdKWSnKs1XmYL4PW/mV62ynS2Luu1RcsGXll1j/jTHDUYiBPDplPfWXw
	jpLE9KoXGj5f+PPJNQVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVp1j-0007KB-KX; Wed, 29 May 2019 03:13:19 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVp1g-0007Js-89
 for linux-mtd@lists.infradead.org; Wed, 29 May 2019 03:13:17 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x4T3C9Cr060053;
 Wed, 29 May 2019 11:12:09 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id EDCE24567F9C6873D729;
 Wed, 29 May 2019 11:12:08 +0800 (CST)
In-Reply-To: <20190527144250.71908bd9@xps13>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>	<1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>	<OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
 <20190520142333.390091d5@xps13>	<OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>
 <20190527144250.71908bd9@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
MIME-Version: 1.0
X-KeepSent: E923A8E5:50375C30-48258409:0009AE1B;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFE923A8E5.50375C30-ON48258409.0009AE1B-48258409.00119767@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 29 May 2019 11:12:08 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/29 AM 11:12:09,
 Serialize complete at 2019/05/29 AM 11:12:09
X-MAIL: TWHMLLG3.macronix.com x4T3C9Cr060053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_201316_562726_79A7376C 
X-CRM114-Status: UNSURE (   5.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

> > > > > > +static void mxic_nand_select_chip(struct nand_chip *chip, int =

 =

> > chipnr) =

> > > > > =

> > > > > _select_target() is preferred now =

> > > > =

> > > > Do you mean I implement mxic_nand_select_target() to control #CS ?
> > > > =

> > > > If so, I need to call mxic_nand_select_target( ) to control #CS ON
> > > > and then #CS OFF in _exec_op() due to nand_select_target()<in =

> > nand_base,c> =

> > > > is still calling chip->legacy.select_chip ? =

> > > =

> > > You must forget about the ->select_chip() callback. Now it should be
> > > handled directly from the controller driver. Please have a look at =

the
> > > commit pointed against the marvell_nand.c driver. =

> > =

> > I have no Marvell NFC datasheet and have one question.
> > =

> > In marvell_nand.c, there is no xxx_deselect_target() or =

> > something like that doing #CS OFF.
> > marvell_nfc_select_target() seems always to make one of chip or die
> > #CS keep low.
> > =

> > Is it right ?
> =

> Yes, AFAIR there is no "de-assert" mechanism in this controller.
> =

> > =

> > How to make all #CS keep high for NAND to enter =

> > low-power standby mode if driver don't use "legacy.select_chip()" ?
> =

> See commit 02b4a52604a4 ("mtd: rawnand: Make ->select_chip() optional
> when ->exec_op() is implemented") which states:
> =

>         "When [->select_chip() is] not implemented, the core is assuming
>    the CS line is automatically asserted/deasserted by the driver
>    ->exec_op() implementation."
> =

> Of course, the above is right only when the controller driver supports
> the ->exec_op() interface. =


Currently, it seems that we will get the incorrect data and error
operation due to CS in error toggling if CS line is controlled in =

->exec_op().
i.e,. =


1) In nand_onfi_detect() to call nand_exec_op() twice by =

nand_read_param_page_op() and annd_read_data_op()

2) In nand_write_page_xxx to call nand_exec_op() many times by
nand_prog_page_begin_op(), nand_write_data_op() and =

nand_prog_page_end_op().


Should we consider to add a CS line controller in struct nand_controller
i.e,.

struct nand_controller {
         struct mutex lock;
         const struct nand_controller_ops *ops;
+          void (*select_chip)(struct nand_chip *chip, int cs);
};

to replace legacy.select_chip() ?


To patch in nand_select_target() and nand_deselect_target()

void nand_select_target(struct nand_chip *chip, unsigned int cs)
{
        /*
         * cs should always lie between 0 and chip->numchips, when that's =

not
         * the case it's a bug and the caller should be fixed.
         */
        if (WARN_ON(cs > chip->numchips))
                return;

        chip->cur_cs =3D cs;

+       if (chip->controller->select_chip)
+               chip->controller->select_chip(chip, cs);
+
        if (chip->legacy.select_chip)
                chip->legacy.select_chip(chip, cs);
}

void nand_deselect_target(struct nand_chip *chip)
{
+       if (chip->controller->select_chip)
+               chip->controller->select_chip(chip, -1);
+
        if (chip->legacy.select_chip)
                chip->legacy.select_chip(chip, -1);

        chip->cur_cs =3D -1;
}


> =

> So if you think it is not too time consuming and worth the trouble to
> assert/deassert the CS at each operation, you may do it in your driver.
> =

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
