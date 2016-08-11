To: linux-mtd@lists.infradead.org, u-boot@lists.denx.de,
 lede-dev@lists.infradead.org
From: J Mo <jmomo@jmomo.net>
Subject: Older u-boot mangles UBI from ubinize 1.5.2
Message-ID: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
Date: Wed, 10 Aug 2016 19:26:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Greetings

I am attempting to port LEDE/OpenWRT to a new device; the TRENDnet 
TEW-827DRU, which is a IPQ806X-based (AP148) system. It has a NAND flash 
for storage with a UBI (kernel + squashfs + ubifs).

When my system attempts to attach the UBI, I see the following error 
from linux:


[    3.781181] ubi0: attaching mtd11
[    3.835224] UBI: EOF marker found, PEBs from 40 will be erased
[    3.835384] ubi0: scanning is finished
[    3.840040] ubi0 error: ubi_read_volume_table: the layout volume was 
not found
[    3.844072] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd11, 
error -22
[    3.850897] UBI error: cannot attach mtd11



I took this to google and it turns out that Ram Chandra Jangir here had 
noted the same issue a few months back, and then I got lucky and saw his 
patches yesterday:

     https://patchwork.ozlabs.org/patch/657285/
     https://patchwork.ozlabs.org/patch/624733/



I emailed Ram and he sent me his boot log and it looks identical to 
mine, so I think it's the same issue. (thx again Ram!)

I tried re-flashing my UBI and tftpbooting my kernel before u-boot could 
ever get a chance to mangle it, and now I get much further, though I'm 
still not able to mount my rootfs for unknown reasons:

     [    3.772502] ubi0: attaching mtd11
     [    3.826477] UBI: EOF marker found, PEBs from 40 will be erased
     [    3.826638] ubi0: scanning is finished
     [    3.872936] ubi0: volume 2 ("rootfs_data") re-sized from 9 to 
430 LEBs
     [    3.873734] ubi0: attached mtd11 (name "rootfs", size 64 MiB)
     [    3.878347] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 
126976 bytes
     [    3.884234] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page 
size 2048
     [    3.890936] ubi0: VID header offset: 2048 (aligned 2048), data 
offset: 4096
     [    3.897849] ubi0: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0
     [    3.904627] ubi0: user volume: 3, internal volumes: 1, max. 
volumes count: 128
     [    3.910815] ubi0: max/mean erase counter: 1/0, WL threshold: 
4096, image sequence number: 2142265782
     [    3.917902] ubi0: available PEBs: 0, total reserved PEBs: 512, 
PEBs reserved for bad PEB handling: 40
     [    3.927275] ubi0: background thread "ubi_bgt0d" started, PID 54
     [    3.937007] block ubiblock0_1: created from ubi0:1(rootfs)
     [    3.942096] hctosys: unable to open rtc device (rtc0)
     [    3.956528] VFS: Cannot open root device "ubi0:rootfs" or 
unknown-block(31,11): error -2
     [    3.956556] Please append a correct "root=" boot option; here 
are the available partitions:



Any advice on this? Any background information that I can read up on? My 
google searches have not come up with much. Ram knew about this, but I 
don't know if it's otherwise a known issue.

The process works fine on the OEM system, so I assume this is some 
ubinize format change which is incompatible with the older u-boot. Or, 
the newer kernel code doesn't know how to deal with the UBI once the 
older u-boot has mangled/attached it.

Seems like a backwards incompatibility issue.

Just to be clear, my kernel is inside the UBI, so u-boot must attach the 
UBI and read the volume to boot.

Rebuilding and replacing my u-boot is probably not possible for now, 
though I do have the OEM source. My device has a jtag, but I have not 
tested it and that's out of my league.



Additional info below:

--

My u-boot version: U-Boot 2012.07 [Standard IPQ806X.LN,r40331]

The old OEM ubinize is 1.2 from mtd-utils-1.4.5.

The old OEM kernel is 3.4.103. New kernel is 4.4.15.

LEDE built from commit 21f460a5dbef5e3ec59e2032b5b113fe045b475f

The new LEDE ubinize version is 1.5.2. The ubinize command (via LEDE's 
ubinize-image.sh script) to build my image was (paths truncated for 
readability):

ubinize-image.sh  --kernel .../TEW827DRU-uImage .../root.squashfs 
.../lede-ipq806x-TEW827DRU-squashfs-factory.bin.tmp -p 128KiB -m 2048   -E 5

Notably the new LEDE ubinize command uses "-E 5" whereas the old OEM 
does not, but I don't think that's related.

The ubinize.ini file looked like:

[kernel]
mode=ubi
vol_id=0
vol_type=dynamic
vol_name=kernel
image=/.../TEW827DRU-uImage
[rootfs]
mode=ubi
vol_id=1
vol_type=dynamic
vol_name=rootfs
image=/.../root.squashfs
[rootfs_data]
mode=ubi
vol_id=2
vol_type=dynamic
vol_name=rootfs_data
vol_size=1MiB
vol_flags=autoresize
