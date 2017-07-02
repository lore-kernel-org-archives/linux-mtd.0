Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dRg3g-00084Q-3Z
 for linux-mtd@lists.infradead.org; Sun, 02 Jul 2017 14:41:10 +0000
Date: Sun, 2 Jul 2017 16:40:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jean-Louis Thekekara <jeanlouis.thekekara@parrot.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: remove hard-coded NAND ids length
Message-ID: <20170702164042.08534135@bbrezillon>
In-Reply-To: <20170629170830.8084-1-jeanlouis.thekekara@parrot.com>
References: <20170629170830.8084-1-jeanlouis.thekekara@parrot.com>
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

Le Thu, 29 Jun 2017 19:08:30 +0200,
Jean-Louis Thekekara <jeanlouis.thekekara@parrot.com> a =C3=A9crit :

> This commit removes hard-coded '8' used for looping into
> struct nand_chip.id.data array.
>=20
> NAND_MAX_ID_LEN has been introduced by Artem Bityutskiy in
> 53552d22bfe1f for defining ids length in nand_flash_ids[] list.
>=20
> This commit unifies ids length in nand base driver.
>=20
> Signed-off-by: Jean-Louis Thekekara <jeanlouis.thekekara@parrot.com>

LGTM. I'll apply to nand/next once 4.13-rc1 is out.

Just a note for your future MTD/NAND contributions, can you please Cc
NAND/MTD maintainers (you can get the list with
scripts/get_maintainers.pl ;-)).

> ---
>  drivers/mtd/nand/nand_base.c |  4 ++--
>  include/linux/mtd/nand.h     | 10 +++++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 85edac9b2bb5..66db2ced87ad 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4056,7 +4056,7 @@ static int nand_detect(struct nand_chip *chip, stru=
ct nand_flash_dev *type)
>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> =20
>  	/* Read entire ID string */
> -	for (i =3D 0; i < 8; i++)
> +	for (i =3D 0; i < ARRAY_SIZE(chip->id.data); i++)
>  		id_data[i] =3D chip->read_byte(mtd);
> =20
>  	if (id_data[0] !=3D maf_id || id_data[1] !=3D dev_id) {
> @@ -4065,7 +4065,7 @@ static int nand_detect(struct nand_chip *chip, stru=
ct nand_flash_dev *type)
>  		return -ENODEV;
>  	}
> =20
> -	chip->id.len =3D nand_id_len(id_data, 8);
> +	chip->id.len =3D nand_id_len(id_data, ARRAY_SIZE(chip->id.data));
> =20
>  	/* Try to identify manufacturer */
>  	manufacturer =3D nand_get_manufacturer(maf_id);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index dc8fbc033442..c3c1a32a5ade 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -449,14 +449,16 @@ struct nand_jedec_params {
>  	__le16 crc;
>  } __packed;
> =20
> +/* The maximum expected count of bytes in the NAND ID sequence */
> +#define NAND_MAX_ID_LEN 8
> +
>  /**
>   * struct nand_id - NAND id structure
> - * @data: buffer containing the id bytes. Currently 8 bytes large, but c=
an
> - *	  be extended if required.
> + * @data: buffer containing the id bytes.
>   * @len: ID length.
>   */
>  struct nand_id {
> -	u8 data[8];
> +	u8 data[NAND_MAX_ID_LEN];
>  	int len;
>  };
> =20
> @@ -1028,8 +1030,6 @@ static inline void *nand_get_manufacturer_data(stru=
ct nand_chip *chip)
>  #define NAND_MFR_ATO		0x9b
>  #define NAND_MFR_WINBOND	0xef
> =20
> -/* The maximum expected count of bytes in the NAND ID sequence */
> -#define NAND_MAX_ID_LEN 8
> =20
>  /*
>   * A helper for defining older NAND chips where the second ID byte fully
