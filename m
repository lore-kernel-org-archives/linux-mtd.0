Received: from crans1-ubr2-3bn34-hfc-0251-d8d89883.rdc1.ri.coxatwork.com
	([216.216.152.131] helo=stone.tmok.com ident=pla)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15a1hw-0001vI-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2001 22:08:08 +0100
Received: (from pla@localhost)
	by stone.tmok.com (8.9.3/8.9.3) id RAA35279
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2001 17:14:48 -0400 (EDT)
Date: Thu, 23 Aug 2001 17:14:48 -0400 (EDT)
From: pla <pla@tmok.com>
Message-Id: <200108232114.RAA35279@stone.tmok.com>
To: linux-mtd@lists.infradead.org
Subject: UnitSizeFactor != 1 ?
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

Okay, new odd question.  Still using a 32mb DOC2000.  Everything
works well, until...
 
I try running XFree86 4.1.0, tried the C&T driver (I have a ct65555),
the FB driver, and the VESA driver.  All produce the same results,
namely, inconsistant "really odd" errors (such as various modules
looking like invalid modules, random sig-11's, etc).  By loading
all the X-stuff into a ramdisk, I can at least get the server to
start, but it locks up within a few seconds.  If I kill the server
before the lockup, I get back to a prompt and the system still
locks up within a few seconds (sometimes so badly that magic SysRq
functions don't respond, and even when they do, it won't finish
a sync or unmount).
 
This occurs with 2.4.8, MTD snapshot 20010812, and DOC stock firmware 4.2.
 
Now, about the subject line...
 
I tried upgrading the DOC to the newer 5.0 firmware, and I get the
error "Sorry, we don't support UnitSizeFactor of != 1 yet" at boot.
 
Both of these seem like at least somewhat serious problems, but the
latter ends up leaving me without a /dev/nftl/ entry, so I consider
it the more serious of the two, thus my subject line.
 
Thank you for any advice you might offer.
 
 
 
              - Ben Despres
