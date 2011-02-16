Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PpWSs-0002NK-QF
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2011 01:45:59 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: common.h: simple_strtoll type usage
Date: Tue, 15 Feb 2011 17:47:58 -0800
Message-ID: <1297820878-2582-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We must use "long long" and "unsigned long long" types when
implementing the functions "simple_strtoll()" and "simple_strtoull()",
respectively. This prevents casting/truncation errors on systems where
"long" is not the same size as "long long" (that is, on most systems).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/common.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/common.h b/include/common.h
index eb8d5fc..2e5c2a0 100644
--- a/include/common.h
+++ b/include/common.h
@@ -108,9 +108,9 @@ static inline type simple_##func(const char *snum, int *error) \
 	return ret; \
 }
 simple_strtoX(strtol, long int)
-simple_strtoX(strtoll, long int)
+simple_strtoX(strtoll, long long int)
 simple_strtoX(strtoul, unsigned long int)
-simple_strtoX(strtoull, unsigned long int)
+simple_strtoX(strtoull, unsigned long long int)
 
 #include "xalloc.h"
 
-- 
1.7.0.4
