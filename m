Received: from imo-r07.mx.aol.com ([152.163.225.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 183w3Y-0006P2-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2002 11:14:36 +0100
Received: from Kschoo70C@netscape.net
	by imo-r07.mx.aol.com (mail_out_v34.13.) id 3.4.5348cd4 (22681)
	 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2002 06:13:32 -0400 (EDT)
Date: Tue, 22 Oct 2002 06:05:56 -0400
From: Kschoo70C@netscape.net
To: linux-mtd@lists.infradead.org
Subject: NAND erase size problem
MIME-Version: 1.0
Message-ID: <778071C8.0A118C12.0265FBE9@netscape.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,
     I have a hardware that has a samsung 16MB NAND flash (K9F2808UoB -- page size 512 bytes, erase block size = 32 pages). I have a problem to copy the image created by mkfs.jffs2 to the mtd device. 
    When I ask mkfs.jffs2 to create an image with erase size of 16KB, it will create image with erase size 64KiB instead. I suppose that is the minimum size set by mkfs.jffs2. When I copy the image to the mtd device, there is no error. However, when I mount to the mtdblock device, it gives me an error of "Perhaps the file system was created with the wrong erase size?" during scanning.
   On the other hand, if I use the system "cp -a /rfs /mnt/nandroot" to transfer the file from NFS root to the flash, everything works fine. Therefore, I guess the NAND driver works fine.

The following are my steps:
On the host
mkfs.jffs2 --eraseblock=16KiB -l -d ./lib -o lib.image
    > Increasing erase size to 64KiB minimum

On the target
    # cat /proc/mtd
    dev:    size   erasesize  name
    mtd0: 00300000 00004000 "SPIA flash partition 1"
    mtd1: 00d00000 00004000 "SPIA flash partition 2"

    # eraseall /dev/mtd2
    Erased 13312 Kibyte @ 0 -- 100% complete.
    # cp ./lib.image /dev/mtd2
    # mount -t jffs2 /dev/mtdblock1 /mnt/nandroot
    Node at 0x00003884 with length 0x0000089e would run over the end of the erase block
    Perhaps the file system was created with the wrong erase size?
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003888: 0x089e instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000388c: 0xf358 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003890: 0x000d instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003894: 0x0007 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00003898: 0x81ff instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000389c: 0x0063 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000038a0: 0xfae4 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000038a4: 0x2ad2 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000038a8: 0x2ad2 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000038ac: 0x2ad2 instead
    Further such events for this erase block will not be printed
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004000: 0xc30f instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004004: 0xc279 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004008: 0xa219 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000400c: 0x6f73 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004010: 0xe29c instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004014: 0x4438 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004018: 0x84e4 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000401c: 0xbff9 instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004020: 0xee7a instead
    jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004024: 0x8cd1 instead
    Further such events for this erase block will not be printed

=======================================================================

     Can anyone tell me how to get the erase size for the nand image right ? Or could it be other problems ?

      Thanks.

regards
choo


__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp 

Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/
