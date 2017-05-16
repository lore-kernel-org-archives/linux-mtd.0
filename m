Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQT-0002gw-Ks
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:08 +0000
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
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 44/53] MAINTAINERS: update old references for DocBook
 directory
Date: Tue, 16 May 2017 09:16:36 -0300
Message-Id: <0c88a0410e57c9be5484a5e1b66ffccfc587fe07.1494935649.git.mchehab@s-opensource.com>
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

As everything was converted, update the references to
point to the new places.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f42daf74f541..8609dba03cbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3567,7 +3567,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6.git
 S:	Maintained
 F:	Documentation/crypto/
 F:	Documentation/devicetree/bindings/crypto/
-F:	Documentation/DocBook/crypto-API.tmpl
 F:	arch/*/crypto/
 F:	crypto/
 F:	drivers/crypto/
@@ -7364,7 +7363,7 @@ W:	http://kgdb.wiki.kernel.org/
 L:	kgdb-bugreport@lists.sourceforge.net
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git
 S:	Maintained
-F:	Documentation/DocBook/kgdb.tmpl
+F:	Documentation/dev-tools/kgdb.rst
 F:	drivers/misc/kgdbts.c
 F:	drivers/tty/serial/kgdboc.c
 F:	include/linux/kdb.h
@@ -10971,7 +10970,7 @@ S:	Supported
 F:	arch/s390/
 F:	drivers/s390/
 F:	Documentation/s390/
-F:	Documentation/DocBook/s390*
+F:	Documentation/driver-api/s390-drivers.rst
 
 S390 COMMON I/O LAYER
 M:	Sebastian Ott <sebott@linux.vnet.ibm.com>
-- 
2.9.3
