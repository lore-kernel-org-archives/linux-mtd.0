Received: from bdsl.66.14.23.165.gte.net ([66.14.23.165]
	helo=eai-exchange.edgeaccess.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aj265-0007QP-VK
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 20:03:38 +0000
Message-ID: <400D8910.9060102@ieee.org>
Date: Tue, 20 Jan 2004 15:01:20 -0500
From: Bob Beers <bbeers@ieee.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <E1Aj0eB-0006rS-Bn@pentafluge.infradead.org>
In-Reply-To: <E1Aj0eB-0006rS-Bn@pentafluge.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re:  MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2004-01-20 at 13:04 -0500, Mark Richards wrote:

 >[root@localhost linux]# make xconfig
 >rm -f include/asm
 >( cd include ; ln -sf asm-i386 asm)
 >make -C scripts kconfig.tk
 >make[1]: Entering directory `/usr/src/linux-2.4.24.new.mtd/scripts'
 >cat header.tk >> ./kconfig.tk
 >./tkparse < ../arch/i386/config.in >> kconfig.tk
 >drivers/mtd/chips/Config.in: 14: unknown command
 >make[1]: *** [kconfig.tk] Error 1
 >make[1]: Leaving directory `/usr/src/linux-2.4.24.new.mtd/scripts'
 >make: *** [xconfig] Error 2 [root@localhost linux]#
 >
 >
 >Is it something I'm missing?  My kernel sources are the 2.4.24 (latest).

I saw the exact same issue.  I edited drivers/mtd/chips/Config.in by hand,
  after mtd patchin, to change the lines (14 and 59) to modify
  the 'elif' into a nested 'else if'.  After that make xconfig works.  Also as
  mentioned by dwmw2, the other make *config don't seem to have any trouble
  with those lines.  I didn't get around to it figuring out why.

-bbeers
