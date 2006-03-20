Received: from sorrow.cyrius.com ([65.19.161.204])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLCCd-0007c1-16
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 04:41:13 +0000
Date: Mon, 20 Mar 2006 04:40:36 +0000
From: Martin Michlmayr <tbm@cyrius.com>
To: akpm@osdl.org
Message-ID: <20060320044036.GI20416@deprecation.cyrius.com>
References: <20060320043802.GA20389@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060320043802.GA20389@deprecation.cyrius.com>
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/12] [MTD] Fix #else directive in the docprobe driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following difference was found between the mainline and linux-mips
kernel.  Fix the #else directive in the docprobe driver, and change
some space to tabs for consistency.

Signed-off-by: Martin Michlmayr <tbm@cyrius.com>


--- linux-2.6/drivers/mtd/devices/docprobe.c	2006-03-05 19:35:04.000000000 +0000
+++ mips.git/drivers/mtd/devices/docprobe.c	2006-03-05 18:51:15.000000000 +0000
@@ -84,10 +84,10 @@
 	0xe4000000,
 #elif defined(CONFIG_MOMENCO_OCELOT)
 	0x2f000000,
-        0xff000000,
+	0xff000000,
 #elif defined(CONFIG_MOMENCO_OCELOT_G) || defined (CONFIG_MOMENCO_OCELOT_C)
-        0xff000000,
-##else
+	0xff000000,
+#else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
 	0xffffffff };

-- 
Martin Michlmayr
http://www.cyrius.com/
