Received: from smtp.seznam.cz ([212.80.76.43])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G9eMp-0002OH-QH
	for linux-mtd@lists.infradead.org; Sun, 06 Aug 2006 04:52:26 -0400
Message-ID: <44D5ADBE.7090704@seznam.cz>
Date: Sun, 06 Aug 2006 10:52:14 +0200
From: Frantisek Dufka <dufkaf@seznam.cz>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nandwrite -j -f made all flashed blocks bad (twice)
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I played few times with nandwrite and two times with flash_eraseall on 
mtd3 partition on my device and later found my mtd3 partition grew from 
2MB to 5MB (and overflowed into mtd4 partition and made it shorter) 
having now 3MB of bad blocks.

Hardware is Nokia 770 (http://www.nokia.com/770 http://www.maemo.org) - 
OMAP1710 based device with  omap-hw-nand: OMAP NAND Controller rev. 1.1 
and NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 
128MiB 1,8V 8-bit)

This device has binary only flasher executable which can flash mtd 
partitions from PC over USB. I tried to find another way and flash 
device directly from itself by using nandwrite and flash_erasall 
compiled from mtd utils 1.0 source.

I did read the documentation and FAQ at www.linux-mtd.infradead.org but 
looks like I still screwed something. I tried to flash 1574084 bytes 
long jffs2 image made by
'mkfs.jffs2 -r initfs -o initfs.bootmenu.jffs2 -e 128 -l -n' command to 
2MB big partition /dev/mtd3.

First I tried 'nandwrite /dev/mtd3 initfs.bootmenu.jffs2' without any 
error but the result did not boot. So I flashed it over USB with 
proprietary flasher and it worked. Then I tried nandwrite -j -f since it 
is jffs2 image and previous attempt failed. I had to use -f with -j 
otherwise it didn't work. This did not boot too so I again flashed it 
over USB to make it working.

Then I found in mailing list that I should use flash_eraseall before 
using nandwrite 
http://lists.infradead.org/pipermail/linux-mtd/2005-February/012040.html
So I tried 'flash_eraseall -j /dev/mtd3' and saw

Nokia770-26:~# ./flash_eraseall -j /dev/mtd3

Skipping bad block at 0x00000000
Erasing 128 Kibyte @ 20000 --  3 % complete. Cleanmarker written at 20000.
Skipping bad block at 0x00040000

Skipping bad block at 0x00060000

Skipping bad block at 0x00080000

Skipping bad block at 0x000a0000

Skipping bad block at 0x000c0000

Skipping bad block at 0x000e0000

Skipping bad block at 0x00100000

Skipping bad block at 0x00120000

Skipping bad block at 0x00140000

Skipping bad block at 0x00160000

Skipping bad block at 0x00180000
Erasing 128 Kibyte @ 360000 -- 96 % complete. Cleanmarker written at 360000.

This is the first time I found there is something seriously wrong but 
don't know when those (1.5MB of) bad blocks were made. Either by using 
nandwrite before without erasing it or by recovering device with nokia 
flasher or by using flash_eraseall now. Also dmesg output is interesting

[   14.708068] omap-hw-nand: OMAP NAND Controller rev. 1.1
[   14.708251] NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 
(Samsung NAND 128MiB 1,8V 8-bit)
[   14.708465] omap-hw-nand: using PSC values 2, 2, 3
[   14.708557] Scanning device for bad blocks
[   14.709472] Bad eraseblock 20 at 0x00280000
[   14.709625] Bad eraseblock 22 at 0x002c0000
[   14.709747] Bad eraseblock 23 at 0x002e0000
[   14.709838] Bad eraseblock 24 at 0x00300000
[   14.709960] Bad eraseblock 25 at 0x00320000
[   14.710083] Bad eraseblock 26 at 0x00340000
[   14.710205] Bad eraseblock 27 at 0x00360000
[   14.710327] Bad eraseblock 28 at 0x00380000
[   14.710449] Bad eraseblock 29 at 0x003a0000
[   14.710571] Bad eraseblock 30 at 0x003c0000
[   14.710693] Bad eraseblock 31 at 0x003e0000
[   14.710815] Bad eraseblock 32 at 0x00400000
[   14.744750] 5 cmdlinepart partitions found on MTD device omap-nand
[   14.744873] Creating 5 MTD partitions on "omap-nand":
[   14.745025] 0x00000000-0x00020000 : "bootloader"
[   14.746643] 0x00020000-0x00080000 : "config"
[   14.748138] 0x00080000-0x00280000 : "kernel"
[   14.749633] 0x00280000-0x00600000 : "initfs"
[   14.751098] 0x00600000-0x08000000 : "root"

