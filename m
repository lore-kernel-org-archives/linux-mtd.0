Received: from postoffice1.connactivity.com ([66.112.160.14]
	helo=connactivity.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZZxX-0004Bw-Up
	for linux-mtd@lists.infradead.org; Thu, 05 Apr 2007 17:57:37 -0400
From: "Jeff Fellin" <jeff.fellin@coredgenetworks.com>
To: "'Iyer'" <maseriyer@yahoo.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Magic bitmask 0x1985 messages,
	while attempting to mount a JFFS2 filesystem on dataflash
Date: Thu, 5 Apr 2007 17:57:25 -0400
Message-ID: <005601c777cd$65287620$0b00a8c0@CoreEdgeNJ4>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: AAAAAFqDkgWWH8tCh1oLEmaFdVXkOSEA
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Iyer
Sent: Thursday, April 05, 2007 3:45 PM
To: Iyer; linux-mtd@lists.infradead.org
Subject: Magic bitmask 0x1985 messages,while attempting to mount a JFFS2
filesystem on dataflash

Hi Folks,

I seem to be getting the "Magic bitmask 0x1985" errors
on attempting to mount a JFFS2 filesystem on a
dataflash (AT45DB321). This is the very first FAQ in
the JFFS2 FAQ. It may be likely that the data on the
flash is not a valid JFFS2 image.

Here are the steps I did, please let me know if I have
done anything wrong. The same JFFS2 image was mounting
well on the NAND flash (with the corresponding
mkfs.jffs2 -e and --pad options set for the NAND
flash), but not on the data flash.

>> Are you sure you entered the correct erase block size and padding options
for the dataflash? 

The kernel was compiled with the MTD relevant options
for having the kernel, RFS and bootloader on the
dataflash, for the board AT91SAM9261-EK:

CONFIG_MTD =y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_DATAFLASH=y

The JFFS2 image was created with the options -e 528 -n
--pad= 777744 (a multiple of 528) for mkfs.jffs2
(erase size:528 for the AT45DB321)

The following bootargs to partition the MTD dataflash
were used:

mtdparts=spi0.0-AT45DB321x:384384(U-Boot),1500048(Linux),-(User_Data)

First the system was booted with a NFS mounted file
system. Then, the following commands were carried out:

Format dataflash device for JFFS2 and copy jffs2.img
to the newly formatted dataflash device; /dev/mtd3
maps to User_Data partition on dataflash.

-bash-3.1# flash_eraseall -j /dev/mtd3

The flash was read by way of  # mtd_debug read
/dev/mtd3 0 1000 mtd3_rd ; mtd3_rd has all 0xFF's in
it, confirming that the data flash was erased
correctly.

-bash-3.1# cat jffs2.img > /dev/mtd3

The flash was read by way of  # mtd_debug read
/dev/mtd3 0 1000 mtd3_rd ; mtd3_rd doesn't have all
0xFF's in it, confirming that the data flash was
written into.

Test if the new FS mounts on dataflash cleanly:

-bash-3.1# mount -t jffs2 /dev/mtdblock3 /mnt

The FS mounts with the following messages such as:
....
..............
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x000b9a20: 0x3ef3 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x000b9a24: 0xf238 instead
Further such events for this erase block will not be
printed
Node at 0x000bbaf4 with length 0x0000002f would run
over the end of the erase block
Perhaps the file system was created with the wrong
erase size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x000bbb00: 0x00bc instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x000bbb04: 0x0109 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x000bbb08: 0x010b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x000bbb0c: 0xe928 instead
............................................
..................................

I was able to read and write into the newly mounted
FS; then this FS was unmounted and the system
shutdown.

The following bootargs were appended to U-boot, for
the kernel command line:

 root=/dev/mtdblock3 rw rootfstype=jffs2 init=/linuxrc

The bootm command was run and the "Magic bitmask
0x1985" messages appear (as listed above). Kernel
panics, no sign of init.
..........
..................................
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not
found at 0x000bbb20: 0x696c instead
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 104K
Failed to execute /linuxrc.  Attempting defaults...
Kernel panic - not syncing: No init found.  Try
passing init= option to kernel.

The JFFS2 image for the same filesystem was mounting
well on the NAND flash, but not on the data flash.

Hope this account has been descriptive. This is
perplexing.

Thanks for your time,
iyer






 
____________________________________________________________________________
________
Need Mail bonding?
Go to the Yahoo! Mail Q&A for great tips from Yahoo! Answers users.
http://answers.yahoo.com/dir/?link=list&sid=396546091

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
