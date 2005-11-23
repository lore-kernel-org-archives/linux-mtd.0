Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EexRp-0007K6-2t
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 16:26:18 +0000
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id jANGcOYZ032305
	for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2005 16:38:28 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005112319260311495
	for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2005 19:26:03 +0300
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Nov 2005 19:26:04 +0300
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A0161CDF8@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: Deadlock in cfi_cmdset_0001.c on simultaneous write operations.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
=20
I faced a halting issue on multi partitioned chip when I tried to
execute simultaneous write operations.
Platform has halted, on execution of this sequence:
dd if=3Drandom of=3D/dev/mtd4 bs=3D4k count=3D1k&
dd if=3Drandom of=3D/dev/mtd5 bs=3D4k count=3D1k&
dd if=3Drandom of=3D/dev/mtd6 bs=3D4k count=3D1k

Halt didn't happens on two simultaneous write operations
Execution of=20
dd if=3Drandom of=3D/dev/mtd5 bs=3D4k count=3D1k&
dd if=3Drandom of=3D/dev/mtd6 bs=3D4k count=3D1k
was ok.
=20
I made small investigation. Platform falls to deadlock in get_chip
function.
I was unable to definetly locate the place of the halt. But I gues it
happened here.
=20
  struct flchip_shared *shared =3D chip->priv;
  struct flchip *contender;
  spin_lock(&shared->lock);
  contender =3D shared->writing;
  if (contender && contender !=3D chip) {
   int ret =3D spin_trylock(contender->mutex);
   spin_unlock(&shared->lock);
   if (!ret)
    goto retry;
   spin_unlock(chip->mutex);
   ret =3D get_chip(map, contender, contender->start, mode);
   spin_lock(chip->mutex);
   if (ret) {
    spin_unlock(contender->mutex);
    return ret;
   }
   timeo =3D jiffies + HZ;
   spin_lock(&shared->lock);
  }
  shared->writing =3D chip;
  if (mode =3D=3D FL_ERASING)
   shared->erasing =3D chip;
  if (contender && contender !=3D chip)
   spin_unlock(contender->mutex);
  spin_unlock(&shared->lock);

I slightly simplified functionality of the code and it helped, the
following code doesn't halt
  struct flchip_shared *shared =3D chip->priv;
  struct flchip *contender;
=20
  contender =3D shared->writing;
  if (contender && contender !=3D chip) {
      yield();=20
       timeo =3D jiffies + HZ;
      goto retry;
  }
  /* We now own it */
  spin_lock(&shared->lock);    =20
  shared->writing =3D chip;
  if (mode =3D=3D FL_ERASING)
   shared->erasing =3D chip;
  if (contender && contender !=3D chip)
   spin_unlock(contender->mutex);
  spin_unlock(&shared->lock);

I know that it can not be solution because it reduces functionality.=20
I would be very much appreciate if someone advice me solution for
deadlock issue on simultaneous write operations.
=20
Thanks,
Alexey
