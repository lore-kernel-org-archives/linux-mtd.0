Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED47C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+hNIdsZdmz+ko6PwxfBCOAZ1xc5uMLTRcvGQWmJWzo=; b=jPJw7/PB4Kh06E+ae+H55/NJIy
	Djyup++GaYbftjA/Kz+Vh2RcwUlaYjGCpbNvblwv7HiTtO0VYHrFfRdS+sBlAClC1maG38Mg5eAsR
	M/7e4rbRtVKljGaZcMxSR8eLIkmWS07KAHg9foC7gauLpcV3tIRJ1i+mTk6Razcuv5IUknrIG1ZXH
	XZIJWtepwbD2bWLD+AphUGP9vr4N7ioMMIaTsENPFf85rmtEQUIS7S/SyM4judflae4hUnbmyP8Qo
	zxUCU/hwtyigWQMkPURT/uQaIwDQ4GSLGAAiyZeEDzlDu2x5pXEj89qWimj4y7arvc2bVcMj303/c
	+Z6jafPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myKvv-00CRkT-1c; Fri, 17 Dec 2021 21:38:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myKvs-00CRjA-EP
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 21:38:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F4A7B82AE3;
 Fri, 17 Dec 2021 21:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42240C36AE2;
 Fri, 17 Dec 2021 21:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639777105;
 bh=LlTsuvYGdJIWToCdLIK0HTL6oM6Lh5nGF3v2QsTfi9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QX9WXZNG24ktiQHd4/VqCAokw+yNsegKXP9FSCaDZRFHHEMzOUMNMOUvtJGQBbiEt
 KsU+Pg9cT9I4PlLQf7MHMmM9UFTkJKo0Akx55q/gOZufY89TV0lBK1JNPASHkv/N0D
 /C2sFvKir602AYFEl6ccAaer/Utq5WsYGa44r/jw/lTQ4cLAxfamANfJ8rFiL31NBI
 m6WIEqQZ4OXTc/P0omsvtpWxFrfyOMT6kEKabeLVeUpcTyZGW0WCEgB5PxcpE7Exd1
 VB5GaciqVVQicFcvSdpCzQKjV5JwH3t1hI6fVzvHFFeKtTkZyjTn3zLg2AvIi5xsqC
 mPE0TfSh8vlXw==
Date: Fri, 17 Dec 2021 22:38:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car
 Gen3 & RZ/N1 NAND controller
Message-ID: <Yb0DT3GCSUCkHv1x@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-renesas-soc@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20211217142033.353599-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_133828_799236_0A33EC96 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Type: multipart/mixed; boundary="===============9074149402575577052=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9074149402575577052==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/PSey1HlptoWKvFp"
Content-Disposition: inline


--/PSey1HlptoWKvFp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 03:20:30PM +0100, Miquel Raynal wrote:
> Add a Yaml description for this Renesas NAND controller.
>=20
> As this controller is embedded on different SoC families, provide:
> * a family-specific "r-car-gen3" compatible and a more specific
>   "r8a77951" one
> * a family-specific "rzn1" compatible and a more specific "r9a06g032"
>   one
>=20
> More compatibles can be added later if new SoCs with this controller
> must be supported.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/PSey1HlptoWKvFp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9A04ACgkQFA3kzBSg
KbYHjBAAiVsvH3XYKGlctcrIqnHUa0ooJcygD0XPTU+7pr2yHulv6d7U33YgrR9S
MnwoiPhIpnNnolgg0OAp+fb+vL4sRbdd9ZuQXXoJISpSSxNVZf5k4dvgsz9I6rKU
KTYEbW+SVRv00sIbiMZqAEdSj61ls4Gl1cqNuT8EAF/TmnQPqM6IJPKo8yEQvZbv
lYTGdhTRSNhmkK1QWJyJrAoFrSAxKuj5v7M+z/O39Y1CSVR4U6QlLREodi6scTHu
06MAxzlKZJ0A0zvs1iUePq0lN6eQ1el6EcAY6kOcoj5xHlsQLrBIXR0J3D0o9vWY
quBJRs1B43XGU0F7FbmzBJ9dbz+wca0g24cp6YXUlKKp1CHG2qJzkleh3v+uSf2F
AkLBzW6jsR0SrIb8LPsYe2eMYo62Zm4fPo2W/6OxwGKzsFGM01K7yI2qw+WUqqVG
rCmgMHaiIPv959YS75evivltVjMd17Su27HOl5ldJ2JrX9oEx0ylMq+LAiTGH4za
zEaCkjTYmzPeasaGFMfWe5flziUO3u/HQxCvWD3NRd7uK0JAGA/KVLbHLqU4K69n
jLkoAf3tQrf7uSPUXUVJcnomfatWI5tMK7H38BTPoc+BjAiMsgSwuybWZnSbRL9m
Qqc8YNQen0hxPwYgIFQTTrgDzVC040B6FjJ0eluj3mlD4khSdFk=
=SLCg
-----END PGP SIGNATURE-----

--/PSey1HlptoWKvFp--


--===============9074149402575577052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9074149402575577052==--

