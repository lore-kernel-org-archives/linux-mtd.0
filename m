Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQc-0008W1-Mj
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:16 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 Ingo Molnar <mingo@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Olof Johansson <olof@lixom.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH v2 48/53] fs: update location of filesystems documentation
Date: Tue, 16 May 2017 09:16:40 -0300
Message-Id: <e1b4fc7add72f565d9c35066d85108346e01d3e9.1494935649.git.mchehab@s-opensource.com>
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

The filesystem documentation was moved from DocBook to
Documentation/filesystems/. Update it at the sources.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 fs/debugfs/file.c       | 2 +-
 include/linux/debugfs.h | 2 +-
 lib/Kconfig.debug       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 354e2ab62031..6dabc4a10396 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -9,7 +9,7 @@
  *	2 as published by the Free Software Foundation.
  *
  *  debugfs is for people to use instead of /proc or /sys.
- *  See Documentation/DocBook/filesystems for more details.
+ *  See Documentation/filesystems/ for more details.
  *
  */
 
diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index 9174b0d28582..aa86e6d8c1aa 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -9,7 +9,7 @@
  *	2 as published by the Free Software Foundation.
  *
  *  debugfs is for people to use instead of /proc or /sys.
- *  See Documentation/DocBook/filesystems for more details.
+ *  See Documentation/filesystems/ for more details.
  */
 
 #ifndef _DEBUGFS_H_
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e4587ebe52c7..b7882d45f48e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -286,7 +286,7 @@ config DEBUG_FS
 	  write to these files.
 
 	  For detailed documentation on the debugfs API, see
-	  Documentation/DocBook/filesystems.
+	  Documentation/filesystems/.
 
 	  If unsure, say N.
 
-- 
2.9.3
