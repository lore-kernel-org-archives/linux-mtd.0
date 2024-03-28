Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A330DC54E67
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 09:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5vbFjOrPHINd8y1upg9dn0AteU8BS8t3Rv6yuzLqFA=; b=305wLPw9Kyc50hqPABBXrcHjLJ
	GhaQNwYC1ZR23VZYTG0rCcA1fEj5DM/XOaAZIQvjJ+21M3IlLLvCn1EeDzQlkuQKdeQnrMT9hk1Cr
	Zt//4VHD0U0CL4mSaEE/0flVvR4A5KAIslJW45NBNpVticaJiwsxxwXx6drVNcSCogDqtSs+W4bDC
	S1EsnpKX8wcRoYPbadVXOI1k4za1WW5rz/x3UD9tjiuUforGyDV5xdp+aVMKgVjewmdZDcbw39m69
	i73zQnb146u4fcFM0BqjEY+sp1A1EUg5iNZX2a30Ns5/4D99ky7AQ1LoDTMnhFu0qipRHtHca6Jos
	m6Jzew9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmCt-0000000DNiZ-2cAm;
	Thu, 28 Mar 2024 09:37:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmCp-0000000DNfj-2wuQ
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 09:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711618675; x=1743154675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=je05IT2ra3zgp+R3TY8tIA0/mN+MpWGD8AqLDSxjOnw=;
  b=Y95wvOus+fDq68XDcbK2rniG1M4kEG8YV4HR5FTSbJsDwoDVkMzSu3OK
   it6BxI3iHSgmCLcvUqxwnUoIDJwSlU+NRsldaeU3u4IVNA3MmE4nX0tRv
   xUwGgbfONnnKAtlYIzaa02GCY7G/gYrfMZ9oOy4DtbIMU7F7rpE5TgoUM
   Hrv6DOReAWmvuYMJ63cckdhQ+YCrWuFmlE3r8K2t+fRARyaq1XEm5+tlM
   UPuNgZ6NSdqu3GANPDai2tnvOq1ELxaOBdRcsETqiVoxUc1z/6PoDwgPk
   yqjxeF59s1zQZ0ALRb2atWYWB2t11ktwRFFwSXeyijfYEHoMFxkCdf9QH
   A==;
X-CSE-ConnectionGUID: DX6dgQOrQEKgaromDnuM8w==
X-CSE-MsgGUID: oruQuroDSA+lampJ4MlvIw==
X-IronPort-AV: E=Sophos;i="6.07,161,1708412400"; 
   d="asc'?scan'208";a="18510167"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Mar 2024 02:37:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 02:37:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 28 Mar 2024 02:37:45 -0700
Date: Thu, 28 Mar 2024 09:36:57 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240328-tinfoil-skillet-b1c1629b97ee@wendy>
References: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
 <20240327-loongson1-nand-v6-1-7f9311cef020@gmail.com>
 <20240327-bonehead-handlebar-1ca8dab95179@spud>
 <CAJhJPsX7Ds-UdFpTpLgFMW+rTGAgAYSKAieAMn12Z8RjNn-A8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJhJPsX7Ds-UdFpTpLgFMW+rTGAgAYSKAieAMn12Z8RjNn-A8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_023755_835840_A17F19B7 
X-CRM114-Status: GOOD (  19.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6652514195788755840=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6652514195788755840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8CphlZzrFnQFHqWt"
Content-Disposition: inline

--8CphlZzrFnQFHqWt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 04:54:59PM +0800, Keguang Zhang wrote:
> On Thu, Mar 28, 2024 at 12:23=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, Mar 27, 2024 at 06:43:59PM +0800, Keguang Zhang via B4 Relay wr=
ote:
> > > From: Keguang Zhang <keguang.zhang@gmail.com>
> > >
> > > Add devicetree binding document for Loongson-1 NAND Controller.
> > >
> > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > > ---
> > > Changes in v6:
> > > - A newly added patch
> > > ---
> > >  .../devicetree/bindings/mtd/loongson,ls1x-nfc.yaml | 66 ++++++++++++=
++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.=
yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml
> > > new file mode 100644
> > > index 000000000000..2494c7b3b506
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml
> > > @@ -0,0 +1,66 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/loongson,ls1x-nfc.yaml#
> >
> > Please make the filename match the compatible.
> >
> Got it. I'll rename it to loongson,ls1-nfc.yaml and change the
> compatible as follows.
>   compatible:
>    items:
>      - enum:
>          - loongson,ls1a-nfc
>          - loongson,ls1b-nfc
>          - loongson,ls1c-nfc
>      - const: loongson,ls1-nfc

No, please do not do this. Just call the file "ls1b-nfc".

Thanks,
Conor.

--8CphlZzrFnQFHqWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgU6OQAKCRB4tDGHoIJi
0qpNAQDPGcLdo896VBifrNbIBoMmtgOKSlc0RzqTLluuo9ii3wD+J5nVH5Pj+smz
YxsCrN3q+VxFGdQPTqKzmuxNdvT8owU=
=1nfV
-----END PGP SIGNATURE-----

--8CphlZzrFnQFHqWt--


--===============6652514195788755840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6652514195788755840==--

