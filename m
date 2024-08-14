Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279A2C52D7B
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuyQ7kpWnBX2cD/A4R+gKL//2UaUdPt/evwUOPJjCpY=; b=tF7tMnxEvTsr1Eo+2mGMgGQxRE
	GQ2F6Rf59NEwYnWwKZmiQZbgJNtjol3b46yyFTWUo+Ns3EefgqoDIeFy/6X0skOKQw1f0X60JOgnl
	Zvlyx00LaVAuuCSkGfRoOg/0+ao3ihh/np7CZRi5jAaO3hddgPMTQp6dT4K6zSV9eImknWyeTD1/l
	nTPjUiwdwiRof5Lwi0pK8F4n1DeR+nJ+epATsKJbE3VyXNF1VrEGfhXmO5ZN/YKdEW3JYe1AlkaeO
	WpTFnXlQrbEHAt/qPxnNMmROLuBdev9ibff5yDk5sTshPmBqvOGR+Akgtpo/kLpsSSdcu2DxR4PE/
	HEvVkjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEv3-00000007GDo-3uOD;
	Wed, 14 Aug 2024 14:24:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seEuQ-00000007G4M-26n7
	for linux-mtd@lists.infradead.org;
	Wed, 14 Aug 2024 14:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8EBC5CE1957;
	Wed, 14 Aug 2024 14:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD55C116B1;
	Wed, 14 Aug 2024 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723645407;
	bh=WmZB11vMhDli+fdnbaer4GhKha6aTMQfRYG+gVMDKjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTPxjzkYWvs0yVd0cKeh+TgTW1yqKtc98a/URuxpzaD0smPjAHyIA/kTknCAM0AaX
	 3KM4BqEt1OMcanuaUWGvQVsIOPR4jy1BEQzE5FUCORu1IRPftFb1wJtYXoT1JMhXhj
	 dIGONJdzJyxPLEI5HibQu0DtW9+xzSNJLL7C0cdv98dSdhncWrHUHdA77j5vSxXgl3
	 vUy6R1GBzhHKGqqXzbU0k3z9XrVW3MpqN7124EDKjE0sHvFu1miujj7b38fVOmL7bu
	 54+mqlzNBUPFICA+jLQj65IEpFyGSMbVZjXWaLAY46d2SKgCQWaZE9/3Rzs0bzZvhk
	 D2fDTEhW5AuPg==
Date: Wed, 14 Aug 2024 15:23:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240814-delicate-oil-d1eef61f0eda@spud>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
 <20240808-backyard-unglue-3cf429ad8da5@spud>
 <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
 <20240809-smuggler-patrol-067003f0ba9b@spud>
 <20240814091231.1d9525be@xps-13>
MIME-Version: 1.0
In-Reply-To: <20240814091231.1d9525be@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_072330_735106_AA363326 
X-CRM114-Status: GOOD (  16.36  )
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
Content-Type: multipart/mixed; boundary="===============9102943808143053036=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9102943808143053036==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uTuK05C7cVKhlzRv"
Content-Disposition: inline


--uTuK05C7cVKhlzRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 09:12:31AM +0200, Miquel Raynal wrote:
> Hi,
>=20
> > > > When I first read "nfc" here I thought it was a copy-paste mistake,=
 as
> > > > "nfc" is a technology of it's own. I think it would make sense to r=
ename
> > > > to "loongson,ls1b-nand-controller" etc to remove that sort of confu=
sion.
> > > > These devices might not implement NFC, but what's to say that a fut=
ure
> > > > device will not?
>=20
> I believe the nfc (also, nc) abbreviation pre-dates the NFC spec. But I
> agree, it may be misleading. Even though I don't foresee any NAND
> controller with NFC coming,

Hm, I think you misunderstood - I meant loongsoon SoCs that had nfc
controllers and nand controllers - not nand controllers with nfc!


--uTuK05C7cVKhlzRv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZry92wAKCRB4tDGHoIJi
0mPyAQDY8GhTPbdBgP9nnui5f6LJNjG7g/Cuwm0J5iLGHBRxpQEAi3GM64KN4+j2
vQ4LyUmofQ4pQttyAo5LJ506oRmyyA4=
=rLLl
-----END PGP SIGNATURE-----

--uTuK05C7cVKhlzRv--


--===============9102943808143053036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9102943808143053036==--

