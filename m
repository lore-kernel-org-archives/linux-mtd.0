Received: from oslproxyp1.tandberg.com ([194.0.215.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4zvN-0005s0-9C
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:29:35 +0000
Message-ID: <47692B14.5040205@tandberg.com>
Date: Wed, 19 Dec 2007 15:30:44 +0100
From: Kjetil Aamodt <kjetil.aamodt@tandberg.com>
MIME-Version: 1.0
To: undisclosed-recipients:;
Subject: MTD/YAFFS2 page problem, data missing
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From time to time we have seen data corruption on our nand flash. Closer investigation with a 300MB large file showed us that 32 of 98 write-boot-read cycles got corrupted. The corruption were of two very similar forms:

a) Somewhere in the image one complete page, page M, were replaced by the contents of M+1. Page M+1, and all other data in the file were correct (data from the same page is returned twice).

b) Somewhere in the image there were two consecutive page errors. In the corrupted file page N were missing and replaced with N+1. Page N+1 contained only zeros. The rest of the data in the file were correct.

Our Linux kernel version are 2.6.22.1. The YAFFS version is per CVS of November 13. 2007.

Have anyone else seen such behavior with MTD and/or YAFFS2?
Do you have any suggestion in how to debug this?

Best regards,
Kjetil Aamodt
TANDBERG
