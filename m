Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y29wd-0006yl-3w
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 02:39:04 +0000
Received: by mail-pd0-f179.google.com with SMTP id fp1so2327685pdb.10
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 18:38:38 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-www 1/4] footer: drop 'Last updated' and other buggy
 footer notices
Date: Fri, 19 Dec 2014 18:38:23 -0800
Message-Id: <1419043106-16453-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These "last updated" messages are often wrong, and are rarely useful. We
could also drop the VAR_CVSID definitions from all the other source
files, but there's no need at the moment.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 inc/footer.tmpl | 1 -
 1 file changed, 1 deletion(-)

diff --git a/inc/footer.tmpl b/inc/footer.tmpl
index 9ba350f55f56..aaa58a1950bf 100644
--- a/inc/footer.tmpl
+++ b/inc/footer.tmpl
@@ -2,7 +2,6 @@
    </div>
    <div align="right">
    	<p>
-	VAR_CVSID
       	<a href="http://validator.w3.org/check?uri=referer">
 		<img src="http://www.w3.org/Icons/valid-xhtml10"
 		 alt="Valid XHTML 1.0!" height="31" width="88" />
-- 
1.9.1
