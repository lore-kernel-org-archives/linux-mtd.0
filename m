Received: from usti.fccps.cz ([194.108.74.250])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ClLxu-0003Jd-6q
	for linux-mtd@lists.infradead.org; Mon, 03 Jan 2005 01:45:19 -0500
Received: from localhost (localhost [127.0.0.1])
	by usti.fccps.cz (Postfix) with ESMTP id 4B0A777C89
	for <linux-mtd@lists.infradead.org>;
	Mon,  3 Jan 2005 07:45:16 +0100 (CET)
Received: from usti.fccps.cz ([127.0.0.1])
	by localhost (usti [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 16200-02 for <linux-mtd@lists.infradead.org>;
	Mon,  3 Jan 2005 07:45:14 +0100 (CET)
Received: from frr (unknown [10.0.0.238])
	by usti.fccps.cz (Postfix) with ESMTP id B0C6277C85
	for <linux-mtd@lists.infradead.org>;
	Mon,  3 Jan 2005 07:45:14 +0100 (CET)
From: "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To: linux-mtd@lists.infradead.org
Date: Mon, 03 Jan 2005 07:49:07 +0100
MIME-Version: 1.0
Content-type: Multipart/Mixed; boundary=Message-Boundary-18861
Message-ID: <41D8F8F3.13501.243F9136@localhost>
Subject: (Fwd) several bugfixes/workarounds in mtd snapshot of 20041226
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Message-Boundary-18861
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Dear MTD maintainers,

I suggest several bugfixes and workarounds against the 
snapshot of 20041226 (inserted into a vanilla 2.4.28) - see 
the attached patch.
I hope it's not a problem that my message is posted a few days
later than I would've liked - I didn't notice I had to 
subscribe to be able to post :-)

I'm using DiskOnChip devices in various sorts of Advantech 
hardware. I'm compiling my MTD drivers for the DiskOnChip 
alone - I don't want to include all the other MTD stuff 
(useless to me).

Bugs fixed / worked around:

1) if you flush the partition table and issue a BLKRRPART 
(i.e., you re-partition the diskonchip), the reported device 
size shrinks to one half of the original. If you do this again 
before a reboot, the size shrinks again (now one quarter).
Seems like the driver would re-init device size to a size denominated in 1k blocks,
rather than sectors (512B).

2) in my DiskOnChip-only setup, CONFIG_MTD_MAP_BANK_WIDTH_1 
is missing in the .config. I've added that straight to $LINUX/include/linux/map.h

3) two #includes seem to be missing in $MTD/nand/diskonchip.c

4) the Reed-Solomon library hooks are messed up in $LINUX/lib/Config.in

I hope this helps

Frank Rysanek


--Message-Boundary-18861
Content-type: Application/Octet-stream; name="-"; type=Plain text
Content-disposition: attachment; filename="-"
Content-transfer-encoding: BASE64

RGVhciBNVEQgbWFpbnRhaW5lcnMsDQoNCkkgc3VnZ2VzdCBzZXZlcmFsIGJ1Z2ZpeGVzIGFu
ZCB3b3JrYXJvdW5kcyBhZ2FpbnN0IHRoZSANCnNuYXBzaG90IG9mIDIwMDQxMjI2IChpbnNl
cnRlZCBpbnRvIGEgdmFuaWxsYSAyLjQuMjgpIC0gc2VlIA0KdGhlIGF0dGFjaGVkIHBhdGNo
Lg0KDQpJJ20gdXNpbmcgRGlza09uQ2hpcCBkZXZpY2VzIGluIHZhcmlvdXMgc29ydHMgb2Yg
QWR2YW50ZWNoIA0KaGFyZHdhcmUuIEknbSBjb21waWxpbmcgbXkgTVREIGRyaXZlcnMgZm9y
IHRoZSBEaXNrT25DaGlwIA0KYWxvbmUgLSBJIGRvbid0IHdhbnQgdG8gaW5jbHVkZSBhbGwg
dGhlIG90aGVyIE1URCBzdHVmZiANCih1c2VsZXNzIHRvIG1lKS4NCg0KQnVncyBmaXhlZCAv
IHdvcmtlZCBhcm91bmQ6DQoNCjEpIGlmIHlvdSBmbHVzaCB0aGUgcGFydGl0aW9uIHRhYmxl
IGFuZCBpc3N1ZSBhIEJMS1JSUEFSVCANCihpLmUuLCB5b3UgcmUtcGFydGl0aW9uIHRoZSBk
aXNrb25jaGlwKSwgdGhlIHJlcG9ydGVkIGRldmljZSANCnNpemUgc2hyaW5rcyB0byBvbmUg
aGFsZiBvZiB0aGUgb3JpZ2luYWwuIElmIHlvdSBkbyB0aGlzIGFnYWluIA0KYmVmb3JlIGEg
cmVib290LCB0aGUgc2l6ZSBzaHJpbmtzIGFnYWluIChub3cgb25lIHF1YXJ0ZXIpLg0KU2Vl
bXMgbGlrZSB0aGUgZHJpdmVyIHdvdWxkIHJlLWluaXQgZGV2aWNlIHNpemUgdG8gYSBzaXpl
IGRlbm9taW5hdGVkIGluIDFrIGJsb2NrcywNCnJhdGhlciB0aGFuIHNlY3RvcnMgKDUxMkIp
Lg0KDQoyKSBpbiBteSBEaXNrT25DaGlwLW9ubHkgc2V0dXAsIENPTkZJR19NVERfTUFQX0JB
TktfV0lEVEhfMSANCmlzIG1pc3NpbmcgaW4gdGhlIC5jb25maWcuIEkndmUgYWRkZWQgdGhh
dCBzdHJhaWdodCB0byAkTElOVVgvaW5jbHVkZS9saW51eC9tYXAuaA0KDQozKSB0d28gI2lu
Y2x1ZGVzIHNlZW0gdG8gYmUgbWlzc2luZyBpbiAkTVREL25hbmQvZGlza29uY2hpcC5jDQoN
CjQpIHRoZSBSZWVkLVNvbG9tb24gbGlicmFyeSBob29rcyBhcmUgbWVzc2VkIHVwIGluICRM
SU5VWC9saWIvQ29uZmlnLmluDQoNCkkgaG9wZSB0aGlzIGhlbHBzDQoNCkZyYW5rIFJ5c2Fu
ZWsNCg0KQXR0YWNobWVudHM6DQogIEc6XHZ5bWVuYVxtdGQtYnVncy4yMDA0MTIyNi5wYXRj
aA0K

