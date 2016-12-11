Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGDqt-0003Y2-Lg
 for linux-mtd@lists.infradead.org; Sun, 11 Dec 2016 23:48:20 +0000
Received: by mail-vk0-x243.google.com with SMTP id l126so3428448vkh.0
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 15:47:59 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1481302167-28044-6-git-send-email-clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-6-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 10:47:37 +1100
Message-ID: <CACPK8XfdLCkFv-n4SDMojugWMZAAi0fTm_03_L3ggCejc8XQbQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mtd: spi-nor: add a label property to jedec,
 spi-nor
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
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

On Sat, Dec 10, 2016 at 3:49 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> This can be used to easily identify a chip on a system with multiple
> chips.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

This is very useful when writing userspace that wants to select the
mtd device that represents a specific flash chip.

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Do=
cumentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 2c91c03e7eb0..b7cd02a3ebe8 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -65,6 +65,7 @@ Optional properties:
>                     all chips and support for it can not be detected at r=
untime.
>                     Refer to your chips' datasheet to check if this is su=
pported
>                     by your chip.
> +- label : name to assign to mtd. If omitted, the label is the MTD device=
 name.
>
>  Example:
>
> @@ -75,4 +76,5 @@ Example:
>                 reg =3D <0>;
>                 spi-max-frequency =3D <40000000>;
>                 m25p,fast-read;
> +               label =3D "System-firmware";
>         };
> --
> 2.7.4
>
