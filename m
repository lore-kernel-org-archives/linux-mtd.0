Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D40C2BA83
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 08:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A727320725
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 08:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/MIlrcq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A727320725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcUyX7FHbZ7E9BryYsQGoE9QYx503DBifa17VIoZ504=; b=d/MIlrcqIwLBeT
	h42f1ChXMC9blRhBQthHZ7uw07UVlDy6jeujLqkRIy6gXbuz9C0DAGMkobSFS/Y8eEYIlhV/14rWl
	4JEuR7MDIZE8PigFIBFdwL4k0ebghyHQYyapOsmxNXnwc4F5c8Lf1VHDZhX8C7TNbabMtE/OT0N0C
	fa6bhIkGgFDeEzMvXo/0GJshCRkBwMuc9MlQPxlqFiUvUpGOALm19jnaHsv/R4HH2KGhzdJfcCPe/
	70s5zZZTsRGNYhEnHtOzQplEkJ5QRSfOrqGp6Nay/ULcYj7YmuHF8ztY6NhI5eONmyX7NGSlhJLPp
	bKEXH99TL227zUOKtUyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3bQ3-0007LT-4Z; Mon, 17 Feb 2020 08:06:19 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3bPs-0007CK-Su
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 08:06:10 +0000
Received: from twhfm1p2.macronix.com (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 01H85KGV065118;
 Mon, 17 Feb 2020 16:05:20 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 9F2C7D893E53A71B2A1F;
 Mon, 17 Feb 2020 16:05:20 +0800 (CST)
In-Reply-To: <20200109174159.1737067f@xps13>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>	<1572256527-5074-2-git-send-email-masonccyang@mxic.com.tw>
 <20200109174159.1737067f@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add support manufacturer specific
 lock/unlock operatoin
MIME-Version: 1.0
X-KeepSent: EFE7D559:94EF04D5-48258511:002C29D3;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFEFE7D559.94EF04D5-ON48258511.002C29D3-48258511.002C6EEC@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 17 Feb 2020 16:05:19 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/02/17 PM 04:05:20,
 Serialize complete at 2020/02/17 PM 04:05:20
X-MAIL: TWHMLLG4.macronix.com 01H85KGV065118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_000609_209352_A7143E43 
X-CRM114-Status: UNSURE (   5.05  )
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
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,


> >  /* Set default functions */
> >  static void nand_set_defaults(struct nand_chip *chip)
> >  {
> > @@ -5782,8 +5810,8 @@ static int nand_scan_tail(struct nand_chip =

*chip)
> >     mtd->_read_oob =3D nand_read_oob;
> >     mtd->_write_oob =3D nand_write_oob;
> >     mtd->_sync =3D nand_sync;
> > -   mtd->_lock =3D NULL;
> > -   mtd->_unlock =3D NULL;
> > +   mtd->_lock =3D nand_lock;
> > +   mtd->_unlock =3D nand_unlock;
> >     mtd->_suspend =3D nand_suspend;
> >     mtd->_resume =3D nand_resume;
> >     mtd->_reboot =3D nand_shutdown;
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 4ab9bcc..2430ecd 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -1136,6 +1136,9 @@ struct nand_chip {
> >        const struct nand_manufacturer *desc;
> >        void *priv;
> >     } manufacturer;
> > +
> > +   int (*_lock)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> > +   int (*_unlock)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> =

> Kernel documentation is missing here.
> =

> Also please fix kbuildtest robot warnings.

okay, will fix both !

> =

> With all this done, please add my:
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> =

> Thanks,
> Miqu=E8l

thanks for your time & comments.
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
