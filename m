Received: from mail-eopbgr40115.outbound.protection.outlook.com
 ([40.107.4.115] helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7IFD-00014x-Aa
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 10:49:37 +0000
From: Martin Lund <malu@gomspace.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-www] Add UBI stress testing section
Date: Tue, 2 Oct 2018 12:49:12 +0200
Message-ID: <20181002104912.15641-1-malu@gomspace.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not many are aware of the UBI stress testing tools available in
mtd-utils so lets mention them. Also, lets give a short example on how
to run the tests.
---
 doc/ubi.xml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/doc/ubi.xml b/doc/ubi.xml
index 299b0f1..f20e1aa 100644
--- a/doc/ubi.xml
+++ b/doc/ubi.xml
@@ -49,6 +49,7 @@
 	</li>
 	<li><a href="ubi.html#L_fastmap">Fastmap</a></li>
 	<li><a href="ubi.html#L_ubiblock">R/O block devices on top of UBI volumes</a></li>
+	<li><a href="ubi.html#L_ubitest">UBI stress testing</a></li>
 	<li><a href="ubi.html#L_ubidoc">More documentation</a></li>
 </ol>
 
@@ -1349,6 +1350,20 @@ $ ubiblock --remove /dev/ubi0_0
 </pre>
 
 
+<h2><a name="L_ubitest">UBI stress testing</a></h2>
+
+<p>If enabled, mtd-utils include user-space tools that can be used to stress
+test the UBI stack. This is useful if you want to test the stability and
+correctness of your particular UBI stack implementation.</p>
+
+<p>Example, running various UBI tests:</p>
+
+<pre>
+$ flash_erase /dev/mtd3 0 0
+$ ubiattach --mtdn 3
+$ /usr/libexec/mtd-utils/runubitests.sh /dev/ubi0
+</pre>
+
 
 <h2><a name="L_ubidoc">More documentation</a></h2>
 
-- 
2.19.0
