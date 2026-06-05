Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6120CD6E6B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 07:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3+GOfHjehPqyRETnLXPF4TAB4i4ankom8erMceF2wA=; b=dCXC4xOlBJyb6TXpqqqruKLr1Q
	tMkvZLIR/0U761p5+5ObDNeztigaFSqVjxM5jhEQRmy7SQh9rCFhy2zTZYWxm4W1Jt5g/0DJF5Qof
	yaPtUa4/CIH4pnXkuSq9xJLy/2Rwt+Jw3DlUcdET+YpRajzIQvE8p5YsBP0f2Bu1q6YG11rvZ01Tt
	AZ5dlTn6LLKR1Q3vcerZGdE3JJ4Jf1GcTJsivbvo1jMVnF99AUMFRpKe69Z7rL+TU9jA45gwMvb9Z
	I/Defs1CU0dsbSA+fhA8QOOyT8MZcH7CT8kYnnTi5jrVH8E1OGM4gvPNtXL0x16AdFzEOeKbdghfd
	BDgSBd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOov-00000000E0G-0bvH;
	Fri, 05 Jun 2026 07:18:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOoi-00000000DzY-2gKB
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 07:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780643889; x=1812179889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jcrToytibwcBAYhSAoNEEpY1rO4Mmvre/yeNqvlg5Fw=;
  b=qzfkcqw+xWxcWBErFr3mYidmP5C1OMudQBUYvRJ55UyZMM8C0HVjxXFW
   JmjYoBTmEs9Mpg2Y2NZ47vqhjLfJ7vl0QVx/ZJz/76fIjUawHd3ccKd7l
   NA/frJmwuk4nB7FURB20gvwxnHi8IJzXDdN7td61RpPDm7Bh/+snfl2qH
   lB5ANKd9gJA4TfThGa2kAMy0DqCPLZFrZmvGhiEk/hYBzF8YP84Beacr0
   93H491zwSgqIt1aMIDqsKtZfvwrlBMT5IaWiGLOLcXhGdNvm3uIFYQc8v
   qtyWO93e2HvMOonDd99jq5LpstOD7f4AzR9qK620KDQY6/TAVYIojgS3y
   w==;
X-CSE-ConnectionGUID: GTxp86iZTpGaNRQZ6+6kdA==
X-CSE-MsgGUID: QRxBKdmdRiqD2ogDiIat/g==
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="asc'?scan'208";a="58640353"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:18:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 5 Jun 2026 00:18:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 5 Jun 2026 00:18:02 -0700
Date: Fri, 5 Jun 2026 08:17:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Conor Dooley <conor@kernel.org>, Santhosh Kumar K <s-k6@ti.com>,
	<broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
Message-ID: <20260605-regulate-crawling-253c6d6bd971@wendy>
References: <eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
 <87cxy92llq.fsf@bootlin.com>
 <20260602-aptly-bunkbed-1bd3a8d63d54@spud>
 <875x3zzkji.fsf@bootlin.com>
 <20260603-neatly-twine-e89b923f5cb6@spud>
 <87o6hry4d4.fsf@bootlin.com>
 <20260603-balance-encounter-94f69e1577f3@spud>
 <87ik7yydyv.fsf@bootlin.com>
 <20260604-shrunk-acclaim-25368d7ad63e@spud>
 <87a4t9wl7r.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87a4t9wl7r.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001808_689580_E660EF4F 
X-CRM114-Status: GOOD (  31.00  )
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
Content-Type: multipart/mixed; boundary="===============2130647311086719855=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2130647311086719855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zUWntl/XEoxjT7CW"
Content-Disposition: inline

--zUWntl/XEoxjT7CW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 08:32:56AM +0200, Miquel Raynal wrote:
> On 04/06/2026 at 09:36:49 +01, Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Thu, Jun 04, 2026 at 09:14:16AM +0200, Miquel Raynal wrote:
> >> Hi Conor,
> >>=20
> >> >> >> > Right, and this I guess is what scuppers letting the controlle=
r driver
> >> >> >> > sort the configuration out itself and leaving the property as-=
is.
> >> >> >> > It could be that the speed in spi-max-frequency is lower than =
the "base
> >> >> >> > speed" of the controller but because of board routing or device
> >> >> >> > capability that the tuned mode is still required, right?
> >> >> >>=20
> >> >> >> I do not actually expect any tuned mode/frequency to be mandator=
y.
> >> >> >
> >> >> > I think you misunderstood my use of "required", I meant that the =
new
> >> >> > property/information was needed in the scenario I described, not =
that it
> >> >> > should be a required property in a binding.
> >> >>=20
> >> >> Yes I misunderstood the term indeed. However I still fail to catch =
what
> >> >> you meant here, I'm sorry. Would you mind rephrasing?
> >> >
> >> > I was talking about a scenario where you want to use the tuned mode =
to
> >> > achieve the maximum rate because of the device and/or board configur=
ation,
> >> > but the rate is below the point where the controller would need tuni=
ng.
> >> > Say the controller needs tuning above 8 Hz but the conditions require
> >> > tuning to achieve more than 5 Hz. In this example, if the device can=
 do
> >> > 6 Hz, spi-max-frequency (in the current form) would be set to 6 Hz, =
and
> >> > the controller would not enable the tuned mode, leading to problems
> >> > because the inflection point determined from the controller compatib=
le
> >> > of 8 Hz would not have been reached.
> >>=20
> >> I don't think this is a real situation. If the "conditions", as you say
> >> (ie. PCB routing, mostly) require tuning above 5, then spi-max-frequen=
cy
> >> should be 5.
> >
> > Then tuning mode would never be used.
>=20
> Well, this is exactly what we propose in this series, a way to indicate
> two maximum frequencies, one that just works (like before) and a higher
> frequency that is only reachable after an extra tuning procedure.
>=20
> > Remember, this is a theoretical world
> > where spi-max-frequency would contain the tuned frequency and the
> > controller was using compatible-specific speed thresholds to determine
> > if tuning was required.
>=20
> That is not what we are proposing. I don't think indicating the "after
> tuning" frequency in a property that has long been used for an always
> reachable frequency is wise. Hence either the use of an array (the
> second entry could contain a higher frequency) or a secondary
> spi-max-frequency-whatever property.

I am/was trying to come up with a scenario that would justify the patch
man, stop trying to interpret it as what I want done.

--zUWntl/XEoxjT7CW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiJ3+wAKCRB4tDGHoIJi
0tz4AP97UBfrz9S9QPKf/ELSWSCSJG0AKrTL2Ilbca63w1hqBwEAmh8dIG97WI0/
6CTKNcnF/fGzd+mNaOA+H2isiryDNgs=
=GMVI
-----END PGP SIGNATURE-----

--zUWntl/XEoxjT7CW--


--===============2130647311086719855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2130647311086719855==--