I believe before I started to mess with device initfs location was
0x00280000-0x00480000 : "initfs"

I tried similar thing again (nandwrite -j,usb flash,flash_eraseall) and 
ended with exactly same flash_eraseall output now having 3MBytes of bad 
blocks.
Incomplete dmesg output after 2nd attempt:
Nokia770-26:~# dmesg
0x00360000
[    1.985870] Bad eraseblock 28 at 0x00380000
[    1.985992] Bad eraseblock 29 at 0x003a0000
[    1.986114] Bad eraseblock 30 at 0x003c0000
[    1.986236] Bad eraseblock 31 at 0x003e0000
[    1.986358] Bad eraseblock 32 at 0x00400000
[    1.986511] Bad eraseblock 34 at 0x00440000
[    1.986633] Bad eraseblock 35 at 0x00460000
[    1.986755] Bad eraseblock 36 at 0x00480000
[    1.986846] Bad eraseblock 37 at 0x004a0000
[    1.986968] Bad eraseblock 38 at 0x004c0000
[    1.987091] Bad eraseblock 39 at 0x004e0000
[    1.987213] Bad eraseblock 40 at 0x00500000
[    1.987335] Bad eraseblock 41 at 0x00520000
[    1.987457] Bad eraseblock 42 at 0x00540000
[    1.987579] Bad eraseblock 43 at 0x00560000
[    1.987701] Bad eraseblock 44 at 0x00580000
[    2.021270] 5 cmdlinepart partitions found on MTD device omap-nand
[    2.021423] Creating 5 MTD partitions on "omap-nand":
[    2.021514] 0x00000000-0x00020000 : "bootloader"
[    2.023132] 0x00020000-0x00080000 : "config"
[    2.024627] 0x00080000-0x00280000 : "kernel"
[    2.026153] 0x00280000-0x00780000 : "initfs"
[    2.027587] 0x00780000-0x08000000 : "root"

So now the device still works when booting rootfs from MMC card, root 
mtd4 partition is not booting (the beginning is moved from 0x00480000 to 
0x00780000), I have made lot of bad blocks and still don't know how to 
flash device from itself or what exactly I did wrong. Any ideas?

Also is it possible that it didn't work because mtdblock3 is mounted 
read only and one process is running from it? Since jffs2 is compressed 
and it is small executable I suppose it is completely in RAM. It cannot 
be stopped easily and device unmounted. It is some proprietary Nokia 
stuff that controls hardware (charging,backlight) and also controlls 
watchdog that reboots device if this or any other vital process dies.

What is also puzzling it that eraseblocks  21 and 33 (i.e. block at 
0x00020000 when using flash_eraseall both times) are OK. Why?


I suppose nandwrite -j -f was the bad thing that made those bad blocks, 
correct? Any way how can I get those 'bad' blocks back? I suppose they 
are good but have some wrong data pattern in oob area which makes them 
bad when scanning. Or are they really bad?

Erasing bad block is not possible in current kernel, could commenting 
out this check in nand_erase_nand kernel source help to reset those 
block to usable state? Since I screwed it many times I'd like to have 
some insight from someone more skilled before going any further. Thanks 
for any helpful tips or ideas.

Frantisek
