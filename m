Received: from qw-out-1920.google.com ([74.125.92.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LyXy3-0003eO-LS
	for linux-mtd@lists.infradead.org; Mon, 27 Apr 2009 21:02:31 +0000
Received: by qw-out-1920.google.com with SMTP id 4so141513qwk.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Apr 2009 14:02:21 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 27 Apr 2009 16:02:21 -0500
Message-ID: <587a08410904271402h6e9cf4fl8d4bb843cd03990f@mail.gmail.com>
Subject: Mounting NAND flash as the root file system
From: Jatin Sharma <sharmaj@gmail.com>
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

Hello,
I am working with Kernel  2.6.10 and am having issues with mounting
the NAND fs.

The kernel is able mount is ramdisk when the file system is embedded
in the kernel. My task is to boot the board from NOR and have the NAND
FS mounted once it has booted. From the kernel logs, it seems the NAND
driver is able to identify the chip.

<6>io scheduler cfq registered
RAMDISK driver initialized: 1 RAM disks of 20000K size 1024 blocksize
<6>loop: loaded (max 8 devices)
WP-SED: Initializing Ethernet card...
get_ethernet_addr: 00:00:77:b3:61:b8
WP-SED: Ethernet card initialized.
BCM> Registering BCM driver with major 244
<6>elevator: using anticipatory as default io scheduler
<5>Interphase NAND Flash chip @ bd400000 CE  <5>(using Interphase NAND
command handler)
Nand Base address = bd400000
Device ready = 1
Read NAND Status Register = 0xe0
Set NAND protection and read status  = 0x60
Clear NAND protection and read status  = 0xe0
<5>NAND Clear Write protect
<6>NAND device: Manufacturer ID: 0x20, Chip ID: 0xd3 (ST Micro NAND
1GiB 3,3V 8-bit)
<6>Scanning device for bad blocks
<4>Bad eraseblock 290 at 0x02440000
<4>Bad eraseblock 1058 at 0x08440000
<4>Bad eraseblock 2328 at 0x12300000
<4>Bad eraseblock 3049 at 0x17d20000
<4>Bad eraseblock 3780 at 0x1d880000
<4>Bad eraseblock 5249 at 0x29020000
<4>Bad eraseblock 7051 at 0x37160000
<5>Using static partition definition
<5>Creating 1 MTD partitions on "NAND 1GiB 3,3V 8-bit":
<5>0x00000000-0x20000000 : "NAND Flash0"
<6>mtd: Giving out device 0 to NAND Flash0
<5>Sizes: page=2048B OOB=64B Chip=1024MB (8b wide)


When I boot the kernel using ramdisk (FS in RAM), I am able to run the
flash_eraseall utility successfully. But the mount command fails:

WDS# mount -t jffs2 /dev/mtd0 /mnt
mount: mounting /dev/mtd0 on /mnt failed

Before mounting, I have written a jffs2.img (same as that from
ramdisk.gz) to this partition using nandwrite command:

# /usr/bin/nandwrite /dev/mtd0 /mnt/nfs/jffs2.img

Being fairly new to this area, I am curious how can I debug the mount
problem. Once I am able to mount this jffs2.img, I will try to boot
into it.


Thanks,
Jatin
