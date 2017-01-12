Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cRcdI-0006CN-OX
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 10:29:32 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	mac@mcrowe.com
Subject: [PATCH 0/3] mtd-utils: fix nandwrite virtual block handling
Date: Thu, 12 Jan 2017 11:28:25 +0100
Message-Id: <20170112102828.13124-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series mainly fixes how nandwrite checks for bad blocks
when using jffs2 virtual erase blocks and tries to cleanup the
nandwrite main loop by using new utility functions.

David Oberhollenzer (3):
      nandwrite: add stricter sanity checking for blockalign
      nandwrite: replace erase loop with mtd_erase_multi
      nandwrite: fix/cleanup bad block skipping

 nand-utils/nandwrite.c | 82 +++++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 38 deletions(-)
