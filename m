Received: from qw-out-1920.google.com ([74.125.92.150])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWl2j-0001oq-2s
	for linux-mtd@lists.infradead.org; Fri, 31 Jul 2009 05:52:41 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1302741qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 22:52:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090730172310.719ad329@ariane.spranger.biz>
References: <20090730172310.719ad329@ariane.spranger.biz>
From: vimal singh <vimal.newwork@gmail.com>
Date: Fri, 31 Jul 2009 11:22:07 +0530
Message-ID: <ce9ab5790907302252w640ce9dh5f99736555d83cd6@mail.gmail.com>
Subject: Re: PATCH] MTD/maps: correct cleanup in error case
To: Benedikt Spranger <b.spranger@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, Stoyan Gaydarov <sgayda2@uiuc.edu>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Below patch submitted to fix this along with making sure 'mtd_list' is
not being freed if it has not been allocated:

http://lists.infradead.org/pipermail/linux-mtd/2009-July/026696.html

-vimal


On Thu, Jul 30, 2009 at 8:53 PM, Benedikt
Spranger<b.spranger@linutronix.de> wrote:
> From: Benedikt Spranger <b.spranger@linutronix.de>
> Date: Thu, 30 Jul 2009 17:03:51 +0200
> Subject: [PATCH] MTD/maps: correct cleanup in error case
>
> fix a copy and paste error introduced by commit 143070e
> (mtd: physmap_of: Add multiple regions and concatenation support).
>
> info is needed (via drvdata) and freed in of_flash_remove(), therefore
> drvdata should be set right after allocation.
>
> Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
> ---
> =A0drivers/mtd/maps/physmap_of.c | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.=
c
> index 39d357b..32b4a5a 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -214,12 +214,12 @@ static int __devinit of_flash_probe(struct of_devic=
e *dev,
> =A0 =A0 =A0 =A0if (!info)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_out;
>
> + =A0 =A0 =A0 dev_set_drvdata(&dev->dev, info);
> +
> =A0 =A0 =A0 =A0mtd_list =3D kzalloc(sizeof(struct mtd_info) * count, GFP_=
KERNEL);
> - =A0 =A0 =A0 if (!info)
> + =A0 =A0 =A0 if (!mtd_list)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_out;
>
> - =A0 =A0 =A0 dev_set_drvdata(&dev->dev, info);
> -
> =A0 =A0 =A0 =A0for (i =3D 0; i < count; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -ENXIO;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (of_address_to_resource(dp, i, &res)) {
> --
> 1.6.3.3
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
