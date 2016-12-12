Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGEFs-0004FL-ED
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 00:14:09 +0000
Received: by mail-ua0-x241.google.com with SMTP id 50so7032233uae.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 16:13:48 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1481302167-28044-5-git-send-email-clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-5-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 11:13:26 +1100
Message-ID: <CACPK8XfZi-nr7PEqqjao8q21crK=nVp1eSYytEX3_xKPO0SU_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: bindings for the Aspeed memory
 controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 10, 2016 at 3:49 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  .../devicetree/bindings/mtd/aspeed-smc.txt         | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Docum=
entation/devicetree/bindings/mtd/aspeed-smc.txt
> new file mode 100644
> index 000000000000..e2c88cea38f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
> @@ -0,0 +1,51 @@
> +* Aspeed Firmware Memory controller
> +* Aspeed SPI Flash Memory Controller
> +
> +The Firmware Memory Controller in the Aspeed AST2500 SoC supports
> +three chip selects, two of which are always of SPI type and the third
> +can be SPI or NOR type flash, but the driver only supports SPI.

As the bindings are a description of the hardware and not the driver,
we might want to reword this. Perhaps "these bindings only describe
SPI"?

Cheers,

Joel

> +
> +The two SPI flash memory controllers in the AST2500 each support two
> +chip selects.
> +
> +Required properties:
> +  - compatible : Should be one of
> +       "aspeed,ast2400-fmc" for the AST2400 Firmware Memory Controller
> +       "aspeed,ast2400-spi" for the AST2400 SPI Flash memory Controller
> +       "aspeed,ast2500-fmc" for the AST2500 Firmware Memory Controller
> +       "aspeed,ast2500-spi" for the AST2500 SPI flash memory controllers
> +
> +  - reg : the first contains the control register location and length,
> +          the second contains the memory window mapping address and leng=
th
> +  - #address-cells : must be 1 corresponding to chip select child bindin=
g
> +  - #size-cells : must be 0 corresponding to chip select child binding
> +
> +Optional properties:
> +  - interrupts : Should contain the interrupt for the dma device if an
> +    FMC
> +
> +The child nodes are the SPI flash modules which must have a compatible
> +property as specified in bindings/mtd/jedec,spi-nor.txt
> +
> +Optionally, the child node can contain properties for SPI mode (may be
> +ignored):
> +  - spi-max-frequency - max frequency of spi bus
> +
> +
> +Example:
> +fmc: fmc@1e620000 {
> +       compatible =3D "aspeed,ast2500-fmc";
> +       reg =3D < 0x1e620000 0x94
> +               0x20000000 0x02000000 >;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       interrupts =3D <19>;
> +       flash@0 {
> +               reg =3D < 0 >;
> +               compatible =3D "jedec,spi-nor";
> +               /* spi-max-frequency =3D <>; */
> +               /* m25p,fast-read; */
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +       };
> +};
> --
> 2.7.4
>
