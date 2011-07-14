Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QhH19-0004Tl-N0
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2011 08:11:35 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] new helper to define common struct resource constructs
Date: Thu, 14 Jul 2011 10:11:05 +0200
Message-Id: <1310631065-4271-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20110713141849.b8cbf675.akpm@linux-foundation.org>
References: <20110713141849.b8cbf675.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>,
	thierry.nolf.barco@gmail.com, Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org,
	H Hartley Sweeten <hartleys@visionengravers.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

resource definitions that just define start, end and flags =
IORESOURCE_MEM or IORESOURCE_IRQ (with start=end) are quite common. So
introduce a shortcut for them. For completeness add macros for
IORESOURCE_DMA and IORESOURCE_IO, too and also make available a set of
macros to specify named resources of all types which are less common.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
changes since v2:
- add parentheses around macro parameter usages

changes since v1:                                                               
- also add _IO and _DMA variants                                                

 include/linux/ioport.h |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 63eb429..9d57a71 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -109,6 +109,36 @@ struct resource_list {
 /* PCI control bits.  Shares IORESOURCE_BITS with above PCI ROM.  */
 #define IORESOURCE_PCI_FIXED		(1<<4)	/* Do not move resource */
 
+
+/* helpers to define resources */
+#define DEFINE_RES_NAMED(_start, _size, _name, _flags)			\
+	{								\
+		.start = (_start),					\
+		.end = (_start) + (_size) - 1,				\
+		.name = (_name),					\
+		.flags = (_flags),					\
+	}
+
+#define DEFINE_RES_IO_NAMED(_start, _size, _name)			\
+	DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_IO)
+#define DEFINE_RES_IO(_start, _size)					\
+	DEFINE_RES_IO_NAMED((_start), (_size), NULL)
+
+#define DEFINE_RES_MEM_NAMED(_start, _size, _name)			\
+	DEFINE_RES_NAMED((_start), (_size), (_name), IORESOURCE_MEM)
+#define DEFINE_RES_MEM(_start, _size)					\
+	DEFINE_RES_MEM_NAMED((_start), (_size), NULL)
+
+#define DEFINE_RES_IRQ_NAMED(_irq, _name)				\
+	DEFINE_RES_NAMED((_irq), 1, (_name), IORESOURCE_IRQ)
+#define DEFINE_RES_IRQ(_irq)						\
+	DEFINE_RES_IRQ_NAMED((_irq), NULL)
+
+#define DEFINE_RES_DMA_NAMED(_dma, _name)				\
+	DEFINE_RES_NAMED((_dma), 1, (_name), IORESOURCE_DMA)
+#define DEFINE_RES_DMA(_dma)						\
+	DEFINE_RES_DMA_NAMED((_dma), NULL)
+
 /* PC/ISA/whatever - the normal PC address spaces: IO and memory */
 extern struct resource ioport_resource;
 extern struct resource iomem_resource;
-- 
1.7.5.4
