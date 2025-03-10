Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497FC282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Mar 2025 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ6sJp3/alZGdmir13MXw7bmEhHReJv6fTmMgMUCoPQ=; b=EBT+899n6wC8ugc4t88pMcm35y
	HeYThixLhRzV8lKw9i1qR9N1IcCF90U3PQGT7OMLjBWQ8QfHAj+R7l4Tii6tGl+Z2GQSJTp5g51xd
	ew5gkPWZWTFpOD6N4NGrC1HXl3bTRbcIhVS2WBxF5eCTxeOM3hOyKxmiZhQecBf/Bt59czUhiO5xK
	HqL8AcDvNmcN4kpWJXHS2q/5PQThN7IsVtoMbzsvbp5/AbdGAltRew1DPDaXPyDfmiAIABDlvJxqO
	yjqxQjikj1sg9IU5NBcxalzwdvhqJ31kvsKFuOY0MES9WpiBxjXZqomScoZyP+o2+6XRqgF2CZ4Hh
	tRqseq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgZz-00000003Reg-44pU;
	Mon, 10 Mar 2025 17:06:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgJI-00000003OT8-0xUq
	for linux-mtd@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=He80anPiKvebL/FnJfyifOVYwrOMXD/S0ef0nCf5pUU=; b=KlN1KjdO17WqAlhbTCwkfJ8Q36
	GKbOfMQDbY/byn/QycLZmtQkJ4pa0IyB3ScKajS6V2S5ldFk5Qeglgrrm8iTo6KdLaqZIlkvVKv/b
	Ydygv77MRWMPVgmIusEls2EmwtbvEMPG4S1QvR9pW6pHfzsX0IVrwbvipnhgda8P5CkwAdCxOcE0j
	niRYoDnqmQuY5QUMQC1gN3BVrSzo8S5aVNaxucWeySe8Q6eQ2iafmTRABoJ4Im8onVbLLKE0Rp05L
	uRWT17arz9z2PUZBswdWuX5rvhHZusNw95tEvS3XOwMkm4hEbthEgYc5ZfJlrNzDsca5eBeaBF9pJ
	k/Wo+SeQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgJF-00000001wku-19Fz
	for linux-mtd@lists.infradead.org;
	Mon, 10 Mar 2025 16:48:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5BEC5C6819;
	Mon, 10 Mar 2025 16:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF3CC4CEE5;
	Mon, 10 Mar 2025 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741625335;
	bh=He80anPiKvebL/FnJfyifOVYwrOMXD/S0ef0nCf5pUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRXvFqV3/kRcrNhE+X3xH7Bqu+/Gg/vDC3Lchgwmym1TSXropU6yyTRnHEnC+8yR7
	 u2zgWRECaknG8UTwE02i9pWYMLMUmYlSM20LfUrOTMVymV8JLz5uV0IBEkyNGXM7to
	 VbYSwkM/EAnzvgwXFMomeK6p55nqmLhher4sc+tpy5smktHXXJShcXG6ewFU/tWWcR
	 HcKeEDQO5tVUrU1WvD0YZ9F7UJqdgnfp081uVrJ9v3J0/wqjMU3OH+OUTCCmW6VaY9
	 4YfFbXl4b9/rnhgp1X+4CNj9BW16qsT2H+sAgOTVkb9z9BQv6nIuv6qqanYukJJso4
	 QSaR+rWPBW05A==
Date: Mon, 10 Mar 2025 16:48:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: mtd: gpmi-nand: Add compatible string for
 i.MX8 chips
Message-ID: <20250310-running-reluctant-5ca27a149351@spud>
References: <20250307220515.3282954-1-Frank.Li@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250307220515.3282954-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_164857_617283_51FE4F5B 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: multipart/mixed; boundary="===============4466563016480596346=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4466563016480596346==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xZOwJLFS9ODUFr6Y"
Content-Disposition: inline


--xZOwJLFS9ODUFr6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 05:05:15PM -0500, Frank Li wrote:
> Add compatible string "fsl,imx8mp-gpmi-nand" and "fsl,imx8mq-gpmi-nand",
> which back compatible with i.MX7D. So set these fall back to
> "fsl,imx7d-gpmi-nand".
>=20
> Add compatible string "fsl,imx8qm-gpmi-nand" and "fsl,imx8dxl-gpmi-nand",
> which back compatible with i.MX8QXP. So set these fall back to
> "fsl,imx8qxp-gpmi-nand".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xZOwJLFS9ODUFr6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ88X8gAKCRB4tDGHoIJi
0v4wAQDIr9sBDLKcJOxHMM6QCM3PGAzIaD1ERbGI2KtxDOrD4wEAg59dYzDWWGiS
8zuUfx0wcYCwcNWlSlfP3gqnwcrzQQQ=
=TFPp
-----END PGP SIGNATURE-----

--xZOwJLFS9ODUFr6Y--


--===============4466563016480596346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4466563016480596346==--

