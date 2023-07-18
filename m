Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17778C001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW+bVUtc0d1hcXsUjlADuvCwLvd5KCM3gAfVbJKvlE4=; b=B+kcoROZNmiNYm1k6bGn9m9tOP
	qiKywtAc4x2nsGK3DPm7pxNGGhYGcLr/JwQm3132hOVVmB3iXXi23yf9qv5mYCfcJ33jn0fIJ4OyR
	03H7QxRuZsgZ8VmyIKds/Ku9fuuCVu0bZ9cExkpd7Pj32fiUmJ0s++OUmuNz3+RuZM56IXrBaGPn1
	CNcYCc4SEu/WUNvlICCZUau5tlIeN1UziQ7ojHCl6+EwseTzDZYwppdXA3K9V9pQKpTxoaaTLcrdw
	BQfvReOP+I4WCLYD7O0G7k8+VCI8H5oRbbmBSXGVpb9FYSWHOicioeLrHM3Jkx/9nT/jFvTpbbeNk
	dD4GDWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17d-005zrD-2D;
	Wed, 19 Jul 2023 06:57:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17K-005za4-0H
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oQJxiue2PxpYJWj4uSGkr1AI/SvHRSnZgfLol4lqaQA=; b=h8DHgGFr3sYo2lsY1mp7vjTtUt
	Z/vDbsgUY1OPXvlOgaz9Ynx8YnQgm/jF8U1UqlEe44Peo9JQvCWNrpEcWgCFlevg7+jNEKVtsH0U5
	iFhldE9PAnQvkC5k+JttmHrRwWgWwUrCtpKYKNoy0hy+EQwbOueGxxgTkrzzlt7b2aPU2Z2SmvJXr
	EoU3FjDB3F8QSGgAgQVUcZu11u1hgy69thGhod6hqvA+CfXqFU0qDIE3jbONLB0Gu33gflpXvbMdT
	tUIcvx/KpGG61mb6AEOl5G65lqev1g9OSv/ws9ogZuI6NRMinHvRrn+F/o8Xoci6HsBeO9IMWagsK
	plZf+1qg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLmv3-00Bhqe-0l
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 15:47:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73CE161640;
	Tue, 18 Jul 2023 15:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3494C433C7;
	Tue, 18 Jul 2023 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689695206;
	bh=76mVnJR9o74Ma8KmtRmvfVhR/CCcRdmixqoJDHlIGzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTqoea1e4JsUd0SgXsF3R8CUlUt42gzMufzNo8YkXur/QdtUJdJ5jhWDr5UneKhQy
	 JLxl3nBJQM80I/OEH5dR+H6AJTnJl9pUcsh7ioARJ1EbCqtgsiZgfUFyvcKkLGV93V
	 zLJ7K/I2ho+eoF1XcUZhSPCLd9k9edyAGCXX/cpl10COVm2lsY3afE/Et/KI+McnaH
	 /s+h6dNU5sXUu4N5BI7p5Buf1GYxt0YALSvDPaC7/xWplza8Cqqv0cqeyYoF/hS8vR
	 Y/aHDeQMGt38kLsWeviLvYz7tGi6C5cGJmdmHpslvjVR1xz5pyopZ/PjLwHMpik1sX
	 hJYpV6TyUgSOQ==
Date: Tue, 18 Jul 2023 16:46:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: nand-controller: add
 nand-skip-bbtscan and nand-no-bbm-quirk DT options
Message-ID: <20230718-curfew-jumble-aeafe95c5cc7@spud>
References: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
MIME-Version: 1.0
In-Reply-To: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_164721_697744_78862C16 
X-CRM114-Status: GOOD (  23.66  )
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
Content-Type: multipart/mixed; boundary="===============5430611677059604285=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5430611677059604285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+7otubzjJ6EFgf8c"
Content-Disposition: inline


--+7otubzjJ6EFgf8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 15, 2023 at 12:48:16PM +0200, Johan Jonker wrote:
> A NAND chip can contain a different data format then the MTD framework
> expects in the erase blocks for the Bad Block Table(BBT).
> Result is a failed probe, while nothing wrong with the hardware.
> Some MTD flags need to be set to gain access again.
>=20
> Skip the automatic BBT scan with the NAND_SKIP_BBTSCAN option
> so that the original content is unchanged during the driver probe.
> The NAND_NO_BBM_QUIRK option allows us to erase bad blocks with
> the nand_erase_nand() function and the flash_erase command.
>=20
> Add nand-skip-bbtscan and nand-no-bbm-quirk Device Tree options,
> so the user has the "freedom of choice" by neutral
> access mode to read and write in whatever format is needed.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>=20
> Previous discussion:
> [PATCH v3 3/3] mtd: rawnand: rockchip-nand-controller: add skipbbt option
> https://lore.kernel.org/linux-mtd/1618382560.2326931.1689261435022.JavaMa=
il.zimbra@nod.at/
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b=
/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index f70a32d2d9d4..ca04d06a0377 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -103,6 +103,19 @@ patternProperties:
>            the boot ROM or similar restrictions.
>          $ref: /schemas/types.yaml#/definitions/flag
>=20
> +      nand-no-bbm-quirk:
> +        description:
> +          Some controllers with pipelined ECC engines override the BBM m=
arker with
> +          data or ECC bytes, thus making bad block detection through bad=
 block marker
> +          impossible. Let's flag those chips so the core knows it should=
n't check the
> +          BBM and consider all blocks good.
> +        $ref: /schemas/types.yaml#/definitions/flag

While this seems okay, as it seems to describe facet of the hardware...

> +      nand-skip-bbtscan:
> +        description:
> +          This option skips the BBT scan during initialization.
> +        $ref: /schemas/types.yaml#/definitions/flag

=2E..this seems to be used to control the behaviour of software, and does
not describe the underlying hardware.

Maybe I'm off, but the description of the property does not hint at the
aspect of the hardware that this addresses.

Thanks,
Conor.

> +
>        nand-rb:
>          description:
>            Contains the native Ready/Busy IDs.
> --
> 2.30.2
>=20

--+7otubzjJ6EFgf8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLaz4gAKCRB4tDGHoIJi
0g3xAPoCChSgHtJm/s66HpBbvjdcQLRTQYdBP7qBc021LHTnKAD+ML/axLivhd8k
t9BrKrTs3wFm05P8sJkqLPbYdU9C5gg=
=07DA
-----END PGP SIGNATURE-----

--+7otubzjJ6EFgf8c--


--===============5430611677059604285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5430611677059604285==--

