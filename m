Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZxx0-0002cx-TJ
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 12:29:05 +0000
Date: Mon, 2 Jul 2018 14:28:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Richard
 Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v4 0/5] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Message-ID: <20180702142840.42801396@xps13>
In-Reply-To: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
References: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
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

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Sat, 23 Jun
2018 01:06:33 +0900:

> The ->setup_data_interface() hook needs to know the clock frequency.
> In fact, this IP needs three clocks, but the current driver does not
> represent it.  Thus, it is hard to understand what is the correct
> clock frequency.
> (at least, clock property is not described in the DT-binding at all.)
>=20
> This series adds more clocks based on the IP datasheet, and document
> it in the DT binding.
> In the new binding, three clocks are required: core clock, bus interface
> clock, ECC engine clock.
>=20
> 1/5 is a backport candidate to fix SOCFPGA.
>=20
>=20
> Masahiro Yamada (5):
>   mtd: rawnand: denali_dt: set clk_x_rate to 200 MHz unconditionally
>   mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
>   dt-binding: mtd: denali_dt: document clock property
>   mtd: rawnand: denali_dt: add more clocks based on IP datasheet
>   mtd: rawnand: denali: optimize timing parameters for data interface

Applied patches 2-5/5 to nand/next on top of v4-18.rc3 (to have the fix
1/5).

Thanks,
Miqu=C3=A8l
