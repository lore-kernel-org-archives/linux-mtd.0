Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9Uq8-0005zS-Ju
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2015 08:54:58 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <computersforpeace@gmail.com>
Subject: [PATCH 1/2] mtd-utils: fs-tests: pass TEST_DIR to integck in
 run_all.sh
Date: Mon, 29 Jun 2015 16:49:18 +0800
Message-ID: <1435567759-32518-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Test integck requires a parameter but run_all.sh did no pass any to it.
Then:
integck: error!: test file-system was not specified (use -h for help)

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 tests/fs-tests/run_all.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/fs-tests/run_all.sh b/tests/fs-tests/run_all.sh
index 7c82921..cb481ab 100755
--- a/tests/fs-tests/run_all.sh
+++ b/tests/fs-tests/run_all.sh
@@ -16,7 +16,7 @@ rm -rf ${TEST_DIR}/*
 
 rm -rf ${TEST_DIR}/*
 
-./integrity/integck || exit 1
+./integrity/integck $TEST_DIR|| exit 1
 
 rm -rf ${TEST_DIR}/*
 
-- 
1.8.4.2
