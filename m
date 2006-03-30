Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOs3u-00068l-U9
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 03:01:41 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Mar 2006 11:58:46 +0400
Message-ID: <F048F58F304F0040BC3E937DE4E231E701DC3AC0@NNSMSX401>
From: "Belyakov, Alexander" <alexander.belyakov@intel.com>
To: <linux-mtd@lists.infradead.org>
Cc: "Belyakov, Alexander" <alexander.belyakov@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>
Subject: [PATCH/RFC] CFI: Threads switching issue workaround
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello again!

As it was promised I have split patch with striping and related stuff
into three parts.

- Striping core itself ([PATCH/RFC] MTD: Striping layer core)
- Thread switching workaround (this message)
- CFI Common polling thread ([PATCH/RFC] CFI: Common polling thread
feature)

This very message contains thread switching workaround code. Please
refer to main thread "[PATCH/RFC] MTD: Striping layer core" to get more
about issue and usage cases.

1. PROBLEM
The problem appears as timely thread switching is required. The most
obvious example here is a case of several instances of FFS mounted on
physically independent flash chips trying to work simultaneously.
Another example is striping feature which presented in much details in
mailing thread "[PATCH/RFC] MTD: Striping layer core". Please find
additional information on this issue there.

2. SOLUTION
The suggested here solution deals with temporarily threads priority
lowering for time data is being written from chip buffer to media. The
main idea here is to lower priority slightly of the one worker thread
before rescheduling. That stimulates thread switching providing actually
simultaneous writing. After device has completed write operation thread
restores its original priority.=20

Another modification here is concerned with the split udelay time in
small chunks. Long udelays negatively affects striping performance since
udelay call is represented by loop and can not be interrupted by other
thread. Small udelay chunks provide more accurate and timely thread
switching.

3. PATCH
The diff file below is a patch containing thread switching workaround
(to be applied on MTD snapshot 20060315).

Kind Regards,
Alexander Belyakov



diff -uNr a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2006-03-16
12:46:25.000000000 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-03-16
12:35:51.000000000 +0300
@@ -1045,19 +1048,62 @@
 #define xip_enable(map, chip, adr)
 #define XIP_INVAL_CACHED_RANGE(x...)
=20
-#define UDELAY(map, chip, adr, usec)  \
-do {  \
-	spin_unlock(chip->mutex);  \
-	cfi_udelay(usec);  \
-	spin_lock(chip->mutex);  \
-} while (0)
+static void snd_udelay(struct map_info *map, struct flchip *chip,
+				unsigned long adr, int usec)
+{
+        struct cfi_private *cfi =3D map->fldrv_priv;
+        map_word status, OK;
+        int chunk =3D 10000 / HZ; /* chunk is one percent of HZ
resolution */
+        int oldnice =3D current->static_prio - MAX_RT_PRIO - 20;
+
+        /* If we should wait for timeout > than HZ resolution, no need=20
+        in resched stuff due to of process sleeping */
+        if ( 2*usec*HZ >=3D 1000000) {=20
+                msleep((usec+999)/1000);
+                return;
+        }=20
+
+        /* Very short time out */
+        if ( usec =3D=3D 1 ) {
+                udelay(usec);
+                return;
+        }
+
+        /* If we should wait neither too small nor too long */
+        OK =3D CMD(0x80);
+        while ( usec > 0 )	{
+                spin_unlock(chip->mutex);
+                /* Lower down thread priority to create concurrency */
+                if(oldnice > -20)
+                        set_user_nice(current,oldnice - 1);
+                /* check the status to prevent useless waiting*/
+                status =3D map_read(map, adr);
+                if (map_word_andequal(map, status, OK, OK)) {
+                        /* let recover priority */
+                        set_user_nice(current,oldnice);
+                        break;
+                }
+
+                if (usec < chunk )
+                        udelay(usec);
+                else=20
+                        udelay(chunk);
+
+                cond_resched();
+                spin_lock(chip->mutex);
+
+                /* let recover priority */
+                set_user_nice(current,oldnice);
+                usec -=3D chunk;
+        }
+}
+
+#define UDELAY(map, chip, adr, usec) snd_udelay(map, chip, adr, usec)
=20
 #define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
 do {  \
-	spin_unlock(chip->mutex);  \
 	INVALIDATE_CACHED_RANGE(map, adr, len);  \
-	cfi_udelay(usec);  \
-	spin_lock(chip->mutex);  \
+        UDELAY(map, chip, cmd_adr, usec); \
 } while (0)
=20
 #endif
@@ -1693,10 +1765,6 @@
 				return 0;
 		}
=20
-		/* Be nice and reschedule with the chip in a usable
state for other
-		   processes. */
-		cond_resched();
-
 	} while (len);
=20
 	return 0;
