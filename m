Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58647CDB482
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJr+XqOReDSK3ZduBKiwoaufXNfJEJZxx01tFlau/80=; b=A92ZQFucCj8FFdzZ3MBVzD1lll
	K2uaxQ+z6xTW29as4EoSVTB3UfolbuW6zoOAO3nybNmo4pQRrUTKrmrefYUyxg/Byw9VXf2i5Y+x4
	S2uk5zlibNXew9+3sMwzFSaiLc9qqQSaIFmRHD+FCnkmx0HPpuDKC5QKfQhEViLLY5MyWzRxZL3i/
	/RnfHI24VDZ6WbVU/ygNEA8xfXHL8XUSAFIpQuWfkrZQjBHJc69BHTcLDLmszagsTe8tL5esqDAN3
	HTRyw1vqW0tXyS+NuNPio2uAomvVq5+bMcAxEPGmDSv5RHkXHCHuQdWbCkrLILONbN31GpouVFEXP
	L2kjXObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qshtT-00CAAM-1y;
	Tue, 17 Oct 2023 11:05:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qshtQ-00CA8h-0B
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 11:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A6196137A;
	Tue, 17 Oct 2023 11:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3298C433C9;
	Tue, 17 Oct 2023 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697540742;
	bh=2tbOzud7Gya65vVoLt1/ZBwSQRofe51xUVd2EqSAZ1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snOtCx2YXwp637xr5gxxfPl9rMN9KFyrga+4o43G/vD/Iz/O2iF1HZsUOC4t1lpm6
	 pRZ2iQjrnnChMftxuOD2go7XYlhbDmIZ07lOJrDH2Z+H0ipcpipFDOrF9FXAEzKkh6
	 ya4gi7w41iKiGUGn+wZZDbcApClRxUAyjZWz1mmU6XzYsogR+lUP2pb2QVp9tJ7SUB
	 O/SFwVMXAsihPP9mu0JWYptLG+LU7T4BcW/QdQUk50pM3/mO//p6iXnB4fRi9mi8SB
	 ite5SNLHDkgxOXe1kzowh7zd153LQTqxIQ4/LVVz4zJMaZD7WDJv2ab+Nw29CxfNCR
	 6KGTWxeweRqDg==
Date: Tue, 17 Oct 2023 12:05:38 +0100
From: Conor Dooley <conor@kernel.org>
To: niravkumar.l.rabara@intel.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Message-ID: <20231017-owl-deodorant-0c9693e7c1f8@spud>
References: <20231014120436.1515339-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231014120436.1515339-1-niravkumar.l.rabara@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_040544_193362_F3AAE2C7 
X-CRM114-Status: GOOD (  29.09  )
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
Content-Type: multipart/mixed; boundary="===============2065159257026419629=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2065159257026419629==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g6vD1SDSOcM33Sw3"
Content-Disposition: inline


--g6vD1SDSOcM33Sw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2023 at 08:04:36PM +0800, niravkumar.l.rabara@intel.com wro=
te:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
>=20
> Convert cadence-nand-controller.txt to yaml format.
> Update cadence-nand-controller.txt to cdns,hp-nfc.yaml in MAINTAINER file.
>=20
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

This seems okay to me, thanks.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Conor.

