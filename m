Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9xhO-0001CZ-6i
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 10:53:27 +0000
Received: by wyb28 with SMTP id 28so464240wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 03:53:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302690114.23151.51.camel@MUC-CSE-01.spansion.com>
References: <BANLkTik+nBf4TJ3BrxQuRa_sLr-8W2wdTw@mail.gmail.com>
	<1302690114.23151.51.camel@MUC-CSE-01.spansion.com>
Date: Wed, 13 Apr 2011 16:23:24 +0530
Message-ID: <BANLkTinjNP=gxbnLEdEVExB7-2u22Nh53A@mail.gmail.com>
Subject: Re: Re: Does NOR chip drivers support PPB protection
From: RAGHAVENDRA V K <vk.raghavendra@gmail.com>
To: Gernot Hoyler <Gernot.Hoyler@spansion.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Gernot,

Thanks for the info. The datasheet mentions that if the PPB freeze bit
is set, the only way to unlock this is to issue a (hardware) reset to
the flash chip. So if we are willing to use the freeze bit that we
need some callback into the chip specific driver (mapping driver) that
can issue a reset. Comments?


RAGHAVENDRA.V.K.



On Wed, Apr 13, 2011 at 3:51 PM, Gernot Hoyler
<Gernot.Hoyler@spansion.com> wrote:
> Currently, cfi_cmdset_0002.c does not support PPB locking of sectors - ma=
inly
> because it is hard to check for older devices if they support it or not (=
newer
> devices indicate this via CFI word 0x49, 0x08 means PPB locking is suppor=
ted).
>
> On the other hand, adding PPB support is not too complicated. The major h=
urdle
> is the MTD lock/unlock logic which assumes that sectors can be locked and=
 unlocked
> individually. With the PPB bits, sectors can be locked individually but c=
an be
> unlocked only together as a group.
>
> So if you want to use the existing MTD lock infrastructure (which is norm=
ally
> unused by the AMD/Spansion chip driver) to set PPB bits then you can appl=
y below
> changes (older kernel version). Afterwards, you can lock sectors, i.e. se=
t the
> corresponding PPB bit via the "flash_lock" mtd utility. Similarly, you co=
uld
> implement an unlock function and use flash_unlock, however, note that all=
 sectors
> will be unlocked (!) in this case whenever you use flash_unlock. Maybe it=
 would
> be better to develop a new "flash_unlockall" utility instead to clarify t=
his.
>
>
> --- cfi_cmdset_0002.c.org =A0 =A0 =A0 2007-12-17 13:46:08.000000000 +0100
> +++ cfi_cmdset_0002.c =A0 2007-12-17 13:46:19.000000000 +0100
> @@ -59,7 +59,8 @@
> =A0static void cfi_amdstd_sync (struct mtd_info *);
> =A0static int cfi_amdstd_suspend (struct mtd_info *);
> =A0static void cfi_amdstd_resume (struct mtd_info *);mtdInfo.size;
> +static int cfi_amdstd_lock(struct mtd_info *mtd, loff_t ofs, size_t len)=
;
> =A0static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, s=
ize_t *, u_char *);
>
> =A0static void cfi_amdstd_destroy(struct mtd_info *);
>
>
> @@ -270,6 +267,7 @@
> =A0 =A0 =A0 =A0mtd->sync =A0 =A0=3D cfi_amdstd_sync;
> =A0 =A0 =A0 =A0mtd->suspend =3D cfi_amdstd_suspend;
> =A0 =A0 =A0 =A0mtd->resume =A0=3D cfi_amdstd_resume;
> + =A0 =A0 =A0 mtd->lock =A0 =A0=3D cfi_amdstd_lock;
> =A0 =A0 =A0 =A0mtd->flags =A0 =3D MTD_CAP_NORFLASH;
> =A0 =A0 =A0 =A0mtd->name =A0 =A0=3D map->name;
> =A0 =A0 =A0 =A0mtd->writesize =3D 1;
> @@ -1869,6 +1876,53 @@
> =A0 =A0 =A0 =A0kfree(mtd->erasereg+ =A0 =A0ions);
> =A0}
>
> +static int __xipram do_lock_oneblock(struct map_info *map, struct flchip=
 *chip,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0unsigned long adr, int len, void *thunk)
> +{
> + =A0 =A0 =A0 struct cfi_private *cfi =3D map->fldrv_priv;
> + =A0 =A0 =A0 int udelay;
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 adr +=3D chip->start;
> +
> + =A0 =A0 =A0 spin_lock(chip->mutex);
> + =A0 =A0 =A0 ret =3D get_chip(map, chip, adr, FL_LOCKING);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock(chip->mutex);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
> + =A0 =A0 =A0 ENABLE_VPP(map);
> + =A0 =A0 =A0 xip_disable(map, chip, adr);
> +
> + =A0 =A0 =A0 cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map,=
 cfi, cfi->device_type, NULL);
> + =A0 =A0 =A0 cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map,=
 cfi, cfi->device_type, NULL);
> + =A0 =A0 =A0 cfi_send_gen_cmd(0xC0, cfi->addr_unlock1, chip->start, map,=
 cfi, cfi->device_type, NULL);
> + =A0 =A0 =A0 cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map,=
 cfi, cfi->device_type, NULL);
> + =A0 =A0 =A0 map_write(map, CMD(0x00), adr);
> + =A0 =A0 =A0 chip->state =3D FL_LOCKING;
> +
> + =A0 =A0 =A0 udelay =3D (1 << cfi->cfiq->WordWriteTimeoutTyp) * (1 << cf=
i->cfiq->WordWriteTimeoutMax);
> + =A0 =A0 =A0 INVALIDATE_CACHE_UDELAY(map, chip, adr, map_bankwidth(map),=
 udelay);
> + =A0 =A0 =A0 /* wait max word program time */
> +
> + =A0 =A0 =A0 cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map,=
 cfi, cfi->device_type, NULL);
> + =A0 =A0 =A0 cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map,=
 cfi, cfi->device_type, NULL);
> +
> + =A0 =A0 =A0 xip_enable(map, chip, adr);
> +
> + =A0 =A0 =A0 chip->state =3D FL_READY;
> + =A0 =A0 =A0 put_chip(map, chip, adr);
> + =A0 =A0 =A0 spin_unlock(chip->mutex);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static int cfi_amdstd_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
> +{
> + =A0 =A0 =A0 return cfi_varsize_frob(mtd, do_lock_oneblock, ofs, len, 0)=
;
> +}
> +
> =A0MODULE_LICENSE("GPL");
> =A0MODULE_AUTHOR("Crossnet Co. <info@crossnet.co.jp> et al.");
> =A0MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu flash chips");
>
>
>
