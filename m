Received: from mail-qw0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsEOJ-0005MZ-ER
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 14:09:00 +0000
Received: by qadc14 with SMTP id c14so149837qad.15
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 06:08:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1327997163-9354-1-git-send-email-computersforpeace@gmail.com>
References: <1327997163-9354-1-git-send-email-computersforpeace@gmail.com>
Date: Tue, 31 Jan 2012 09:08:57 -0500
Message-ID: <CAGiDA6Jw52CGM6KT5EANaGb8xxQQEH0Lf5ms24NGZLeMtqgjGA@mail.gmail.com>
Subject: Re: [RFC/PATCH] mtd: m25p80: set writebufsize
From: "Shawn J. Goff" <shawn7400@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 agust@denx.de, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, I ran into this problem myself and fixed it in a similar way.

Even after adding this fix, it turned out that I still couldn't boot
from a UBI volume because SPI comes up after UBI, so the UBI tries to
attach, but there is no MTD device to attach to.

On Tue, Jan 31, 2012 at 3:06 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Using UBI on m25p80 can give messages like:
>
> =A0 =A0UBI error: io_init: bad write buffer size 0 for 1 min. I/O unit
>
> We need to initialize writebufsize; I think "page_size" is the correct
> "bufsize", although I'm not sure. Comments?
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> =A0drivers/mtd/devices/m25p80.c | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index f83e4d0..8808da9 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -932,6 +932,7 @@ static int __devinit m25p_probe(struct spi_device *sp=
i)
> =A0 =A0 =A0 =A0ppdata.of_node =3D spi->dev.of_node;
> =A0 =A0 =A0 =A0flash->mtd.dev.parent =3D &spi->dev;
> =A0 =A0 =A0 =A0flash->page_size =3D info->page_size;
> + =A0 =A0 =A0 flash->mtd.writebufsize =3D flash->page_size;
>
> =A0 =A0 =A0 =A0if (info->addr_width)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0flash->addr_width =3D info->addr_width;
> --
> 1.7.5.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
