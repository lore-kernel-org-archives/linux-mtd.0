Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAgxR-0003dp-O1
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 18:12:32 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Markus Heiser <markus.heiser@darmarIT.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 53/53] kernel-doc: describe the ``literal`` syntax
Date: Tue, 16 May 2017 15:12:00 -0300
Message-Id: <5d47c31b59f6c2c7ddce0fcb1be0f85ad39a56fe.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
References: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

changeset b97f193abf83 ("scripts/kernel-doc: fix parser
for apostrophes") added support for ``literal`` inside
kernel-doc, in order to allow using the "%" symbol inside
a literal block, as this is used at printk() description.

Document it.

Fixes: b97f193abf83 ("scripts/kernel-doc: fix parser for apostrophes")
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/doc-guide/kernel-doc.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index b32e4813ff6f..b24854b5d6be 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -149,6 +149,16 @@ Domain`_ references.
 ``%CONST``
   Name of a constant. (No cross-referencing, just formatting.)
 
+````literal````
+  A literal block that should be handled as-is. The output will use a
+  ``monospaced font``.
+
+  Useful if you need to use special characters that would otherwise have some
+  meaning either by kernel-doc script of by reStructuredText.
+
+  This is particularly useful if you need to use things like ``%ph`` inside
+  a function description.
+
 ``$ENVVAR``
   Name of an environment variable. (No cross-referencing, just formatting.)
 
-- 
2.9.3
