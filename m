Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQT-0001MI-4z
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:47 +0000
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
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 15/53] docs-rst: add sound book to pdf output
Date: Tue, 16 May 2017 09:16:07 -0300
Message-Id: <f3377977aa06ecb2558466293a711e2c21bdad3c.1494935649.git.mchehab@s-opensource.com>
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

The sound subsystem book was added without the bits required to
generate PDF output. Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/conf.py       |  2 ++
 Documentation/sound/conf.py | 10 ++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 Documentation/sound/conf.py

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1d461f0c1cd0..bca751960dec 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -371,6 +371,8 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('security/index', 'security.tex', 'The kernel security subsystem manual',
      'The kernel development community', 'manual'),
+    ('sound/index', 'sound.tex', 'Linux Sound Subsystem Documentation',
+     'The kernel development community', 'manual'),
 ]
 
 # The name of an image file (relative to this directory) to place at the top of
diff --git a/Documentation/sound/conf.py b/Documentation/sound/conf.py
new file mode 100644
index 000000000000..3f1fc5e74e7b
--- /dev/null
+++ b/Documentation/sound/conf.py
@@ -0,0 +1,10 @@
+# -*- coding: utf-8; mode: python -*-
+
+project = "Linux Sound Subsystem Documentation"
+
+tags.add("subproject")
+
+latex_documents = [
+    ('index', 'sound.tex', project,
+     'The kernel development community', 'manual'),
+]
-- 
2.9.3
