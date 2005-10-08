Received: from [204.13.82.214] (helo=mail.netenrich.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EO7fl-0006f6-NA
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2005 01:55:18 -0400
Message-ID: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>
Date: Fri, 7 Oct 2005 22:48:02 -0700 (PDT)
From: nreddy@netenrich.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: "Timing issue when we use SPANSION 8MB Flash"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,

We are developing an embedded system with u-boot and Montavista Emebededd
linux ( Kernel Version 2.4.20).
Here we have put AMD 4MB flash  and the system is working is working fine.
Recently we have increased Flash size to 8MB(SPANSION ( S29GL064M90FAIR10)
make).

Now the system works fine but with one problem.

When i try to copy files to /mnt/jffs2 directory it is taking very long
time(around 8 Minutes for 2.2 MB files).
But when i try to copy files on 4MB Flash (AMD(AM29LV320DT) Make) it is
taking only 1.7 Min to copy same size of files.

Can any one throw a light on this...

Thanks in advance,
--Nagi Reddy
