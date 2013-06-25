Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UrT4W-0007ui-Te
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2013 13:14:14 +0000
Message-ID: <1372166033.4488.91.camel@coredoba.hi.pengutronix.de>
Subject: Re: UBI leb_write_unlock NULL pointer Oops
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Brent Taylor <motobud@gmail.com>
Date: Tue, 25 Jun 2013 15:13:53 +0200
In-Reply-To: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
References: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2013-05-13 at 18:09 -0500, Brent Taylor wrote:
> I'm working with an atmel at91sam9g20 evaluation board
> (http://www.atmel.com/Images/doc6413.pdf) running the Linux kernel
> version 3.6.9.  On two occasions I have had the following Oops
> reported:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 00000=
00c
> pgd =3D c313c000
> [0000000c] *pgd=3D231a5831, *pte=3D00000000, *ppte=3D00000000
> Internal error: Oops: 17 [#1] ARM
> Modules linked in:
> CPU: 0    Tainted: G        W     (3.6.9-00.04 #1)
> PC is at __up_write+0x34/0x16c
> LR is at leb_write_unlock+0x2c/0x88

> [<c013493c>] (__up_write+0x34/0x16c) from [<c01933d4>] (leb_write_unlock+=
0x2c/0x88)
> [<c01933d4>] (leb_write_unlock+0x2c/0x88) from [<c0193acc>] (ubi_eba_writ=
e_leb+0xa0/0x984)
> [<c0193acc>] (ubi_eba_write_leb+0xa0/0x984) from [<c0192874>] (ubi_leb_wr=
ite+0xe0/0x124)
> [<c0192874>] (ubi_leb_write+0xe0/0x124) from [<c00dd268>] (ubifs_leb_writ=
e+0x9c/0x130)
> [<c00dd268>] (ubifs_leb_write+0x9c/0x130) from [<c00dde20>] (ubifs_wbuf_s=
ync_nolock+0x104/0x34c)
> [<c00dde20>] (ubifs_wbuf_sync_nolock+0x104/0x34c) from [<c00d07bc>] (ubif=
s_jnl_update+0x2b8/0x60c)
> [<c00d07bc>] (ubifs_jnl_update+0x2b8/0x60c) from [<c00d7298>] (ubifs_crea=
te+0x108/0x1dc)
> [<c00d7298>] (ubifs_create+0x108/0x1dc) from [<c0089e60>] (vfs_create+0x8=
4/0xb4)
> [<c0089e60>] (vfs_create+0x84/0xb4) from [<c008c94c>] (do_last.isra.38+0x=
78c/0xb90)
> [<c008c94c>] (do_last.isra.38+0x78c/0xb90) from [<c008cdf8>] (path_openat=
+0xa8/0x448)
> [<c008cdf8>] (path_openat+0xa8/0x448) from [<c008d47c>] (do_filp_open+0x2=
c/0x80)
> [<c008d47c>] (do_filp_open+0x2c/0x80) from [<c007f8d4>] (do_sys_open+0xe8=
/0x180)
> [<c007f8d4>] (do_sys_open+0xe8/0x180) from [<c00092c0>] (ret_fast_syscall=
+0x0/0x2c)
> Code: e5903004 e58d2004 e1560003 0a00002a (e593200c)
> ---[ end trace 287ddd4605e3394c ]---
> Kernel panic - not syncing: Fatal exception

I've seen the same traceback with 3.7.5, I seems to have something to do
with remounting read-only or failing to unmount a busy FS. Did you also
use remount?

You could also try to enable CONFIG_DEBUG_SPINLOCK, CONFIG_DEBUG_MUTEXES
and CONFIG_DEBUG_LOCK_ALLOC, as the cash seems to happen during lock
operations.

Regards,
Jan L=C3=BCbbe
--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
