Received: from rcsinet14.oracle.com ([148.87.113.126]
	helo=rgminet14.oracle.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCNo3-0000Y9-IG
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 00:28:59 +0000
Received: from rgminet11.oracle.com (rcsinet11.oracle.com [148.87.113.123])
	by rgminet14.oracle.com (Switch-3.3.1/Switch-3.3.1) with ESMTP id
	mBFNeS3T014057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2008 23:40:53 GMT
Message-ID: <4946EA7F.1@oracle.com>
Date: Mon, 15 Dec 2008 15:38:39 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH -next] mtd: fix nettel printk formats
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

Fix printk format references:

drivers/mtd/maps/nettel.c:361: warning: format '%d' expects type 'int', but argument 2 has type 'uint64_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/maps/nettel.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20081215.orig/drivers/mtd/maps/nettel.c
+++ linux-next-20081215/drivers/mtd/maps/nettel.c
@@ -357,8 +357,8 @@ static int __init nettel_init(void)
 		*intel1par = 0;
 	}
 
-	printk(KERN_NOTICE "SNAPGEAR: Intel flash device size = %dK\n",
-		(intel_mtd->size >> 10));
+	printk(KERN_NOTICE "SNAPGEAR: Intel flash device size = %lluK\n",
+		(unsigned long long)(intel_mtd->size >> 10));
 
 	intel_mtd->owner = THIS_MODULE;
 
