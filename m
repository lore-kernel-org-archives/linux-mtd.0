Received: from f83.law11.hotmail.com ([64.4.17.83] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FZCH-0000KX-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 11:38:53 +0100
From: "Svend Bengt" <pastaanta@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: JEDEC flash confusion?
Date: Thu, 28 Jun 2001 10:43:51 -0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F83i95HfqR77bieLYCT000174a7@hotmail.com>
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

Hi,

What chip driver should generally be used for JEDEC flash chips? When 
looking at the MTD snapshots i found both jedec.c, cfi_jedec.c and 
amd_flash.c as possible candidates. Will there be made a "unified" JEDEC 
driver which incorporates support for all JEDEC flashes?

My own story is that I have a board with Macronix MX29F800B flash chips. I 
made it work by patching the amd_flash.c to recognize Macronix manufacturer 
ID and patching physmap.c to use amd_flash instead of cfi.

Regards,
T. Vestermark


BTW.
Here is my patch to mtd-snapshot-20010609 to include support for Macronix 
flash. I hope you can use it. (Is this an OK way to supply patches?)

diff -r -C3 -P mtd_original/drivers/mtd/chips/amd_flash.c 
mtd/drivers/mtd/chips/amd_flash.c
*** mtd_original/drivers/mtd/chips/amd_flash.c Sun Jun  3 00:00:07 2001
--- mtd/drivers/mtd/chips/amd_flash.c Sun Jun 17 19:13:48 2001
***************
*** 51,56 ****
--- 51,57 ----
  #define MANUFACTURER_ST  0x0020
  #define MANUFACTURER_SST 0x00BF
  #define MANUFACTURER_TOSHIBA 0x0098
+ #define MANUFACTURER_MACRONIX   0x00C2

  /* AMD */
  #define AM29F800BB 0x2258
***************
*** 416,421 ****
--- 417,434 ----
     { offset: 0x010000, erasesize: 0x10000, numblocks: 15 }
    }
   }, {
+   mfr_id: MANUFACTURER_MACRONIX,
+   dev_id: AM29F800BB,
+   name: "Macronix MX29F800B",
+   size: 0x00100000,
+   numeraseregions: 4,
+   regions: {
+    { offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
+    { offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
+    { offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
+    { offset: 0x010000, erasesize: 0x10000, numblocks: 15 }
+   }
+  }, {
    mfr_id: MANUFACTURER_AMD,
    dev_id: AM29LV800BT,
    name: "AMD AM29LV800BT",
***************
*** 431,436 ****
--- 444,461 ----
    mfr_id: MANUFACTURER_AMD,
    dev_id: AM29F800BT,
    name: "AMD AM29F800BT",
+   size: 0x00100000,
+   numeraseregions: 4,
+   regions: {
+    { offset: 0x000000, erasesize: 0x10000, numblocks: 15 },
+    { offset: 0x0F0000, erasesize: 0x08000, numblocks:  1 },
+    { offset: 0x0F8000, erasesize: 0x02000, numblocks:  2 },
+    { offset: 0x0FC000, erasesize: 0x04000, numblocks:  1 }
+   }
+  }, {
+   mfr_id: MANUFACTURER_MACRONIX,
+   dev_id: AM29F800BT,
+   name: "Macronix MX29F800T",
    size: 0x00100000,
    numeraseregions: 4,
    regions: {


_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
