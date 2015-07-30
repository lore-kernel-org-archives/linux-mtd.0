Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKh5M-0002s5-91
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 06:12:56 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <eguan@redhat.com>, <fstests@vger.kernel.org>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 2/5] xfstest: generic/219 add _require_odirect
Date: Thu, 30 Jul 2015 14:06:54 +0800
Message-ID: <1438236417-24612-3-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438236417-24612-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438236417-24612-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

generic/219 is testing quota in three use cases including
Direct I/O. So we have to add a dependence to odirect in
this test.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 tests/generic/219 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/generic/219 b/tests/generic/219
index 2b75b89..866e7b7 100755
--- a/tests/generic/219
+++ b/tests/generic/219
@@ -44,6 +44,7 @@ _supported_fs generic
 _supported_os Linux #IRIX
 _require_scratch
 _require_quota
+_require_odirect
 _require_user
 _require_group
 
-- 
1.8.4.2
