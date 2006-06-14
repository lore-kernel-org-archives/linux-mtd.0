Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqTIw-00010P-KW
	for linux-mtd@lists.infradead.org; Wed, 14 Jun 2006 07:13:19 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] Fixes for several performance issues 
Date: Wed, 14 Jun 2006 15:12:47 +0400
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A01EF2E9D@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>, "Nicolas Pitre" <nico@cam.org>,
	"Davide CASCONE" <davide.cascone@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,=20

The current implementation has some performance and stability issues in
CFI drivers.

I found the following bugs:
1. Very low write performance on Sibley (perf tests demonstrated write
perf less than 100Kb/sec when it should be over 400Kb/sec):=20

The root of the issue is in the following code:

static inline void cfi_udelay(int us)
{
	if (us >=3D 1000) {
		msleep((us+999)/1000);
	} else {
		udelay(us);
		cond_resched();
	}
}

According to spec Sibley buffer write time is 2048us. It is greater than
1000us.=20
So we call msleep which has resolution 10000 us.=20

2. Erase speed is rather low on SND configurations on Sibley and
probably other NOR chips.

3. As Davide mentioned block locking works too slow in XIP mode. There
is another problem here:
(usec >=3D 1000000/HZ) is condition for sending CPU to idle state.=20
When zero timeout is passed from do_xxlock_oneblock to
xip_wait_for_operation it automatically sets the usec =3D 500000 - and =
we
send cpu to idle when it is unnecessary.
It also causes the issue with very low write performance on XIP on
several kind of NOR chips (passing zero timeout from do_write_buffer
after sending write_cmd command).

4. JFFS2 tests with CPU loading application cause "block erase error:
(status timeout)".=20
The reason of the failure is following:
During erase the process goes to sleep for rather long time.=20
CPU load application takes the control. Timeout tuning code in CFI
driver reduces erase timeout.=20
It happens until erase timeout is reduced to very low value.=20
This case maximum wait timeout will be set to HZ/2 which is lower than
erase timeout.=20
If nobody loads CPU next erase will wait for 0.5 sec (HZ/2) and return
with error flag.=20


The patch at the end of the letter removes all these issue.=20
The issue 3 may be easily fixed by modifying cpu idle conditions.=20

To solve the issues 1,2 and 4 I did the following:
1) Removed the timeout tuning from inval_cache_and_wait_for_operation.=20
IMO there are very few advantages in it.=20
Time out for msleep and "udelay + cond_resched" may vary significanlty.
Chip operations timeout may also vary.=20
So I guess that chip op timeout tuning is not a very good definition for
chip operations.=20

2) Waiting conditions in inval_cache_and_wait_for_operation now is based
on timer resolution
If timeout is lower than timer resolution then we do in cycle
	"Checking the status"
	udelay(1);
	cond_resched();
Udelay is just a cycle so substitution of udelay(500) for 500 udelay(1)
will not affect on system performance negatively but it will provide
much higher resolution. It fixes the issue with very low performance on
Sibley. It increases write speed on it over 4 times.

If timeout is greater than timer resolution (probably erase operation)
We do the following
	sleep for half of operation timeout
	and do in cycle the following
	"Checking the status"
	sleep for timer resolution
It adds insignificant CPU overhead but it provides higher resolution and
resolves the issue of low erase speed=20
(Without patch: Erase Speed: 246 KB/sec With patch: Erase Speed: 318
KB/sec)

Please find the patch below:
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-13
21:52:19.809272680 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-13
21:53:49.959567752 +0400
@@ -907,7 +907,7 @@
=20
 static int __xipram xip_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
-		unsigned long adr, int *chip_op_time )
+		unsigned long adr, int chip_op_time )
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	struct cfi_pri_intelext *cfip =3D cfi->cmdset_priv;
@@ -916,7 +916,7 @@
 	flstate_t oldstate, newstate;
=20
        	start =3D xip_currtime();
-	usec =3D *chip_op_time * 8;
+	usec =3D chip_op_time * 8;
 	if (usec =3D=3D 0)
 		usec =3D 500000;
 	done =3D 0;
@@ -1000,7 +1000,7 @@
 			map_write(map, CMD(0x70), adr);
 			chip->state =3D oldstate;
 			start =3D xip_currtime();
