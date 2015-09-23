Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZekKQ-0000NO-63
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 13:43:23 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [Resend PATCH 0/2] UBIFS: two trivial fix
Date: Wed, 23 Sep 2015 09:11:38 +0000
Message-ID: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sheng Yong (2):
  UBIFS: call dbg_is_power_cut() instead of reading c->dbg->pc_happened
  UBIFS: print verbose message when rescanning a corrupted node

 fs/ubifs/debug.c    | 8 ++++----
 fs/ubifs/recovery.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1
