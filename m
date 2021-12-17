Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD70C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 21:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZSAtRg2ovuVjMwJo+gs1g86CRXUXXHK5Rz0ZuYzD1s=; b=yAQomp5bnRmi7wG3KCEFDWwKRI
	8xAQXDt90rkDf4uy5gmn9WMNy/ecCgt1opnN4tMWMktVLnvFm+mR7dxMM8Jpq64wDKE1Uouj8RQby
	qSje2iGMM1Du/UN/xEVQz9nvQoHqQC3d3mAC29hLrHrU4WyOS1qhWtEq31M48WVb/lt/Srru5MJql
	7C1rhpNn+xAUoPkk4NcMCrr3sS7EB92ThQxsybSlP8s2jVf1+I2tJmu01WPDroV8YV8rboprttDlZ
	VExc3UQfuTk7E0fFaKL8H13540iGr/H5bvV1ZEZUT4Dk067vz4kNNDtIgDzTQUWfViebXRKU31F3u
	/3wXyfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myKs8-00CQwP-T2; Fri, 17 Dec 2021 21:34:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myKs6-00CQw6-Kq
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 21:34:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59A4962264;
 Fri, 17 Dec 2021 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C2BC36AE2;
 Fri, 17 Dec 2021 21:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639776872;
 bh=Kw0iKGdVy8Fi/XFJiR6dOzi8M/aGluWyy00V2duZ3g0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k83xh3KoXNhIJdROmeVDWCGHT1MqKE8y94KbU8NLPOG2wjDyN3lAABuSi8GBasuIj
 +HFx+sCv+DM2zdVTd2xLrAymkd0orbNE8NBgodn8C+IoIwGNe46XGR48Ysj6UTNa3b
 331pNO3k+IAONxCjbnA/30Mj1ZECVjUCcRzgSO0n0d1geX0wPlDGz8OS5z3CjfjS0G
 u7hb6Meg38lBApyQs5GExeota3Nu3EoIv28fo0EbqcRd8JtRVjJ8V6kZR18heKiB29
 R6DiQCX6R6adsrhtIT7rhWClkqk4Ox/7hk33yuTe61zAPPYLkFbU38yRXHJEpl9YUT
 DAWfNScuVoS3A==
Date: Fri, 17 Dec 2021 22:34:26 +0100
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
 Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: Re: [PATCH v6 3/4] MAINTAINERS: Add an entry for Renesas NAND
 controller
Message-ID: <Yb0CYpCBFA/bQFjF@kunai>
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
 Ralph Siemsen <ralph.siemsen@linaro.org>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20211217142033.353599-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_133434_810320_E004CAD6 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3216330669362286397=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3216330669362286397==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YgipmO8J0jnQIUmg"
Content-Disposition: inline


--YgipmO8J0jnQIUmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +RENESAS R-CAR GEN3 & RZ/N1 NAND CONTROLLER DRIVER
> +M:	Miquel Raynal <miquel.raynal@bootlin.com>
> +L:	linux-mtd@lists.infradead.org

Could you add

L:      linux-renesas-soc@vger.kernel.org

as well please?

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> +F:	drivers/mtd/nand/raw/renesas-nand-controller.c

--YgipmO8J0jnQIUmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9Al4ACgkQFA3kzBSg
KbbyaxAAjM28xHUCttzmmsIUBoWM5VyuLEiozGDzNaFVk5nssyFKz7x3G1JZwCpv
lyTibV/kIiuX3Lmiu4Aq954kOnCZnWaMxpAV64cpvxcSiBty+avhbGk8nLMxaPx3
lCoI7ySHvo1dqvUCpjrX2mQZamGsi0vkyU1IcwHh3904FpoYUdDoX1Z7fggVr7PD
UOOph53HSOUqJJGs79UNsqGcrcK/R2W7bMTq9yhLQjMLjuNvl/iWWM24jxw0lurx
FBwTp3HliFu0vNFZFMyh0N0iZPy/J1+BnnWyCj5OFMYoH1rDtJ9mu3JRw2Cjirzd
5JpAZuuvjI2a2jnIqtouJ8iZMKv4eKz63Lw7nkPhKxLJxacLXWdvDAUtp6e2B5oo
qMmHy92NH6adu4+wj2ttWwBmxVNVOYjcugM7SL9rUqOhBuh4ALFDxvNKgdeaGSTs
FL2x1mIcuUv3g+dTxQpJYimDmZWRM+UM9PY7OF3VvLT6Twb6CDiWZ+7KlA8fjvrX
rxeSW11JhacxfV32bLbupswb2cryMlwO/Xee9DtftOhg5f0CDiSWj52lv+zJXcwt
p3r1NFFb2rtPnWt9bHmUFOaF4iq9aIYJGZBAgs0mf91r42l4q4DQ/Y6mopHIL8H7
1vUkFBVgCz3OPejJvQTuW4cuOVJrXILzlr7yfU5/5wl6fwa7w74=
=DqmB
-----END PGP SIGNATURE-----

--YgipmO8J0jnQIUmg--


--===============3216330669362286397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3216330669362286397==--

