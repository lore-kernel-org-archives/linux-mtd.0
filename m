Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVek-00012B-Uj
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:38:35 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 7/9] faq: ubi(fs): sending bug reports using `mtdinfo'
Date: Mon, 8 Aug 2011 12:37:17 -0700
Message-ID: <1312832239-21759-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
References: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The `mtdinfo' utility (with the `-a' flag) is much more informative
than `cat /proc/mtd', so encourage users to use it if possible when
sending bug reports.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 faq/ubi.xml   |    4 ++--
 faq/ubifs.xml |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/faq/ubi.xml b/faq/ubi.xml
index 2d9ce6e..e9e6625 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -874,8 +874,8 @@ quicker than the first method.</p>
 	<li>provide UBI configuration from you your <code>.config</code>
 	file, or just attach whole file;</li>
 
-	<li>describe your flash device, attach the
-	"<code>cat /proc/mtd</code>" output;</li>
+	<li>describe your flash device, attach the "<code>mtdinfo -a</code>"
+	output (or the less useful "<code>cat /proc/mtd</code>" output);</li>
 
 	<li>specify which kernel version you are using; if your kernel is not
 	the latest one, please, explicitly tell whether you updated UBI by
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index 14043f5..2969bad 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -1485,8 +1485,8 @@ all checks: "<code>echo 127 > /sys/module/ubifs/parameters/debug_chks</code>".</
 	<li>provide UBIi and UBIFS configuration from you your
 	<code>.config</code> file, or just attach whole file;</li>
 
-	<li>describe your flash device, attach the
-	"<code>cat /proc/mtd</code>" output;</li>
+	<li>describe your flash device, attach the "<code>mtdinfo -a</code>"
+	output (or the less useful "<code>cat /proc/mtd</code>" output);</li>
 
 	<li>specify which kernel version you are using; if your kernel is not
 	the latest one, please, explicitly tell whether you updated UBIFS by
-- 
1.7.0.4
