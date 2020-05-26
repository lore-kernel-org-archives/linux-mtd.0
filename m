Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60457C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 11:42:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30263207CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 11:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FGrjObU/";
	dkim=fail reason="length tag value exceeds body size" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="hXke1NcY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30263207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzjabhmrrjD+Vf+qmf4dhqkDu/aIj3EynyTTpofzZtE=; b=FGrjObU/j9TGkR
	L5mA0JMe3aZgsjb/fV6sqAbGjZLiX0iaLSR87YaShCMAM7QcTQ3WyrgBGulDNajBvSSNwifGXlspC
	SQmSFd5dHWrvZkurEr3osAsi6BjKuKrMOO77d0MRBxYzw5Jh09KtLKLWYy0lOImIHKuYSPGUnznqX
	ktWwLl93Qukk1emTu208K0utZn4W5k1znuV0L5YGD729fCwTKSsPTmbcEc8kkA0V2cYbOC4qIqxB6
	iKlYAtkgaUenXgjQijok0TaMRnzpPbJjDrsPI/oYZiG8JgJOGS/JLFNsf5nSxF0RBAHR6ypAZz9fA
	nMqJq/mz8K7Iq6MGk/GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdXyE-00063H-0u; Tue, 26 May 2020 11:42:10 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdXyB-00062W-LN
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 11:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=3804; q=dns/txt; s=axis-central1;
 t=1590493327; x=1622029327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=acBsamI4FHYZP8LDPSTeZee/0NKp1PQ9Ydd8tWW27gE=;
 b=hXke1NcY/e186yz3yL5RINh1guD+GkURmZRSn4FnXKiKjpHqE89GnZ5d
 VuCQjJJO8LnBuAl2vMpSjieQM6T7btln0YpkGuPWjpVsGlm7B14sLYuf0
 K83iz5N71c5rKIAZPiIkQIOMAXUzfVKKRrkEwa27rMMUkajwV3N9UYi9n
 sKiRg3fZr/MqOYMqs7H9LOTnJXgUSgVqObZ1UR0httZ07JvqK8NLpvTNa
 EqL6E4E1jUAF7YGyrbqqUCk25TxxdzficAB26L3OvDvh+90vi1cT30Wz4
 Xrb6Kkj0zR4tvfI3A8DKDQWGWY03SI/1rswZbLti31viBJekaXz5VBY/I w==;
IronPort-SDR: bMrQgenH+y5YVR/OVfHyfCrpUgXg95YdSSQiuPIZ8dVYKz+2c8C/Ne2pqfQ9hr1SlX3QEf1SoZ
 VTgsxp4nQhhyK44VOQg/4sljSty4qZ2HSSjQfjYuv/7mCivtOXy9pIPODnkE7jr3QDR73IS9MW
 X/BzYfKDtl8SQQb+jTOczOV9DWcyloaaunxRiGFLba9M0gSRvjiFSGdtSmnB6aan0EKgzHE2rk
 QgBO4+czNeHYClieLl5DPv0RFtZCvMrPwBW/3kQABKK7hjtTTsMBoM72Jp3/h8UoTeDhQZxizO
 PeY=
X-IronPort-AV: E=Sophos;i="5.73,437,1583190000"; 
   d="scan'208";a="9115345"
From: Rickard X Andersson <Rickard.Andersson@axis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: SV: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Thread-Topic: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Thread-Index: AQHWMrvx0GB+9nbIC0qgjza4H/ESQKi5ExgAgAEHpST//+NCgIAAJh/+///p5oCAAC+o+A==
Date: Tue, 26 May 2020 11:42:04 +0000
Message-ID: <1590493324794.851@axis.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-18-miquel.raynal@bootlin.com>
 <20200525214530.16cd59c1@collabora.com>	<1590485738758.69301@axis.com>
 <20200526114615.287cba5d@xps13>
 <1590487858465.24768@axis.com>,<20200526124335.7f1ad8c4@xps13>
In-Reply-To: <20200526124335.7f1ad8c4@xps13>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_044208_100622_5A044878 
X-CRM114-Status: GOOD (  14.09  )
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

On Tue, May 26, 2020 at 12:44 PM Miquel Raynal <miquel.raynal@bootlin.com> =
wrote:
> > > > > +/**
> > > > > + * nand_choose_best_sdr_iface - given a data interface, find the=
 closest
> > > > > + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mo=
de/timings set for this interface supported
> > > > > + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0by=
 both the NAND controller and the NAND chip
> > > > > + * @chip: the NAND chip
> > > > > + * @best_iface: the best data interface (can eventually be updat=
ed)
> > > > > + */
> > > > > +static int nand_choose_best_sdr_iface(struct nand_chip *chip,
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct nand_data_interface *best_iface)
> > > > > +{
> > > > > + =A0 =A0 =A0 const struct nand_controller_ops *ops =3D chip->con=
troller->ops;
> > > > > + =A0 =A0 =A0 int mode, ret;
> > > > > +
> > > > > + =A0 =A0 =A0 /* Verify the controller supports the requested int=
erface */
> > > > > + =A0 =A0 =A0 ret =3D ops->setup_data_interface(chip, NAND_DATA_I=
FACE_CHECK_ONLY,
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 best_iface);
> > > > > + =A0 =A0 =A0 if (!ret)
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> > > > > +
> > > > > + =A0 =A0 =A0 /* Fallback to slower modes */
> > > > > + =A0 =A0 =A0 for (mode =3D best_iface->timings.mode - 1; mode >=
=3D 0; mode--) {
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onfi_fill_data_interface(ch=
ip, best_iface,
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0NAND_SDR_IFACE, mode);
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> > > > > +
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ops->setup_data_interface(c=
hip,
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NAND_DATA_IFACE_CHECK_ONLY,
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 best_iface);
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ret)
> > > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > > > > + =A0 =A0 =A0 }
> > > > > +
> > > > > + =A0 =A0 =A0 return 0;
> > > > > +}
> > > > > + =A0 =

> > > >
> > > > Should we not start looping from "mode =3D best_iface->timings.mode=
" ? The first setup_data_interface call in the above function tests the spe=
cific timings or am I missing something? =

> > >
> > > Indeed, we assume that the controller driver will not support the
> > > "official" ONFI timings mode X if it did not support the specific
> > > timings close to mode X.
> > >
> > > This is an assumption, but I don't think we are far from the reality
> > > here.
> > >
> > > Miqu=E8l =

> >
> > It could be that the "corresponding onfi mode" is quite low due to devi=
ation of some parameter that are actually not checked/used by the controlle=
r drivers.
>
> That might happen. I'll change it.
>
> > Another thing, should we not check in order to be sure that mode does n=
ot become negative? I.e if best_iface->timings.mode is zero before executin=
g the loop.
>
> I think the for-loop "mode >=3D 0" condition ensures this will never
> happen, right?
>
> Thanks,
> Miqu=E8l

If best_iface->timings.mode is zero before entering the loop we will not ca=
ll onfi_fill_data_interface at all.

BR,
Rickard
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
