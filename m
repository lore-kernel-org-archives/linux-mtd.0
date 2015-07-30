Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKh5N-0002s5-D3
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 06:12:57 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <eguan@redhat.com>, <fstests@vger.kernel.org>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 3/5] xfstest: generic/125 add _require_odirect
Date: Thu, 30 Jul 2015 14:06:55 +0800
Message-ID: <1438236417-24612-4-git-send-email-yangds.fnst@cn.fujitsu.com>
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

generic/125 is using src/trunc which is testing O_DIRECT.
So we have to add direct dependence to this test.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 tests/generic/125 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/generic/125 b/tests/generic/125
index bcf9b3e..67eb63f 100755
--- a/tests/generic/125
+++ b/tests/generic/125
@@ -41,6 +41,7 @@ _supported_os Linux
 
 _require_test
 _require_user
+_require_odirect
 
 TESTDIR=$TEST_DIR/ftrunc
 TESTFILE=$TESTDIR/ftrunc.tmp
-- 
1.8.4.2
