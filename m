Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18J9p0-00050k-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Dec 2002 09:58:30 +0000
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-35.mail.demon.net with esmtp (Exim 3.36 #2)
	id 18JAIa-0005QN-0U
	for linux-mtd@lists.infradead.org; Tue, 03 Dec 2002 10:29:04 +0000
From: "" <simon@baydel.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Date: Tue, 3 Dec 2002 10:23:47 -0000
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: JFFS2 and bad blocks
Message-ID: <3DEC8633.25166.12C6FD@localhost>
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

I am using an SMC via the MTD layer. On one of the partitions I 
would like to put a JFFS2 filesystem. Normally I erase the partition 
and then mount it JFFS2. The problem is that if the partition has a 
bad block I cannot erase or mount it. Does the bad block handling 
have to be in the vendor specific nand driver ?

Cheers

Simon.
__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
