Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKWDM-0000ie-ST
 for linux-mtd@lists.infradead.org; Thu, 30 Nov 2017 21:17:50 +0000
Date: Thu, 30 Nov 2017 22:17:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: nand: fix interpretation of NAND_CMD_NONE in
 nand_command[_lp]()
Message-ID: <20171130221727.71f8ad55@bbrezillon>
In-Reply-To: <20171108160027.18718-1-miquel.raynal@free-electrons.com>
References: <20171108160027.18718-1-miquel.raynal@free-electrons.com>
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

On Wed,  8 Nov 2017 17:00:27 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Some drivers (like nand_hynix.c) call ->cmdfunc() with NAND_CMD_NONE
> and a column address and expect the controller to only send address
> cycles. Right now, the default ->cmdfunc() implementations provided by
> the core do not filter out the command cycle in this case and forwards
> the request to the controller driver through the ->cmd_ctrl() method.
> The thing is, NAND controller drivers can get this wrong and send a
> command cycle with a NAND_CMD_NONE opcode and since NAND_CMD_NONE is
> -1, and the command field is usually casted to an u8, we end up sending
> the 0xFF command which is actually a RESET operation.
>=20
> Add conditions in nand_command[_lp]() functions to sending the initial
> command cycle when command =3D=3D NAND_CMD_NONE.

Applied.

Thanks,

Boris

>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>=20
> Hello,
>=20
> Changes since v1:
>   - Commit message rewording.
>   - Added a case for NAND_CMD_NONE in the switch statement of each
>     function to avoid unnecesary wait.
>=20
> Thanks,
> Miqu=C3=A8l
>=20
>=20
>  drivers/mtd/nand/nand_base.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e48bf8260f54..074b67571bfc 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -710,7 +710,8 @@ static void nand_command(struct mtd_info *mtd, unsign=
ed int command,
>  		chip->cmd_ctrl(mtd, readcmd, ctrl);
>  		ctrl &=3D ~NAND_CTRL_CHANGE;
>  	}
> -	chip->cmd_ctrl(mtd, command, ctrl);
> +	if (command !=3D NAND_CMD_NONE)
> +		chip->cmd_ctrl(mtd, command, ctrl);
> =20
>  	/* Address cycle, when necessary */
>  	ctrl =3D NAND_CTRL_ALE | NAND_CTRL_CHANGE;
> @@ -738,6 +739,7 @@ static void nand_command(struct mtd_info *mtd, unsign=
ed int command,
>  	 */
>  	switch (command) {
> =20
> +	case NAND_CMD_NONE:
>  	case NAND_CMD_PAGEPROG:
>  	case NAND_CMD_ERASE1:
>  	case NAND_CMD_ERASE2:
> @@ -831,7 +833,9 @@ static void nand_command_lp(struct mtd_info *mtd, uns=
igned int command,
>  	}
> =20
>  	/* Command latch cycle */
> -	chip->cmd_ctrl(mtd, command, NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> +	if (command !=3D NAND_CMD_NONE)
> +		chip->cmd_ctrl(mtd, command,
> +			       NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
> =20
>  	if (column !=3D -1 || page_addr !=3D -1) {
>  		int ctrl =3D NAND_CTRL_CHANGE | NAND_NCE | NAND_ALE;
> @@ -866,6 +870,7 @@ static void nand_command_lp(struct mtd_info *mtd, uns=
igned int command,
>  	 */
>  	switch (command) {
> =20
> +	case NAND_CMD_NONE:
>  	case NAND_CMD_CACHEDPROG:
>  	case NAND_CMD_PAGEPROG:
>  	case NAND_CMD_ERASE1:
