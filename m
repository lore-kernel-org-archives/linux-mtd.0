Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQWFE-0003bA-8P
 for linux-mtd@lists.infradead.org; Sat, 05 May 2012 04:05:20 +0000
Received: by mail-pz0-f43.google.com with SMTP id z8so5059468daj.30
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 21:05:20 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH (mtd-www) 2/3] source: update patch title format
Date: Fri,  4 May 2012 21:04:59 -0700
Message-Id: <1336190700-27345-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1336190700-27345-1-git-send-email-computersforpeace@gmail.com>
References: <1336190700-27345-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Today, patches usually use "mtd: target: ..." (in lowercase) rather than
"[MTD] TARGET: ..."

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 source.xml |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/source.xml b/source.xml
index faba4a1..01c359f 100644
--- a/source.xml
+++ b/source.xml
@@ -66,10 +66,10 @@ simple rules should be followed when submitting patches</p>
 
 <ol>
 <li>Provide a short summary line of the patch in the format:</li><br />
-<code>[PATCH] [MTD] DETAILEDTARGET: short summary</code>
+<code>[PATCH] mtd: DETAILEDTARGET: short summary</code>
 <p>
-DETAILEDTARGET should be one of the MTD subcomponents, e.g. NAND, CHIPS,
-MAPS, CORE, and/or a filename if it simplifies the review/recognition of
+DETAILEDTARGET should be one of the MTD subcomponents, e.g. nand, chips,
+maps, core, and/or a filename if it simplifies the review/recognition of
 patch relevance.</p>
 
 <li>Empty new line</li>
-- 
1.7.5.4.2.g519b1
