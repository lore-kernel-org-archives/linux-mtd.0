Received: from smtp6.mindspring.com ([207.69.200.110])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kFuf-0004X2-RU
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 05:28:38 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 6 Aug 2003 00:27:50 -0400
Message-ID: <IIEEICKJLNEPBBDJICNGAEENDMAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a DiskOnChip device soldered onto a PowerPC target and
would appreciate if someone could verify if I am using the 
correct commands to put a filesystem on it.

Also I am concerned from what I have read in the archives about
the bad block table.  From what I see in the archives and in
Karim Yaghmour's book, I needed to save this off.  Unfortunately
however I cannot run DOS or its utilities on this target board,
so I don't think that there is any way to do this.

I use the following commands:

  nftl_format /dev/mtd0
  fdisk /dev/nftla

(I know it's unnecessary for now to use partitioning when I just
have 1 partition, but I may be using multiple partitions in the
near future)

  mkfs.ext3 /dev/nftla1
  mount /dev/nftla1 /mnt

This filesystem on the DOC looks like it is working well.

 Questions:

1. Have I destroyed any bad block table in the device by
   doing this command sequence?

2. If so, is this a bad block table needed by firmware
   internal to the DOC, or just needed by some DOS utilities
   that I won't be using anyway?

3. What I would really prefer to use is JFFS2 on this DOC.
   I have seen messages from David that this may now be 
   possible.
   When I use other targets with NOR flash I typically write
   an MTD partition map file for the target, then I use dd to
   put my jffs2 image file into the right mtdblock partition.
   How would I do this with a DOC device?
   (Meaning how do you specify the MTD partition map for your
   DOC so you are able to specify /dev/mtdblock3, for example,
   as a destination for the fs image).

Thanks very much,
Chuck Meade
