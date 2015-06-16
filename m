Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4kYQ-0005S2-3p
 for linux-mtd@lists.infradead.org; Tue, 16 Jun 2015 06:41:02 +0000
Received: by iecrd14 with SMTP id rd14so6854372iec.3
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jun 2015 23:40:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1434434789-25915-1-git-send-email-antonynpavlov@gmail.com>
References: <1434434789-25915-1-git-send-email-antonynpavlov@gmail.com>
Date: Tue, 16 Jun 2015 08:40:40 +0200
Message-ID: <CACna6rwTMFo9mE-umGhnKEQntoSVzymQZUaXMG40cunUJ-PKXg@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: spi-nor: add Spansion S25FL204K support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Antony Pavlov <antonynpavlov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 June 2015 at 08:06, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> Spansion S25FL204K is a 4-Mbit 3.0V Serial Flash Memory
> with Uniform 4 kB Sectors.
>
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index 14a5d23..274083c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -614,6 +614,7 @@ static const struct spi_device_id spi_nor_ids[] =3D {
>         { "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) =
},
>         { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) =
},
>         { "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, 0) },
> +       { "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K) =
},
>
>         /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_W=
RITE) },

Change looks fine, I just noticed it's not based on the latest code from:
http://git.infradead.org/l2-mtd.git
(the patch won't apply).

Depending on the maintainer's time you may be asked to rebase your
patch (or just do it yourself if you have a moment).

Thanks for the patch!

--=20
Rafa=C5=82
