Received: from kynes.gatewest.net ([198.163.227.7]
	helo=10-10-1-6.gatewest.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A4Tm1-0008SD-Nh
	for <linux-mtd@lists.infradead.org>; Wed, 01 Oct 2003 00:19:17 +0100
Received: from iders01.iders.ca (h24-77-192-14.wp.shawcable.net
	[24.77.192.14])8.12.0.Beta19) with ESMTP id h8UNGpuE031383
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 18:16:51 -0500
Received: from kilauea.iders.ca (kilauea.iders.ca [200.123.101.201])
	by iders01.iders.ca (8.12.6/8.12.8) with SMTP id h8UNJOdA012186
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 18:19:24 -0500
From: Cam Mayor <cmayor@iders.ca>
To: a-linux-mtd <linux-mtd@lists.infradead.org>
Date: Tue, 30 Sep 2003 18:19:23 -0500
MIME-Version: 1.0
Message-Id: <0309301819230B.25773@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: MTD/JFFS2 bug - misreported filesystem usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all,

I found a reproducable bug in the version of mtd/jffs2 that i have.  I'm 
using kernel 2.4.19-rmk7, and an MTD snapshot from March 25/2003.  My 'df' 
command comes from busybox version 0.60.5.

Bug: misreported filesystem usage

Procedure to reproduce:
1) boot system (this unlocks a NOR flash MTD area on which JFFS2 gets mounted)
2) 'df' to see filesystem usage
3) umount jffs2 partition
4) erase mtd partition which had jffs2 filesystem
5) mount jffs2 on newly erased partition
6) 'df' to see filesystem usage.
	"Used" and "Available" fields are switched; switch is reflected in the 
"Use%" field
7) write a file to JFFS2 filesystem
8) 'df' to see filesystem usage
	The filesystem usage is now reported accurately.



-- 
Cameron Mayor
Iders Incorporated
