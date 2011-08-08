Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVe7-0000xl-0j
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:37:55 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/9] UBIFS FAQ: spelling, grammar
Date: Mon, 8 Aug 2011 12:37:11 -0700
Message-ID: <1312832239-21759-2-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 faq/ubifs.xml |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index bd91733..f70c222 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -77,9 +77,9 @@ some specific aspects of MLC NAND flashes:</p>
 	this is also not a problem because it is exactly what UBI and UBIFS do
 	(see also <a href="ubi.html#L_restrict">this</a> section);</li>
 
-	<li>MLC flashes have rather short eraseblock life-cycle of just few
-	thousand of erase cycles; and this is not a problem, because UBI
-	uses deterministic wear-leveling algorithm
+	<li>MLC flashes have rather short eraseblock life-cycles of just a few
+	thousand erase cycles; this is not a problem because UBI uses a
+	deterministic wear-leveling algorithm
 	(see <a href="ubi.html#L_mlc">this</a> section);</li>
 
 	<li>MLC flashes exhibit bit flips as a result of "program disturb" and
@@ -1229,7 +1229,7 @@ The ways to solve this:
 	<li>Use <code>ubiformat</code> and format the NOR partition before
 	attaching it to UBI. But this will not help in situations when you
 	delete may files, and starts erasing many eraseblocks, so the "MTD/CFI
-	chip lock" becomes very condtended.</li>
+	chip lock" becomes very contended.</li>
 	<li>Use erase-suspend for writing (if your chip supports this).</li>
 </ol>
 </p>
-- 
1.7.0.4
