Received: from hvc-24-164-172-133.hvc.rr.com ([24.164.172.133] helo=circe.crossproduct.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SvSJ-00032o-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 09:07:11 +0100
Date: Fri, 12 Jul 2002 04:07:21 -0400
To: linux-mtd@lists.infradead.org
Subject: MTD statistics
Message-ID: <20020712080721.GA4066@circe.crossproduct.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: axial@circe.crossproduct.net (Austin Jennings)
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

I'm interested in getting MTD devices to report read/write/erase
statistics, similar to the way block devices report read/write
statistics via /proc/stat.  I'm aware that no such functionality
currently exists.  However, I've been told that there has been some past
interest in implementing something like this, and that a version of
mtdram may have been produced which does this.  I've glanced over the
list archives and searched around a bit, but I can't find any
information about this.  Does anybody know if there has in fact been any
work done on this, and if so, where I might find it?  Any information
would be appreciated.
