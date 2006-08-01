Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7n7p-0003WU-Ot
	for linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 01:49:13 -0400
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J3B003DG1HMWH@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 14:48:59 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0J3B007XI1HLV8@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 14:48:58 +0900 (KST)
Date: Tue, 01 Aug 2006 14:49:04 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: RE: Bad block message from JFFS2
In-reply-to: <6AD9F6A5F6E096408F0B703773355A070129D945@CHN-SNR-MBX01.wipro.com>
To: linux-mtd@lists.infradead.org
Message-id: <007b01c6b52e$335f6250$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 

Thanks for reply. I am getting Node CRC read error too or some time data CRC
or head CRC.I think some alignment problem because I am using utility tools
developed for 2.6 kernel. I think for they may have some problem for 2.4
that why these messages are coming. Any way what is ur idea about tools like
flasheraseall, nandwrite and mkfs.jffs2. Do these tools need to be
investigating for using with 2.4 kernels.
Can u tell me why this message is coming?

Newly-erased block contained word 0x1313000 at offset 0x0b4e0000
Newly-erased block contained word 0x1b076 at offset 0x05540000

Thanks
Amit

-----Original Message-----
From: srideep.devireddy@wipro.com [mailto:srideep.devireddy@wipro.com] 
Sent: Tuesday, August 01, 2006 2:33 PM
To: sharma.amit@samsung.com
Subject: RE: Bad block message from JFFS2


Hi ,

   Normally the logic for jffs2 making a block as bad is Any block where
the 1st and 6th bytes in the spare area of the 1st page doesn't contain
ffh is a bad block , yes the clean marker is not updated ( -j option
should update the clean marker in spare area , try this out correctly .

     When writing data to nand on a page it write it and reads it back
to check the crc , if the crc is found correctly it continues to write
data to next block or page . while the crc is read wrongly then it adds
that block to the bad block list . later jffs2 tries to make it good ,
if not it frees it from the node list .

        In your case I see data is written even to the bad blocks , this
is because . while writing data clean marker is not updated properly .
So it write there and next time when it boots after scaning , it finds
bad block .

If your using a u-boot loader , then try to perform a nand erase from
there , if you are mounting the device after linux comes up . eraseall
-j /dev/mtblock/0 or 1 and try to copy the file system?

        Hw are you writing the filesystem on the nand ?
Good luck ...

Regards
Srideep



-----Original Message-----
From: Amit Kumar Sharma [mailto:sharma.amit@samsung.com]

Sent: Tuesday, August 01, 2006 10:45 AM
To: Srideep DeviReddy (WT01 - Broadband Networks)
Subject: RE: Bad block message from JFFS2


Hi Srideep


This problem is coming from bad blocks as flasheraseall -j will not
update

Bad blocks with erase marker so I wonder why Jffs2 try to write in these
block.

Thanks
Amit

-----Original Message-----
From: srideep.devireddy@wipro.com [mailto:srideep.devireddy@wipro.com]

Sent: Tuesday, August 01, 2006 2:06 PM
To: sharma.amit@samsung.com
Subject: RE: Bad block message from JFFS2


Hi Amit ,

          I think the problem below is clean marker from jffs2 is not
written properly after the block is been erased .. check the clean
marker implementation in jffs2 code of your's ,



Regards
Srideep


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Amit Kumar
Sharma
Sent: Tuesday, August 01, 2006 5:34 AM
To: linux-mtd@lists.infradead.org
Subject: Bad block message from JFFS2


Hi


I am testing JFFS2 with OneNAND mtd on Linux kernel mvl 2.4.20
I have two partition of JFFS2 on my device of following size 20Mb and
200Mb.
During iozone testing on flash partition of size 200Mb, JFFS2 try to
erase
device and it create Bad blocks on device .when I try to check with some
different software, I did not find so many bad blocks on my device .How
I
Can verify bad block marker in JFFS2 and in which condition JFFS2 will
mark
a block as bad block?


During IOZONE running on 200Mb partition for 20Mb file read and write
operation.I am getting following debugging messages on console

KB  reclen   write rewrite    read    reread
20480       4jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985, 0x)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block 



 /* ==========" block state bad block   print is coming from
here===============

    int ret = jffs2_check_nand_cleanmarker(c, jeb);
                D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker
returned
%d\n",ret));
                /* Even if it's not found, we still scan to see
                   if the block is empty. We use this information
                   to decide whether to erase it or not. */
                switch (ret) {
                case 0:         cleanmarkerfound = 1; break;
                case 1:         break;
                case 2:
                        printk("block state bad block\n");
                        return BLK_STATE_BADBLOCK;
                case 3:



========================================================*/



jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
Newly-erased block contained word 0xe0021985 at offset 0x05540000
Newly-erased block contained word 0x44c17860 at offset 0x00220000
Newly-erased block contained word 0x20f000 at offset 0x00200000
jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985, 0xe002, 0x00000046)
has
in)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
Newly-erased block contained word 0x3 at offset 0x0bb60000
Newly-erased block contained word 0x34 at offset 0x05540000
Newly-erased block contained word 0x1141 at offset 0x06860000
    3318    1875jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985,
0xe002,
0x)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb60000
block state bad block
Newly-erased block contained word 0x1313000 at offset 0x0b4e0000
Newly-erased block contained word 0x1b076 at offset 0x05540000
Newly-erased block contained word 0x1400000 at offset 0x0bb40000
jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985, 0xe002, 0x00000046)
has
in)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb40000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb60000
block state bad block
Newly-erased block contained word 0xe0021985 at offset 0x09220000
Newly-erased block contained word 0x0 at offset 0x05540000
     5362     4459
Newly-erased block contained word 0x1141 at offset 0x06800000
Newly-erased block contained word 0x2fc93c1e at offset 0x04d60000
           20480       8jffs2_scan_eraseblock(): Node at 0x003cdff8
{0x1985,
0x)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42800:
0x4994 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42804:
0xd309 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42808:
0xac25 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d4280c:
0xa49c id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42810:
0x96f8 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42814:
0x5b8f id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42818:
0x0c02 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d4281c:
0x203a id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42820:
0x803e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42824:
0x4764 id
Further such events for this erase block will not be printed
jffs2_check_nand_cleanmarker(): Bad block at 04d60000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 09220000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb40000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb60000
block state bad block





I am getting following message from device after boot up complete.

"            Newly-erased block contained word 0x1a2c3ecf at offset
0x054e000

root@apollon:~# Newly-erased block contained word 0x37fc4828 at offset
0x0bb4000...
"


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


The information contained in this electronic message and any attachments
to
this message are intended for the exclusive use of the addressee(s) and
may
contain proprietary, confidential or privileged information. If you are
not
the intended recipient, you should not disseminate, distribute or copy
this
e-mail. Please notify the sender immediately and destroy all copies of
this
message and any attachments.


WARNING: Computer viruses can be transmitted via email. The recipient
should
check this email and any attachments for the presence of viruses. The
company accepts no liability for any damage caused by any virus
transmitted
by this email.


www.wipro.com




The information contained in this electronic message and any attachments to
this message are intended for the exclusive use of the addressee(s) and may
contain proprietary, confidential or privileged information. If you are not
the intended recipient, you should not disseminate, distribute or copy this
e-mail. Please notify the sender immediately and destroy all copies of this
message and any attachments.


WARNING: Computer viruses can be transmitted via email. The recipient should
check this email and any attachments for the presence of viruses. The
company accepts no liability for any damage caused by any virus transmitted
by this email.


www.wipro.com
