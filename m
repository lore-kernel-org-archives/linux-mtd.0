From: leeyang@ycig.com (leeyang)
Date: Sat, 8 Feb 2003 16:59:04 +0800
Subject: 2 bank raw flash problem
Message-ID: <001a01c2cf50$5504dab0$0200a8c0@ycigrnd.ycig.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

HW:2 bank AM29LV160B(16bit bus,2M bytes)
        And MPC860(flash connected to flash with 16bit bus wide)
1st  bank mapped at 0xFF800000-0xFF9FFFFF
2nd bank mapped at 0xFFA00000-0xFFBFFFFF
SW:kernel 2.4.20-pre7 with patch 'cvsed' from infradead.org

I want to implemnt mtd on the 2nd bank flash,and leave 1st one
unaffacted.

so I set

CONFIG_MTD_PHYSMAP_START=ffa00000
CONFIG_MTD_PHYSMAP_LEN=200000

kernel booting msg:
.............
physmap flash device: 200000 at ffa00000
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
Physically mapped flash: JEDEC Device ID is 0xC4. Assuming broken CFI table.
Physically mapped flash: Swapping erase regions for broken CFI table.
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
mtd: Giving out device 0 to Physically mapped flash
.............
seems did not find that flash.

but when I
cat /proc/mtd
it reports size 200000 and block size 10000

I try to
eraseall /dev/mtd0
it reports "no such device",I check the /dev directory,it does have mtd0-20

I also tried
od -x /dev/mtd0,
it reports almost the same thing

However if  I set
CONFIG_MTD_PHYSMAP_START=ff800000
CONFIG_MTD_PHYSMAP_LEN=400000

kernel msg:
Starting kswapd
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communications AB.
..............
physmap flash device: 400000 at ff800000
Physically mapped flash: Found 1 x16 devices at 0x200000 in 16-bit mode
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ no this line in the former msg
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
Physically mapped flash: JEDEC Device ID is 0xC4. Assuming broken CFI table.
Physically mapped flash: Swapping erase regions for broken CFI table.
number of CFI chips: 2
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
mtd: Giving out device 0 to Physically mapped flash
.............

this time seems really find 2 flashs

but when I try to erase or od  /dev/mtd0 the same as above,FAILS.

Q1:why mtd can not find 2nd flash separately?

Q2:If find the flash,why unable to operate the flash  with /dev/mtd0

and a common sense question:

AM29LV160B have 35 sectors,
31*64kbytes+1*32kbytes+2*8kbytes+1*4kbytes=2048kbytes

if block size is 64kbytes,the 4 'small-size' block will be look as a whole
one?

Best regards

leeyang
