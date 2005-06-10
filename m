Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DgYCl-0003pI-Sy
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2005 21:21:06 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: Phillip Kamp <pkamp@equator.com>
In-Reply-To: <42A8DC02.90708@equator.com>
References: <42A8DC02.90708@equator.com>
Content-Type: text/plain
Date: Fri, 10 Jun 2005 09:20:54 +0800
Message-Id: <1118366454.11408.97.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2 --cleanmarker=?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What is cleanmarker and what it is used for ?

Cleanmarker is a special JFFS2 node which is written to the beginning of
a block just after the block has been erased. On NOR flashes it is a
special small JFFS2 node at the beginning of the block. On NAND flashes
it is placed to the spare area of the first page.

The main reason why cleanmarkers are used is the need to be sure that
the block erase operation was correctly completed. All 0xFF bytes in the
block are not necessarily mean the block is ready to be utilized. For
example, if an unclean reboot happened just at the end of the block
erase cycle, the block might have unstable bits, which are read as "1"
one time and might be read as "0" next time.

When preparing a flash partition for JFFS2, it is recommended to put
cleanmarkers to the erased blocks. This might be done my means of "-j"
option of the "flash_eraseall" MTD utility. Otherwise, JFFS2 will re-
erase the blocks which contain all 0xFF and have no cleanmarker. This is
an unneeded wasting of time.


On Thu, 2005-06-09 at 17:17 -0700, Phillip Kamp wrote:
> I'm developing a proprietary nand flash driver based on the
> drivers/mtd/nand/nand_base.c code.  I can successfully read
> and write the nand device in char mode, but when I write a jffs2
> file system on it I get these CLEANMARKER errors:
> CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
> CLEANMARKER node found at 0x00004000 has totlen 0xc != normal 0x0
> CLEANMARKER node found at 0x00008000 has totlen 0xc != normal 0x0
> CLEANMARKER node found at 0x0000c000 has totlen 0xc != normal 0x0
> ...
> for every single block.
> 
> The Samsung nand chip we use is has 512 byte pages, 16 byte OOB area and
> 16 Kbyte erase blocks:
> dev:    size   erasesize  name
> mtd0: 00800000 00004000 "Boot Image"
> mtd1: 01800000 00004000 "Root FS (JFFS2)"
> 
> I can successfully boot from the mtd0 partiion.  But when I create my
> jffs2 image I use
> mkfs.jffs2 -s 0x200 -e 0x4000 -o jffs2.image
> 
> and copy it,
> cp jffs2.image /dev/mtd1
> 
> but when I mount the partion using
> mount -t jffs2 /dev/mtdblock1 /mnt/nf
> 
> I get the above errors.  The fs seems to function okay, but this slew
> of errors seems ominous.  (Same results if I mount the partition as my
> root fs).
> 
> What is the --cleanmarker option?  Is it related to the oob size?  I
> tried -c 16 and the error changed to "totlen 0x10 != normal 0x0".
> Perhaps -c 0 would mask these errors, but before I do that I wanted
> to see what exactly the cleanmarker meant.
> 
> I'm using jffs2 sources from Linux 2.6.11.  I see you latest distribution
> is more recent.  Is it worth it for me to port your distribution
> to my linux version, or am I doing something fundamentally ignorant?
> 
> Thanks in advance.
> Phil
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
-- 
Munira Ahmed
Senior Embedded Specialist

Radixs Pte Ltd
Email:munira.ahmed@radixs.com


Main: +65 6335 8600
Fax: +65 6335 8601
URL: www.radixs.com 

1 Temasek Avenue, #21-01, Millenia Tower, Singapore 039192

Disclaimer Notice: This email, its content and any files transmitted
with it are intended solely for the addressee(s) and may be confidential
and privileged. Any unauthorised disclosure or use or dissemination of
the information contained herein, either whole or partial, is
prohibited. Radixs Pte Ltd (Radixs) cannot accept liability for any
statements made which are clearly the sender's own and not expressly
made on behalf of Radixs or one of its agents. If you have received this
message in error, please notify the sender immediately, and delete this
email from your computer system. Radixs has taken reasonable precaution
to ensure no viruses are present in this email, however Radixs does not
accept responsibility for any loss or damage arising from the use of
this email or attachments.

Co. Reg. 200104892Z
