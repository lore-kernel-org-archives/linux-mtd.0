Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXQUe-0002ZJ-Qj
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 08:35:25 +0000
Received: by ignm3 with SMTP id m3so28214736ign.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 01:35:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1426493782-3791-1-git-send-email-vndao@altera.com>
References: <1426493782-3791-1-git-send-email-vndao@altera.com>
Date: Mon, 16 Mar 2015 09:35:00 +0100
Message-ID: <CACna6rxx9TN1vko0fVPQgJPLZ3ZN17JjPki+q1Y3Ep9e0HppEA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v3] mtd:spi-nor: Add Altera Quad SPI Driver
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Viet Nga Dao <vndao@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Nga Chi <ngachi86@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 March 2015 at 09:16,  <vndao@altera.com> wrote:
> +static struct flash_device flash_devices[] =3D {
> +       FLASH_ID("epcq16-nonjedec",  2, 0x15),
> +       FLASH_ID("epcq32-nonjedec",  2, 0x16),
> +       FLASH_ID("epcq64-nonjedec",  2, 0x17),
> +       FLASH_ID("epcq128-nonjedec", 2, 0x18),
> +       FLASH_ID("epcq256-nonjedec", 2, 0x19),
> +       FLASH_ID("epcq512-nonjedec", 2, 0x20),

You could probably use EPCQ_OPCODE_ID


> +
> +       FLASH_ID("epcs16-nonjedec",  1, 0x14),
> +       FLASH_ID("epcs64-nonjedec",  1, 0x16),
> +       FLASH_ID("epcs128-nonjedec", 1, 0x18),

And EPCS_OPCODE_ID here.


> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index 43bb552..ad0c274 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -683,6 +683,17 @@ static const struct spi_device_id spi_nor_ids[] =3D =
{
>         { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_N=
OR_NO_FR) },
>         { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE | SPI_N=
OR_NO_FR) },
>         { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_N=
OR_NO_FR) },
> +
> +       /* Altera EPCQ/EPCS Flashes */
> +       { "epcq16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
> +       { "epcq32-nonjedec",  INFO(0, 0, 0x10000, 64,   0) },
> +       { "epcq64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
> +       { "epcq128-nonjedec", INFO(0, 0, 0x10000, 256,  0) },
> +       { "epcq256-nonjedec", INFO(0, 0, 0x10000, 512,  0) },
> +       { "epcq512-nonjedec", INFO(0, 0, 0x10000, 1024, 0) },
> +       { "epcs16-nonjedec",  INFO(0, 0, 0x10000, 32,   0) },
> +       { "epcs64-nonjedec",  INFO(0, 0, 0x10000, 128,  0) },
> +       { "epcs128-nonjedec", INFO(0, 0, 0x40000, 256,  0) },
>         { },
>  };

But mostly, I just wanted to say I like your integration with spi-nor.
Nice work :)

--=20
Rafa=C5=82
