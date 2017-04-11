Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxsSQ-0006Vh-RF
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 09:51:32 +0000
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v2 0/3] make ubifs compatible with IMA and EVM.
Date: Tue, 11 Apr 2017 11:50:52 +0200
Message-Id: <20170411095055.26328-1-o.rempel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To make ubifs compatible with IMA nad EVM security modules:
- we need to notify them about inode changes over inode->i_version
- provide super block uuid to allow fs choice by uuid.

Oleksij Rempel (1):
  fs: ubifs: update i_version on inode changes

Steffen Trumtrar (2):
  fs: ubifs: parse iversion mount option
  fs: ubifs: set s_uuid in super block

 fs/ubifs/file.c  | 9 +++++++++
 fs/ubifs/super.c | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.11.0
