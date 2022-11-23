Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAA6C4167D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpkE9s9YQ7Kq7bftGMpCRWhsiMbFr2w++EBxkxs84K4=; b=MtKxom+zJZ9+FP2rK9WPKtT7NE
	swJdexD+5m/TMdOkDfEAsxH07rHmXU5v8IS8Ik3rBck87ZCMyRezqi+HIA2Fb0/K4pX0dbeH6DCGZ
	/mhX038JT4cc2GY/qWAsqC0ZUjvVs2y8AnMv12xoX0P2mjRsRJfgPc1zpZDvfxPFLF6y5baXu2mZj
	ZcHRZzLTQxFLkQb/MFYs2NVJB/EDfbB3c7X7k0EJOL7GBZUHExwSIvgQJNLtdM0kMgraJ0M1XlAnN
	sal68mfa0w90onM7TGQk8Mpv2Qvmp2A8mJWXbX0K3Q7Kl4jFoNpjiSVvUccr7Y0KfJlnME22KgXaB
	EZcvbBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxr6y-000CuE-6G; Wed, 23 Nov 2022 14:52:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxr6Y-000Cse-Km
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 14:52:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9A66B8201C;
	Wed, 23 Nov 2022 14:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4054C433D6;
	Wed, 23 Nov 2022 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669214636;
	bh=Y//1b3rNjcukiNpZ5Pvh7pYLjJ73zqnquLe7wn350Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZG0A8BqvT2ORUrlb7I1sLgQbAJlUfWRx4X3QT05SHfMJHOiZi+oRORqmZj+4Ve1sr
	 yrWervl3veC7SaL/o17MVgz3Dhfcy0sfIdmXTsu4djT54VPEw3RJkWavMyc6YUx1SN
	 g9poRnTZVXeouBC0UZFuX6m9uQ4XqT9Rm2SZUstZY6NdbdpCNIZXXUg8rJ/rXGDFnm
	 xocVZ/NP1GyqV/SPtlOUK0KMz9pz+BK8ggFE9KJ+P7VJYkoo1Jc9GcfSQ0yDAa9SVX
	 zznkZz4xqfL53zsXyhV3+8pHvNOb+T4KROZfGYgEnEdEcDbd2YXbZBbjcYD5dpvcKV
	 yktlDGX0NXmHQ==
Date: Wed, 23 Nov 2022 14:43:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] memory: renesas-rpc-if: Pass device instead of
 rpcif to rpcif_*()
Message-ID: <Y34xpkf4c55D4VRc@sirena.org.uk>
References: <cover.1669213027.git.geert+renesas@glider.be>
 <0460fe82ba348cedec7a9a75a8eff762c50e817b.1669213027.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <0460fe82ba348cedec7a9a75a8eff762c50e817b.1669213027.git.geert+renesas@glider.be>
X-Cookie: I'm rated PG-34!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_065202_838857_2ED14551 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: multipart/mixed; boundary="===============0340446247654049478=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0340446247654049478==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BKAJETaVx6g41XLW"
Content-Disposition: inline


--BKAJETaVx6g41XLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 23, 2022 at 03:41:21PM +0100, Geert Uytterhoeven wrote:
> Most rpcif_*() API functions do not need access to any other fields in
> the rpcif structure than the device pointer.  Simplify dependencies by
> passing the device pointer instead.

Acked-by: Mark Brown <broonie@kernel.org>

--BKAJETaVx6g41XLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+MaUACgkQJNaLcl1U
h9Bcugf9Fq5kxq2SwxU/HdgpmKvb/nRaHNMV7D4mCFZNMxmkwUY4eMNTKzbpvly3
D4lSGL4xRZWS1hQVR4EK5Xs5BCj2PqvvYhNTAM4BLDgLP/qK/+8B9Ezs8PuSYDRg
CRyR3HF7GGKhP0NM8Vj9+M+OoldvWwfAFp5wx4kp5henzsB1zSuwIs90Z4FxsQTN
IiCpmwcBJrmDQcBwYeZL+rGYiVWfs5xm/7WPt/E5ssbMGXms/cOnhjMZHgexSFEv
ZPT3WyWEY7Ka01Ri1OxtooAIgdQ3BHnxEswLJbAhJj5Reb9kPfvl8UN+6h1iV1f6
jLNoNQ5Gr5aHbQCbbs72ASpRcUqCqA==
=evAV
-----END PGP SIGNATURE-----

--BKAJETaVx6g41XLW--


--===============0340446247654049478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0340446247654049478==--

