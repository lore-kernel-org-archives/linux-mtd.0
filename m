Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F805C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 16:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D90A20830
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 16:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyW7/c1q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="hmkmYQvm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D90A20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vPnY+ByHPTxAP4wb6iu5O98bvGcijW3Y0av1i6597fY=; b=eyW7/c1qqvtSrw0AeXIgWepOo
	dn/ZKN6i2nNolh+RrVyaHJmb0dzavAENnLFxzYRH+Ae3MvR4ufvxDr7VibzVRdNBqt3BHIHxxC75C
	WyMk9gec1srfjMQjUoCT6EJzTgMipV+/j6wLju7TnSqiNDeXIHTuF3i6Uf4Cvwrr0oTV+nXKUDhNK
	ungEcZs8Vb8MEGyWlQiMNm5FW/Zsh0GXJBk7UaLDfJ1CKoamA1sc/8duS8Amkoex5h6esXyw3/t2E
	utqHORkiatIblHnhFaI40qVTWwPKyy7bx5TAN4BlyQr6oZMKf9E8OiLW0zE0BhCs9tomvtT+OHCA6
	Gx2dvemEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8S4X-0005h6-Vs; Mon, 25 Mar 2019 16:03:37 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8S4K-0005ZN-N3; Mon, 25 Mar 2019 16:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bVatkp1ZOcVOBlKz/e+XJrjrAYMID8wn3F0WJ//LFdM=; b=hmkmYQvmSVfrtNTvQ/7zrh1UT
 L+l6Off4RPoxge/R7435f19CK1kpFLWK2K8CQe2inrZf46AQJ788saGqDXGeAqCaR5RghqhvtScRI
 yOfiSb1iMFiBM9Gu8V3MgcLkO6T4N0qnsm23GwFExARH6HO0IyPNeNG+6zfgwNdVZi4Ds=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1h8S4A-0002cY-6t; Mon, 25 Mar 2019 16:03:14 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 76CBB11288F1; Mon, 25 Mar 2019 16:03:13 +0000 (GMT)
Date: Mon, 25 Mar 2019 16:03:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Ludovic Barre <ludovic.Barre@st.com>
Subject: Re: [PATCH 1/2] spi: stm32-qspi: add spi_master_put in release
 function
Message-ID: <20190325160313.GJ7284@sirena.org.uk>
References: <1553265354-16433-1-git-send-email-ludovic.Barre@st.com>
 <1553265354-16433-2-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
In-Reply-To: <1553265354-16433-2-git-send-email-ludovic.Barre@st.com>
X-Cookie: Short people get rained on last.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_090325_712420_A9380081 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0606123775237977612=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0606123775237977612==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tAmVnWIZ6lqEAvSf"
Content-Disposition: inline


--tAmVnWIZ6lqEAvSf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2019 at 03:35:53PM +0100, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
>=20
> This patch adds spi_master_put in release function
> to drop the controller's refcount.

I'm getting build errors with this:

  CC      drivers/spi/spi-stm32-qspi.o
drivers/spi/spi-stm32-qspi.c: In function =E2=80=98stm32_qspi_probe=E2=80=
=99:
drivers/spi/spi-stm32-qspi.c:430:8: error: =E2=80=98struct stm32_qspi=E2=80=
=99 has no member named =E2=80=98phys_base=E2=80=99; did you mean =E2=80=98=
io_base=E2=80=99?
  qspi->phys_base =3D res->start;
        ^~~~~~~~~
        io_base

--tAmVnWIZ6lqEAvSf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyY+8AACgkQJNaLcl1U
h9B0aQf/fdWpPjnowIBjcy1bnS1nYt1V/UZopHw918CDYM0j/ws6gqcZ6hliRlSB
2WhwMUaq4th49OQOitBHw/kDyQAS7gkfvHhg9LyEL0B5nkVnQDTN8pfnsRj7b/5N
fjG2AM6bMKjeiyUl97ObpJrDPvNUi6Gp/RwAXVlFLEXMKrN5vnnzaQYEfpctAFp5
JBMc6n9Qp2Ao5jAHb6Kw0yGqnrFvDDz/Rnp03ofXJJI4T+lvtwp+rUz2R3ZzyRlC
SHP68Lapg/Jk+AQ3EQexlyR3SpOezzpiDRH4iECxNH98nNX3WmUQJ5u8WjMTGU75
0eNyyzqbd0DM8wXYWOd0QSHCV0JCaA==
=T4u8
-----END PGP SIGNATURE-----

--tAmVnWIZ6lqEAvSf--


--===============0606123775237977612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0606123775237977612==--

