Received: from ip-161-71-171-238.corp-eur.3com.com ([161.71.171.238] helo=columba.www.eur.3com.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17VZsr-0006DS-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Jul 2002 16:41:33 +0100
Received: from toucana.eur.3com.com (toucana.EUR.3Com.COM [140.204.220.50])
	by columba.www.eur.3com.com  with ESMTP id g6JFhCDw006957
	for <linux-mtd@lists.infradead.org>; Fri, 19 Jul 2002 16:43:12 +0100 (BST)
Received: from notesmta.eur.3com.com (eurmta1.EUR.3Com.COM [140.204.220.206])
	by toucana.eur.3com.com  with SMTP id g6JFg3R12481
	for <linux-mtd@lists.infradead.org>; Fri, 19 Jul 2002 16:42:03 +0100 (BST)
From: "Jon Burgess" <Jon_Burgess@eur.3com.com>
To: linux-mtd@lists.infradead.org
Message-ID: <80256BFB.00569639.00@notesmta.eur.3com.com>
Date: Fri, 19 Jul 2002 16:41:10 +0100
Subject: [Patch] Fixes to support ST 29W320DB in cfi_cmdset_002
Mime-Version: 1.0
Content-type: multipart/mixed;
	Boundary="0__=UocjoDiRQQvC3ZOySpWTcbGg9vIXNv5QgI5SKL8B43bWGiWo1d3S85LE"
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--0__=UocjoDiRQQvC3ZOySpWTcbGg9vIXNv5QgI5SKL8B43bWGiWo1d3S85LE
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline



We have an embedded Linux product which uses an ST 29W320DB flash part. To get
this to work we needed to make the changes below to the driver.

- Turned off the AMD_BOOTLOC_BUG fix. This chip matches the bug test criteria in
the code which was then swapping the sectors. This chip does not suffer from
this bug so it it doesn't work with the bug fix enabled. It would be a good idea
to make the bug test criteria test against a specific list of vendor &
deviceid's which chips require the bug fix the current check is too broad.
Unfortunately the present fix does not provide enough information to create this
list.

- Added a 3-byte reset sequence in addition to the normal 1-byte command. The
documentation for the chip suggests that the 1-byte command should work, but the
chip gets left in the id-mode after the probe. Hopefully this extra reset should
not cause problems for any other devices.

     Jon Burgess

--- drivers/mtd/chips/cfi_cmdset_0002.c~      Tue Nov  6 07:56:00 2001
+++ drivers/mtd/chips/cfi_cmdset_0002.c  Wed Jul 17 13:51:48 2002
@@ -26,7 +26,8 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>

-#define AMD_BOOTLOC_BUG
+/* This bug work around doesn't seem necessary and breaks ST 29W320DB */
+#undef AMD_BOOTLOC_BUG

 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char
 *);
 static int cfi_amdstd_write(struct mtd_info *, loff_t, size_t, size_t *, const
u_char *);
@@ -137,7 +138,12 @@
     map->fldrv = &cfi_amdstd_chipdrv;
     MOD_INC_USE_COUNT;

+    /* Short reset command */
     cfi_send_gen_cmd(0xf0, 0x55, base, map, cfi, cfi->device_type, NULL);
+    /* Longer reset command - ST 29W320DB flash device seems to require this */
+    cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
+    cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
+    cfi_send_gen_cmd(0xf0, 0x555, base, map, cfi, cfi->device_type, NULL);
     return cfi_amdstd_setup(map);
 }


(See attached file: cfi-sst.patch)

--0__=UocjoDiRQQvC3ZOySpWTcbGg9vIXNv5QgI5SKL8B43bWGiWo1d3S85LE
Content-type: application/octet-stream;
	name="cfi-sst.patch"
Content-Disposition: attachment; filename="cfi-sst.patch"
Content-transfer-encoding: base64

LS0tIGxpbnV4L2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jfglUdWUgTm92ICA2
IDA3OjU2OjAwIDIwMDEKKysrIGxpbnV4L2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAw
Mi5jCVdlZCBKdWwgMTcgMTM6NTE6NDggMjAwMgpAQCAtMjYsNyArMjYsOCBAQAogI2luY2x1ZGUg
PGxpbnV4L210ZC9tYXAuaD4KICNpbmNsdWRlIDxsaW51eC9tdGQvY2ZpLmg+CiAKLSNkZWZpbmUg
QU1EX0JPT1RMT0NfQlVHCisvKiBUaGlzIGJ1ZyB3b3JrIGFyb3VuZCBkb2Vzbid0IHNlZW0gbmVj
ZXNzYXJ5IGFuZCBicmVha3MgU1QgMjlXMzIwREIgKi8KKyN1bmRlZiBBTURfQk9PVExPQ19CVUcK
IAogc3RhdGljIGludCBjZmlfYW1kc3RkX3JlYWQgKHN0cnVjdCBtdGRfaW5mbyAqLCBsb2ZmX3Qs
IHNpemVfdCwgc2l6ZV90ICosIHVfY2hhciAqKTsKIHN0YXRpYyBpbnQgY2ZpX2FtZHN0ZF93cml0
ZShzdHJ1Y3QgbXRkX2luZm8gKiwgbG9mZl90LCBzaXplX3QsIHNpemVfdCAqLCBjb25zdCB1X2No
YXIgKik7CkBAIC0xMzcsNyArMTM4LDEyIEBACiAJbWFwLT5mbGRydiA9ICZjZmlfYW1kc3RkX2No
aXBkcnY7CiAJTU9EX0lOQ19VU0VfQ09VTlQ7CiAKKwkvKiBTaG9ydCByZXNldCBjb21tYW5kICov
CiAJY2ZpX3NlbmRfZ2VuX2NtZCgweGYwLCAweDU1LCBiYXNlLCBtYXAsIGNmaSwgY2ZpLT5kZXZp
Y2VfdHlwZSwgTlVMTCk7CisJLyogTG9uZ2VyIHJlc2V0IGNvbW1hbmQgLSBTVCAyOVczMjBEQiBm
bGFzaCBkZXZpY2Ugc2VlbXMgdG8gcmVxdWlyZSB0aGlzICovCisJY2ZpX3NlbmRfZ2VuX2NtZCgw
eGFhLCAweDU1NSwgYmFzZSwgbWFwLCBjZmksIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOworCWNm
aV9zZW5kX2dlbl9jbWQoMHg1NSwgMHgyYWEsIGJhc2UsIG1hcCwgY2ZpLCBjZmktPmRldmljZV90
eXBlLCBOVUxMKTsKKwljZmlfc2VuZF9nZW5fY21kKDB4ZjAsIDB4NTU1LCBiYXNlLCBtYXAsIGNm
aSwgY2ZpLT5kZXZpY2VfdHlwZSwgTlVMTCk7CiAJcmV0dXJuIGNmaV9hbWRzdGRfc2V0dXAobWFw
KTsKIH0KIAo=

--0__=UocjoDiRQQvC3ZOySpWTcbGg9vIXNv5QgI5SKL8B43bWGiWo1d3S85LE--
