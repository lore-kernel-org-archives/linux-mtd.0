Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F4AC4828F
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+itFxIuyz6GEhE+2ywH77uo05yrTXYNuyVc6tFntF3M=; b=MILR40vhYielweLhENBgdwvNgE
	upL53X3c5Mw3iiMYwf1xh5btPW7k5/2Gn/LCMMg51LwTLYUdCEwu0TNDx6yac8V1OQdaHb3bcr53S
	8HkSc3blQ8CZ3v0NrMhhC79EbE2BtlOOLi1rWGpGOVHe3Fn47hEoPdPQGhWID9E1PmbnR59WMRsvD
	WZmFDdwul03ssdtpirtKjRXURbQITPeeLsglw2kfk7KOsd942dXc/M7X33LiTYSgTEd2wwKU39FXX
	7gieTeZ3xZnJ8MRsK+VlsfkRynzyu3/hlNcl/dqDqopI0xx9mD3Qf1x1SUDj0zgENRyMZFyU9ulsT
	5Pia3i2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWHMT-0000000Geds-0h1K;
	Sat, 03 Feb 2024 14:51:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWHMP-0000000GecV-3CRp;
	Sat, 03 Feb 2024 14:51:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33D45CE2A74;
	Sat,  3 Feb 2024 14:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AB0C433C7;
	Sat,  3 Feb 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706971867;
	bh=kZrg3ai602uwcG9r7fcunazV+Lut/tm/tBOnYvdvVwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kyU/GFd+9pKR7Kt/css9MJdmrcVnZ31dprRIGBrXJASerebXa55nK2X+PPYZ2+Kby
	 jYc4JUwHZeOn7OozmHC3BHF0mOaSCRiCEr3y60yFSoyFvtLCeLcVZuvQtiSQDBtKV2
	 0cVHAOMes0FI5vc0pf1SsLRzj5yf2xA/FycdT4GZGLAZPlYFgMWf4GK12E3gSPfiWm
	 e4qx9TuXucn0q3Trv0+QSgEgyq+BhvdGeQNR9ztU29Y2KhWGtc37brmKRfWAvbylpL
	 YUiPCCfpu2yfCgFSptOr9qtgLJIhSYg3zY/sFBXAbxymoKdmlXMLDG4mEnK91AJmTd
	 0trNq/P0TLk6A==
Date: Sat, 3 Feb 2024 14:51:01 +0000
From: Conor Dooley <conor@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	f.fainelli@gmail.com, kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com, anand.gore@broadcom.com, dregan@mail.com,
	kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com, devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 02/12] dt-bindings: mtd: brcmnand: Add WP pin
 connection property
Message-ID: <20240203-unselfish-rewire-78cc0d3db0db@spud>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
 <20240203002834.171462-3-william.zhang@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240203002834.171462-3-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_065113_994738_FDB17667 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Type: multipart/mixed; boundary="===============2758567857748825193=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2758567857748825193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qrjKC5ASGNxluNoU"
Content-Disposition: inline


--qrjKC5ASGNxluNoU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2024 at 04:28:23PM -0800, William Zhang wrote:
> Add brcm,wp-not-connected property to have an option for disabling this
> feature on broadband board design that does not connect WP pin.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--qrjKC5ASGNxluNoU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZb5S1QAKCRB4tDGHoIJi
0mOCAP9+H/eJznyn7suY07Ew8Ml+xZ9vSfwBboku/7M35uHXvgD/aybKwovhGgVC
4DhLtmNGAk2tCCNzRnIEcGoX8bHOmwA=
=E5iS
-----END PGP SIGNATURE-----

--qrjKC5ASGNxluNoU--


--===============2758567857748825193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2758567857748825193==--

