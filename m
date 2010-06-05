MIME-Version: 1.0
In-Reply-To: <4C09F15E.9020408@gmail.com>
References: <4C09F15E.9020408@gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Sat, 5 Jun 2010 15:14:21 +0800
Message-ID: <AANLkTinLfGD-x-861sFK9r2zW5aEZvyXIB4PFKJl8NDZ@mail.gmail.com>
Subject: Re: [PATCH 1/3] MTD/pxa: patch for error return value method of
	pxa2xx-flash.c
To: Wan ZongShun <mcuos.com@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/6/5 Wan ZongShun <mcuos.com@gmail.com>:
> This patch is to re-implement the 'pxa2xx-flash.c' error return value met=
hod
> of probe() and remove() function,the old return way can arouse the 'info'=
 memory
> leak risk.
>
> Signed-off-by :Wan ZongShun <mcuos.com@gmail.com>
>
> ---
> =C2=A0drivers/mtd/maps/pxa2xx-flash.c | =C2=A0 47 +++++++++++++++++++++++=
+++++----------
> =C2=A01 files changed, 34 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-fl=
ash.c
> index dd90880..1d2583f 100644
> --- a/drivers/mtd/maps/pxa2xx-flash.c
> +++ b/drivers/mtd/maps/pxa2xx-flash.c
> @@ -60,12 +60,21 @@ static int __init pxa2xx_flash_probe(struct platform_=
device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE=
_MEM, 0);
> - =C2=A0 =C2=A0 =C2=A0 if (!res)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 if (!res) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail0;
> + =C2=A0 =C2=A0 =C2=A0 }

Can just return -ENODEV, why bother goto here?

> +
> + =C2=A0 =C2=A0 =C2=A0 if (!request_mem_region(res->start, resource_size(=
res), pdev->name)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EBUSY;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail0;
> + =C2=A0 =C2=A0 =C2=A0 }
>

Same here, nothing to release, can just return -EBUSY here. Provided I
always doubt the necessity of request_mem_region() here since the resource
should have been claimed when the platform device is registered, this is
possibly going to claim a sub-region of that resource. But that's another
story.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D kzalloc(sizeof(struct pxa2xx_flash_in=
fo), GFP_KERNEL);
> - =C2=A0 =C2=A0 =C2=A0 if (!info)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 if (!info) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail1;
> + =C2=A0 =C2=A0 =C2=A0 }
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map.name =3D (char *) flash->name;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map.bankwidth =3D flash->width;
> @@ -78,13 +87,17 @@ static int __init pxa2xx_flash_probe(struct platform_=
device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!info->map.virt) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_WARNIN=
G "Failed to ioremap %s\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 info->map.name);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map.cached =3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioremap_cached(inf=
o->map.phys, info->map.size);
> - =C2=A0 =C2=A0 =C2=A0 if (!info->map.cached)
> + =C2=A0 =C2=A0 =C2=A0 if (!info->map.cached) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_WARNIN=
G "Failed to ioremap cached %s\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 info->map.name);


This might not be an error at all, it's a warning. The cached mapping is
for performance reason on some platforms, it should be working all right
without it.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail3;
> + =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->map.inval_cache =3D pxa2xx_map_inval_cac=
he;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0simple_map_init(&info->map);
>
> @@ -97,10 +110,8 @@ static int __init pxa2xx_flash_probe(struct platform_=
device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->mtd =3D do_map_probe(flash->map_name, &i=
nfo->map);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!info->mtd) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iounmap((void *)info->=
map.virt);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->map.cached)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 iounmap(info->map.cached);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EIO;

See above.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail4;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->mtd->owner =3D THIS_MODULE;
>
> @@ -124,13 +135,21 @@ static int __init pxa2xx_flash_probe(struct platfor=
m_device *pdev)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, info);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> +
> +fail4: iounmap(info->map.cached);
> +fail3: iounmap(info->map.virt);
> +fail2: kfree(info);
> +fail1: release_mem_region(res->start, resource_size(res));
> +fail0:
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> =C2=A0}
>
> =C2=A0static int __devexit pxa2xx_flash_remove(struct platform_device *de=
v)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa2xx_flash_info *info =3D platform_ge=
t_drvdata(dev);
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res;
>
> - =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(dev, NULL);

What's wrong with the above statement? And normally there is some benefit
of setting drive data to be NULL, as the driver data could be used concurre=
ntly
during removal (i.e. an interrupt handler if the IRQ is not already disable=
d).
Though relying on this behavior to safely remove a device is _not_ by anywa=
y
recommended.

> + =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM=
, 0);
>
> =C2=A0#ifdef CONFIG_MTD_PARTITIONS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info->nr_parts)
> @@ -141,10 +160,12 @@ static int __devexit pxa2xx_flash_remove(struct pla=
tform_device *dev)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0map_destroy(info->mtd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(info->map.virt);
> - =C2=A0 =C2=A0 =C2=A0 if (info->map.cached)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iounmap(info->map.cach=
ed);
> + =C2=A0 =C2=A0 =C2=A0 iounmap(info->map.cached);

See above, the map.cached is supposed to be optional and can only
be removed if it's mapped, no force here.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(info->parts);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(info);
> + =C2=A0 =C2=A0 =C2=A0 release_mem_region(res->start, resource_size(res))=
;
> + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(dev, NULL);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> --
> 1.6.3.3
>
