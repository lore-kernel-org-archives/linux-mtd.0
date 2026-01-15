Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F8BD4660A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FPc8859F9AIEXOjC5c4GxQjsUAjHgzxn1KxnZ48Rwk=; b=vmwp8AtHdEWmLtOcJnF8IhOa+0
	69ZdAORDtINOdwqufqDTYsV1xIOYu1IRTOvAqvhm5wAtTcK8mspydoKuy+A5SSJS8XdyPZWrSVyNc
	A4XrBnjFWnQtg0jO1n1PM0SFovJBs2nK9TPB81HV6igQWi2e97R19pN6D7qzOeH3t59odfebAuz1y
	zIRXiAc42fyt36SpT7c/s2oVSkz8+h88MgAfTdZjAx0cHazpMOVGFaJENT88gGptrwrV+vwWyCK0E
	YQ38m1jzrMZePshFqjoVYmzKEzHgk0ksBhCWLdhrcPI3oAepnkDQf4c4BJDkZR7knHmsR2ACK4le6
	Dy7Cutng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRdC-0000000Cv4K-2lgn;
	Thu, 15 Jan 2026 17:59:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRd7-0000000Cv2L-2ZaN;
	Thu, 15 Jan 2026 17:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1C3E43726;
	Thu, 15 Jan 2026 17:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F1CC116D0;
	Thu, 15 Jan 2026 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499972;
	bh=k4nv3LNd06xUvMB9BLcG7D7UT7+uRA8LQwwCBmUw9b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bG1i4O1+W2z7yWUtJI1p/k45SGqFHEUeCXPRng04/jkQsWUyjPvq3mHb5AciPxV/C
	 UukaXnh3Yj+ph19La4HWe8yH9NzKH/gw3gbimVogSubKyLiGhmzyF5u9Gym/B22Z2J
	 rb4/ZcqhkCesFC7O3e2GcmvMY2mUJ3LtFcZbyUopScOin/CYRKn+S3iQUMpDgX33OQ
	 2zDSdShciJprta6Vl9mZk/jP8OgxzS9ugcb/N80LOgq/fqICk0I3EG53CPXPbxJBPm
	 K4XHnOueqew3hL2YV5evGkeOZjzJkbP2l0I77g56YrBAZKq1xsDtcG0M3TAiJV664u
	 JzpLo5rXebRHw==
Date: Thu, 15 Jan 2026 17:59:25 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org,
	mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, lgirdwood@gmail.com, matthias.bgg@gmail.com,
	julien.massot@collabora.com, jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	robh@kernel.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
Message-ID: <246e84a5-18f9-464c-926d-3f1f305283c1@sirena.org.uk>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
 <e1ed2a68-683c-4235-890b-9b2c5ad93e38@linaro.org>
 <9bb24b4a-248d-4a97-a9fc-a00b5237f548@collabora.com>
MIME-Version: 1.0
In-Reply-To: <9bb24b4a-248d-4a97-a9fc-a00b5237f548@collabora.com>
X-Cookie: Are you sure the back door is locked?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_095933_669424_A960CCB5 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Type: multipart/mixed; boundary="===============7182525674256085064=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7182525674256085064==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KyHCmqwLxjNYg8pj"
Content-Disposition: inline


--KyHCmqwLxjNYg8pj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 15, 2026 at 03:46:18PM +0100, AngeloGioacchino Del Regno wrote:

> I wonder if the Fixes tag can be added while applying.

Yeah, b4 will DTRT by default there.

--KyHCmqwLxjNYg8pj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlpKvwACgkQJNaLcl1U
h9C6GQf/YxMHx6TFHxRD11tVNCK7jX3h2fjjKf1TF9IusHOSp+9QdQzpXJWWi83w
hDYIsC5WX4jgAZ+IFLo3qaDsFtsPBfPvBvbSdbncbCDuqPYcdGr9EQK7gC2tugyT
107X+LJwJ73+cM/zlGxgv3qpvdhd+RrRqXiKNOPv+a/DXfip360bRzKWvEkfiNSD
HX/tEKhncVVHePdGClv71P+fZ2F6jP7jRcG6ExPE4KLj0YRa/NZ8iOUMg1dtIYBx
pL/vDRD5Sq6eXq4az9H/xgCH1/+J/GmGe4ZislsRksNFRmcVoh2WGXGA3ZEg3TY/
7AO+EqXRxfl97vJBipSqR2HUGChvlQ==
=lO8H
-----END PGP SIGNATURE-----

--KyHCmqwLxjNYg8pj--


--===============7182525674256085064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7182525674256085064==--

