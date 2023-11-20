Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12535C2BB3F
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8pkXLGc/pXJSVos5ASx11hR7ZJKfttHPz5jBbiRX5o=; b=zdIxNZMPnJOAMQ0KWTXW0DJwuG
	/SIuxkpv1+6kDk/zK4n0JiVO+XrxPLp4zMmQ7apSEcD9UfEi8wNLp2zftlD/m/zhViwjX2y9qpBQF
	0AetknE5ciMny3s7t3xn400Bjf+6RF70GaeI7mjHpV8usrudvo/E5Yv6NRGl4ZCk4ja79Uh6mmzS7
	o4KvAndwOyQrEnpd0G2O+1qG5TE1d0d4FKkdh8wHwgMYB6mms3yg/m8acn/8W3il8gPK/ucwX1bGS
	Z59zYIruPv65e5PCT9GTpsKNn1GzMPNKB6HT72cTJdRZGL4FJJOrKotliBhE44qUIu+2Qj7P7jUdO
	AylGjlMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r54sa-00CE5t-2U;
	Mon, 20 Nov 2023 14:04:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54rZ-00CDrx-2Z;
	Mon, 20 Nov 2023 14:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H96nSIEQPgDP8tdx6XhEBl8791EW6+F+JXk1mxypCJU=; b=pmn5CF2lMdJh1F8X2jemCx8bAk
	hO+9Aui+dVE6kliSmM4oYKg+WCzaxcRF2CQ30T9b9pyoye2dKFVhkXd/nUfciM/2XYD0knVarMoWN
	mwSQbpAjEugyxVk/EScLGWhSI1tKoGOJyi5g32e6oNTrNvNEGJx1CoE/1QgwNZBXtWDHVgsZCSfCA
	kCZI/bil/aNDd/H6SnglwKMYcxPIn57354BpLx7dNdwnbVt5FTibiXT1RaoLrRJicvM6O8XcnJoe5
	lU1HiPCOgXL6dDHm0FK0Lp0yy9dMeurUbUY8WmvvB9rN3K65GtBqcrX+14dnWT4mt/UKa3KcLW4IX
	V1Aqv7yA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54rT-00Azjh-33;
	Mon, 20 Nov 2023 14:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CE2F611F5;
	Mon, 20 Nov 2023 14:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6534FC433C7;
	Mon, 20 Nov 2023 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700488960;
	bh=6aSa52+i1oys/ode+5jaVFsNLiPy8c/knuAgK5eUilM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PecvQReB8EC0t4GDgV5A4OUDf7be4jwPihyMoCPHW4Uh6hGjsvr4p5yBYdOzhaVIT
	 oNlewumX6fs/FbSZOKns16tQBSsGhenb65XKwaqOIJGXe27O4pFIy0twZdmZvaYSaf
	 w4v1TpT3rEGoUDe4sLIpYvuHposrJoAX9cbhTdtSOsrWftqX3iWcPuBMB4glqUyUC+
	 uCCSO5nJzMO12r436rZ2HsJdku7+LAYBkxcKe6hiAuf946T2qMsVpTZaFCKjfIRWJA
	 5jXJvEQMMMJ0ScjO5X0gcPQ9R53GqA3h+7K6BA9u+CAgR4/TMw4ioQ7XElABDPGG5z
	 VHSlIZ1LcEeAA==
Date: Mon, 20 Nov 2023 14:02:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, michael@walle.cc,
	linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v10 1/8] spi: Add multi-cs memories support in SPI core
Message-ID: <281c9708-f965-4bb1-821e-3e6cfe26ba5d@sirena.org.uk>
References: <20231118135446.52783-1-amit.kumar-mahapatra@amd.com>
 <20231118135446.52783-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20231118135446.52783-2-amit.kumar-mahapatra@amd.com>
X-Cookie: <Manoj> I *like* the chicken
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_140252_220521_815CA52B 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Type: multipart/mixed; boundary="===============5525965964144160345=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5525965964144160345==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m2cq6RiF6dDmRuer"
Content-Disposition: inline


--m2cq6RiF6dDmRuer
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 07:24:39PM +0530, Amit Kumar Mahapatra wrote:
> AMD-Xilinx GQSPI controller has two advanced mode that allows the
> controller to consider two flashes as one single device.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/pci/hda/cs35l56_hda_spi.c: In function =E2=80=98cs=
35l56_hda_spi
_probe=E2=80=99:
/build/stage/linux/sound/pci/hda/cs35l56_hda_spi.c:32:52: error: passing ar=
gumen
t 2 of =E2=80=98cs35l56_hda_common_probe=E2=80=99 makes integer from pointe=
r without a cast [-We
rror=3Dint-conversion]
   32 |         ret =3D cs35l56_hda_common_probe(cs35l56, spi->chip_select);
      |                                                 ~~~^~~~~~~~~~~~~
      |                                                    |
      |                                                    u8 * {aka unsign=
ed ch
ar *}
In file included from /build/stage/linux/sound/pci/hda/cs35l56_hda_spi.c:12:
/build/stage/linux/sound/pci/hda/cs35l56_hda.h:45:63: note: expected =E2=80=
=98int=E2=80=99 but a
rgument is of type =E2=80=98u8 *=E2=80=99 {aka =E2=80=98unsigned char *=E2=
=80=99}
   45 | int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id);
      |                                                           ~~~~^~

--m2cq6RiF6dDmRuer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbZvUACgkQJNaLcl1U
h9C7+wf/Y66EoAefhFbBRGn/F667fF8eGVlw/njem/yf50HB8iNFULY3b1FDiQN2
tkohmbFFMPuwef2VX7ughOqk3b6vFTY6YRNVjvQvItlKJL85m8zuPVmetJ35s42O
+5htT9J+WhIbBIvaeL7gRms/hltTunTTSE0maVCT2sA8UTFFOXHLZ8SrYfRGMcHE
7h9rnmV7eJR/BttTqDtVyQg3n/MiRWvWZb+nhVQAE7ytHZVyydUYIWd8Cl4o941d
t0MJ4sTVXUwh4k1V2Km6CwTbfAFHmyQlv0Kgzmwb+F5xevmaymXutZqVlWYv5cR6
UZerV5/EA6GdypcQYNSC5y91TI9xUw==
=9H0Y
-----END PGP SIGNATURE-----

--m2cq6RiF6dDmRuer--


--===============5525965964144160345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5525965964144160345==--

