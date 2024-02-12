Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D830EC48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 18:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYSI0+/IE42p7XrOeF/BwBTXjZanWyEQJ7QN0zR9tVA=; b=opxEeQYuLXWQ0luTEW/ptwIeFi
	vdz0xF3U3P4F+6de1ClVoSpv/vpz7BTReUg4e/mrdZmWyLsEuemY6i9uHdC9xDDHlOVbvFDlKKFZy
	8w7iLPHIFmJuMKrXxsIvpdJNeperhY/SHmQVdoecGVnXH3WqQw15eYorgElIw3rwftGzMkJonvG9v
	dy+MQGUdaEjzwGtKgahCiloe9fX6X3rI8rtTYByASeRmKRaoUee19qZXciE9vPYjOnTHz8a8Mc92i
	4aX8BD+kDuAKVs+6n/QYOgSNml6zldri6Zy6IR0Rp0iU4lbLMExM/5ESpomKDY6t9V9uZ84iFprsg
	p3ABSsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbCG-00000006dqQ-38ow;
	Mon, 12 Feb 2024 18:38:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbCD-00000006dpG-46hO
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 18:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9A4961062;
	Mon, 12 Feb 2024 18:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B78EC433C7;
	Mon, 12 Feb 2024 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707763104;
	bh=DB+QxJu9d3ZS9rmjqca4J9xEJVvpvRrU2w7NHJpSp2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMUyCia9MG/ccuDFUpmDHiaLgC+igJvueSb2uGUiW+TWBq+vBFJgv8cUhmQuvL+pz
	 5iUT2b3vi+tdzkMXYYrc1B47l5j0QmWiB9PXCy926EZDb90ffrj4N8HGa+6ELm+baa
	 d1O2E1uY04FIGeZwOqJkdmUtPJLY5anr/dqnPnvxGLeRiKmLD0fwaP48UDg+6JQpGI
	 kmvpJ2wegkC+GvoCO932G8UHkEkGm1sJGgCoev1AUcQOsunK5XzdWaUaXPYSOGUYqp
	 p9S5u9N0bEQx6QB8D9+o/mABVRhhIOFXR2yemqFi5EEwnKE1jChO2G6vNh5tKdRLgQ
	 16/DAqRwQIcPg==
Date: Mon, 12 Feb 2024 18:38:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 08/12] dt-bindings: mtd: st,stm32: add MP25 support
Message-ID: <20240212-squeak-mortality-5a53a4d1039c@spud>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-9-christophe.kerello@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240212174822.77734-9-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_103826_129515_71FD747C 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Type: multipart/mixed; boundary="===============7142576333344883193=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7142576333344883193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5x9qetWChxMtvEey"
Content-Disposition: inline


--5x9qetWChxMtvEey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:48:18PM +0100, Christophe Kerello wrote:
> Add 2 new compatible strings to support MP25 SOC.
> MP25 SOC supports up to 4 chip select.

Again, please explain why the new device is not compatible with the
existing ones. Also, please explain why two compatibles are required for
the mp25.

Thanks,
Conor.

>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  .../bindings/mtd/st,stm32-fmc2-nand.yaml      | 58 ++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yam=
l b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> index e72cb5bacaf0..33a753c8877b 100644
> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> @@ -14,10 +14,12 @@ properties:
>      enum:
>        - st,stm32mp15-fmc2
>        - st,stm32mp1-fmc2-nfc
> +      - st,stm32mp25-fmc2
> +      - st,stm32mp25-fmc2-nfc
> =20
>    reg:
>      minItems: 6
> -    maxItems: 7
> +    maxItems: 13
> =20
>    interrupts:
>      maxItems: 1
> @@ -92,6 +94,60 @@ allOf:
>              - description: Chip select 1 command
>              - description: Chip select 1 address space
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp25-fmc2
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Registers
> +            - description: Chip select 0 data
> +            - description: Chip select 0 command
> +            - description: Chip select 0 address space
> +            - description: Chip select 1 data
> +            - description: Chip select 1 command
> +            - description: Chip select 1 address space
> +            - description: Chip select 2 data
> +            - description: Chip select 2 command
> +            - description: Chip select 2 address space
> +            - description: Chip select 3 data
> +            - description: Chip select 3 command
> +            - description: Chip select 3 address space
> +
> +        clocks:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +      required:
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp25-fmc2-nfc
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Chip select 0 data
> +            - description: Chip select 0 command
> +            - description: Chip select 0 address space
> +            - description: Chip select 1 data
> +            - description: Chip select 1 command
> +            - description: Chip select 1 address space
> +            - description: Chip select 2 data
> +            - description: Chip select 2 command
> +            - description: Chip select 2 address space
> +            - description: Chip select 3 data
> +            - description: Chip select 3 command
> +            - description: Chip select 3 address space
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.25.1
>=20

--5x9qetWChxMtvEey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcplmwAKCRB4tDGHoIJi
0qEaAQC6FzMEWUZon7Rbw9b51wIt52mF6FLV+DfSgClzOalRFAEAiDB3FOanV76n
XJT9NErVw/coKCkhHjtRx02Cv9xOtQI=
=9ijQ
-----END PGP SIGNATURE-----

--5x9qetWChxMtvEey--


--===============7142576333344883193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7142576333344883193==--

