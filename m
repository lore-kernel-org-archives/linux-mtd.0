Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC2EC83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 06:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tl6TU/1MevTDESNm1D/FnlPitvQRT22xBOlNs/kV6Bc=; b=EJWe2uhLz/I1uvwzpuSaY2arhj
	KgtMflYBm4/MP2ySz6n7yUCpTVzn3M1T1YCBVq34D+c06oDHzALQ4YiN52nuU1jTDWuLFQbSFukv+
	iHY5mUk66gTl3F+7KO8hE6vfdhD2UGknt7YvUU+f0tUvQ5OfhCNgC17PqRqr9IFksMHi7P0ZsTx9w
	dScQrfdnRsUxnC3K+091RIFeYwzUswFiWflgcIaDCdUX64RUZ9DcZtcRU1gzK+oKSuNADi1qnI0+9
	QiwRERe6lGQeWfn4sSqtxAcbWmFR1+VKKJ76Wt4wSriOxzhzm2/nhLKfJevViRFKopB7CSsm1LLVl
	7V/6plGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueT61-0000000498o-0kB1;
	Wed, 23 Jul 2025 06:36:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueT5y-0000000497t-3lDV
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 06:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 117EFA540F2;
	Wed, 23 Jul 2025 06:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9CDC4CEE7;
	Wed, 23 Jul 2025 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753252612;
	bh=SpBNyaoMaktj6TidG8FVS9exfWquRDq+PSURzu8oQfg=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=e5QrpDDFhMS1RlvKRBjCwzQblD/CjH0/h2xRNK8X/W/TPQQpNU1ghx9Getdo5JQ24
	 XB4ZL33goG264Un6VOha7odaeoYCVzUlCkmgc4OMHgaCGjLaUj1KUBpQzFsKOJzx3Y
	 ZuZD8MLZxKehV3cGqiA7bT/xKfAZNwpRmSBdIwQ8x6QnqKeiNgwaItP26OSuz5qekT
	 Kfs4EyOELARsr2p3gixIlcpZo1WN2yupjl+cohzokWobSj5cY36kwHulspYcfnYkFI
	 9kVGRqnnmrRFSh1qhpJ+QJ+GyhwC+HJTlXwahWfyIrGWuU3FgQXyQS6UB0Wa2sVKma
	 /CDZ7A75YZ/tQ==
Date: Wed, 23 Jul 2025 08:36:48 +0200
Message-Id: <DBJ86H8MDFNX.2Y6T55E0NH63R@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marek Vasut" <marek.vasut@mailbox.org>, "Marek Vasut"
 <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
Cc: <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
 <62383ff7-0a14-4f15-818b-f5e5c56332c5@mailbox.org>
In-Reply-To: <62383ff7-0a14-4f15-818b-f5e5c56332c5@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_233655_067094_2B2D1101 
X-CRM114-Status: GOOD (  19.95  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6629544630785671129=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6629544630785671129==
Content-Type: multipart/signed;
 boundary=54f52f5a30941d8da38b7bcc7265a56981a08648e7187f9a304e8ae4e366;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--54f52f5a30941d8da38b7bcc7265a56981a08648e7187f9a304e8ae4e366
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jul 22, 2025 at 4:28 PM CEST, Marek Vasut wrote:
> On 7/22/25 10:43 AM, Michael Walle wrote:
> > Hi Marek,
>
> Hi,
>
> >> --- a/drivers/mtd/spi-nor/winbond.c
> >> +++ b/drivers/mtd/spi-nor/winbond.c
> >> @@ -343,6 +343,10 @@ static const struct flash_info=20
> >> winbond_nor_parts[] =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D SNOR_ID(0xef,=
 0x80, 0x20),
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "w25q512nwm=
",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .otp =3D SNOR_OTP(256=
, 3, 0x1000, 0x1000),
> >> +=C2=A0=C2=A0=C2=A0 }, {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* W77Q51NW */
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D SNOR_ID(0xef, 0x8a=
, 0x1a),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .otp =3D SNOR_OTP(256, 3, =
0x1000, 0x1000),
> >=20
> > Did you also test the OTP read and write? I'd guess so, because otherwi=
se
> > you wouldn't need that entry at all, right? Or is it because of the
> > winbond_nor_late_init() which will be called as a manufacturer fixup?
> > In that case we could do the same as in commit afe1ea1344bb ("mtd: spi-=
nor:
> > add support for Macronix Octal flash").
>
> I have limited supply of these devices, so OTP is untested. The flash=20
> does have OTP registers, that's why the .otp entry is there. Why should=
=20
> I remove it if the OTP registers are in the chip ?

We only add tested features. I'm just the messenger here :o. Anyway,
OTP is not really one-time-programmable here, you can write and
erase it again as long as you don't lock it, if that was your
concern.

But my main question was whether this chip is working without
this entry (if you don't use the OTP bits) or if there is still
something missing. IOW, with this patch you are just adding the
OTP feature.

-michael

--54f52f5a30941d8da38b7bcc7265a56981a08648e7187f9a304e8ae4e366
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaICDARIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gj1wF/UMLZxv1icrZLxLiZBYXeWkKZ61dXbaZN
D5qvBDH4ZrrJ6g/271jQlWHI6z24fntLAYD5tvjT9xZYqoSaAgPL7A5QhVprASBZ
YJzhF5FRzbWW/PYVDaD9Z62JrM29DUrsLHY=
=Ecie
-----END PGP SIGNATURE-----

--54f52f5a30941d8da38b7bcc7265a56981a08648e7187f9a304e8ae4e366--


--===============6629544630785671129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6629544630785671129==--

