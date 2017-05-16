Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQX-0008Uo-Md
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:12 +0000
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
Subject: [PATCH v2 12/53] docs-rst: conf.py: remove kernel-documentation from
 LaTeX
Date: Tue, 16 May 2017 09:16:04 -0300
Message-Id: <1d8c4e1fded88588a172bec4df5ade953916f574.1494935649.git.mchehab@s-opensource.com>
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

There's no kernel-documentation.rst file at Documentation/
anymore. So, remove it from the list of LaTeX-generated
documents.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/conf.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1bad6a4d6348..15f34d6863a7 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -359,9 +359,7 @@ latex_documents = [
      'The kernel development community', 'manual'),
     ('input/index', 'linux-input.tex', 'The Linux input driver subsystem',
      'The kernel development community', 'manual'),
-    ('kernel-documentation', 'kernel-documentation.tex', 'The Linux Kernel Documentation',
-     'The kernel development community', 'manual'),
-    ('kernel-hacking/index', 'kernel-hacking.tex', 'Kernel Hacking Guides',
+    ('kernel-hacking/index', 'kernel-hacking.tex', 'Unreliable Guide To Hacking The Linux Kernel',
      'The kernel development community', 'manual'),
     ('media/index', 'media.tex', 'Linux Media Subsystem Documentation',
      'The kernel development community', 'manual'),
-- 
2.9.3
