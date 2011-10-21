Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RHIEw-0003y6-CO
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2011 16:46:39 +0000
Received: by yxk36 with SMTP id 36so4694914yxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Oct 2011 09:46:36 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] doc, faq: fix typos
Date: Fri, 21 Oct 2011 09:46:17 -0700
Message-Id: <1319215577-30184-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix spelling errors and a URL typo.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 doc/ubifs.xml |    2 +-
 faq/nand.xml  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/ubifs.xml b/doc/ubifs.xml
index 9943508..bbe86f6 100644
--- a/doc/ubifs.xml
+++ b/doc/ubifs.xml
@@ -309,7 +309,7 @@ some specific aspects of MLC NAND flashes:</p>
 
 	<li>[<b>NEED WORK</b>] The "unstable bits issue", which is not
 	MLC-specific, described
-	<a href="/ubifs.html#L_unstable_bits">here</a>.</li>
+	<a href="ubifs.html#L_unstable_bits">here</a>.</li>
 </ul>
 
 
diff --git a/faq/nand.xml b/faq/nand.xml
index 9d9cd06..e142de8 100644
--- a/faq/nand.xml
+++ b/faq/nand.xml
@@ -186,7 +186,7 @@ Yes, you can. The requirements are the same as for boot-loaders
 <P>
 NAND simulator (<CODE>nandsim</CODE>) is an extremely useful debugging and
 development tool which simulates NAND flashes in RAM or a file. To select the
-simulated flash type one should specify ID bytes of your flashe - the onese
+simulated flash type one should specify ID bytes of your flash - the ones
 which are returned by the "Read ID" command (<CODE>0x90</CODE>) - consult the
 flash manual. The following are examples of input parameters:
 </P>
-- 
1.7.5.4
