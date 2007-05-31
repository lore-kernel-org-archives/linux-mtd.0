Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Htlqm-0000bc-KC
	for linux-mtd@lists.infradead.org; Thu, 31 May 2007 10:42:17 -0400
Subject: GC starves write's in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 31 May 2007 16:41:57 +0200
Message-Id: <1180622517.1468.246.camel@gentoo-jocke.transmode.se>
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

We have noticed that deleting some 50 files, some a few MB big, in our
JFFS2 FS and then directly start downloading a large rpm file sometimes
stalls a write(2) call 10-15 secs, possibly more. The GC process is
running and it appears to be blocking the write(2). However the FS is
just 50-60% full so I don't think stalling writes for that long time is
justified. These long delays causes a timeout in the tftp demon and
the transmission is aborted. Any ideas?

 Jocke
