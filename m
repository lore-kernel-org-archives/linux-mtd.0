Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1923E82CA1
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VXwRIVbpF74CxxdsvxNPh/xEIFPohURBI7cQntE5wk=; b=QEf/D0nOATMvBU8Aw79/XQlhkn
	/F3keNqFB26yBQe/+ohRccylx8FaKzIMu8iNMqunDH2bpH7bMkmsggzNDc89t1uujUhXJNu9lEJaS
	7gCX70elOzYz+cZk6g6m6lCxHvpgJfWslxMlMKzu2LXAWX3QaRj8cRlh/YZ8lqfl3EJ0GQQLpkRgl
	zgMv1BIoiFNkGgcs3E7ZIYeRk4G+zfxJcPyBa+nNviqx7gSpHrbD09Fq8M1rNT/HmV1t92V1THlNj
	N8EU95Gxcb7axgEOpyV7uLyG2+/3tjp00yebttQn9wArKUkLgxniL6pcU3Ya9qmwq4V97YISeZXHq
	eyzBwp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWZa-001G7N-1Q;
	Wed, 27 Sep 2023 15:35:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWZY-001G6U-0F
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 15:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DDA26190B;
	Wed, 27 Sep 2023 15:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53614C433C9;
	Wed, 27 Sep 2023 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695828930;
	bh=37kBTb9YjXxjlMIh+0Q1RNuR2TQo6vk32qz35NjOF/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0j3K5uJdXc0EKvk80mUbQi+BDLCAgx203Htw+2xLooqambR20sjwmZzHKhX/MGRQ
	 rES0R5mS88bOMzEdVGjriDwzdxxHwuh5o5kxrN/IHPmyivO9nuQ4EXQOaU7oFFzija
	 suPsoH0HVNxgtrYAfwyWQ+97rms/iVqqmKSbeZhFRw/P6Ib0VObaVi0beGE2xK8f6G
	 p5NiUyHpe+wtTtSwpHm5BpDQyoHCI6XN9yGbdJi4ftQKWLLpJ1TYfMuJ4a1jaZkJrG
	 /6gWUNBNN85OSkz3JemqPGFXpb/yPxKglYqIUtydqmawjmzHIE/abd1cFLXoW8h6VZ
	 ox6UfBV0xVZBA==
Date: Wed, 27 Sep 2023 17:35:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Norris <computersforpeace@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Walle <michael@walle.cc>, Paul Cercueil <paul@crapouillou.net>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v2 00/17] Prevent NAND chip unevaluated properties
Message-ID: <s7gfoex2esucv5i43e7rfmkf3i63ullvh7kpylberuqiiimobw@p2slzyepmo5r>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <2b5dd78d308c007dfaf01eaf59fe8ec4.mripard@kernel.org>
MIME-Version: 1.0
In-Reply-To: <2b5dd78d308c007dfaf01eaf59fe8ec4.mripard@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083532_161256_2012C60C 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: multipart/mixed; boundary="===============0633681105218990478=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0633681105218990478==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ouxkrnlofymraaa5"
Content-Disposition: inline


--ouxkrnlofymraaa5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 07:20:12AM +0000, Maxime Ripard wrote:
> On Tue, 6 Jun 2023 19:52:29 +0200, Miquel Raynal wrote:
> > As discussed with Krzysztof and Chris, it seems like each NAND
> > controller binding should actually restrain the properties allowed in
> > the NAND chip node with its own "unevaluatedProperties: false". This
> > only works if we reference a yaml schema which contains all the possible
> > properties *in the NAND chip node*. Indeed, the NAND controller yaml
> >=20
> > [ ... ]
>=20
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Tested-by: Maxime Ripard <mripard@kernel.org>

Erm, sorry for the noise, I ended up sending those by mistake...

Maxime

--ouxkrnlofymraaa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRRLwAAKCRDj7w1vZxhR
xX4JAQDyiGBGb794KYUAGZDbfAs7W7wE1aIS/OcN8jgKLIZO7AEAilipuu235Nxg
wZFOlLb2C+X+xU14jHSRogTkVbn9zgU=
=2ukJ
-----END PGP SIGNATURE-----

--ouxkrnlofymraaa5--


--===============0633681105218990478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0633681105218990478==--

