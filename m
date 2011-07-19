Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIzL-0000ug-Iw
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:42:05 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 09/10] nand-data: update sorting description
Date: Tue, 19 Jul 2011 15:40:46 -0700
Message-ID: <1311115247-20636-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
References: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our python script (csvtohtml.py) automatically sorts the CSV table, so
update the page description to reflect this.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nand-data/header.tmpl |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/nand-data/header.tmpl b/nand-data/header.tmpl
index 239e9db..d0b3423 100644
--- a/nand-data/header.tmpl
+++ b/nand-data/header.tmpl
@@ -50,10 +50,9 @@ It is not an exhaustive list by any means, and it certainly has a few holes
 (especially on newer parts) but it is well beyond the scope of anything I have
 found in other materials.
 </p>
-<p>This table is currently sorted by the order in which I came across the chips.
-This leaves many of the chips in grouping by datasheet and similar type, but it
-may overall seem disorganized. I may choose to improve the nature of this catalog
-in the future.
+<p>This table is currently sorted by Full ID string, then by Size (for
+multi-chip die) and Manufacturer (for chips produced by more than one
+manufacturer, such as NAND08GR3B2C).
 </p>
 <p>One should note that <span class="wrong-size">rows in blue represent chips that
 are detected properly except for their total size (perhaps because they are
-- 
1.7.0.4
