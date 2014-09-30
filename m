MIME-Version: 1.0
In-Reply-To: <1412043317.9388.84.camel@decadent.org.uk>
References: <1412043222.9388.81.camel@decadent.org.uk>
 <1412043317.9388.84.camel@decadent.org.uk>
Date: Tue, 30 Sep 2014 07:14:15 +0200
Message-ID: <CACna6ryNp7+4y7oSs60atDZhUwFhiAyV4Oq5ELi1gyen45zhVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] spi-nor: Make spi_nor_scan() take a chip type
 name, not an spi_device_id
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 September 2014 04:15, Ben Hutchings <ben@decadent.org.uk> wrote:
> @@ -236,16 +236,13 @@ static int m25p_probe(struct spi_device *spi)
>          * If that's the case, respect "type" and ignore a "name".
>          */
>         if (data && data->type)
> -               id = spi_nor_match_id(data->type);
> +               name = data->type;
>
>         /* If we didn't get name from platform, simply use "modalias". */
> -       if (!id) {
> -               id = spi_nor_match_id(spi_get_device_id(spi)->name);
> -               if (WARN_ON(!id))
> -                       return -ENODEV;
> -       }
> +       if (!name)
> +               name = spi_get_device_id(spi)->name;

Huh? Iterating the whole id_table, checking the entries (looking for
one with name equal to the spi->modalias) and then... getting that
name?

Did it hurt to use the patch I've sent
mtd: m25p80: get rid of spi_get_device_id
https://patchwork.ozlabs.org/patch/394328/
