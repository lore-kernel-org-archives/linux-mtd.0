Received: from vdisk2.elitel.it ([212.34.224.151] helo=abraham.elitel.it)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0Jcg-0002or-OJ
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2004 12:12:42 +0000
Message-ID: <1078747931.404c631bec01e@www.postino.punto.it>
Date: Mon,  8 Mar 2004 13:12:11 +0100
From: adriacom2232@adriacom.it
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: JFFS2 check fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
sometimes, during boot sequence, the system I'm working on doesn't boot: the
JFFS2 issues a data CRC failure and the kernel goes in panic!
Panic is caused by a illegal memory access due to the fact that the JFFS's
check function uses inodes "cdata" parameter to define how many bytes it has
to read to perform CRC checking on data. Unfortunatelly this size is bigger
than that allocated by the driver in a temporary buffer (RAM).
The problem is that a previous JFFS's write contains bad inode "csize"
value: bigger than PAGE_SIZE. It is not caused by a defective write to flash
because the inode CRC is correct.
I'am using JFFS2 version 2.1 included in the Handhelds linux distribution
(kernel 2.4.7).

Do next releases of JFFS2 fix this bug?
The problem appears very seldom and is difficult to catch.
Any suggestion will be apreciated.

Michele
