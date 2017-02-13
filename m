Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdOFi-0008Bu-PB
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 21:33:45 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	dwmw2@infradead.org
Subject: [PATCH 0/5] mtd-www: Updates regarding mtd-utils & ubi power-cut
 testing
Date: Mon, 13 Feb 2017 22:31:13 +0100
Message-Id: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series adds the mtd-utils 2.0.0 release anouncement to the 
news page and attempts to update the documentation regarding 
compiling mtd-utils and the user space ports of the mtd-tests.

Also included is the previously requested and long over due 
documentation on UBI power-cut testing.

Regards,

David

--
 doc/general.xml | 75 +++++++++++++++++++++++++++++++++++++--------------------
 doc/ubi.xml     | 11 +++++++++
 faq/general.xml | 22 ++++++++++++++---
 faq/ubi.xml     | 35 +++++++++++++++++++++++++++
 faq/ubifs.xml   |  5 ++++
 index.xml       |  2 ++
 6 files changed, 121 insertions(+), 29 deletions(-)
