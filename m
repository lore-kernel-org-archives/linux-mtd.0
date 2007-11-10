Received: from nf-out-0910.google.com ([64.233.182.189])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqpKG-0008Rs-4A
	for linux-mtd@lists.infradead.org; Sat, 10 Nov 2007 07:20:42 -0500
Received: by nf-out-0910.google.com with SMTP id h3so634957nfh
	for <linux-mtd@lists.infradead.org>;
	Sat, 10 Nov 2007 04:20:34 -0800 (PST)
Message-ID: <63937a040711100420r177bf333y1e441a15c54bcaa3@mail.gmail.com>
Date: Sat, 10 Nov 2007 15:50:34 +0330
From: "farajian amin" <amin.farajian@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Multiple errors during erase and write to flash
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

we have an embedded board with 256MB DDR and 64MB
strataflash(TE28F64J3C-120). I tried to use physmap general driver
which can statically defined from menuconfig with these parameters:
(0x20000000=phys startaddr of flash)
---------------------------------------------------------------
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBODSE=3
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_UTILS=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x20000000
CONFIG_MTD_PHYSMAP_LEN=0x1000000
CONFIG_MTD_PHYSMAP_BANKWIDTH=2
-----------------------------------------
we tried to access more than 16MB (0x1000000) of flash, but it gives
ioremap errors. By the way, we recive he followings after starting
linux about flash:
-----------------------------------------
FFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2006 Red Hat, Inc.
JFFS2: default compression mode: priority
io scheduler noop registered
io scheduler cfq registered (default)
Serial: Leon driver, author: Mehdi Aminian
ttyS0 at MMIO 0x15000000 (irq = 8) is a Leon
RAMDISK driver initialized: 2 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
physmap platform flash device: 01000000 at 20000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available

-------------------------------------------------
after that we could see mtd device in /proc

  ----------

cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00020000 "physmap-flash.0 "

  ----------

 after that we added char and block device by the following commands:

 mknod /dev/mtd0 c 90 0
 mknod /dev/mtdblock0 b 31 0

 -----------

 Then we used flash_eraseall utility from mtd_utils package as follows

     #./flash_eraseall /dev/mtd0
          MTD_open
          MTD_ioctl
          MTD_ioctl
          Erasing 128 Kibyte @ 0 --  0 % complete.MTD_ioctl
          Erasing 128 Kibyte @ 20000 --  0 % complete.MTD_ioctl

-----------------

then we decided to mount  blockdevice with following command till we
recived the following messages:

       # mount -t jffs2 /dev/mtdblock0 /mnt
                       Newly-erased block contained word 0x0 at offset
0x00fc0000
                        .....
                       Newly-erased block contained word 0x0 at offset
0x00020000
                       Newly-erased block contained word 0x0 at offset
0x00000000
                       Newly-erased block contained word 0x0 at offset
0x00fe0000
-------------------------------------
But we could see the output of "df" command as follows: (with the
above messages it was strange)
    #df
    Filesystem           1k-blocks      Used Available Use% Mounted on
    /dev/mtdblock0           16384       644     15740   4% /mnt
--------------------------------------
After that we tried to copy a file to /mnt and we recieve a more
strange error as below:

   #cp flashcp /mnt
      JFFS2 error: (28) __jffs2_dbg_prewrite_paranoia_check: argh,
about to write node  to 0xfc000c on flash, but there are data already
  there. The first corrupted byte is at 0xfc0050 offset.
------------------------------------
when we use flash_eraseall with -j parameter we will get the following error:
  JFFS2: Erase block at 0x001c0000 is not formatted. It will be erased
  JFFS2: Erase block at 0x001e0000 is not formatted. It will be erased
  Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
  empty_blocks 0, bad_blocks 0, c->nr_blocks 16
  mount: Mounting /dev/mtdblock1 on /mnt/p2 failed: Input/output error

-----------------------------------

Any help will be appretiated....
