Received: from dragon.actrix.co.nz ([203.96.16.164] helo=desire.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196GJP-0002Qz-2B
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 21:48:51 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Paul" <paul@maypaul.com>, <linux-mtd@lists.infradead.org>,
	yaffs list <yaffs@toby-churchill.org>
Date: Fri, 18 Apr 2003 08:49:31 +1200
References: <001201c30505$c4b83dd0$6c00a8c0@home>
In-Reply-To: <001201c30505$c4b83dd0$6c00a8c0@home>
MIME-Version: 1.0
Message-Id: <20030417204847.5409515144@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Restore the bad block flag in OOB of  NAND flash
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 18 April 2003 05:21, Paul wrote:
>  Dear All,
>
>     How can I restore the 0xFF in the OOB[5]?   i understood the oob[5] is
>  the bad block indicator. The YAFFS set accidentally the byte to 0x00 . I
>  want to use JFFS2 but the eraseall command said they are invalid block. I
> am
>  sure that the block is health . So, I want to force set the oob[5] to
> oxFF, pls. how can i do? Thank you.
>
>  Paul

Generally this is a bad idea to erase bad blocks since destroying factory 
marked bad blocks can cause problems through the entire chip (not just the 
bad block). eg. Some blocks are marked because a write to the block could 
disturb data in another block.

More recent chips seem to have some hardware "fuse" blown to prevent bad 
blocks from being erased.

One way to achieve what you want is to hack mkyaffs. mkyaffs erases the 
blocks in the partition, but first checks for bad block markers. If you 
comment out the check then it will erase the block regardless. This will set 
all the bits in the block to 1 (including the bad block marker).

BTW: I am curious as to how YAFFS managed to mark your block bad.

-- Charles
