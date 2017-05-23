Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dD41x-000602-OA
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 07:14:59 +0000
Date: Tue, 23 May 2017 09:14:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/5] mtd: mchp23k256: Add support for mchp23lcv1024
Message-ID: <20170523091423.1a0b84d9@bbrezillon>
In-Reply-To: <20170523004317.16908-6-chris.packham@alliedtelesis.co.nz>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
 <20170523004317.16908-6-chris.packham@alliedtelesis.co.nz>
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

Le Tue, 23 May 2017 12:43:17 +1200,
Chris Packham <chris.packham@alliedtelesis.co.nz> a =C3=A9crit :

> The mchp23lcv1024 is software compatible with the mchp23k256, the
> only difference (from a software point of view) is the size. There
> is no way to detect the size so we must be told via a Device Tree.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - fix formatting in switch statement
> - add support for 24-bit addressing
> Changes in v3:
> - None
>=20
>  .../bindings/mtd/microchip,mchp23k256.txt          |  2 +-
>  drivers/mtd/devices/mchp23k256.c                   | 53 ++++++++++++++++=
++----
>  2 files changed, 44 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.t=
xt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> index 25e5ad38b0f0..7328eb92a03c 100644
> --- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> @@ -3,7 +3,7 @@
>  Required properties:
>  - #address-cells, #size-cells : Must be present if the device has sub-no=
des
>    representing partitions.
> -- compatible : Must be "microchip,mchp23k256"
> +- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp2=
3lcv1024"
>  - reg : Chip-Select number
>  - spi-max-frequency : Maximum frequency of the SPI bus the chip can oper=
ate at
> =20
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp2=
3k256.c
> index 3e5feb454644..72ecf374a06a 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -21,10 +21,14 @@
>  #include <linux/spi/spi.h>
>  #include <linux/of_device.h>
> =20
> +#define MAX_CMD_SIZE		4
> +enum chips { mchp23k256, mchp23lcv1024 };
> +
>  struct mchp23k256_flash {
>  	struct spi_device	*spi;
>  	struct mutex		lock;
>  	struct mtd_info		mtd;
> +	u8			addr_width;
>  };

How about creating a struct mchp23_caps or mchp23_specs struct
containing the SRAM specs.

struct mchp23_caps {
	u8 addr_width;
	unsigned int size;
}

and then

struct mchp23k256_flash {
	...
	const struct mchp32_cap	*caps;
};

This way you can get rid of the enum and add new fields to the caps
struct if needed.

BTW, it's really weird to have the _flash extension in the struct name,
while we're actually dealing with SRAMs.

