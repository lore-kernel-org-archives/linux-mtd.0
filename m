Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI9Ey-0006Lp-DL
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 08:54:07 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at
Subject: [PATCH 0/3] mtd-utils: miscellaneous fixes
Date: Mon, 14 May 2018 10:53:22 +0200
Message-Id: <20180514085325.6793-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch set contains various fixes for problems that have been reported
on the mtd IRC channel over the weekend.

The first patch fiexes command line option processing for ubiformat, the
second patch removes the old no-volume-table option from ubiformat.

The last patch contains another build system fixup and should in theory make
sure that the configure script from the distribution tar ball produces a
sensible error message if pkg-config is missing on a system instead of just
exploding somewhere else because some make variables are empty.

Regards,

David
