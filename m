Received: from palrel13.hp.com ([156.153.255.238])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACTeL-0007ms-Kz
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 01:48:25 +0100
From: "Christopher Hoover" <ch@hpl.hp.com>
To: <tharbaugh@lnxi.com>
Date: Wed, 22 Oct 2003 17:43:44 -0700
Message-ID: <001201c398fe$b6d567a0$d203b60f@duckduck>
MIME-Version: 1.0
In-Reply-To: <1066863067.6281.197.camel@tubarao>
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
cc: ch@murgatroid.com
cc: 'mtd list' <linux-mtd@lists.infradead.org>
Subject: RE: Regression of mtd/chips/jedec_probe.c in 2.6.0-test7
Reply-To: ch@hpl.hp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> There's one more fragment where cfi->device_type should
> revert back to CFI_DEVICETYPE_X8

OK, now I'm confused.  Revert *back* to CFI_DEVICETYPE_X8?

I though we were going the other direction.

Appended is the last diff (n.b., original vs new) I tried.  It changes that
last fragment *from* CFI_DEVICETYPE_X8 *to* cfi->device_type -- it still
fails.  

The boot messages show different ids:

Search for id:(70 e3a0) interleave(1) type(2)
Search for id:(70 e3a0) interleave(1) type(2)
Search for id:(70 e3a0) interleave(1) type(2)
Search for id:(01 5b) interleave(2) type(1)
Search for id:(01 5b) interleave(2) type(1)
Search for id:(70 a0) interleave(2) type(1)
Search for id:(70 f10) interleave(2) type(2)
Search for id:(70 f10) interleave(2) type(2)
Search for id:(70 f10) interleave(2) type(2)
JEDEC: Found no ceiva flash device at location zero
clps_setup_mtd: do_map_probe failed to find flash

And before we found it fails with that last fragment left as is (i.e.
CFI_DEVICETYPE_X8).

-ch


--- linux-2.6.0-test8-rmk1/drivers/mtd/chips/jedec_probe.c	2003-10-20
22:19:24.000000000 -0700
+++ linux-2.6.0-test8-rmk1-ceiva1/drivers/mtd/chips/jedec_probe.c
2003-10-22 17:26:35.000000000 -0700
@@ -1481,7 +1481,7 @@
 	DEBUG( MTD_DEBUG_LEVEL3,
 	       "MTD %s(): Check fit 0x%.8x + 0x%.8x = 0x%.8x\n",
 	       __func__, base, 1 << finfo->DevSize, base + (1 <<
finfo->DevSize) );
-	if ( base + ( 1 << finfo->DevSize ) > map->size ) {
+	if ( base + cfi->interleave * ( 1 << finfo->DevSize ) > map->size )
{
 		DEBUG( MTD_DEBUG_LEVEL3,
 		       "MTD %s(): 0x%.4x 0x%.4x %dKiB doesn't fit\n",
 		       __func__, finfo->mfr_id, finfo->dev_id,
@@ -1539,10 +1539,10 @@
 	 */
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__
);
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
cfi->device_type, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
 	/* FIXME - should have a delay before continuing */
 
  match_done:	
@@ -1614,10 +1614,10 @@
 
 	/* Autoselect Mode */
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
cfi->device_type, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
 	/* FIXME - should have a delay before continuing */
 
 	if (!cfi->numchips) {
