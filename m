Date: Thu, 19 Oct 2017 09:18:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Daniel Mack <daniel@zonque.org>, David
 Woodhouse <dwmw2@infradead.org>, devel@driverdev.osuosl.org,
 devicetree@vger.kernel.org, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Gregory Clement
 <gregory.clement@free-electrons.com>, Han Xu <han.xu@nxp.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jason Cooper <jason@lakedaemon.net>,
 Josh Wu <rainyfeeling@outlook.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org, Marc
 Gonzalez <marc_gonzalez@sigmadesigns.com>, Marek Vasut
 <marek.vasut@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Masahiro
 Yamada <yamada.masahiro@socionext.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Richard Weinberger
 <richard@nod.at>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring
 <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner
 <stefan@agner.ch>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Wenyou Yang <wenyou.yang@atmel.com>, Will Deacon
 <will.deacon@arm.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Igor Grinberg
 <grinberg@compulab.co.il>, Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz
 <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Hanna Hawa
 <hannah@marvell.com>
Subject: Re: [RFC 06/12] mtd: nand: add reworked Marvell NAND controller driver
Message-ID: <20171019091810.13f54c78@bbrezillon>
In-Reply-To: <20171018143629.29302-7-miquel.raynal@free-electrons.com>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171018143629.29302-7-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Oct 2017 16:36:23 +0200
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:


> +
> +enum marvell_nfc_variant {
> +	MARVELL_NFC_VARIANT_PXA3XX,
> +	MARVELL_NFC_VARIANT_ARMADA370,
> +	MARVELL_NFC_VARIANT_ARMADA_8K,
> +};
> +
> +/*
> + * NAND controller capabilities for distinction between compatible strings
> + *
> + * @variant:		Board type
> + * @max_cs_nb:		Number of Chip Select lines available
> + * @max_rb_nb:		Number of Ready/Busy lines available
> + * @legacy_of_bindings	Indicates if DT parsing must be done using the old
> + *			fashion way
> + */
> +struct marvell_nfc_caps {
> +	enum marvell_nfc_variant variant;

Do you really need this variant field. It seems you're only using it to
detect if you should MUX the NAND pins using the Special Function
registers on armada8k. Maybe you should just have:

	bool need_system_controller;

and set it to true for the "armada8k" compatible.

> +	unsigned int max_cs_nb;
> +	unsigned int max_rb_nb;
> +	bool legacy_of_bindings;
> +};
> +
