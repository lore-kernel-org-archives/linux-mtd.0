Received: from [152.101.51.1] (helo=janus.hk.panelx.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196MiM-0003u4-9Y
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 04:39:02 +0100
Message-ID: <001401c3055c$dc8ec4e0$6c00a8c0@home>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <manningc2@actrix.gen.nz>,
	<linux-mtd@lists.infradead.org>,
	"yaffs list" <yaffs@toby-churchill.org>
References: <001201c30505$c4b83dd0$6c00a8c0@home>
	<20030417204847.5409515144@desire.actrix.co.nz>
Date: Fri, 18 Apr 2003 11:44:27 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Restore the bad block flag in OOB of  NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks  for suggestion. I will try it.

I am using the Samsung 16MB NAND flash . and separate 3 partitions.
/dev/mtd0 is used for kernel img; /dev/mtd1 for general file drive (YAFFS);
/dev/mtd2 for initrd.img. The yaffs driver is compiled by module. and set
"mount -t yaffs /dev/block1 /mnt/flash" in rcS (setup script). No format the
partition in the first mounting.
The drive is not always to use, it is just saved the config. file. So, I
dont clearly know why the yaffs is corrupt. I check the disk space by "du"
command. It said 100% used . And cannot remove any file in this /mnt/flash.
therefore , i think it is corrupted.

Any ideal??

Thank a lot.

Paul

----- Original Message -----
From: "Charles Manning" <manningc2@actrix.gen.nz>
To: "Paul" <paul@maypaul.com>; <linux-mtd@lists.infradead.org>; "yaffs list"
<yaffs@toby-churchill.org>
Sent: Friday, April 18, 2003 4:49 AM
Subject: Re: Restore the bad block flag in OOB of NAND flash


> On Friday 18 April 2003 05:21, Paul wrote:
> >  Dear All,
> >
> >     How can I restore the 0xFF in the OOB[5]?   i understood the oob[5]
is
> >  the bad block indicator. The YAFFS set accidentally the byte to 0x00 .
I
> >  want to use JFFS2 but the eraseall command said they are invalid block.
I
> > am
> >  sure that the block is health . So, I want to force set the oob[5] to
> > oxFF, pls. how can i do? Thank you.
> >
> >  Paul
>
> Generally this is a bad idea to erase bad blocks since destroying factory
> marked bad blocks can cause problems through the entire chip (not just the
> bad block). eg. Some blocks are marked because a write to the block could
> disturb data in another block.
>
> More recent chips seem to have some hardware "fuse" blown to prevent bad
> blocks from being erased.
>
> One way to achieve what you want is to hack mkyaffs. mkyaffs erases the
> blocks in the partition, but first checks for bad block markers. If you
> comment out the check then it will erase the block regardless. This will
set
> all the bits in the block to 1 (including the bad block marker).
>
> BTW: I am curious as to how YAFFS managed to mark your block bad.
>
> -- Charles
>
>
>
> --------------------------------------------------------------------------
-------------
> This mailing list is hosted by Toby Churchill open software
(www.toby-churchill.org).
> If mailing list membership is no longer wanted you can remove yourself
from the list by
> sending an email to yaffs-request@toby-churchill.org with the text
"unsubscribe"
> (without the quotes) as the subject.
>
>
