Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45653C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cNcshYrcwmUOcUikjcloe2oU4Yxw5+UIQTve03KTfo=; b=CE0kqtMIWXM2u3/9cSul6pMMUm
	b1BVAINfT5ZGTX7tImQbtMfDN+s4fpbw+8vOWEpom9rzvchrC3ea/JcVReoaXTUsF3AAsAGVj75Xu
	juh0e+NkSJ4YDXArZxnrJw3J9p628LpkwJROnoo7DkZmy1i2QJJZkOB7tpR6acjpu8AlHHU6MAw6o
	n1XaOzQjzhW7w0fJ941zhstc5zPgo2RqhCzkBm+ciAvpl53lkXdfXFvYsmB2tWnG7cGl4ynbmaxN2
	4nJCHi+UdNpym4XVxl0DApLjcvOIZOjxuGm1nZA/BcNlCxTdV855aBFoN1zzo7gEH7iAwTcXI6oPE
	ihANqmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4L9r-00HOJk-1M;
	Wed, 31 May 2023 12:42:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4L9o-00HOIQ-2e
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 12:42:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35252615CC;
	Wed, 31 May 2023 12:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5349BC433D2;
	Wed, 31 May 2023 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685536947;
	bh=tZgE2oBQxYazjPO6CTUnPX79KVv4ZnyhW1uCkRKF24M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLqv3SEAFd//wuZRQJ+GZ0dMPxJWPnn5thnJpyoLbDfrRpXjyP2ovp8KlymRKwR9C
	 tyc87kmIhAcVjYDUicmy0pWThiJws9KmimeN8j0/XdLZvv9KqP9kERgGuU0eQuB6Oh
	 FZ0pcfDgO0QIvU1rwLpVAljbksp6f5IqyLcpwrf7QREdeoOoSKVqyO3FDFFUM4uEIr
	 OksRIQk2owTJoW+5WtM0NcD1F3KdcyQifKgE+9BwOU1N6pu3GIzPqjvbZA4/iNBJaz
	 2lzjHMv4Hht1nIWBQpJgZsq4dLLOeta9erG6J0pEmj1JHh3BYryJX9q7cL2wU75XLx
	 UWt4XYGvuwfuw==
Date: Wed, 31 May 2023 13:42:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, arnd@arndb.de, daniel.lezcano@linaro.org,
	neil.armstrong@linaro.org, f.fainelli@gmail.com,
	christophe.kerello@foss.st.com, liang.yang@amlogic.com,
	jdelvare@suse.de, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Add AC5 specific binding
Message-ID: <20230531-unfrosted-refried-bc4c953c4d70@spud>
References: <20230531025847.1284862-1-chris.packham@alliedtelesis.co.nz>
 <20230531025847.1284862-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
In-Reply-To: <20230531025847.1284862-2-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_054228_896646_F83B04B1 
X-CRM114-Status: GOOD (  18.01  )
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
Content-Type: multipart/mixed; boundary="===============5132649942320790548=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5132649942320790548==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j0OUzNSQ82kM+G9g"
Content-Disposition: inline


--j0OUzNSQ82kM+G9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2023 at 02:58:46PM +1200, Chris Packham wrote:
> Add binding for AC5 SoC.

Ideally the comment about how it has only 3 of something-I-forget
would go here too, explaining why you cannot use a fallback compatible.

> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../devicetree/bindings/mtd/marvell,nand-controller.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controlle=
r.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> index 80ce854291cb..c09efd7a0043 100644
> --- a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>        - enum:
>            - marvell,armada370-nand-controller
>            - marvell,pxa3xx-nand-controller
> +          - marvell,ac5-nand-controller

IFF you end up respinning for another reason, I think alphanumerical order
would be preferable. Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

I figure this depends on the conversion, so alphanumerical order would
be good to have there from the beginning of the yaml binding's existence
if it isn't already.

Cheers,
Conor.

> =20
>    reg:
>      maxItems: 1
> --=20
> 2.40.1
>=20

--j0OUzNSQ82kM+G9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHdArQAKCRB4tDGHoIJi
0gplAQCARBMi47SOwGp3JREhXmhkrMkwX3WMqE+KsYJqMneinAD/RIO4K86MUN3S
eBdxFm4J9aroXH4OMOP2k//ai0voMgw=
=xh3l
-----END PGP SIGNATURE-----

--j0OUzNSQ82kM+G9g--


--===============5132649942320790548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5132649942320790548==--

