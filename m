Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E87C4451C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 11:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPo7USs+fjJOgkqgZTelDH48IGvwOPyoAaBFTRIGDBk=; b=mi9TQ4BC4h2HdTEjBLVzKTqQjW
	pW+auv3C3fmzl9JSpPqfm6K1EYfoNHWYoV6JDXqwPRUwQpSZ1ioRPeImuGvS2cecufaPx6lVgaTQc
	uAXAXxk7Id3siS+EZ5o0w2nlaGcOD3QgOBEGXa+1dwoqCCBVNG8Ek0VfQ/Et8FkMz1URbMx5QmGax
	axH1rc7HVwM+4FJWOiRJ4Q1tR9LSANU74u+yI2ctsQmfhHK02tndH02cUIDqjiB+T8BG0UBoQj20e
	GExouhATng5qz9EFakVn6qzx5kLOd7tYDGjZ6J/Yx+//wPauQ3X2G3YrPwDKjvpGA8cRXGbUorEvc
	PUMB8slA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8PC-00000009Hov-1uwO;
	Tue, 21 Jul 2026 11:12:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8PB-00000009HoB-0Ts2;
	Tue, 21 Jul 2026 11:12:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 82B1643BE0;
	Tue, 21 Jul 2026 11:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id DC92D1F000E9;
	Tue, 21 Jul 2026 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784632376;
	bh=mxwd2aB2/Sy3num+t0tGdUNpoMk21B3BKSEdMEtgiEQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=fIBzKYvafM1Bc2GeXqNv33ETryQzd83nU4QUWWJ5JDjTU3X4mHztz9ApkHrxB+niE
	 HgbM7pOXBz219d/Pf+dTa5HCsJzefF5wxLKRAihdQcIT8jvlI59UuWYvu3rxNNS2w5
	 iJoHGz+iQnMdrN2UBACMBN7vwvg/x88wUCJ4ZDlGBv7iAqlBGGePrhA8NJN039yFkx
	 t2IZAovn4bz5aWhEjeBhsvIeZR5jAZU5YAxpUCWEBcE9poe3bzGGqvwMKkIJc84omn
	 Nxvh1Lhwdf6VCcWGeKIykDOWNEa5KNltwoHgqUCBWqKNrJ6M+te8eD/7/grkZq22R2
	 sRmsP+yUel/9A==
Mime-Version: 1.0
Date: Tue, 21 Jul 2026 13:12:52 +0200
Message-Id: <DK47DLQCZVFI.2GL81VG910N1J@kernel.org>
Subject: Re: [PATCH v5 3/7] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Cc: <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <Manikandan.M@microchip.com>
X-Mailer: aerc 0.20.0
References: <20260721052859.171341-1-manikandan.m@microchip.com>
 <20260721052859.171341-4-manikandan.m@microchip.com>
 <DK42262TYFG1.NZKF4VGZGSRM@kernel.org>
 <c921d021-b6c3-4d91-89ca-0e3c41169e81@microchip.com>
In-Reply-To: <c921d021-b6c3-4d91-89ca-0e3c41169e81@microchip.com>
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
Content-Type: multipart/mixed; boundary="===============7180654269549199444=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7180654269549199444==
Content-Type: multipart/signed;
 boundary=ab797b970cb1ccfb3d1ed84bb9c19a1fb24835b66e0e80a735c859388d87;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ab797b970cb1ccfb3d1ed84bb9c19a1fb24835b66e0e80a735c859388d87
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jul 21, 2026 at 12:17 PM CEST, Manikandan.M wrote:
>> Or rather NVEMEM_DEVID_NONE? There will ever be just one SFDP nvmem
>> device.
>>=20
>> How does the sysfs path looks like?
> Currently the sysfs looks like:
>
> /sys/bus/nvmem/devices/sfdp0
>
> I kept AUTO so that the bare "sfdp" name would clash on a board(if any)=
=20
> with a second flash exposing a "jedec,sfdp" node.

Ah ok. I thought it would have something with spi0,0 in it's path.
So yeah, there could of course be multiple flashes with SFDP.

-michael

--ab797b970cb1ccfb3d1ed84bb9c19a1fb24835b66e0e80a735c859388d87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCal9UNBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hhTQF+KZoFG4/icFLa+LRtgnRP2iyB/1wM4IpR
ZTM2zKxAVZxOaUG+3GTVHda/yUa1WcR6AX4oRgKid0SEZGVzAaONi7xZxyo28lL1
zsopOz7ovlyRsOxy5atv1KquEEQCsyUY3Ug=
=rxYz
-----END PGP SIGNATURE-----

--ab797b970cb1ccfb3d1ed84bb9c19a1fb24835b66e0e80a735c859388d87--


--===============7180654269549199444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7180654269549199444==--

