Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HRVrG-0003VZ-9V
	for linux-mtd@lists.infradead.org; Wed, 14 Mar 2007 15:57:48 +0000
Subject: Slow JFFS2 mount on one particular system
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 14 Mar 2007 16:47:36 +0100
Message-Id: <1173887256.26465.151.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I got this system(embedded PowerPC, big endian) with a JFFS2 root FS and it is very slow to
mount(~50 sec) at boot, which is about 45 sec longer that other comparable system in the lab.

This system has been subjected to alot abuse like powercycling, adding and removing lots of
small and big files. Currently there are no errors from the FS when booting/using it other
that it is very slow. About 20% FS usage. I have forced GC by sending kill -HUP and kill -CONT
to the GC thread in a loop for about an hour and it didn't get any better.
There aren't and big log files either that are fragmented.

I have dumped an image of the FS here:
ftp://www.transmode.net/pub/slow_jffs2_image
It is 128509 KB.

Would very much like to know why this FS is so slow. Any ideas?

 Jocke
