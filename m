Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQwWt-00042z-4a
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 15:08:48 +0000
Date: Thu, 7 Jun 2018 17:08:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Mark Brown
 <broonie@kernel.org>, linux-spi@vger.kernel.org, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>, Vignesh R <vigneshr@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 2/2] mtd: m25p80: Use the SPI mem direct API to
 possibly improve performances
Message-ID: <20180607170824.6c32bfc3@xps13>
In-Reply-To: <20180601143603.4047-3-boris.brezillon@bootlin.com>
References: <20180601143603.4047-1-boris.brezillon@bootlin.com>
 <20180601143603.4047-3-boris.brezillon@bootlin.com>
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

Hi Boris,

On Fri,  1 Jun 2018 16:36:03 +0200, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Make use of the SPI mem direct mapping API.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/devices/m25p80.c | 149 ++++++++++++++++++++++++++-----------=
------
>  1 file changed, 89 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 1dd5f0420b5a..285fc94118ae 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -31,6 +31,10 @@
>  struct m25p {
>  	struct spi_mem		*spimem;
>  	struct spi_nor		spi_nor;
> +	struct {
> +		struct spi_mem_dirmap_desc *write;
> +		struct spi_mem_dirmap_desc *read;
> +	} dirmap;
>  };

While reading this patch I was a bit confused with this naming. You
refer these descriptors as 'flash->dirmap->read/write' which is
confusing as this is not a function but a descriptor. Passing such
variable to a function called spi_meme_dirmap_read/write() is also
confusing IMHO (see below).

Would you mind renaming them with something like "read/write_desc"?

[...]

> @@ -107,39 +81,66 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff=
_t from, size_t len,
>  			   u_char *buf)
>  {
>  	struct m25p *flash =3D nor->priv;
> -	struct spi_mem_op op =3D
> -			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> -				   SPI_MEM_OP_ADDR(nor->addr_width, from, 1),
> -				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> -				   SPI_MEM_OP_DATA_IN(len, buf, 1));
> -	size_t remaining =3D len;
> -	int ret;
> +
> +	return spi_mem_dirmap_read(flash->dirmap.read, from, len, buf);

                                   ^
The place where I had troubles understanding because of the naming.


Thanks,
Miqu=C3=A8l
