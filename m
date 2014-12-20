Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y29wd-0006ys-8F
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 02:39:05 +0000
Received: by mail-pd0-f177.google.com with SMTP id ft15so2297531pdb.22
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 18:38:42 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-www 4/4] faq: ubi: note that CONFIG_MTD_NAND_VERIFY_WRITE
 is dead
Date: Fri, 19 Dec 2014 18:38:26 -0800
Message-Id: <1419043106-16453-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1419043106-16453-1-git-send-email-computersforpeace@gmail.com>
References: <1419043106-16453-1-git-send-email-computersforpeace@gmail.com>
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

RIP.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 faq/ubi.xml | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/faq/ubi.xml b/faq/ubi.xml
index 9b2165def9c3..f8c40f64044d 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -567,9 +567,27 @@ ubi.mtd=0,2048
 
 <p>If you have a 2048 bytes per NAND page device, and have
 <code>CONFIG_MTD_NAND_VERIFY_WRITE</code> enabled in your kernel, you will need
-to turn it off. The code does not currently (as of 2.6.26) perform verification
+to turn it off. The code did not currently (as of 2.6.26) perform verification
 of sub-page writes correctly. As UBI is one of the few users of sub-page
-writes, not much else seems to be affected by this bug.</p>
+writes, not much else seemed to be affected by this bug. In Linux 3.7,
+<code>CONFIG_MTD_NAND_VERIFY_WRITE</code> was removed:
+
+<pre>
+commit 657f28f8811c92724db10d18bbbec70d540147d6
+Date:   Tue Aug 14 22:38:45 2012 -0400
+
+    mtd: kill MTD_NAND_VERIFY_WRITE
+
+    "Both UBI and JFFS2 are able to read verify what they wrote already.
+    There are also MTD tests which do this verification. So I think there
+    is no reason to keep this in the NAND layer, let alone wasting RAM in
+    the driver to support this feature. Besides, it does not work for sub-pages
+    and many drivers have it broken. It hurts more than it provides benefits."
+
+    So kill MTD_NAND_VERIFY_WRITE entirely.
+</pre>
+
+</p>
 
 
 
-- 
1.9.1
