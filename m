Received: from ultra.secret.org.uk ([194.154.178.202] helo=ultra)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ErAN-0006J2-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 12:38:00 +0100
Received: from spoinky.secret.org.uk ([194.154.178.212])
	by ultra with esmtp (Exim 3.03 #1)
	id 15ErPo-0006Bj-00
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2001 12:53:56 +0100
Received: from localhost ([127.0.0.1] helo=spoinky.secret.org.uk)
	by spoinky.secret.org.uk with esmtp (Exim 2.02 #1)
	id 15Eq9Y-0005cF-00
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2001 11:33:04 +0100
From: Simon Evans <spse@secret.org.uk>
To: linux-mtd@lists.infradead.org
Subject: Block device as MTD
Date: Tue, 26 Jun 2001 11:33:04 +0100
Message-Id: <E15Eq9Y-0005cF-00@spoinky.secret.org.uk>
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

I have written a mtd driver that makes a block device
appear as an MTD device, ie you can use a floppy disk,
hard disk or Compact flash as an MTD then put JFFS2 on
top etc. The main reason for writing this was so I could
put JFFS2 on a Compact Flash (which pretends to be an IDE drive),
however it can be used as a test device for using JFFS2 on
large devices (you should be able to use upto a 4gig block device)
or floppy disks (ie eject the disk when it does a write for testing
 jorunalling).

I have tested it on a floppy disk, and 96MB CF and it seems relatively
stable.

What is the best procedure for releasing it.

cheers
si
