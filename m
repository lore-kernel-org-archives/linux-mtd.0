Received: from kynes.gatewest.net ([198.163.227.7]
	helo=10-10-1-6.gatewest.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6b6Y-0004Um-7q
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 20:33:14 +0100
Received: from iders01.iders.ca (h24-77-192-14.wp.shawcable.net
	[24.77.192.14])8.12.0.Beta19) with ESMTP id h96JUcLq018597
	for <linux-mtd@lists.infradead.org>; Mon, 6 Oct 2003 14:30:38 -0500
Received: from kilauea.iders.ca (kilauea.iders.ca [200.123.101.201])
	by iders01.iders.ca (8.12.6/8.12.8) with SMTP id h96JXIdA004564
	for <linux-mtd@lists.infradead.org>; Mon, 6 Oct 2003 14:33:18 -0500
From: Cam Mayor <cmayor@iders.ca>
To: a-linux-mtd <linux-mtd@lists.infradead.org>
Date: Mon, 6 Oct 2003 14:33:16 -0500
MIME-Version: 1.0
Message-Id: <03100614331605.30787@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: mtd filesystem across different sector sizes in the same part
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After doing a flash storage map for one of our devices and based on reading a 
recent question to this list, i thought of another question.

In my flash part (intel 28f320c3) there are 8 x 8kB blocks and 63 x 64 kB 
blocks.  I believe that [1] MTD can span the two block sizes effectively for 
it to be recognized as a single MTD device.  JFFS2, IIRC, uses 5 flash blocks 
for flash filesystem overhead.  Do those blocks have to be any specific size 
relative to the rest of the filesystem blocks?  Will it use the first five 
blocks, or does it move around for wear levelling?  Will JFFS2 get confused 
by different block sizes, or is that already handled in the MTD layer?  

If the 5 blocks move around, is there any way to predict how much space will 
be available in the filesystem?  (eg. one moment you have 5 overhead blocks 
in the 8kB area and have 70kB free.  the next moment you have 4 overhead 
blocks in the 8kB area, and one in the 64kB area, leaving you with 14kB free 
space)

thanks,
cam

[1] please correct me if i'm wrong


-- 
Cameron Mayor
Iders Incorporated