> =20
>  #define MCHP23K256_CMD_WRITE_STATUS	0x01
> @@ -34,22 +38,35 @@ struct mchp23k256_flash {
> =20
>  #define to_mchp23k256_flash(x) container_of(x, struct mchp23k256_flash, =
mtd)
> =20
> +static void mchp23k256_addr2cmd(struct mchp23k256_flash *flash,
> +				unsigned int addr, u8 *cmd)
> +{
> +	/* cmd[0] has opcode */
> +	cmd[1] =3D addr >> (flash->addr_width * 8 -  8);
> +	cmd[2] =3D addr >> (flash->addr_width * 8 - 16);
> +	cmd[3] =3D addr >> (flash->addr_width * 8 - 24);

or

	int i;

	/*
	 * Address is sent in big endian (MSB first) and we skip
	 * the first entry of the cmd array which contains the cmd
	 * opcode.
	 */
	for (i =3D flash->caps->addr_width; i--, addr >>=3D 8; i > 0)
		cmd[i] =3D addr;

> +}
> +
> +static int mchp23k256_cmdsz(struct mchp23k256_flash *flash)
> +{
> +	return 1 + flash->addr_width;
> +}
> +
>  static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
>  			    size_t *retlen, const unsigned char *buf)
>  {
>  	struct mchp23k256_flash *flash =3D to_mchp23k256_flash(mtd);
>  	struct spi_transfer transfer[2] =3D {};
>  	struct spi_message message;
> -	unsigned char command[3];
> +	unsigned char command[MAX_CMD_SIZE];
> =20
>  	spi_message_init(&message);
> =20
>  	command[0] =3D MCHP23K256_CMD_WRITE;
> -	command[1] =3D to >> 8;
> -	command[2] =3D to;
> +	mchp23k256_addr2cmd(flash, to, command);
> =20
>  	transfer[0].tx_buf =3D command;
> -	transfer[0].len =3D sizeof(command);
> +	transfer[0].len =3D mchp23k256_cmdsz(flash);
>  	spi_message_add_tail(&transfer[0], &message);
> =20
>  	transfer[1].tx_buf =3D buf;
> @@ -73,17 +90,16 @@ static int mchp23k256_read(struct mtd_info *mtd, loff=
_t from, size_t len,
>  	struct mchp23k256_flash *flash =3D to_mchp23k256_flash(mtd);
>  	struct spi_transfer transfer[2] =3D {};
>  	struct spi_message message;
> -	unsigned char command[3];
> +	unsigned char command[MAX_CMD_SIZE];
> =20
>  	spi_message_init(&message);
> =20
>  	memset(&transfer, 0, sizeof(transfer));
>  	command[0] =3D MCHP23K256_CMD_READ;
> -	command[1] =3D from >> 8;
> -	command[2] =3D from;
> +	mchp23k256_addr2cmd(flash, from, command);
> =20
>  	transfer[0].tx_buf =3D command;
> -	transfer[0].len =3D sizeof(command);
> +	transfer[0].len =3D mchp23k256_cmdsz(flash);
>  	spi_message_add_tail(&transfer[0], &message);
> =20
>  	transfer[1].rx_buf =3D buf;

static const struct mchp23_caps mchp23k256_caps =3D {
	.size =3D SZ_32K,
	.addr_width =3D 2;
};

static const struct mchp23_caps mchp23lcv1024_caps =3D {
	.size =3D SZ_128K,
	.addr_width =3D 3;
};

> @@ -128,6 +144,7 @@ static int mchp23k256_probe(struct spi_device *spi)
>  	struct mchp23k256_flash *flash;
>  	struct flash_platform_data *data;
>  	int err;
> +	enum chips chip;
> =20
>  	flash =3D devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
>  	if (!flash)
> @@ -143,15 +160,30 @@ static int mchp23k256_probe(struct spi_device *spi)
> =20
>  	data =3D dev_get_platdata(&spi->dev);
> =20
> +	if (spi->dev.of_node)
> +		chip =3D (enum chips)of_device_get_match_data(&spi->dev);
> +	else
> +		chip =3D mchp23k256;

	flash->caps =3D of_device_get_match_data(&spi->dev);
	if (!flash->caps)
		flash->caps =3D mchp23k256_caps;

> +
>  	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
>  	flash->mtd.dev.parent	=3D &spi->dev;
>  	flash->mtd.type		=3D MTD_RAM;
>  	flash->mtd.flags	=3D MTD_CAP_RAM;
>  	flash->mtd.writesize	=3D 1;
> -	flash->mtd.size		=3D SZ_32K;
>  	flash->mtd._read	=3D mchp23k256_read;
>  	flash->mtd._write	=3D mchp23k256_write;
> =20
> +	switch (chip) {
> +	case mchp23lcv1024:
> +		flash->mtd.size		=3D SZ_128K;
> +		flash->addr_width	=3D 3;
> +		break;
> +	default:
> +		flash->mtd.size		=3D SZ_32K;
> +		flash->addr_width	=3D 2;
> +		break;
> +	}
> +
>  	err =3D mtd_device_register(&flash->mtd, data ? data->parts : NULL,
>  				  data ? data->nr_parts : 0);
>  	if (err)
> @@ -168,7 +200,8 @@ static int mchp23k256_remove(struct spi_device *spi)
>  }
> =20
>  static const struct of_device_id mchp23k256_of_table[] =3D {
> -	{ .compatible =3D "microchip,mchp23k256" },
> +	{ .compatible =3D "microchip,mchp23k256", .data =3D (void *)mchp23k256 =
},
> +	{ .compatible =3D "microchip,mchp23lcv1024", .data =3D (void *)mchp23lc=
v1024 },

	{
		.compatible =3D "microchip,mchp23k256",
		.data =3D &mchp23k256_caps,
	},
	{
		.compatible =3D "microchip,mchp23lcv1024",
		.data =3D &mchp23lcv1024_caps,
	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
