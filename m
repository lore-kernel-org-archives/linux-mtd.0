Received: from c-24-91-108-216.hsd1.ma.comcast.net ([24.91.108.216]
	helo=ahgu.homeunix.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EA7rC-0000Jf-3L
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 11:17:09 -0400
Received: from maaxiang (fwma1.atitech.com [204.176.13.6])
	(authenticated bits=0)
	by ahgu.homeunix.com (8.12.11/8.12.11) with ESMTP id j7UFBmBC097725
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Aug 2005 11:11:49 -0400 (EDT)
	(envelope-from ahgu@ahgu.homeunix.com)
Message-ID: <169701c5ad76$272b9140$1f1a12ac@atitech.com>
From: "ahgu" <ahgu@ahgu.homeunix.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 30 Aug 2005 11:18:56 -0400
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="gb2312"; reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Handling of write failure on NAND
Reply-To: ahgu <ahgu@ahgu.homeunix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does JFFS2 have support on write failure handling for NAND flash. When a 
write or verification after write fails, does it find a new block and copy 
all data into the new block, and mark the original block as bad block? I 
only see that the bad_list is used during scanning and erase. I saw someone 
added a retry in the write function, but that is just writing to the same 
block. The ofs returned by jffs2_reserve_space stays the same.

It is calling the BUGS() and halt the kernel when the write fails.

-Andrew 
