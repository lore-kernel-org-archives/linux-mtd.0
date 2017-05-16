Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQM-0001Lj-LG
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:41 +0000
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
Subject: [PATCH v2 14/53] docs-rst: add dev-tools book to pdf output
Date: Tue, 16 May 2017 09:16:06 -0300
Message-Id: <81e11d490ea470381943ce24c63dec0b6ce31e4e.1494935649.git.mchehab@s-opensource.com>
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

The dev-tools API book was added without the bits required to
generate PDF output at the main conf.py. Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/conf.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index ce62723491d4..1d461f0c1cd0 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -353,6 +353,8 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('crypto/index', 'crypto-api.tex', 'Linux Kernel Crypto API manual',
      'The kernel development community', 'manual'),
+    ('dev-tools/index', 'dev-tools.tex', 'Development tools for the Kernel',
+     'The kernel development community', 'manual'),
     ('doc-guide/index', 'kernel-doc-guide.tex', 'Linux Kernel Documentation Guide',
      'The kernel development community', 'manual'),
     ('driver-api/index', 'driver-api.tex', 'The kernel driver API manual',
-- 
2.9.3
