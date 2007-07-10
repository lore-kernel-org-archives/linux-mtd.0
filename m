Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8BFB-0004G5-JI
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 04:38:51 -0400
Subject: [PATCH 0/3] jffs2 LZO support
From: Richard Purdie <rpurdie@openedhand.com>
To: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 10 Jul 2007 09:38:36 +0100
Message-Id: <1184056716.6435.21.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following patches add LZO support to jffs2. They work against the
LZO code currently in -mm which Andrew has agreed to merge promptly in
the current merge window. The patches have been posted several times
before and the previous feedback has been worked into them.

Let me know if there are any problems, hopefully we can get this code
merged! :)

Richard
