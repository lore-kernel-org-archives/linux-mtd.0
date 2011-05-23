Received: from rcsinet10.oracle.com ([148.87.113.121])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOa0P-0000Vf-JD
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 18:37:30 +0000
Date: Mon, 23 May 2011 11:37:09 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mtd@lists.infradead.org
Subject: [PATCH -next] mtd: fix physmap.h warnings
Message-Id: <20110523113709.4357b4ba.randy.dunlap@oracle.com>
In-Reply-To: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build warnings in physmap.h:

include/linux/mtd/physmap.h:25: warning: 'struct platform_device' declared inside parameter list
include/linux/mtd/physmap.h:25: warning: its scope is only this definition or declaration, which is probably not what you want
include/linux/mtd/physmap.h:26: warning: 'struct platform_device' declared inside parameter list
include/linux/mtd/physmap.h:27: warning: 'struct platform_device' declared inside parameter list

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/mtd/physmap.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110523.orig/include/linux/mtd/physmap.h
+++ linux-next-20110523/include/linux/mtd/physmap.h
@@ -19,6 +19,7 @@
 #include <linux/mtd/partitions.h>
 
 struct map_info;
+struct platform_device;
 
 struct physmap_flash_data {
 	unsigned int		width;
