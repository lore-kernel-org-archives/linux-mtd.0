Received: from smtpuni.servlinks.com ([38.127.70.215])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TdTeN-0002CQ-FV
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2012 22:29:09 +0000
Message-ID: <50B53ED3.6030503@douville.org>
Date: Tue, 27 Nov 2012 17:29:39 -0500
From: <linux-mtd@douville.org>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: UBI error -74 (ECC error)
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I am making a ubi/ubifs image for an AM335x board. When I flash using 
UBI tools (ubiformat / ubiupdatevol) from Linux, it works fine. I can 
flash either the ubi or the ubifs image without any issue.

However I also need to be able to flash from the boot loader (u-boot) on 
first boot.
Both flash_eraseall/nandwrite from Linux and u-boot's nand erase + nand 
write commands give me this error when booting the kernel:

[    1.487209] UBIFS: mounted UBI device 0, volume 0, name "root"
[    1.493306] UBIFS: mounted read-only
[    1.497061] UBIFS: file system size:   18284544 bytes (17856 KiB, 17 
MiB, 144 LEBs)
[    1.505055] UBIFS: journal size:       2920448 bytes (2852 KiB, 2 
MiB, 23 LEBs)
[    1.512691] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    1.518787] UBIFS: default compressor: lzo
[    1.523060] UBIFS: reserved for root:  0 bytes (0 KiB)
[    1.530052] VFS: Mounted root (ubifs filesystem) readonly on device 0:12.
[    1.537901] devtmpfs: mounted
[    1.541312] Freeing init memory: 140K
[    1.885519] udevd[358]: starting version 181
[    2.392869] UBIFS: start fixing up free space
[    2.401172] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 4096 bytes from PEB 3:4096, read 4096 bytes
[    2.412095] UBIFS error (pid 381): ubifs_leb_read: reading 4096 bytes 
from LEB 1:0 failed, error -74

The ubifs is generated using the -F switch. The filesystem is mounted 
read-only. If I try to mount it read-write, I get the same error again.

I read the FAQ at this page:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error

I confirmed that ubiattach works on my MTD device right after I erase it 
with flash_eraseall. The filesystem is also mounted with ubi.mtd=9,2048 
so I already ignore sub-pages.

Does anyone have an idea?

thanks

Xavier