> ---
>=20
> Changes in v3:
> - Changed file name to cdns,hp-nfc.yaml to match with compatible.
> - Update description, fixed alignment, and used defines for interrupt
>   flag as per review comments in v2.
>=20
> Changes in v2:
> - Update name cadence-nand-controller.txt to cadence,nand.yaml in MAINTAI=
NER
>   file to resolve the warning.
>=20
>  .../bindings/mtd/cadence-nand-controller.txt  | 53 -------------
>  .../devicetree/bindings/mtd/cdns,hp-nfc.yaml  | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 76 insertions(+), 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-co=
ntroller.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controlle=
r.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> deleted file mode 100644
> index d2eada5044b2..000000000000
> --- a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* Cadence NAND controller
> -
> -Required properties:
> -  - compatible : "cdns,hp-nfc"
> -  - reg : Contains two entries, each of which is a tuple consisting of a
> -	  physical address and length. The first entry is the address and
> -	  length of the controller register set. The second entry is the
> -	  address and length of the Slave DMA data port.
> -  - reg-names: should contain "reg" and "sdma"
> -  - #address-cells: should be 1. The cell encodes the chip select connec=
tion.
> -  - #size-cells : should be 0.
> -  - interrupts : The interrupt number.
> -  - clocks: phandle of the controller core clock (nf_clk).
> -
> -Optional properties:
> -  - dmas: shall reference DMA channel associated to the NAND controller
> -  - cdns,board-delay-ps : Estimated Board delay. The value includes the =
total
> -    round trip delay for the signals and is used for deciding on values
> -    associated with data read capture. The example formula for SDR mode =
is
> -    the following:
> -    board delay =3D RE#PAD delay + PCB trace to device + PCB trace from =
device
> -    + DQ PAD delay
> -
> -Child nodes represent the available NAND chips.
> -
> -Required properties of NAND chips:
> -  - reg: shall contain the native Chip Select ids from 0 to max supporte=
d by
> -    the cadence nand flash controller
> -
> -See Documentation/devicetree/bindings/mtd/nand-controller.yaml for more =
details on
> -generic bindings.
> -
> -Example:
> -
> -nand_controller: nand-controller@60000000 {
> -	  compatible =3D "cdns,hp-nfc";
> -	  #address-cells =3D <1>;
> -	  #size-cells =3D <0>;
> -	  reg =3D <0x60000000 0x10000>, <0x80000000 0x10000>;
> -	  reg-names =3D "reg", "sdma";
> -	  clocks =3D <&nf_clk>;
> -	  cdns,board-delay-ps =3D <4830>;
> -	  interrupts =3D <2 0>;
> -	  nand@0 {
> -	      reg =3D <0>;
> -	      label =3D "nand-1";
> -	  };
> -	  nand@1 {
> -	      reg =3D <1>;
> -	      label =3D "nand-2";
> -	  };
> -
> -};
> diff --git a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml b/Doc=
umentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
> new file mode 100644
> index 000000000000..402930995bd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence NAND controller
> +
> +maintainers:
> +  - Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> +
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: cdns,hp-nfc
> +
> +  reg:
> +    items:
> +      - description: Controller register set
> +      - description: Slave DMA data port register set
> +
> +  reg-names:
> +    items:
> +      - const: reg
> +      - const: sdma
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  cdns,board-delay-ps:
> +    description: |
> +      Estimated Board delay. The value includes the total round trip
> +      delay for the signals and is used for deciding on values associated
> +      with data read capture. The example formula for SDR mode is the
> +      following.
> +      board delay =3D RE#PAD delay + PCB trace to device + PCB trace fro=
m device
> +      + DQ PAD delay
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    nand-controller@10b80000 {
> +        compatible =3D "cdns,hp-nfc";
> +        reg =3D <0x10b80000 0x10000>,
> +              <0x10840000 0x10000>;
> +        reg-names =3D "reg", "sdma";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&nf_clk>;
> +        cdns,board-delay-ps =3D <4830>;
> +
> +        nand@0 {
> +            reg =3D <0>;
> +        };
> +      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..226efb6352e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4474,7 +4474,7 @@ F:	drivers/media/platform/cadence/cdns-csi2*
>  CADENCE NAND DRIVER
>  L:	linux-mtd@lists.infradead.org
>  S:	Orphan
> -F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
> +F:	Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
>  F:	drivers/mtd/nand/raw/cadence-nand-controller.c
> =20
>  CADENCE USB3 DRD IP DRIVER
> --=20
> 2.25.1
>=20
>=20

--g6vD1SDSOcM33Sw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS5qggAKCRB4tDGHoIJi
0kz0AQDPCeD893BtaZFdntgoUBBt6C0gO2wm2euxJQpHmMEXZQD/SWQPfr2imldt
1I4esXa3ahT585MR1VQ3lYX9MdKElAg=
=lOU+
-----END PGP SIGNATURE-----

--g6vD1SDSOcM33Sw3--


--===============2065159257026419629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2065159257026419629==--

