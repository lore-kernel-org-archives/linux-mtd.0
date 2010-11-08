Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PFKaa-0006Ls-LT
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2010 05:48:21 +0000
From: Viresh Kumar <viresh.kumar@st.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd/fsmc.h: including linux/io.h for definition of readl
Date: Mon, 8 Nov 2010 11:17:54 +0530
Message-ID: <ae7281ab5364fe0c2b1a7375d5d53ddfc12172d6.1289194908.git.viresh.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Viresh Kumar <viresh.kumar@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
 include/linux/mtd/fsmc.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index 2ac94d3..fce5cf0 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -16,6 +16,7 @@
 #ifndef __MTD_FSMC_H
 #define __MTD_FSMC_H
 
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/mtd/physmap.h>
 #include <linux/types.h>
-- 
1.7.2.3
