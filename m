Received: from rcsinet14.oracle.com ([148.87.113.126]
	helo=rgminet14.oracle.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCNo5-0000YI-Me
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 00:29:01 +0000
Received: from rgminet13.oracle.com (rcsinet13.oracle.com [148.87.113.125])
	by rgminet14.oracle.com (Switch-3.3.1/Switch-3.3.1) with ESMTP id
	mBFNfIPK014433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2008 23:41:44 GMT
Message-ID: <4946EA3D.8060604@oracle.com>
Date: Mon, 15 Dec 2008 15:37:33 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH -next] mtd: fix nandsim sched.h references
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
In-Reply-To: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, akpm <akpm@linux-foundation.org>,
	linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix sched.h references:

build-r7149.out:/local/linsrc/linux-next-20081215/drivers/mtd/nand/nandsim.c:1326: error: dereferencing pointer to incomplete type
build-r7149.out:/local/linsrc/linux-next-20081215/drivers/mtd/nand/nandsim.c:1326: error: 'PF_MEMALLOC' undeclared (first use in this function)
build-r7149.out:/local/linsrc/linux-next-20081215/drivers/mtd/nand/nandsim.c:1328: error: dereferencing pointer to incomplete type
build-r7149.out:/local/linsrc/linux-next-20081215/drivers/mtd/nand/nandsim.c:1335: error: dereferencing pointer to incomplete type
build-r7149.out:/local/linsrc/linux-next-20081215/drivers/mtd/nand/nandsim.c:1335: error: 'PF_MEMALLOC' undeclared (first use in this function)
build-r7149.out:make[4]: *** [drivers/mtd/nand/nandsim.o] Error 1

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/nand/nandsim.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20081215.orig/drivers/mtd/nand/nandsim.c
+++ linux-next-20081215/drivers/mtd/nand/nandsim.c
@@ -38,6 +38,7 @@
 #include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/random.h>
+#include <linux/sched.h>
 #include <linux/fs.h>
 #include <linux/pagemap.h>
 
