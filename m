Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1XgqfC-0003GO-8X
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 07:48:58 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: ubiformat: Add fastmap support
Date: Wed, 22 Oct 2014 09:48:29 +0200
Message-Id: <1413964111-4048-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When flashing an image with ubiformat fastmap is not supported since
the first 64 eraseblocks are occupied with data, so the fastmap code
does not find a place to put the fastmap anchor. This series changes
this and allows to use fastmap with ubiformat flashed images.

Sascha Hauer (2):
      ubiformat: Factor out a write_eraseblock function
      ubiformat: Leave space for fastmap anchor

 ubi-utils/ubiformat.c | 251 +++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------------
 1 file changed, 121 insertions(+), 130 deletions(-)
