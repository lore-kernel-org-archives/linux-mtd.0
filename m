Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuYQq-00012G-SZ
 for linux-mtd@lists.infradead.org; Wed, 11 Jun 2014 02:38:33 +0000
Message-ID: <5397C0E7.9070602@huawei.com>
Date: Wed, 11 Jun 2014 10:37:27 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/4] UBIFS: Fix code issues detected by Fortify
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the help of Fortify, I found some problems in source
code. I would like to fix them in this series of patches.

hujianyang (4):
  UBIFS: Add missing error handling in create_default_filesystem()
  UBIFS: Add missing error handling in dump_lpt_leb()
  UBIFS: Add missing break in dbg_chk_pnode()
  UBIFS: Remove useless statements

 fs/ubifs/journal.c    | 3 +++
 fs/ubifs/lpt.c        | 5 ++---
 fs/ubifs/lpt_commit.c | 7 +++++--
 fs/ubifs/orphan.c     | 1 -
 fs/ubifs/sb.c         | 4 +++-
 fs/ubifs/super.c      | 2 +-
 fs/ubifs/tnc.c        | 1 -
 fs/ubifs/tnc_commit.c | 1 -
 8 files changed, 14 insertions(+), 10 deletions(-)

-- 
1.8.1.4
