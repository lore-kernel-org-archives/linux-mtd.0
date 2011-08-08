Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVeK-0000xl-OJ
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:38:09 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 3/9] faq: general: turn statement into a question
Date: Mon, 8 Aug 2011 12:37:13 -0700
Message-ID: <1312832239-21759-4-git-send-email-computersforpeace@gmail.com>
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

This looks like a statement, yet it's in the Frequently Asked Questions.
We can fix that.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 faq/general.xml |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/faq/general.xml b/faq/general.xml
index 2dc64b3..0336a32 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -18,7 +18,7 @@
 	<LI><A HREF="general.html#L_mtd_vs_hdd">What are the differences between flash devices and block drives?</A></LI>
 	<LI><A HREF="general.html#L_ext2_mtd">Can I mount ext2 over an MTD device?</A></LI>
 	<LI><A HREF="general.html#L_point">What are the point() and unpoint() functions used for?</A></LI>
-	<LI><A HREF="general.html#L_unlock">I keep getting errors whenever I try to write or erase to my MTD device</A></LI>
+	<LI><A HREF="general.html#L_unlock">Why do I keep getting errors whenever I try to write to or erase my MTD device?</A></LI>
 	<LI><A HREF="general.html#L_compile_mtd">How do I compile the mtd-utils tree?</A></LI>
 </OL>
 
@@ -221,7 +221,7 @@ release the chip again.
 
 
 <A NAME="L_unlock">
-<H2>I keep getting errors whenever I try to write or erase to my MTD device</H2>
+<H2>Why do I keep getting errors whenever I try to write to or erase my MTD device?</H2>
 </A>
 
 <P>
-- 
1.7.0.4
