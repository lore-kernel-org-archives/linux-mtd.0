Received: from imo-d01.mx.aol.com ([205.188.157.33])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eGuC-0001X7-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 15:47:08 +0000
Received: from Kschoo70C@netscape.net
	by imo-d01.mx.aol.com (mail_out_v34.13.) id 3.2e.76518c5 (16214)
	 for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 11:17:34 -0500 (EST)
Date: Thu, 30 Jan 2003 11:17:34 -0500
From: Kschoo70C@netscape.net
To: linux-mtd@lists.infradead.org
Subject: Bad Block Handling in jffs2
MIME-Version: 1.0
Message-ID: <03E2B9D1.52EE4DE7.0265FBE9@netscape.net>
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
   My nand device has a few bad blocks. Therefore if I copy the jffs2 formated 
   image to the device, some files are missing from the file systems.
 
   In http://www.linux-mtd.infradead.org/tech/nand.html, it is stated that 
   
   "if you have a bad block on your chip, just skip this block and copy 
   the data to the next block. JFFS2 is able to handle this gap.".

   So, I write a program to skip the bad block, and copy the data to the next block. 
   The missing file seems to appear on the file system now, the size looks correct. 
   But when I diff the binary of the file to that of original, they are different 
   and the binary failed to execute.

   I don't know much about jffs2 bad block handling, the only information I have is 
   as mentioned above. Am I missing any other information ?

   Is anyone manage to transfer an image to the nand device that has bad blocks 
   without losing any files ?

   Note that there is no problem to copy the same image to nand devices 
   which are bad blocks free 

   Thanks in advance.

regards
choo


__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp 

Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/
