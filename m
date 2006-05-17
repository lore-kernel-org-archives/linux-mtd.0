Received: from shinybook.infradead.org ([81.187.2.165])
	by pentafluge.infradead.org with esmtpsa (Exim 4.62 #1 (Red Hat Linux))
	id 1FgAjs-0006NH-Rq
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 02:22:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Wed, 17 May 2006 02:22:14 +0100
Message-Id: <1147828934.30771.32.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Map driver updates from CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've taken a quick look at drivers/mtd/maps in CVS, and most of the
changes there are just merges of cleanups which happened upstream, or
look like they're real changes which were also merged upstream as well
as being committed to CVS -- but without a $Id$ update.

So I'm going to ignore what's in CVS for drivers/mtd/maps -- if there
are any changes in there which do still need to be sent upstream, would
the owners of those files please send me an updated patch against the
git tree.

-- 
dwmw2
