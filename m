Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWqPv-0005nu-8O
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 10:00:07 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JWqPq-0002ml-OO
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 10:00:03 +0000
Received: from 57.67.17.100 ([57.67.17.100])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2008 10:00:02 +0000
Received: from david.fontaine by 57.67.17.100 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2008 10:00:02 +0000
To: linux-mtd@lists.infradead.org
From: David Fontaine <david.fontaine@transport.alstom.com>
Subject: One file with Data CRC Error on a JFFS2 root fs
Date: Wed, 5 Mar 2008 09:40:41 +0000 (UTC)
Message-ID: <loom.20080305T090914-96@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,
I have used a JFFS2 partition as root fs on a ppc_8xx platform with 32MByte
NOR device ( 2x IntelStrata PC28F128P30, kernel 2.6.16 ) for
one year without any trouble until last week.

After analysis, I find (only) one file on rootfs with Data CRC error.
This file is a daemon and none of my applications try to move/copy/modify it. 
I suppose Garbage collector tries to move it (for wear levelling or other 
purpose) and did not succeed in.

1. Is it right ? Are there other mechanisms which are expected to move 
such kind of file? 

With the Data CRC log message, I see in the flash raw image the 4th part
of this file as valid inode (correct Jffs2 header struct jffs2_raw_inode,
size of 0x9A6 for this 4th part), the first data bytes OK but 380 bytes 
at the end of data were 0xFF.
In another flash block, I find also  : 
	the four first parts marked as obsolete inode of this file 
	and the 3 last parts of the file marked as Valid inode. 
	
2. Does Garbage collector stop moving this file due to the detection 
of Mtd write error? Anybody can help me about understanding why the 
erroneous part of the file was marked as Valid, and why JFFS2 passed
the old part as obsolete instead of keeping it Valid. 

I try some other kind of tests :  
	- write some file and check rootfs integrity during two days  
	to see if flash memory is in failure : no trouble. 
	- Manually modify the dumped flash to get right bytes instead of
	the 380 bytes at 0xFF and dowload it with bootloader: root fs OK 
	no more Data CRC trouble : the daemon can be started. 
	- inspect flash dump : many obsolete entries in the file system and 
	5*256 kbytes erased but no relevant things.

I try to reproduce the trouble to get JFFS Debug Log but without success: I can
only do "after failure" analysis with a raw dump of the flash.

3. Do you have any test suggestion that I can do to identify my trouble and
then fix it?  
 

Thanks in advance for your help.                                               
David Fontaine                 
