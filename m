Received: from plane.gmane.org ([80.91.229.3])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXPOe-0002Zt-0i
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 06:20:36 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1WXPO8-0002PY-Vg
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 08:20:05 +0200
Received: from ABTS-North-Dynamic-042.7.177.122.airtelbroadband.in
 ([ABTS-North-Dynamic-042.7.177.122.airtelbroadband.in])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2014 08:20:04 +0200
Received: from hf.basit by ABTS-North-Dynamic-042.7.177.122.airtelbroadband.in
 with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2014 08:20:04 +0200
To: linux-mtd@lists.infradead.org
From: gpuguy <hf.basit@gmail.com>
Subject: While trying to open /dev/mtd2 for read/write access: Permission
 denied
Date: Tue, 8 Apr 2014 06:14:01 +0000 (UTC)
Message-ID: <loom.20140408T081131-273@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks like my MTD2,and MTD3 partitions are write protected. The OS is 
booting from SD card on a ARM Cortex A 9 processor.

root@Xilinx-ZC702-2013_3:~# mount /dev/mmcblk0p1 /mnt/
root@Xilinx-ZC702-2013_3:~#
root@Xilinx-ZC702-2013_3:~# cd /mnt/flash/
root@Xilinx-ZC702-2013_3:/mnt/flash#
root@Xilinx-ZC702-2013_3:/mnt/flash# ls
BOOT.BIN      image.ub      rootfs.jffs2
root@Xilinx-ZC702-2013_3:/mnt/flash# flashcp -v image.ub /dev/mtd2
While trying to open /dev/mtd2 for read/write access: Permission denied
root@Xilinx-ZC702-2013_3:/mnt/flash#


Even I tried alternate:

root@Xilinx-ZC702-2013_3:/mnt/flash# flash_eraseall -j /dev/mtd2
flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please use 
it
flash_erase: error!: /dev/mtd2
             error 13 (Permission denied)


Here are additional info:

root@Xilinx-ZC702-2013_3:/mnt/flash# mtdinfo
Count of MTD devices:           4
Present MTD devices:            mtd0, mtd1, mtd2, mtd3
Sysfs interface supported:      yes

root@Xilinx-ZC702-2013_3:~# cat /proc/mtd
    dev:    size   erasesize  name
    mtd0: 00500000 00010000 "boot"
    mtd1: 00020000 00010000 "bootenv"
    mtd2: 001202c0 00010000 "image"
    mtd3: 00500000 00010000 "jffs2"
Also:

root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd3
mtd.type = MTD_NORFLASH
mtd.flags = MTD_BIT_WRITEABLE
mtd.size = 5242880 (5M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_BIT_WRITEABLE
mtd.size = 1180352 (1M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 131072 (128K)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 5242880 (5M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

root@Xilinx-ZC702-2013_3:/mnt/flash#




How do I solve this issue?
