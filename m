Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVAsW-0007rf-Fe
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 07:48:58 +0000
Date: Fri, 7 Dec 2018 08:48:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Gregory Clement
 <gregory.clement@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: fix spelling mistake in kernel doc
Message-ID: <20181207084820.3175e8e2@xps13>
In-Reply-To: <20181122155859.627-1-miquel.raynal@bootlin.com>
References: <20181122155859.627-1-miquel.raynal@bootlin.com>
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


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 22 Nov 2018
16:58:59 +0100:

> Correct the spelling mistake 'Regiters' -> 'Registers'.
>=20
> Fixes: 961ba15c48dd ("mtd: rawnand: marvell: Fix clock resource by adding=
 a register clock")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c
> index 650f2b490a05..ce1212dd0122 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -378,7 +378,7 @@ struct marvell_nfc_caps {
>   * @dev:		Parent device (used to print error messages)
>   * @regs:		NAND controller registers
>   * @core_clk:		Core clock
> - * @reg_clk:		Regiters clock
> + * @reg_clk:		Registers clock
>   * @complete:		Completion object to wait for NAND controller events
>   * @assigned_cs:	Bitmask describing already assigned CS lines
>   * @chips:		List containing all the NAND chips attached to

Applied on nand/next.


Miqu=C3=A8l
