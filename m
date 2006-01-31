Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F3yAw-00008t-Bg
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2006 11:16:17 -0500
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id k0VGU80H022111
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2006 16:30:10 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2006013119161013941
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2006 19:16:10 +0300
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 31 Jan 2006 19:16:08 +0300
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A018F2071@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] CFI cmdset_0001 A small fixup of wrong cache invalidation
	regions.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
=20
I found issue in cfi_cmdset0001.c. It related to setting up of cache
regions for invalidating in buffered write porcedure.
Code performs cache invalidation from "cmd_addr" to "cmd_adr + len" in
do_write_buffer function. In fact we modify region from "adr" to
"adr+len".=20
The issue affects when you try to write and read data by small chunks.
This case you may catch read errors on SND configurations.=20
=20
I made fix for it. Please take a look at the patch.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- b/drivers/mtd/chips/cfi_cmdset_0001.c 2006-01-26 18:59:52.000000000
+0300
+++ a/drivers/mtd/chips/cfi_cmdset_0001.c 2006-01-31 18:56:01.315227496
+0300
@@ -1019,8 +1019,8 @@
 #define XIP_INVAL_CACHED_RANGE(map, from, size)  \
  INVALIDATE_CACHED_RANGE(map, from, size)
=20
-#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \
- UDELAY(map, chip, adr, usec)
+#define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
+ UDELAY(map, chip, cmd_adr, usec)
=20
 /*
  * Extra notes:
@@ -1052,7 +1052,7 @@
  spin_lock(chip->mutex);  \
 } while (0)
=20
-#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \
+#define INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr, adr, len, usec)  \
 do {  \
  spin_unlock(chip->mutex);  \
  INVALIDATE_CACHED_RANGE(map, adr, len);  \
@@ -1284,7 +1284,7 @@
  map_write(map, datum, adr);
  chip->state =3D mode;
=20
- INVALIDATE_CACHE_UDELAY(map, chip,
+ INVALIDATE_CACHE_UDELAY(map, chip, adr,=20
     adr, map_bankwidth(map),
     chip->word_write_time);
=20
@@ -1572,8 +1572,8 @@
  map_write(map, CMD(0xd0), cmd_adr);
  chip->state =3D FL_WRITING;
=20
- INVALIDATE_CACHE_UDELAY(map, chip,
-    cmd_adr, len,
+ INVALIDATE_CACHE_UDELAY(map, chip, cmd_adr,
+    adr, len,
     chip->buffer_write_time);
=20
  timeo =3D jiffies + (HZ/2);
@@ -1749,7 +1749,7 @@
  chip->state =3D FL_ERASING;
  chip->erase_suspended =3D 0;
=20
- INVALIDATE_CACHE_UDELAY(map, chip,
+ INVALIDATE_CACHE_UDELAY(map, chip, adr,
     adr, len,
     chip->erase_time*1000/2);
=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
Thanks,
Alexey
