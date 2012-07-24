Received: from cdptpa-bc-oedgelb.mail.rr.com ([75.180.133.32])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SthbB-0000m4-SZ
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2012 16:04:56 +0000
Message-ID: <500EC7D9.8020509@cincinnatitechnologies.com>
Date: Tue, 24 Jul 2012 12:05:45 -0400
From: Russell Zuck <rzuck@cincinnatitechnologies.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Is my erase block size correct?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am attempting to troubleshoot an issue where my UBIFS becomes 
corrupted after repeated upgrade attempts.  Before I submit a bug report 
to the list, I'm attempting to rule out as many possibilities as I can.

While rechecking the datasheet for our NAND flash (Micron MT29F4G08BABWP 
4Gb), I noticed a discrepancy between the erase block size presented in 
the datasheet (128KiB + 4KiB) and that returned from mtdinfo (see 
below).  The extra 4KiB overhead is due to a 64Byte overhead for each of 
the 64 pages/block.

root@ctc-imx51 ~$ mtdinfo -a
Count of MTD devices:           4
Present MTD devices:            mtd0, mtd1, mtd2, mtd3
Sysfs interface supported:      yes

mtd0
Name:                           nor_flash
Type:                           dataflash
Eraseblock size:                512 bytes
Amount of eraseblocks:          8192 (4194304 bytes, 4.0 MiB)
Minimum input/output unit size: 512 bytes
Sub-page size:                  512 bytes
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true

mtd1
Name:                           nand.bootloader
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          8 (1048576 bytes, 1024.0 KiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:2
Bad blocks are allowed:         true
Device is writable:             true

mtd2
Name:                           nand.kernel
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          24 (3145728 bytes, 3.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:4
Bad blocks are allowed:         true
Device is writable:             true

mtd3
Name:                           nand.rootfs
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          4064 (532676608 bytes, 508.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:6
Bad blocks are allowed:         true
Device is writable:             true

I've dug into the kernel source a bit and have come to the conclusion 
that the erase block size reported by mtdinfo comes from an 
interrogation of the MTD device by its driver.  I take this to mean that 
either I'm using the wrong driver, the driver is configured incorrectly, 
or the driver is correct and is not reporting the 4KiB overhead of each 
erase block.

Any help in confirming or refuting any of my 3 possible conclusions 
would be greatly appreciated.  Alternate theories are, of course, welcome.

Best regards,

Russell Zuck
