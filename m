Received: from [199.64.0.252] (helo=AZ18CN851.global.ds.honeywell.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEzDE-0007t7-0t
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 20:36:16 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Mar 2006 18:28:38 -0700
Message-ID: <3667CE78C449C0448D87DD5E61F19BC7899315@AZ18EV804.global.ds.honeywell.com>
From: "Matsen, Dean \(WA26\)" <Dean.Matsen@Honeywell.com>
To: <dwmw2@infradead.org>,
	<linux-mtd@lists.infradead.org>
Cc: 
Subject: Fix for CFI Flash Driver bug in 2.4 Kernel. Relates to 2.6 kernel
	too.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Mackerras recommended I forward this here

Regards,
Dean

OK, since it affects drivers/mtd, it should go to David Woodhouse
(dwmw2@infradead.org) and the linux-mtd@lists.infradead.org mailing
list.

Paul.

-----Original Message-----
From: Matsen, Dean (WA26)=20
Sent: Monday, February 27, 2006 10:49 AM
To: 'Paul Mackerras'
Subject: FW: Fix for CFI Flash Driver bug in 2.4 Kernel

Someone seems to have found out it also exists in the 2.6 kernel.

The original patch is at the end of this e-mail

Regards,
Dean


-----Original Message-----
From: Kelsey Dawes [mailto:kelsey@codemonkey.net]=20
Sent: Friday, February 24, 2006 10:14 AM
To: Matsen, Dean (WA26)
Subject: Re: Fix for CFI Flash Driver bug in 2.4 Kernel

Hi Dean,

just FYI - I have hit this bug with a  2.6.13 tree. =20

29LV640MH flash. =20

Kelsey


On Thu, Feb 23, 2006 at 02:33:37PM -0700, Matsen, Dean (WA26) wrote:
> All,
>=20
> =20
>=20
> This patch applies to 2.4.22 from Monta Vista.  We started seeing a
> kernel panic due to the really SLOOOOW 29LV641MH-120 flash parts.
>=20
> Interestingly, the same part with 90mS access time (29LV641MH-120) are
> about 10 times faster erasing and programming.
>=20
> =20
>=20
> Turns out there are two problems in the driver code:=20
>=20
> =20
>=20
> 1- the timeout is calculated incorrectly, based on HZ/100, which is
zero
> on my system 'cuz "HZ" is equal to 100
>=20
> =20
>=20
> 2- when the timeout occurs, the code erroneously releases a spinlock
> twice.
>=20
> =20
>=20
> I have not checked to see if there is a similar problem in the 2.6
> kernel
>=20
> =20
>=20
> Regards,
>=20
> Dean Matsen
>=20
> Software Architect
>=20
> Alerton Honeywell
>=20
> dean.matsen@honeywell.com
>=20
> =20
>=20
> Patch follows:
>=20
> =20
>=20
> =20
>=20
>
------------------------------------------------------------------------
> ----------------------
>=20
> diff --unified --recursive
> ppc-linux-kernel.org/drivers/mtd/chips/cfi_cmdset_0002.c
> ppc-linux-kernel/drivers/mtd/chips/cfi_cmdset_0002.c
>=20
> --- ppc-linux-kernel.org/drivers/mtd/chips/cfi_cmdset_0002.c      Sat
> Jul 12 01:08:17 2003
>=20
> +++ ppc-linux-kernel/drivers/mtd/chips/cfi_cmdset_0002.c    Thu Feb 23
> 12:50:34 2006
>=20
> @@ -10,6 +10,15 @@
>=20
>   *
>=20
>   * $Id: cfi_cmdset_0002.c,v 1.1.1.1 2003/07/12 08:08:17 dean Exp $
>=20
>   *
>=20
> + * - 2006/02/23 : Dean Matsen (dean.matsen@honeywell.com) Fixed write

>=20
> + *   timeout bug: timeout was based on HZ/1000 before (which is equal
> to
>=20
> + *   zero in my system), also the exit path unlocked the spinlock
> twice.
>=20
> + *   Increased timeout from 1mS to 100mS, because new 100K write
> flashes
>=20
> + *   such as 29LV641MH say "TBD" in the data sheet for worst case
> programming
>=20
> + *   time.  Problem was detected due to the really slow 29LV641MH-120
> part,
>=20
> + *   which erases and programs 10 times slower than any other flash
> we've
>=20
> + *   ever encountered (including the 29LV641MH-90, which is in the
same
>=20
> + *   100K write family of parts!).
>=20
>   */
>=20
> =20
>=20
>  #include <linux/module.h>
>=20
> @@ -511,7 +520,7 @@
>=20
>          or tells us why it failed. */       =20
>=20
>       dq6 =3D CMD(1<<6);
>=20
>       dq5 =3D CMD(1<<5);
>=20
> -     timeo =3D jiffies + (HZ/1000); /* setting timeout to 1ms for now
*/
>=20
> +     timeo =3D jiffies + (HZ/10); /* setting timeout to 100ms for now
*/
>=20
>            =20
>=20
>       oldstatus =3D cfi_read(map, adr);
>=20
>       status =3D cfi_read(map, adr);
>=20
> @@ -532,10 +541,10 @@
>=20
>       }
>=20
>      =20
>=20
>       if( (status & dq6) !=3D (oldstatus & dq6) ) {
>=20
> -           /* The erasing didn't stop?? */
>=20
> +           /* The writing didn't stop?? */
>=20
>             if( (status & dq5) =3D=3D dq5 ) {
>=20
>                   /* When DQ5 raises, we must check once again
>=20
> -                    if DQ6 is toggling.  If not, the erase has been
>=20
> +                    if DQ6 is toggling.  If not, the write has been
>=20
>                      completed OK.  If not, reset chip. */
>=20
>                   oldstatus =3D cfi_read(map, adr);
>=20
>                   status =3D cfi_read(map, adr);
>=20
> @@ -543,7 +552,7 @@
>=20
>                   if ( (oldstatus & 0x00FF) =3D=3D (status & 0x00FF) ) =
{
>=20
>                         printk(KERN_WARNING "Warning: DQ5 raised while
> program operation was in progress, however operation completed OK\n"
);
>=20
>                   } else {=20
>=20
> -                       /* DQ5 is active so we can do a reset and stop
> the erase */
>=20
> +                       /* DQ5 is active so we can do a reset and stop
> the write */
>=20
>                         cfi_write(map, CMD(0xF0), chip->start);
>=20
>                         printk(KERN_WARNING "Internal flash device
> timeout occurred or write operation was performed while flash was
> programming.\n" );
>=20
>                   }
>=20
> @@ -554,7 +563,7 @@
>=20
>                   wake_up(&chip->wq);
>=20
>                   cfi_spin_unlock(chip->mutex);
>=20
>                   DISABLE_VPP(map);
>=20
> -                 ret =3D -EIO;
>=20
> +                 return -EIO;
>=20
>             }
>=20
>       }
>=20
>
------------------------------------------------------------------------
> -----------------------------------
>=20
> =20
>=20
> =20
>=20
> =20
>=20
> =20
>=20
> =20
>=20

> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@ozlabs.org
> https://ozlabs.org/mailman/listinfo/linuxppc-dev
