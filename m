Received: from smtp6-g21.free.fr ([212.27.42.6])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJqbS-0006wK-16
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 17:52:26 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH 01/13] mtd/docg3: fix debug log verbosity
Date: Fri, 28 Oct 2011 19:51:20 +0200
Message-Id: <1319824292-11085-2-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change the NOP debug log verbosity to very verbose to
unburden log analysis.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index bdcf5df..6f5233d 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -143,7 +143,7 @@ static void doc_delay(struct docg3 *docg3, int nbNOPs)
 {
 	int i;
 
-	doc_dbg("NOP x %d\n", nbNOPs);
+	doc_vdbg("NOP x %d\n", nbNOPs);
 	for (i = 0; i < nbNOPs; i++)
 		doc_writeb(docg3, 0, DOC_NOP);
 }
-- 
1.7.5.4