--Message-Boundary-18861
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Text from file 'mtd-bugs.20041226.patch'

--- linux_with_mtd_bugs/drivers/mtd/mtd_blkdevs-24.c	2004-12-27 14:48:52.000000000 +0100
+++ linux/drivers/mtd/mtd_blkdevs-24.c	2004-12-29 14:32:14.000000000 +0100
@@ -315,7 +315,7 @@
 	}
 
 	grok_partitions(gd, minor, 1 << tr->part_bits, 
-			tr->blkcore_priv->sizes[minor]);
+                        dev->size);
 	up(&mtd_table_mutex);
 
 	return 0;
--- linux_with_mtd_bugs/include/linux/mtd/map.h	2004-12-27 14:48:54.000000000 +0100
+++ linux/include/linux/mtd/map.h	2004-12-27 15:33:58.000000000 +0100
@@ -14,6 +14,10 @@
 #include <asm/io.h>
 #include <asm/bug.h>
 
+#ifndef CONFIG_MTD_CFI_GEOMETRY
+#define CONFIG_MTD_MAP_BANK_WIDTH_1
+#endif
+
 #ifdef CONFIG_MTD_MAP_BANK_WIDTH_1
 #define map_bankwidth(map) 1
 #define map_bankwidth_is_1(map) (map_bankwidth(map) == 1)
--- linux_with_mtd_bugs/drivers/mtd/nand/diskonchip.c	2004-12-27 14:48:53.000000000 +0100
+++ linux/drivers/mtd/nand/diskonchip.c	2004-12-27 13:39:56.000000000 +0100
@@ -24,6 +24,8 @@
 #include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/rslib.h>
+#include <linux/moduleparam.h>
+#include <linux/rslib.h>
 #include <asm/io.h>
 
 #include <linux/mtd/mtd.h>
--- linux_with_mtd_bugs/lib/Config.in	2004-12-27 14:48:54.000000000 +0100
+++ linux/lib/Config.in	2004-12-29 14:37:35.000000000 +0100
@@ -43,13 +43,15 @@
 
 if [ "$CONFIG_MTD_DOCPROBE" = "y" -o \
      "$CONFIG_MTD_NAND_RTC_FROM4" = "y" -o \
-     "$MTD_NAND_DISKONCHIP" = "y" ]; then
+     "$CONFIG_MTD_NAND_DISKONCHIP" = "y" ]; then
    define_tristate CONFIG_REED_SOLOMON y
+   define_tristate CONFIG_REED_SOLOMON_DEC16 y
 else
   if [ "$CONFIG_MTD_DOCPROBE" = "m" -o \
      "$CONFIG_MTD_NAND_RTC_FROM4" = "m" -o \
-     "$MTD_NAND_DISKONCHIP" = "m" ]; then
+     "$CONFIG_MTD_NAND_DISKONCHIP" = "m" ]; then
      define_tristate CONFIG_REED_SOLOMON m
+     define_tristate CONFIG_REED_SOLOMON_DEC16 y
   else
      define_tristate CONFIG_REED_SOLOMON n
   fi

--Message-Boundary-18861--
