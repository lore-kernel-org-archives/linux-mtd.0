Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xx1OI-0003nw-9z
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 22:30:22 +0000
Received: by mail-ie0-f171.google.com with SMTP id rl12so1604577iec.16
 for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2014 14:30:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1417808133-20719-3-git-send-email-grmoore@opensource.altera.com>
References: <1417808133-20719-1-git-send-email-grmoore@opensource.altera.com>
 <1417808133-20719-3-git-send-email-grmoore@opensource.altera.com>
Date: Fri, 5 Dec 2014 23:30:00 +0100
Message-ID: <CACna6ry0WBwcqH74sub-C=e0oGsPEoqXZ4O7uAwGcJC9Zc2zJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Graham Moore <grmoore@opensource.altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 December 2014 at 20:35, Graham Moore <grmoore@opensource.altera.com> w=
rote:
> +               if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
> +                       goto probe_failed;
> +
> +               ret =3D spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
> +               if (ret)
> +                       goto probe_failed;
> (...)
> +
> +static struct of_device_id cqspi_dt_ids[] =3D {
> +       {.compatible =3D "cdns,qspi-nor",},
> +       { /* end of table */ }
> +};

AFAIU of_modalias_node will give you "qspi-nor" string. Second
argument passed to the spi_nor_scan is a chip name you expect on the
device. Of course passing "qspi-nor" (if I'm right about
of_modalias_node) doesn't make any sense.

Since my commit
mtd: spi-nor: allow NULL as chip name and try to auto detect it
second argument is optional.

Can you simply pass NULL instead of modalias?

--=20
Rafa=C5=82
