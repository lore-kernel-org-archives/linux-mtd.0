Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWy4Z-0001on-Fl
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 20:51:56 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH 5/6] mtd-utils/nandtest.c: Fixed indentation
Date: Thu, 8 Jul 2010 13:50:08 -0700
Message-ID: <1278622209-20149-6-git-send-email-norris@broadcom.com>
In-Reply-To: <1278622209-20149-1-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replaced tabs with spaces in the help message for nandtest to
fix problems with varying indentation and to provide consistency
with other utils in the set.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 nandtest.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index e31e28a..13e9577 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -18,13 +18,13 @@
 void usage(void)
 {
 	fprintf(stderr, "usage: nandtest [OPTIONS] <device>\n\n"
-		"  -h, --help		Display this help output\n"
-		"  -m, --markbad	Mark blocks bad if they appear so\n"
-		"  -s, --seed		Supply random seed\n"
-		"  -p, --passes		Number of passes\n"
-		"  -o, --offset		Start offset on flash\n"
-		"  -l, --length		Length of flash to test\n"
-		"  -k, --keep		Restore existing contents after test\n");
+		"  -h, --help           Display this help output\n"
+		"  -m, --markbad        Mark blocks bad if they appear so\n"
+		"  -s, --seed           Supply random seed\n"
+		"  -p, --passes         Number of passes\n"
+		"  -o, --offset         Start offset on flash\n"
+		"  -l, --length         Length of flash to test\n"
+		"  -k, --keep           Restore existing contents after test\n");
 	exit(1);
 }
 
-- 
1.7.0.4
