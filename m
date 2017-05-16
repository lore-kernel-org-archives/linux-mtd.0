Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQn-0002i7-Ks
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:26 +0000
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
 Jason Wessel <jason.wessel@windriver.com>, Jiri Slaby <jslaby@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 49/53] lib: update location of kgdb documentation
Date: Tue, 16 May 2017 09:16:41 -0300
Message-Id: <08c76a2f432974de34343a1a323cbeab48321c41.1494935649.git.mchehab@s-opensource.com>
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

The documentation was moved from DocBook directory.
Update its location.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 lib/Kconfig.kgdb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
index 533f912638ed..ab4ff0eea776 100644
--- a/lib/Kconfig.kgdb
+++ b/lib/Kconfig.kgdb
@@ -13,7 +13,7 @@ menuconfig KGDB
 	  CONFIG_FRAME_POINTER to aid in producing more reliable stack
 	  backtraces in the external debugger.  Documentation of
 	  kernel debugger is available at http://kgdb.sourceforge.net
-	  as well as in DocBook form in Documentation/DocBook/.  If
+	  as well as in Documentation/dev-tools/kgdb.rst.  If
 	  unsure, say N.
 
 if KGDB
-- 
2.9.3
