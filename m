Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC16C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 10:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3E72073B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 10:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iZmYgm9q";
	dkim=fail reason="length tag value exceeds body size" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="L4FVWMBa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3E72073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lR+YGe6E3SVGgGOaRSh7gdkmK/y6j+7OpocGB/MS5so=; b=iZmYgm9qUbtqW4
	3aJpKcta2iEli5W3RsQZqKWTf9hQWsV64QZQtV0Z/jrDlnaoai1yf2bIaiUTQDq5jpUxC/dxMbsLl
	Rbm2WPoxOavYkemlfLSUcxcmBycQ+OSRaJn3Fd+aLxDO9r6PzTsTWR1DdLjfsYNTZ1UKUsRjW0nm+
	jD5bUHRW9gewe+kIVD9HgsR0q+9wk9p55Lwkl6TbkfU1MwCB3+cqUXPAc35gqbbSWaxCl7kDl1e74
	WtJKtQE6+kXOAbHYApvC9y4HwAGcTlgnDSwaI9Z87jJYvqyXq2LsbL2snJn19vOpE8oGUk1lZ4QdN
	oqAd9dD2plrhxV8JVeUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdWY3-00037i-QA; Tue, 26 May 2020 10:11:03 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdWY0-000373-Fs
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 10:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=3295; q=dns/txt; s=axis-central1;
 t=1590487860; x=1622023860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O+2HCWXb4lOZSEByt8gDWKGK8vJD+KAnzXPcXoY1CxA=;
 b=L4FVWMBa/TixjdLg49kdkEFCoWqX2Y7KBDo6/GjtGrsA7RbMvrzRJAgl
 DfTcre6ut+V5Xn0zc2j1AY5A+ouMJNa56kOwt75k+rlVx/tLdutiL/x1p
 l0SefCTMTxheOzd0kzsAlerbfllhRjh70IG77HdwhH8p2RKMvnyh86a6J
 6jZ2F0ypLMZi2wBBsL/NtI9fwasB7LPhSgE8scWLsjgFfz8yRhl1i4h4y
 uuCt5Nf1peE/Ayu7c1LBKoYUp+DEOCLWSZDzAUy7OgvQKV9F6+tQ9rtOj
 gSs3MlL+xXO7qGFc7ry91AsUB89qJ1BX/Cp/o2RzBH8hBeIs8Bxbejgrd A==;
IronPort-SDR: i0EDQZmwaq41NloIiIIvWf/GHuiBI6N3inngb/TchR6U9aahnGe2rLXxLNyGFRwc+6npBAo55H
 M+GOQZkF0JJm6WTN9Vh6dFSRpU0HQsscf8x0Orp0dVq/UkEpUCbQ3bQPN6202JiY9iQjLksMo4
 0JZYpY+Up5SPU0ymnKRnBKsLTm/ILejDOIeaIJEsdS0qf/2L+IPFV2nTxJo7iJfwZtOv2wEyT1
 SNhlbGgsB9Y1yNgdHqPpRY+cLf+4vyYZuQz7msLKXMw8Ebqw7fypiVr6BS2hiitbqeU0fB3oh2
 zWQ=
X-IronPort-AV: E=Sophos;i="5.73,436,1583190000"; 
   d="scan'208";a="9111911"
From: Rickard X Andersson <Rickard.Andersson@axis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: SV: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Thread-Topic: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Thread-Index: AQHWMrvx0GB+9nbIC0qgjza4H/ESQKi5ExgAgAEHpST//+NCgIAAJh/+
Date: Tue, 26 May 2020 10:10:58 +0000
Message-ID: <1590487858465.24768@axis.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-18-miquel.raynal@bootlin.com>
 <20200525214530.16cd59c1@collabora.com>
 <1590485738758.69301@axis.com>,<20200526114615.287cba5d@xps13>
In-Reply-To: <20200526114615.287cba5d@xps13>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.15]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_031101_145837_36D620DB 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 26, 2020 at 11:46 AM Miquel Raynal <miquel.raynal@bootlin.com> =
wrote:

> > > +/**
> > > + * nand_choose_best_sdr_iface - given a data interface, find the clo=
sest
> > > + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mode/t=
imings set for this interface supported
> > > + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0by bot=
h the NAND controller and the NAND chip
> > > + * @chip: the NAND chip
> > > + * @best_iface: the best data interface (can eventually be updated)
> > > + */
> > > +static int nand_choose_best_sdr_iface(struct nand_chip *chip,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct nand_data_interface *best_iface)
> > > +{
> > > + =A0 =A0 =A0 const struct nand_controller_ops *ops =3D chip->control=
ler->ops;
> > > + =A0 =A0 =A0 int mode, ret;
> > > +
> > > + =A0 =A0 =A0 /* Verify the controller supports the requested interfa=
ce */
> > > + =A0 =A0 =A0 ret =3D ops->setup_data_interface(chip, NAND_DATA_IFACE=
_CHECK_ONLY,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 best_iface);
> > > + =A0 =A0 =A0 if (!ret)
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> > > +
> > > + =A0 =A0 =A0 /* Fallback to slower modes */
> > > + =A0 =A0 =A0 for (mode =3D best_iface->timings.mode - 1; mode >=3D 0=
; mode--) {
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onfi_fill_data_interface(chip, =
best_iface,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0NAND_SDR_IFACE, mode);
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> > > +
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ops->setup_data_interface(chip,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 NAND_DATA_IFACE_CHECK_ONLY,
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 best_iface);
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ret)
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > > + =A0 =A0 =A0 }
> > > +
> > > + =A0 =A0 =A0 return 0;
> > > +}
> > > + =

> >
> > Should we not start looping from "mode =3D best_iface->timings.mode" ? =
The first setup_data_interface call in the above function tests the specifi=
c timings or am I missing something?
>
> Indeed, we assume that the controller driver will not support the
> "official" ONFI timings mode X if it did not support the specific
> timings close to mode X.
>
> This is an assumption, but I don't think we are far from the reality
> here.
>
> Miqu=E8l

It could be that the "corresponding onfi mode" is quite low due to deviatio=
n of some parameter that are actually not checked/used by the controller dr=
ivers. =


Another thing, should we not check in order to be sure that mode does not b=
ecome negative? I.e if best_iface->timings.mode is zero before executing th=
e loop.

Best regards,
Rickard
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
