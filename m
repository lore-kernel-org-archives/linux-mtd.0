Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 1749q5-0007aQ-00
	for <linux-mtd@lists.infradead.org>; Sun, 05 May 2002 01:25:21 +0100
From: elf@buici.com
Date: Sat, 4 May 2002 17:25:18 -0700
To: linux-mtd@lists.infradead.org
Subject: Unclear about unwriteprotecting
Message-ID: <20020505002518.GA3665@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

I've built the mtd driver into a 2.2.17 kernel using the mtd-20000704
version.  I am accessing a DOC 2000 (24MB) that was created using the
M-Systems's doc driver.  It has two partitions, one formatted for
ext2.

The NFTL driver sees the partitions find and I can mount them.
However, I cannot write.  Nothing in the code or on the list has
enlightened me.  What am I missing?
