Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjiue-0008HJ-Rs
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 03:27:29 +0000
Received: by werc12 with SMTP id c12so449099wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 20:27:26 -0700 (PDT)
Message-ID: <1340767634.2317.1.camel@koala>
Subject: Re: Patch MTD: increase time out value for buffer program
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Changming Chen (changmingche)" <changmingche@micron.com>
Date: Wed, 27 Jun 2012 06:27:14 +0300
In-Reply-To: <1340726334.3119.150.camel@sauron.fi.intel.com>
References: <mailman.0.1338988276.11201.linux-mtd@lists.infradead.org>
 <6ACDE3A4C2F7E94C8DBB6FCC0D06A0873DA88046@NTXBOIMBX05.micron.com>
 <1340726334.3119.150.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-JDILGXKr1aqnnMIlcemG"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Youxin He
 \(youxinhe\)" <youxinhe@micron.com>,
 "Frank Liu \(frankliu\)" <frankliu@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-JDILGXKr1aqnnMIlcemG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-26 at 18:58 +0300, Artem Bityutskiy wrote:
> On Wed, 2012-06-13 at 04:29 +0000, Changming Chen (changmingche) wrote:
> > The time out value(1ms:typical HZ defined smaller than 1000) defined fo=
r function "do_write_buffer" in "cfi_cmdset_0002.c" is not enough. Because =
the enlargement of buffer size, much time will cost for buffer program. It'=
s has risk that time out will be triggered before buffer program finished a=
nd make misjudge for buffer program. we suggest that 4ms is more appropriat=
e compare to 1ms. This change has no impact of program performance.
> >=20
> > diff --git a/a/drivers/mtd/chips/cfi_cmdset_0002.c b/b/drivers/mtd/chip=
s/cfi_cmd
> > index 9d93c45..7da8fca 100755
> > --- a/a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -1312,7 +1312,7 @@ static int __xipram do_write_buffer(struct map_in=
fo *map,=20
> >          struct cfi_private *cfi =3D map->fldrv_priv;
> >          unsigned long timeo =3D jiffies + HZ;
> >          /* see comments in do_write_oneword() regarding uWriteTimeo. *=
/
> > -        unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
> > +        unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 4;
>=20
> No, sorry, this is not a fix, this is a band-aid. The whole HZ/1000
> thing is broken. You should not use HZ at all. For this driver it looks
> like you should use ' schedule_timeout()' with the right timout instead
> of 'schedule()' and get rid of all the HZ and jiffies stuff.

What I meant is something like this (not tested, not even compiled),
which should also be done in many other places in this file:

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 22d0493..8ce3b44 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -48,6 +48,9 @@
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
=20
+/* Write operation timeout, ms */
+#define WRITE_TIEMEOUT 2
+
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u=
_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_=
t *, const u_char *);
 static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, siz=
e_t *, const u_char *);
@@ -1143,17 +1146,6 @@ static int cfi_amdstd_secsi_read (struct mtd_info *m=
td, loff_t from, size_t len,
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *=
chip, unsigned long adr, map_word datum)
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
-	unsigned long timeo =3D jiffies + HZ;
-	/*
-	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
-	 * have a max write time of a few hundreds usec). However, we should
-	 * use the maximum timeout value given by the chip at probe time
-	 * instead.  Unfortunately, struct flchip does have a field for
-	 * maximum timeout, only for typical which can be far too short
-	 * depending of the conditions.	 The ' + 1' is to avoid having a
-	 * timeout of 0 jiffies if HZ is smaller than 1000.
-	 */
-	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
 	int ret =3D 0;
 	map_word oldd;
 	int retry_cnt =3D 0;
@@ -1197,8 +1189,6 @@ static int __xipram do_write_oneword(struct map_info =
*map, struct flchip *chip,
 				adr, map_bankwidth(map),
 				chip->word_write_time);
=20
-	/* See comment above for timeout value. */
-	timeo =3D jiffies + uWriteTimeout;
 	for (;;) {
 		if (chip->state !=3D FL_WRITING) {
 			/* Someone's suspended the write. Sleep */
@@ -1207,20 +1197,18 @@ static int __xipram do_write_oneword(struct map_inf=
o *map, struct flchip *chip,
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			mutex_unlock(&chip->mutex);
-			schedule();
+			ret =3D schedule_timeout(msecs_to_jiffies(WRITE_TIEMEOUT));
 			remove_wait_queue(&chip->wq, &wait);
-			timeo =3D jiffies + (HZ / 2); /* FIXME */
 			mutex_lock(&chip->mutex);
+			if (!ret) {
+				xip_enable(map, chip, adr);
+				printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
+				xip_disable(map, chip, adr);
+				break;
+			}
 			continue;
 		}
=20
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
-			xip_enable(map, chip, adr);
-			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
-			xip_disable(map, chip, adr);
-			break;
-		}
-
 		if (chip_ready(map, adr))
 			break;
=20
--=20
Best Regards,
Artem Bityutskiy

--=-JDILGXKr1aqnnMIlcemG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6n2SAAoJECmIfjd9wqK0Wj0P/2PpesXBVd5YcAXG6sd1FnMo
JUFcL7qKeCFpSXafQHwOZuwtQfuN5soSHExKvSwDZ0UM40WMEjQTTZg2S+L3uH9o
wDXNPJdNSAfSARJEaaSdfVfhNEq5Z4DWIXqJV2yK3UPYXNXLYVq9GGYBpQzfCoJF
ytsORswzs0N8PSUM2aJBK08azVCUgDPt53iMJ3IRjEBk1Nzbg89YmtuB0U8f7alt
mDTB914To54i9BW5JekgSU1T/mj0CAL/r4JrFtL7XlT1lUmpvf3xVdoFY/zbd80o
FPv1LILnTfYCzOkuVeJIEx0/lR8inqtU7DHmdCH5klOkR/DocoGlC2rxQ/WPeIuM
NYH1MLvbKVFDJDAeV01MxHsdgM7NsonacK9T0E75d16c0vb/jMYZjocwmhDkNEjV
Bk2mVNwUch90E3Se2XJ5zi0RunnKCsCWTYBWmzopbzJR3BzfbZPUTCFfz+tdZC2F
y/k7xFmpiYM/R/KnyRBrRnozkCdlID/UE05brn2fF25wp4E1Km5ZphaCj8k/PP2F
H4oZZyG69fELhLOLSHTaKLR1FMqPLTy3fS+Wdx9Do0PXb9GhAgDHlTwDuaII/3W+
RrUFwAqdE+NKtfKp79mDv8p2UwTggIoM6MxyznsvNTMuK9L5TOx0syPmg52/xjDv
7bLtF/xCn+Ni+ltPEaBl
=N/ki
-----END PGP SIGNATURE-----

--=-JDILGXKr1aqnnMIlcemG--
