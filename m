Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MwrfF-0005br-2F
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 06:12:21 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ingo Molnar <mingo@elte.hu>
Subject: [PATCH] panic.c: export panic_on_oops
Date: Sun, 11 Oct 2009 09:10:58 +0300
Message-Id: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

We use the mtdoops module which stores oopses on the Flash partition,
in order to make it possible to analyze them later. And mtdoops needs
to know whether 'panic_on_oops' is on or off. Thus, we need this
variable to be exported.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aaro Koskinen <aaro.koskinen@nokia.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Simon Kagstrom <simon.kagstrom@netinsight.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>
---
 kernel/panic.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index bcdef26..6d29be3 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -24,6 +24,8 @@
 #include <linux/dmi.h>
 
 int panic_on_oops;
+EXPORT_SYMBOL_GPL(panic_on_oops);
+
 static unsigned long tainted_mask;
 static int pause_on_oops;
 static int pause_on_oops_flag;
-- 
1.6.2.5
