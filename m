Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIBbw-00057p-Cp
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 11:25:50 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, goliath@sigma-star.at,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/5] mtd-utils: Add fastmap support to ubinize
Date: Mon, 14 May 2018 13:25:23 +0200
Message-Id: <20180514112528.24092-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the userspace side of my preseeded fastmap series.
ubinize can now created images with a preloaded fastmap on it.

Richard Weinberger (5):
  Sync ubi-media.h with Linux
  ubinize: Don't stat image file twice
  libubigen: Carry image path and size in volume info
  libubigen: Maintain a eraseblock association table
  ubinize: Add fastmap support

 include/libubigen.h     |  25 ++++-
 include/mtd/ubi-media.h | 158 +++++++++++++++++++++++++++++--
 lib/libubigen.c         | 241 ++++++++++++++++++++++++++++++++++++++++++++----
 ubi-utils/ubiformat.c   |   6 +-
 ubi-utils/ubinize.c     | 120 ++++++++++++++++--------
 5 files changed, 477 insertions(+), 73 deletions(-)

-- 
2.13.6
