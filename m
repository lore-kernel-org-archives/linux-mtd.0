Received: from rv-out-0708.google.com ([209.85.198.250])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWzfW-0007Pr-Qe
	for linux-mtd@lists.infradead.org; Fri, 31 Jul 2009 21:29:45 +0000
Received: by rv-out-0708.google.com with SMTP id c5so172212rvf.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 31 Jul 2009 14:29:37 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 31 Jul 2009 14:29:37 -0700
Message-ID: <110c8b2e0907311429k26d23f10jb220a4afdf89e949@mail.gmail.com>
Subject: Trouble getting MTD to run -- permission denied messages
From: Subodh Nijsure <nijsure.subodh@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have defined my NOR flash layout as follows I am able to see the
contents of the flash when I do

dd=/dev/mtdblock1 of=/tmp/myflash

However I created a jffs2 image on my workstation and tried to "burn"
it to flash by executing following command  and I see messages "This
doesn't seem to be valid MTD flash device.

# ./flashcp /initrd.jffs2 /dev/mtdblock1
mtdblock_open
ok
This doesn't seem to be a valid MTD flash device!
mtdblock_release
ok

Also mtdinfo -a display following message

# /mtd/mtdinfo -a
Count of MTD devices:           3
MTD_open
libmtd: error!: cannot open "/dev/mtd0"
        error 13 (Permission denied)
mtdinfo: error!: libmtd failed get MTD device 0 information
         error 13 (Permission denied)

I must have missed some basic step in getting things setup for NOR
flash, would appreciate a nudge in right direction...



static struct mtd_partition my_flash_partitions[] = {
        {
                .name = "Linux",
                .offset = RW_PART2_OF,
                .size = RW_PART2_SZ,
                .mask_flags = MTD_WRITEABLE
        },
        {
                .name = "ramdisk",
                .offset = RW_PART3_OF,
                .size = RW_PART3_SZ,
                .mask_flags = MTD_WRITEABLE
        },
};


struct map_info my_flash_map = {
        .name = "My device",
        .size = WINDOW_SIZE,
        .bankwidth = 2,
        .phys = WINDOW_ADDR,
};


When I boot my board I see following messages :

flash mapping: size 0600000 at 0xc1400000
Found 1 x16 devices at 0x0 in 16-bit bank
NOR chip too large to fit in mapping. Attempting to cope...
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
Using auto-unlock on power-up/resume
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x8000,blocks=4
erase region 1: offset=0x20000,size=0x20000,blocks=255
Reducing visibility of 32768KiB chip to 6144KiB
Creating 2 MTD partitions on "My Device":
0x00000000-0x00300000 : "Linux"
mtd: Giving out device 0 to Linux
0x00300000-0x00600000 : "ramdisk"
mtd: Giving out device 1 to ramdisk


/Subodh
