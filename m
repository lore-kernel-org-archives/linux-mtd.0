Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4369CD44D56
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llglfQlaUh3g/wL8hNQuNkO1CTuUo2lR8sGYjyhDZ50=; b=PBVpHhDS7U5Bt+0jIjFxVcufuF
	PmqUHtpOxlqom3z9CdM9B+7cRazfdf1I+L7APhupmN1c0wPsV9tAL9Qoq3JtX8tYFDW5RefZ708Hl
	x5V6mdyUai1rrC0UfpmqU4TTBi/6Efbay1iCDr0MhmGlhgx2pC2mredSHyCOpiq1KZjlqSlsMJipK
	ID8ybHIDboHHzdQ31k40VzwzM3MQ33JcvlYf5JIggDt9HXEhsrR8v9rmwl79tgIaY4D7nEUvBnFaw
	rzD+gFEuPGjhbUFbg6IhRdF9ptdG4SYPxBPeKdKPWud9Ao9ZSQT3ZI9NPudciI96L3RqH5UG3RuBF
	z5brFXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t966E-00000007mZ3-3hYu;
	Thu, 07 Nov 2024 17:15:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t966C-00000007mYP-2TvD
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 17:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53BDFA448C4;
	Thu,  7 Nov 2024 17:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0E5C4CECC;
	Thu,  7 Nov 2024 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730999710;
	bh=paankYmJQRECpd98G1Q22WUKvs4Rk7C3en/qFTL5HTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKTWxS50PRtubCn66KXYYV/EqQuwSQCBXvQGToBnx7lAaVTps6KiAZoEKvMsXa06h
	 sj/gSJvCNtMSVTzm84g3Th1DQlg43FxI+kZoRxdrRNYdirD9BmoS6jsiHhwNLtr12m
	 +s5G6xfgqVsLfT1dWSEST7JI0kPp5ZD/8E7c+tCggKE6w5Z9NQYX61pZS7Zms8IeE/
	 inpKeo4QEz0/0/Uae98vrtS6VDOgZrkTuybIwrA1gywfra+RMDMD1OAqd6BLDVV+Rt
	 WRbP0oQKD1yvSsn/FrlZqD4sF4PZGkHlMUSt0+7nRZjC3gLWCt5JB91C9X6l2+LZhp
	 Y4XlEr+nBtZmA==
Date: Thu, 7 Nov 2024 17:15:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 02/24] spi: spi-mem: Add a new controller capability
Message-ID: <f0ea6706-17a2-4500-b426-a53c836c52b8@sirena.org.uk>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-3-miquel.raynal@bootlin.com>
 <586cf617-37ee-4859-a11b-67654d650380@sirena.org.uk>
 <871pznqqdb.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <871pznqqdb.fsf@bootlin.com>
X-Cookie: Professional driver on closed track.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_091512_745110_1DCEB772 
X-CRM114-Status: GOOD (  15.98  )
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
Content-Type: multipart/mixed; boundary="===============6392337494296675656=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6392337494296675656==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7aoKoHXbg0c1jiz1"
Content-Disposition: inline


--7aoKoHXbg0c1jiz1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 11:40:00AM +0100, Miquel Raynal wrote:
> On 01/11/2024 at 20:17:33 GMT, Mark Brown <broonie@kernel.org> wrote:

> > After applying this patch (I bisected the series) my Avenger96 board
> > started failing to probe the SPI NOR flash it has:

> > [    3.567876] spi-nor spi0.0: probe with driver spi-nor failed with
> > error -95

> Would you mind testing the series with this change on top and tell me if
> that fixes it?
>=20
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -184,7 +184,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>                         return false;
>         }
> =20
> -       if (op->max_freq < mem->spi->max_speed_hz) {
> +       if (op->max_freq && op->max_freq < mem->spi->max_speed_hz) {
>                 if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
>                         return false;
>         }

Yes, that seems to have been the issue.

--7aoKoHXbg0c1jiz1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcs9ZYACgkQJNaLcl1U
h9BanQf/VDGt8OfnUN5O2fdVfWMjqxwt0/k1sp3cjo1HWRquSXtdw3SsV6v7VfsO
GPl8v9atScopqUOlC7xpbUfb2pEELvQ7koNlysmugdJl1QLz12Zkh1rjkOwQ0QSD
bnLy0a44MA3r/zrmxK8LrJAwQ+jX84IFa75zCkkpcntxcQDAUZH8L6eZs3jukt/v
4U56AxHpNvYEXkF1AxBPxG+ahQXE3l5tvUO3nxq2JkeemWkcuCZymqHQmxuiPoor
rKW6fy8u+/OPCPWqtQ3OXZpGI/HEbcSJ+lQRsUy/wR36boLvyF4QJrlfp5LoML9w
VmtV6urSLkDPc3kW8dtrMgv8w+1vVw==
=/8dT
-----END PGP SIGNATURE-----

--7aoKoHXbg0c1jiz1--


--===============6392337494296675656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6392337494296675656==--

