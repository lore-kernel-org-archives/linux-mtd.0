Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G5ikq-0000Fy-Do
	for linux-mtd@lists.infradead.org; Wed, 26 Jul 2006 08:44:53 -0400
Date: Wed, 26 Jul 2006 14:45:27 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Subject: fixing intel P30 finally
Message-ID: <20060726124527.GC2348@synertronixx3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Folks!

In da discussion on linux-arm-kernel in May I started to investigate how
to make intel P30 Flashes working in linux.

No I grabbed linux-2.6.16 and tried to put everything together which was
the result of the discussion in
http://marc.theaimsgroup.com/?l=linux-arm-kernel&m=114833865503774&w=2

I did the following:

--- linux-2.6.16/drivers/mtd/chips/cfi_cmdset_0001.c    2006-03-20 06:53:29.000000000 +0100
+++ 2.6.16-imx1/drivers/mtd/chips/cfi_cmdset_0001.c     2006-07-26 14:19:26.000000000 +0200
@@ -181,6 +181,17 @@
 }
 #endif
 
+static void fixup_intel_p30(struct mtd_info *mtd, void* param)
+{
+       struct map_info *map = mtd->priv;
+       struct cfi_private *cfi = map->fldrv_priv;
+       struct cfi_pri_intelext *extp = cfi->cmdset_priv;
+
+       printk(KERN_WARNING "cfi_cmdset_0001: Erasing "
+                           "Bit 512 of Feature Set on this P30.\n");
+       extp->FeatureSupport &= ~512;
+}
+
 static void fixup_st_m28w320ct(struct mtd_info *mtd, void* param)
 {
        struct map_info *map = mtd->priv;
@@ -232,6 +243,7 @@
 #endif
        { CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
        { CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
+       { CFI_MFR_ANY, 0x8922, /* 28F256P30 */ fixup_intel_p30, NULL },
        { 0, 0, NULL, NULL }
 };
 

Which indeed seems to work fine. But I get this:

Unable to handle kernel paging request at virtual address c2880000
Internal error: Oops: 7 [#1]
CPU: 0
pc : [<c00a1030>]    lr : [<c00e152c>]    Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
sp : c0201cd4  ip : c021ec00  fp : c029d200
r10: c029d2d0  r9 : c029d2d8  r8 : 00000000
r7 : c0cf4d20  r6 : c029d200  r5 : 00000000  r4 : 00000000
r3 : 00000400  r2 : 00020000  r1 : 000003ff  r0 : c2880000
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment user
Control: C000717F  Table: 08CFC000  DAC: 00000015
Stack: (0xc0201cd4 to 0xc0202000)
1cc0:                                              c0201d14 c0201d10 c01a9620 
1ce0: c01ee820 000000d0 c004d690 000200d0 00020000 008c0000 008bffff c2880000 
1d00: 00000000 00000000 00000046 00000046 c1fc0000 018c0000 c0060c68 00000001 
1d20: 000000d0 a0000013 00000000 c029d2b0 c029d2b8 c029d2a8 c029d2c0 c029d2c8 
1d40: c029d2d8 c029d2d0 c029d200 c00a46b8 c029d130 00000005 00000000 c0200000 
1d60: 00020000 00000000 c029d200 c029d000 00008400 00000001 c0c21000 c021ec00 
1d80: c00a6bc4 c029d200 c029d000 c029d2fc c029d2e0 00008400 c00a6fec c0c20000 
1da0: ffffffea 00000004 c0c20000 00008000 c0201dcc c0c21000 c0167380 c0c21000 
1dc0: c00a7214 c021ec00 c00733f8 c0c9ee48 c01b3120 c0017900 0006f000 c0c21fe8 
1de0: 00000001 00000001 00000000 a0000013 fffffff4 c0167380 00008000 c01b3f70 
1e00: c01b3f78 c01b3f20 c0c20000 c0215920 c01b3f20 fffffff4 c0167380 00008000 
1e20: c0c21000 c0201f1c c0218000 c006bc64 00008000 c0c20000 c0016000 00000000 
1e40: 00000000 c0081d04 ffffffec c01ee820 c0c2c17c c00107e0 c001e640 c0016000 
1e60: c0201e78 00000000 ffffffff c0161fac 00000017 c0201f28 0006f000 20000013 
1e80: bea3fdb4 00000001 c001e780 00000000 bea3fba4 00000060 00000000 10d277dc 
1ea0: c006e4a4 000061a0 00001000 10d277dc 00000002 10d277dc 00000002 10d277dc 
1ec0: 00000002 00000006 00000000 000000aa 00000000 0000000a 00000000 00000000 
1ee0: 000000aa 000061a0 c016443c c0200000 c0164430 00000000 c0164410 c004d358 
1f00: 00000044 00000000 00000000 c01648b0 ffffffff c0201f5c c0c21000 c03e1304 
1f20: c01b33a0 c0017900 0006f000 c0c21fe8 00000001 00000001 00000000 00000018 
1f40: c0c21000 c0201f88 c0017ec4 c0200000 bea3fdb4 00000001 c0198420 c0201f70 
1f60: 00000000 00000000 c0016000 00008000 c0017ec4 c0200000 bea3fdb4 00000001 
1f80: c0082090 c0c21000 c0c21000 c0c20000 c0218000 0006e018 00008000 bea3fc14 
1fa0: 00000015 c0017d40 0006e018 00008000 bea3feaa bea3feb9 bea3fea4 00008000 
1fc0: 0006e018 00008000 bea3fc14 0006e018 bea3fcbc 00000000 bea3fdb4 00000001 
1fe0: 4007bd88 bea3fbec 00049be4 4007bd94 20000010 bea3feaa e3700106 13e03003 
Backtrace: 
Code: 83a03b01 e1580003 2a000003 e59d0028 (e7903008) 


>>LR;  c00e152c <get_chip+c/1c0>

>>EIP; c00a1030 <$a+84/ebc>   <=====

Code;  c00a1020 <$a+74/ebc>
00000000 <_EIP>:
Code;  c00a1020 <$a+74/ebc>
   0:   01 3b                     add    %edi,(%ebx)
Code;  c00a1022 <$a+76/ebc>
   2:   a0 83 03 00 58            mov    0x58000383,%al
Code;  c00a1027 <$a+7b/ebc>
   7:   e1 03                     loope  c <_EIP+0xc>
Code;  c00a1029 <$a+7d/ebc>
   9:   00 00                     add    %al,(%eax)
Code;  c00a102b <$a+7f/ebc>
   b:   2a 28                     sub    (%eax),%ch
Code;  c00a102d <$a+81/ebc>   <=====
   d:   00 9d e5 08 30 90         add    %bl,0x903008e5(%ebp)   <=====
Code;  c00a1033 <$a+87/ebc>
  13:   e7 00                     out    %eax,$0x0



This happens when mounting the last partition with this cmdline:

console=ttySMX0,115200n8 root=/dev/mtdblock3 rootfstype=jffs2
mtdparts=scb9328_flash:128k(U-boot)ro,128k(U-boot_env),2m(kernel),5m(root),-(fs)

Bootlog:

scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erasing Bit 512 of Feature Set on this P30.
cfi_cmdset_0001: Erase suspend on write enabled
5 cmdlinepart partitions found on MTD device scb9328_flash
Creating 5 MTD partitions on "scb9328_flash":
0x00000000-0x00020000 : "U-boot"
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00240000 : "kernel"
0x00240000-0x00740000 : "root"
0x00740000-0x02000000 : "fs"

When I alter the cmdline to

console=ttySMX0,115200n8 root=/dev/mtdblock3 rootfstype=jffs2
mtdparts=scb9328_flash:128k(U-boot)ro,128k(U-boot_env),2m(kernel),5m(root),5m(fs)

Bootlog:

scb9328_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erasing Bit 512 of Feature Set on this P30.
cfi_cmdset_0001: Erase suspend on write enabled
5 cmdlinepart partitions found on MTD device scb9328_flash
Creating 5 MTD partitions on "scb9328_flash":
0x00000000-0x00020000 : "U-boot"
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00240000 : "kernel"
0x00240000-0x00740000 : "root"
0x00740000-0x00c40000 : "fs"

The mounting works and "df" show easonable results.

Where should I look next to get this beast functional?

Kind Regards, Konstantin Kletschke


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
