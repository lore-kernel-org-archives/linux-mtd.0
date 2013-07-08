Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uw3DU-0000S1-1X
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2013 04:38:24 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "olof@lixom.net" <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org"
 <devicetree-discuss@lists.ozlabs.org>
Subject: RE: [PATCH v4 2/4] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Date: Mon, 8 Jul 2013 04:37:36 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E5014@DBDE04.ent.ti.com>
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
 <1372764757-29511-3-git-send-email-pekon@ti.com>
In-Reply-To: <1372764757-29511-3-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "arnd@arndb.de" <arnd@arndb.de>, "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> index 6a983c1..690070e 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> @@ -17,20 +17,42 @@ Required properties:
>=20
>  Optional properties:
>=20
> - - nand-bus-width: 		Set this numeric value to 16 if the hardware
> -				is wired that way. If not specified, a bus
> -				width of 8 is assumed.
> + - nand-bus-width: 		Determines data-width of the connected
> device
> +				x16 =3D "16"
> +				x8  =3D "8" (default)
>=20
> - - ti,nand-ecc-opt:		A string setting the ECC layout to use. One of:
>=20
> -		"sw"		Software method (default)
> -		"hw"		Hardware method
> -		"hw-romcode"	gpmc hamming mode method & romcode
> layout
> -		"bch4"		4-bit BCH ecc code
> -		"bch8"		8-bit BCH ecc code
> + - ti,nand-ecc-opt:		Determines the ECC scheme used by driver.
> +				It can be any of the following strings:
> +
> +	"hamming_code_sw"		1-bit Hamming ECC
> +					- ECC calculation in software
> +					- Error detection in software
> +
> +	"hamming_code_hw"		1-bit Hamming ECC
> +					- ECC calculation in hardware
> +					- Error detection in software
> +
> +	"hamming_code_hw_romcode"	1-bit Hamming ECC
> +					- ECC calculation in hardware
> +					- Error detection in software
> +					- ECC layout compatible to ROM code
> +
> +	"bch8_hw_code_detection_sw"	8-bit BCH ECC
> +					- ECC calculation in hardware
> +					- Error detection in software
> +					- depends on
> CONFIG_MTD_NAND_ECC_BCH
> +
> +	"bch8_code_hw"             	8-bit BCH ECC
> +					- ECC calculation in hardware
> +					- Error detection in hardware
> +					- depends on
> CONFIG_MTD_NAND_OMAP_BCH
> +					- requires <elm_id> to be specified
> +
> +
> + - elm_id:			Specifies elm device node. This is required to
> +				support some BCH ECC schemes mentioned
> above.
>=20
> - - elm_id:	Specifies elm device node. This is required to support BCH
> - 		error correction using ELM module.
>=20

[Pekon] Requesting DT maintainers to please review the above=20
changes in values for 'nand-ecc-opt' property. And please ACK | NAK it.

with regards, pekon
