Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbYA-00043Q-Ib
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:26:04 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 11/53] docs-rst: conf.py: sort LaTeX documents in
 alphabetical order
Date: Tue, 16 May 2017 09:16:03 -0300
Message-Id: <c2b563d8a3185667c44c2ec17243cf714d1db52f.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
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

As we add more documents, it makes more sense to sort the
entries there in alphabetical order, as it makes easier to
check if something is not there.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/conf.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1774357150a3..1bad6a4d6348 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -345,27 +345,28 @@ if major == 1 and minor > 3:
 # Grouping the document tree into LaTeX files. List of tuples
 # (source start file, target name, title,
 #  author, documentclass [howto, manual, or own class]).
+# Sorted in alphabetical order
 latex_documents = [
-    ('doc-guide/index', 'kernel-doc-guide.tex', 'Linux Kernel Documentation Guide',
-     'The kernel development community', 'manual'),
     ('admin-guide/index', 'linux-user.tex', 'Linux Kernel User Documentation',
      'The kernel development community', 'manual'),
     ('core-api/index', 'core-api.tex', 'The kernel core API manual',
      'The kernel development community', 'manual'),
+    ('doc-guide/index', 'kernel-doc-guide.tex', 'Linux Kernel Documentation Guide',
+     'The kernel development community', 'manual'),
     ('driver-api/index', 'driver-api.tex', 'The kernel driver API manual',
      'The kernel development community', 'manual'),
+    ('gpu/index', 'gpu.tex', 'Linux GPU Driver Developer\'s Guide',
+     'The kernel development community', 'manual'),
     ('input/index', 'linux-input.tex', 'The Linux input driver subsystem',
      'The kernel development community', 'manual'),
     ('kernel-documentation', 'kernel-documentation.tex', 'The Linux Kernel Documentation',
      'The kernel development community', 'manual'),
     ('kernel-hacking/index', 'kernel-hacking.tex', 'Kernel Hacking Guides',
      'The kernel development community', 'manual'),
-    ('process/index', 'development-process.tex', 'Linux Kernel Development Documentation',
-     'The kernel development community', 'manual'),
-    ('gpu/index', 'gpu.tex', 'Linux GPU Driver Developer\'s Guide',
-     'The kernel development community', 'manual'),
     ('media/index', 'media.tex', 'Linux Media Subsystem Documentation',
      'The kernel development community', 'manual'),
+    ('process/index', 'development-process.tex', 'Linux Kernel Development Documentation',
+     'The kernel development community', 'manual'),
     ('security/index', 'security.tex', 'The kernel security subsystem manual',
      'The kernel development community', 'manual'),
 ]
-- 
2.9.3
