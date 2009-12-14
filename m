Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NK9p8-0007If-Rl
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 12:14:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by buzzloop.caiaq.de (Postfix) with ESMTP id C0BB57F407B
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Dec 2009 13:14:42 +0100 (CET)
Received: from buzzloop.caiaq.de ([127.0.0.1])
	by localhost (buzzloop.caiaq.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AI379p6j9zwh for <linux-mtd@lists.infradead.org>;
	Mon, 14 Dec 2009 13:14:40 +0100 (CET)
Date: Mon, 14 Dec 2009 20:14:40 +0800
From: Daniel Mack <daniel@caiaq.de>
To: linux-mtd@lists.infradead.org
Subject: New mtd-utils release?
Message-ID: <20091214121439.GC28375@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

we're building mtd-utils with buildroot, and as we need a recent version
of it to get the ubi features, we currently check out a git snapshot as
tarball. Last week, for some reason the SHA1 ID we used (e783e75e0)
disappeared from the repository. (Just out of curiosity: what happened?
Was the tree rebased or filtered?).

However, this approach is somewhat hackish anyway, and we would much
more like to check out a version that is officially tagged. Seeing the
last tag has been done ~17 month ago, I wonder whether there is any
change to get a new one soon?

Thanks,
Daniel
