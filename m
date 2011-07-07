Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QevRc-0004Yn-Bf
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 20:45:09 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 2/3] Makefile: fix "make clean" for cross-compile
Date: Thu, 7 Jul 2011 13:44:26 -0700
Message-ID: <1310071467-9017-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When cross-compiling (make CROSS=mipsel-linux-), I get this error:

rm -rf /home/norris/git/mtd-utils/mipsel-linux
find /home/norris/git/mtd-utils/mipsel-linux/ -xdev \
		'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
		-exec rm -f {} +
find: `/home/norris/git/mtd-utils/mipsel-linux/': No such file or directory
make: *** [clean] Error 1

Now, for cross-compiling, we've already deleted the $(BUILDDIR), so we
should check this before cleaning individual objects with "find."

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Makefile |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 7c20ea5..78f5f9f 100644
--- a/Makefile
+++ b/Makefile
@@ -50,9 +50,11 @@ ifneq ($(BUILDDIR),$(CURDIR))
 endif
 endif
 endif
-	find $(BUILDDIR)/ -xdev \
-		'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
-		-exec rm -f {} +
+	@if test -d "$(BUILDDIR)/"; then \
+		find $(BUILDDIR)/ -xdev \
+			'(' -name '*.[ao]' -o -name '.*.c.dep' ')' \
+			-exec rm -f {} + ; \
+	fi
 	rm -f include/version.h
 	$(MAKE) -C $(TESTS) clean
 
-- 
1.7.0.4
