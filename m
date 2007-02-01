Received: from alias7.ihug.co.nz ([203.96.222.17])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HCSf9-0003Cy-R6
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 03:31:07 +0000
From: "Gavin Lambert" <gavinl@compacsort.com>
To: <linux-mtd@lists.infradead.org>
Subject: Driver-specific ioctls
Date: Thu, 1 Feb 2007 16:30:48 +1300
Message-ID: <042701c745b1$5dc9c260$0502a8c0@gavinlpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I came across a situation the other day where I wanted to get some more
esoteric data from an MTD chip driver into userspace (mostly for
debugging purposes).  Sadly (at least in 2.6.15) mtdchar doesn't pass
any unrecognised ioctls to the MTD driver, which seems like the cleanest
way to do that sort of thing.

Any chance that this could get added?  Or is there a similar mechanism
already that I have somehow missed?
