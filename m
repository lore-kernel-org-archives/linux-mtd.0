Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Llsqb-0001p2-VF
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 22:42:28 +0000
Received: id: bigeasy by Chamillionaire.breakpoint.cc authenticated by bigeasy
	with local (easymta 1.00 BETA 1) id 1LlsqY-0004mc-7c
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 23:42:18 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: mtd-utils/flash_eraseall: tiny cleanup
Date: Mon, 23 Mar 2009 23:42:15 +0100
Message-Id: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

tiny cleanup:
- #1 is almost a pure code move, except that now it is non fatal if a
  clean marker can't be prepared.
- #2 add support/ignore for flash types which don't support clean markers
- #3 is tricky. At this point we don't really which format is expected by
  the kernel. So we could either add another command line switch or get
  rid of this option :) Any comments on this?


Sebastian
