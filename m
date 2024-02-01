Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742B6C47DDF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvREeBZ5VBBu/R9TjI+Ay6ov82jRTOQWHnZTI90oCts=; b=mw52LDix3EMub7pCTKkbxvFMLQ
	EG1cznQh9LR16alftS/OVFS3CEcFHKRSIQ/CvemnrJ4e4XNrEiynxXvQz3mw8iMe0PCIuBKvUXozo
	7zOMlbj0qjA9roC98MRXQSZp0I50F1qxDWfvTU22Wg0IPkRkJ4dU8vq0ocJ4q6DhTL4c5mb3q/JZy
	qbB3scAbKYBKn8nInDiyTdUMVVCQ/U2TBjQx464HtHHoleFISDfDLNxTk1BkYbGRbwkzUmGks76GM
	lbONPaIK6e+tfIBYX+8U0NcrIbbSF78UHMjkSntHlcoLIPWc0jY76pbWv5AGypkaaQ93P24AIMa69
	ddRfEISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVoQ-00000007fzh-3OAp;
	Thu, 01 Feb 2024 12:04:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVoO-00000007fyi-21Gq
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 12:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0833E61DFF;
	Thu,  1 Feb 2024 12:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61420C433C7;
	Thu,  1 Feb 2024 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706789095;
	bh=v1EK5eIpj6FCljIX/jdk2TEEGlXUFe37dH/uhRwfiXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eL+PBCz31YTi6h4k4eUCbJmJqmr6ITFMTlDyGg3ZYlEVdDmxmNrHYYWRLlsOMkDbw
	 Ein9Lmv/mpih7npOh2ErrWH/1LkPuqF/6mzSkLG8cpPtEeChJXgN6euiiVcG5FHwx5
	 hOZsOOgn2VxlS7i9wGMWBKc5cm+SR7RPuWzjEbZPVEOzRjTWaStw7MZqxaLlhOgteX
	 Q43qPB/5XdeJK+8Ec1qHNH1x8ch69jeVYBefm6lpQaIhE1yd3M6z1qwUiIRkQF0gSt
	 CSd5chpBzSIMxz+QwHBt95sDvuOmcRrIMyjl3gG3JCPzM49watiaR20GiGLIJrlJqd
	 ex2tR8Ot5NDlg==
Date: Thu, 1 Feb 2024 12:04:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v8 2/9] spi: spi-mem: Allow specifying the byte order in
 Octal DTR mode
Message-ID: <4a7fb252-9a38-4ada-b9a1-d31e13adc98b@sirena.org.uk>
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
 <20240201094353.33281-3-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240201094353.33281-3-jaimeliao.tw@gmail.com>
X-Cookie: You can't cheat the phone company.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_040456_580181_8BB672D3 
X-CRM114-Status: UNSURE (   9.76  )
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
Content-Type: multipart/mixed; boundary="===============6043788541457582660=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6043788541457582660==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="izoFBLRdPvk3P82M"
Content-Disposition: inline


--izoFBLRdPvk3P82M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 05:43:46PM +0800, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
>=20
> There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> boundary when configured in Octal DTR mode. The byte order of
> 16-bit words is swapped when read or written in Octal Double
> Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses

Acked-by: Mark Brown <broonie@kernel.org>

--izoFBLRdPvk3P82M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW7iOEACgkQJNaLcl1U
h9Cw6Qf/Q6rcaXXA4OW9X+HACJCNwLnWAapE7fxy+8vl+m49TN62lMmZI8i/NrCA
9YeK/TUBGViQw7woOOJG/suuBE+fQki2iffXZW/gl/Gcc7rZzAsstbIFrYQaP5Ei
QJ5JnAipY89s8fXiHzZC6RN+j4UjapzLlTjMSIoR6CvdpnrG3yrNQOr2ynp3U4wW
IMKahUTXRsZ0UuAIOP7VbnyMQN9LMCb6gqkVRExfAzCtWIHfMzNpGSHbehrV4Dre
Mwohr4wBU8VatsK66R140NXL24W1PRi8wG0FaIjyPKv1RrtBXKX5BRwBKJrgAIzY
JpqbgLAslTg8N2c0IY/L3nqIBq5hHQ==
=Wupf
-----END PGP SIGNATURE-----

--izoFBLRdPvk3P82M--


--===============6043788541457582660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6043788541457582660==--

