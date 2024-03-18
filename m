Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06D3C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2024 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHsMAjLXWiyS6iM1ZsYOFJfHeh+16UxnYLSyt0GjmzA=; b=2un0HCCSCwLfeP1AEIM4ubg3H2
	A2tcYR6Dt9/hEVRTopMOwGpbDtOaLCKWph0DUdNQKGggTxSxgbwjbFm34HWJFbQra99ZApFCt1XLC
	fvYK8S+q92MM7hs2PgN8yzbWaRQLRnJxPJnypDkmVaEuoRGWg5Xzx4DPNUdxudJJZn9bhnY3NRg/7
	9dKnEUEAuY2pXE6fY5F+l6rZURj/ul9B5/OgUsYo2g+L6Imqw80EyTn00Ey0shGzKY7CBzH3Nhric
	cnaejRydN1ZF/Yr/7AHPTGHzVZrOLiuoabyTwvDtwjAKAfM0kjSFcgGXYH5POEfneELN/KyehB3np
	sH2KjM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmDeC-00000008kYK-1PXr;
	Mon, 18 Mar 2024 14:07:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmDe8-00000008kWu-166G
	for linux-mtd@lists.infradead.org;
	Mon, 18 Mar 2024 14:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE551CE0201;
	Mon, 18 Mar 2024 14:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE18FC433C7;
	Mon, 18 Mar 2024 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710770841;
	bh=vkD2c6YOu/3PLLtPJN8BZ4sJ1EZR5ZziaUiEsoLiRHo=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=UoAASRy49t4fYNk5zt4y3ZniIxzKKiwzxdCQE4wzQnV649Zwua5izMsVO/rVMbngB
	 KMMX/zmbd1oJMn7AQRMeeX/sMIMN163l/RUwVVwT7LLkBwQXfG3Bf5EFSgDM869Z5q
	 J1fqus1YFKq0OnTNxkIQj7VziN2+7BBOLm1iOgkkZbVaUSSeD9L7vO4LXAtM/2hBo6
	 K/JUc5lAA48VTB3Mu3GzGzyZ5JFRzPCHv73prUmPeRNyPxLhAzmjy9SlQs44qv/WTZ
	 KPpAJlD2d1JzKY3hJy6BNiSjR7FNu0Y90a+huEiqI9LHf2I8zW5VGhzEG//MGA6TmB
	 1XPARtvsjEiVQ==
Date: Mon, 18 Mar 2024 15:07:13 +0100
Message-Id: <CZWXNB1U9VWE.G9CWTCUO3ZY3@kernel.org>
To: "Aapo Vienamo" <aapo.vienamo@linux.intel.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: core: Don't fail mtd_otp_nvmem_add() if OTP
 is unsupported
Cc: <mika.westerberg@linux.intel.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240313173425.1325790-1-aapo.vienamo@linux.intel.com>
 <20240313173425.1325790-3-aapo.vienamo@linux.intel.com>
In-Reply-To: <20240313173425.1325790-3-aapo.vienamo@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_070724_505562_54B48E4E 
X-CRM114-Status: GOOD (  10.71  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0921806705715089948=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0921806705715089948==
Content-Type: multipart/signed;
 boundary=8ac9ce41e26f4cabb23549944e22bfa9a25961dadc257ee5a3e92aa37b29;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--8ac9ce41e26f4cabb23549944e22bfa9a25961dadc257ee5a3e92aa37b29
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Mar 13, 2024 at 6:34 PM CET, Aapo Vienamo wrote:
> Handle the case where -EOPNOTSUPP is returned from OTP driver.
>
> This addresses an issue that occurs with the Intel SPI flash controller,
> which has a limited supported opcode set. Whilst the OTP functionality
> is not available due to this restriction, other parts of the MTD
> functionality of the device are intact. This change allows the driver
> to gracefully handle the restriction by allowing the supported
> functionality to remain available instead of failing the probe
> altogether.
>
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--8ac9ce41e26f4cabb23549944e22bfa9a25961dadc257ee5a3e92aa37b29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZfhKkRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvs0YQEAsYw1iglE8VFvcu5bjOkVo5oFjG2qb2Jo
lbITqsfqxfoA/iYKuEvmeC+oVqLKwTwaumonvnWI4F8TpREztajbvYoD
=uszn
-----END PGP SIGNATURE-----

--8ac9ce41e26f4cabb23549944e22bfa9a25961dadc257ee5a3e92aa37b29--


--===============0921806705715089948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0921806705715089948==--

