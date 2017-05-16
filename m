Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQ3-0001Lg-2e
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:17:56 +0000
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
Subject: [PATCH v2 16/53] docs-rst: add userspace API book to pdf output
Date: Tue, 16 May 2017 09:16:08 -0300
Message-Id: <6bb33768db86cd6860e07bf2145012556221b745.1494935649.git.mchehab@s-opensource.com>
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

The userspace API book was added without the bits required to
generate PDF output. Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/conf.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index bca751960dec..2e215477edf5 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -373,6 +373,8 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('sound/index', 'sound.tex', 'Linux Sound Subsystem Documentation',
      'The kernel development community', 'manual'),
+    ('userspace-api/index', 'userspace-api.tex', 'The Linux kernel user-space API guide',
+     'The kernel development community', 'manual'),
 ]
 
 # The name of an image file (relative to this directory) to place at the top of
-- 
2.9.3
