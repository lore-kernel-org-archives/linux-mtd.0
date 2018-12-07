Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVLDc-0005xJ-Mi
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 18:51:23 +0000
Date: Fri, 7 Dec 2018 19:51:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mathieu Malaterre <malat@debian.org>
Cc: Paul Burton <paul.burton@mips.com>, trivial@kernel.org,
 kernel-janitors@vger.kernel.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: jz4780: annotate implicit fall throughs
Message-ID: <20181207195107.1b4959e1@xps13>
In-Reply-To: <20181204201057.30733-1-malat@debian.org>
References: <20181203212214.8862-1-malat@debian.org>
 <20181204201057.30733-1-malat@debian.org>
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

Hi Mathieu,

Mathieu Malaterre <malat@debian.org> wrote on Tue,  4 Dec 2018 21:10:57
+0100:

> There is a plan to build the kernel with -Wimplicit-fallthrough and
> these places in the code produced warnings. Fix them up.
>=20
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
> v2: fix subject prefix non sense
>=20
>  drivers/mtd/nand/raw/jz4780_bch.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4=
780_bch.c
> index 731c6051d91e..7201827809e9 100644
> --- a/drivers/mtd/nand/raw/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/jz4780_bch.c
> @@ -136,8 +136,10 @@ static void jz4780_bch_read_parity(struct jz4780_bch=
 *bch, void *buf,
>  	switch (size8) {
>  	case 3:
>  		dest8[2] =3D (val >> 16) & 0xff;
> +		/* fall through */
>  	case 2:
>  		dest8[1] =3D (val >> 8) & 0xff;
> +		/* fall through */
>  	case 1:
>  		dest8[0] =3D val & 0xff;
>  		break;

Applied to nand/next.


Thanks,
Miqu=C3=A8l