-		} else if (usec >=3D 1000000/HZ) {
+		} else if (chip_op_time >=3D 1000000/HZ) {
 			/*
 			 * Try to save on CPU power when waiting delay
 			 * is at least a system timer tick period.
@@ -1026,8 +1026,8 @@
 #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
 	INVALIDATE_CACHED_RANGE(map, from, size)
=20
-#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len,
p_usec) \
-	xip_wait_for_operation(map, chip, cmd_adr, p_usec)
+#define INVAL_CACHE_AND_WAIT(map, chip, cmd_adr, inval_adr, inval_len,
usec) \
+	xip_wait_for_operation(map, chip, cmd_adr, usec)
=20
 #else
=20
@@ -1039,26 +1039,24 @@
 static int inval_cache_and_wait_for_operation(
 		struct map_info *map, struct flchip *chip,
 		unsigned long cmd_adr, unsigned long inval_adr, int
inval_len,
-		int *chip_op_time )
+		int chip_op_time )
 {
 	struct cfi_private *cfi =3D map->fldrv_priv;
 	map_word status, status_OK =3D CMD(0x80);
-	int z, chip_state =3D chip->state;
-	unsigned long timeo;
-
+	int chip_state =3D chip->state;
+	unsigned long timeo, timer_resolution =3D 1000000/HZ;
+=09
 	spin_unlock(chip->mutex);
 	if (inval_len)
 		INVALIDATE_CACHED_RANGE(map, inval_adr, inval_len);
-	if (*chip_op_time)
-		cfi_udelay(*chip_op_time);
+=09
+	if ( chip_op_time / 2 > timer_resolution)
+		cfi_udelay(chip_op_time / 2 );
+	=09
 	spin_lock(chip->mutex);
+=09
+	timeo =3D jiffies + HZ/2 + chip_op_time * 8 / timer_resolution;
=20
-	timeo =3D *chip_op_time * 8 * HZ / 1000000;
-	if (timeo < HZ/2)
-		timeo =3D HZ/2;
-	timeo +=3D jiffies;
-
-	z =3D 0;
 	for (;;) {
 		if (chip->state !=3D chip_state) {
 			/* Someone's suspended the operation: sleep */
@@ -1069,7 +1067,7 @@
 			spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			timeo =3D jiffies + (HZ / 2); /* FIXME */
+			timeo =3D jiffies + HZ/2 + chip_op_time * 8 /
timer_resolution;
 			spin_lock(chip->mutex);
 			continue;
 		}
@@ -1086,18 +1084,14 @@
 		}
=20
 		/* Latency issues. Drop the lock, wait a while and retry
*/
-		z++;
 		spin_unlock(chip->mutex);
-		cfi_udelay(1);
+		if (chip_op_time / 2 < timer_resolution)
+		    cfi_udelay(1);
+    		else
+		    cfi_udelay(timer_resolution);
 		spin_lock(chip->mutex);
 	}
=20
-	if (!z) {
-		if (!--(*chip_op_time))
-			*chip_op_time =3D 1;
-	} else if (z > 1)
-		++(*chip_op_time);
-
 	/* Done and happy. */
  	chip->state =3D FL_STATUS;
 	return 0;
@@ -1106,8 +1100,7 @@
 #endif
=20
 #define WAIT_TIMEOUT(map, chip, adr, udelay) \
-    ({ int __udelay =3D (udelay); \
-	INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, &__udelay); })
+	   INVAL_CACHE_AND_WAIT(map, chip, adr, 0, 0, udelay)
=20
=20
 static int do_point_onechip (struct map_info *map, struct flchip *chip,
loff_t adr, size_t len)
@@ -1331,7 +1324,7 @@
=20
 	ret =3D INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, map_bankwidth(map),
-				   &chip->word_write_time);
+				   chip->word_write_time);
 	if (ret) {
 		xip_enable(map, chip, adr);
 		printk(KERN_ERR "%s: word write error (status
timeout)\n", map->name);
@@ -1568,7 +1561,7 @@
=20
 	ret =3D INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
 				   adr, len,
-				   &chip->buffer_write_time);
+				   chip->buffer_write_time);
 	if (ret) {
 		map_write(map, CMD(0x70), cmd_adr);
 		chip->state =3D FL_STATUS;
@@ -1703,7 +1696,7 @@
=20
 	ret =3D INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, len,
-				   &chip->erase_time);
+				   chip->erase_time);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state =3D FL_STATUS;
