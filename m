Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E32C83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 11:50:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DAE12073E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 11:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="no1DWJLI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="AdwKmZuB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MG42hl0N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DAE12073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mhy8LZs9B5qUR59jAPj9RC+1hOARUgN0cE4U4MtpyKE=; b=no1DWJLIkl/CFr6dE77Whsd/7
	kk9ZonOrc19Gz+FT3AmmQ9HVXfmQTFwzGNA/eVJyOmP9SXHHKDeoct/I1hIHSxPI34d2nZXo77wI9
	vQxLvkA2uhTqGQRkGElqjOouMJVP1EbF2uGpPwYw0cAPwzUsP/dF1MjK+m6Ow3MLHPmuzcKs27S5v
	V72DI42aXHwYX/8exmVvtDHg1/XNbwMSjX2SVYRKPQw9OwGZ1r/rfXFHmtSfTvvIUuehrgYGbExTh
	QzEtRNJEnLYdwBI1KYBJk9TmidQMMb8wIV1/zHZ4ScUcCiyX3CSPoCdR9Drka5b9zUtubZEL1/fqL
	NPcyLTSqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTlEI-0001Np-PZ; Wed, 29 Apr 2020 11:50:18 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTlEE-0001N3-NU
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 11:50:17 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id DF3D5734;
 Wed, 29 Apr 2020 07:50:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Apr 2020 07:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=MZELg45ZQRts6Cx5sUhyiaLHCD8
 lRyjQOu7wzrAbEX8=; b=AdwKmZuBTWOncc4vQFaslDngWdipB7Wqv3I7TYGxi8M
 gPRbPacdPE2U0iNsmPnuHLlhAuUIgo6nEwFlp1DGKIW7NOb+Qhcme6/Twmc7wlL5
 4pZOEdkEuDZCeqY0LSHmNZyT1KNta/K74rKhebaIbkfHtrcVc771P0xA7ahH8wzg
 1GA0ibYCEAn4ZO0fYFvtPyCnvFv3dG2hZ9LGVztMVHSu8zo5RxnECqbv3JPGZfWo
 ef50Ciky/KMuzxE7PWcd9SEVc0Rrvjpxg2tgX+HRhQW1At0R+jkpxqCPVtUU+Nav
 GzjE+a+/X8H5WsczHIOxvYLKZTVmcSwVMeo+FFtKOuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MZELg4
 5ZQRts6Cx5sUhyiaLHCD8lRyjQOu7wzrAbEX8=; b=MG42hl0NaysBYPaqZodAAc
 8CULeoLq6hP+Evn53cgbUf138qUNy3Br4rVF5qXFuHiP+lmST6UyASqoxnoLdLA4
 MGDM74Cx04fOiptzHNnyfUegnA0MsswcVwiHqJEqzVyKMOMGOYBFGPe5WN8qi/7V
 urtTqzcbxu5M5FEfGyg2DfDl33Iqd6Voh5KkPGVbIvVSdxTG8BOmQCzdLVdVzCiE
 2APiiZ4sdN+nEcM0rj492E70qFDTmGhUyoN5VSSNjkbUAnGVQkraEpTHm7wmn3Kp
 cAC80tqeu9hXzGWiSKU4QfN1YFULJjXi2rLNEqGvrMuWOzayTb5lo4YJTXEZxyGQ
 ==
X-ME-Sender: <xms:8mmpXqlGaXjIB2AkWGkbyZSvzxcCYjWGfmFrsp-nsbnz3jNtI0RHRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
 gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8mmpXukVgCosWgr-zmsPAEDwC7UJvcsqqluQmHAJr2oHydlhDldBEQ>
 <xmx:8mmpXoN0JjU9yFBj4GFCjcgg6gfVWqEfzoFJP5jdLByiV51NWWC-KA>
 <xmx:8mmpXnOoNQR4Ckq-KHGp8Nsvq94N2RXH8BFC3474gbm0LDXUfoLwrQ>
 <xmx:9GmpXj6QDi0cK_8E3K5TcQZpcO3Qk37EfNurxpLAsBn0v9YDJmG45uNWzrQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DAA333280060;
 Wed, 29 Apr 2020 07:50:09 -0400 (EDT)
Date: Wed, 29 Apr 2020 13:50:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: Add YAML for Nand Flash
 Controller support
Message-ID: <20200429115008.d5jmsc4ws2o3cm5w@gilmour.lan>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200423162113.38055-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_045014_810543_5EB3C4E7 
X-CRM114-Status: GOOD (  13.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 andriy.shevchenko@intel.com
Content-Type: multipart/mixed; boundary="===============4470809794990799830=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4470809794990799830==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vrgo34uqoxmbwyae"
Content-Disposition: inline


--vrgo34uqoxmbwyae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 24, 2020 at 12:21:12AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel=
=2Ecom>
>=20
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
>=20
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@li=
nux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 61 ++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/=
Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> new file mode 100644
> index 000000000000..6dd899d367b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel LGM SoC NAND Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.=
com>
> +
> +properties:
> +  compatible:
> +    const: intel,lgm-nand-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    enum:
> +      - rx
> +      - tx

This looks wrong?

If you have two dmas channels, I assume you'll want to have both rx and tx,
right? If so, then you need an items, not an enum.

> +  pinctrl-names: true
> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true

both pinctrl-names and that pattern are added automatically by the tooling,=
 you
should leave them out.

> +  "^nand@[a-f0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +
> +      nand-ecc-mode: true
> +
> +      nand-ecc-algo:
> +        const: hw
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dmas
> +
> +additionalProperties: false
> +
> +...

Can you provide an example too?

Thanks!
Maxime

--vrgo34uqoxmbwyae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqlp8AAKCRDj7w1vZxhR
xaI7AP9HY2RRA2nv/CwHEUJZv3C50OrtP7Ir+YFN6Hd4bYtCcgEArOCPK1GJeB2l
VoqKcGXOMea5Mx1PBMZF1eirh59GXgM=
=tGn6
-----END PGP SIGNATURE-----

--vrgo34uqoxmbwyae--


--===============4470809794990799830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4470809794990799830==--

