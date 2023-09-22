Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC13CD4847
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vykhw6fgAEKNkmov564J5JbR6PPZtoy1z2Ga+tMUOFo=; b=e8i2oZix8nHv/pqqrZHJjWwxhH
	w4Ynlqh1TsSEU5wlM9cLDjmqL2MWPRJblPn+BW3OjS2Y5UpYYc4MkNsG79OxFO3UFthIwaaSbjFlE
	Fn3hTY+WimXc0w+IVFja/wmv3KP/FhTIdZkoKwzd9wkdUm1y32CpkKtyUJ7YCKV+R/9f/JqWUHTBf
	K40qTHNaxQycjEE97IXClRnkp0UYDzW5u4A6ax9XbJnGeB3ztdIoTOiFeELex24zyyvao3+jfgA37
	q9G+lXdqyCrN4+i6cKvTUZaznW0GtsVkgOa3HE7KwCU6Ez+oouphBqe0MzAn20GburcDJpx2qwMoN
	tgfXCYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkNE-009ZlZ-19;
	Fri, 22 Sep 2023 17:55:28 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkN9-009ZiG-0E
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 17:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Mg2A
	AnBs+prhkh2fk1Nlp3ajuJgPByOE0d0i3KeOkV0=; b=QHbiAQioaRK0OoiLUGt/
	4QE7q6HgEadfjVQbNEMZ7LYUvcnKFHWh+3jivr4h3RMf+tJJP1q5FlzahYH3Z1Si
	abfr2nlp9vmNzIMNQFpRKQv4MhPGRlEYrFqHMtboVsfhHn3I9wVC8zGpXXFjPKnh
	Pv7JVqH3GC5CRZ/DuTOd65zMZzNga4XBh9DOgX0LF7ScKbulllPrxCIcZn032XTw
	d5lzdU6txXo7glxm4DSq3k8+3pNflky8LvYxDosO9zu/bjOpFEBVQNtDbeNPb3Vg
	I0G6AA5uS+Tm5HfKKsrIZkkWhcu4xEdaVjYnIwYO8jdEY5b7dxJeF+83lpv+LphF
	vg==
Received: (qmail 1457883 invoked from network); 22 Sep 2023 19:55:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 19:55:16 +0200
X-UD-Smtp-Session: l3s3148p1@52CbT/YFGL0ujntX
Date: Fri, 22 Sep 2023 19:55:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Message-ID: <ZQ3VA/2pAC3Do1Xd@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
 <20230922061530.3121-3-wsa+renesas@sang-engineering.com>
 <20230922163903.3f49ea2a@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230922163903.3f49ea2a@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_105524_152134_3AF7D330 
X-CRM114-Status: GOOD (  13.31  )
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
Content-Type: multipart/mixed; boundary="===============3030070731859483028=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3030070731859483028==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CN+XZjYK9gPYPfl3"
Content-Disposition: inline


--CN+XZjYK9gPYPfl3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I'm not sure it is wise to merge defconfig changes through mtd. Would
> you mind sending this change aside to avoid potential conflicts? Each
> patch can live on their own anyway.

Yup, I can send a seperate patch for it.

> >  drivers/mtd/parsers/Kconfig    |   5 --
> >  drivers/mtd/parsers/Makefile   |   1 -
> >  drivers/mtd/parsers/ar7part.c  | 129 ---------------------------------
>=20
> Do you have other changes related to this file in your tree? It failed
> to apply on my side.

No change. Plain v6.6-rc2. I used "--irreversible-delete", though. Maybe
this is causing issues? As I stated in the cover-letter, I wonder if all
this should go via MIPS. But there hasn't been any discussion about it
yet.


--CN+XZjYK9gPYPfl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUN1QAACgkQFA3kzBSg
KbZzCQ//TX27sNa/UiZIFCSjrAOOgSLQI0+z9odUjS9rOBLtm+a4sP6VuQ+BRhtR
oIPlyJLa38QdDr35LNQz/LY4WOiayV54t6djG0/MNJ63qs9J3RmyxiND3k54qAH1
eGH/zKhVYb4KfSkKF3svjKsAp6eMxVcBopzx2cE0/SBkKwSjmRoOjIaQboVsOrn+
9BLuKCGYc0PktzaUzRB5icMFC/qVquafZIcS2J7G9BbOf+BJ56XwxvIbX/9QhXMU
NXhStndkoVEQlV+Um/uojiFwT37aChkDuhjqZXaSn5IN2ILGFsqcVxRaX/TSrQOP
5QE6UbqmzOi95oQmPxDtPDL1KOy4nvKD+KQVQE6A27dFu9o6QWCF4WDrH5Umz4hH
OPhUg/ipYgoUXk8+B1YqafwXVdjlFf+h+5CGT8BA1pEvOGmFiIdqJy4Ly73JtsiA
Dba3cHm1FwDzs/egxuhWEzKE3IOeTRhEaMryRi3kHXgAmA109vnIYht/dvKcWXPL
t8NDtnvtHdRSeffihZXLwenSsat1zykrGWg9D2cv7+ID/GvUXXFFf5Ypz6MfCp0C
yIczQ0YqQ85CiJFPMEUOQ0YyrDWXKb6GmsawzmZWLQV+pMTLLjcwnxcqp+LOEZA9
VNr7z+4ueA1bfcf/umTJuytOx4Y8ihy/4pSRlPkyV4n14K3407E=
=Toah
-----END PGP SIGNATURE-----

--CN+XZjYK9gPYPfl3--


--===============3030070731859483028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3030070731859483028==--

