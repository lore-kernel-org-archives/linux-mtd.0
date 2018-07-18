Date: Wed, 18 Jul 2018 10:03:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nuc900_nand: mark expected switch fall-through
Message-ID: <20180718100309.49c5452a@xps13>
In-Reply-To: <20180710132902.GA13541@embeddedor.com>
References: <20180710132902.GA13541@embeddedor.com>
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

Hi Gustavo,

Prefix should be "mtd: rawnand: nuc900:"

"Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote on Tue, 10 Jul
2018 08:29:02 -0500:

> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
>=20
> Addresses-Coverity-ID: 1471717 ("Missing break in switch")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/nand/raw/nuc900_nand.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/raw/nuc900_nand.c b/drivers/mtd/nand/raw/nu=
c900_nand.c
> index af5b32c9..53a9f6c 100644
> --- a/drivers/mtd/nand/raw/nuc900_nand.c
> +++ b/drivers/mtd/nand/raw/nuc900_nand.c
> @@ -191,8 +191,9 @@ static void nuc900_nand_command_lp(struct mtd_info *m=
td, unsigned int command,
>  		return;
> =20
>  	case NAND_CMD_READ0:
> -
>  		write_cmd_reg(nand, NAND_CMD_READSTART);
> +		/* fall through */

Have you checked this is actually the right thing to do?

Thanks,
Miqu=C3=A8l
