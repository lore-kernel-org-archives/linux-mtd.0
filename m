Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1mWD-0001GE-LB
	for linux-mtd@lists.infradead.org; Sat, 24 Oct 2009 19:43:29 +0000
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: <linux-pcmcia@lists.infradead.org>
Subject: [PATCH 14/16] pcmcia: use dynamic debug infrastructure,
	deprecate CS_CHECK (misc drivers)
Date: Sat, 24 Oct 2009 21:43:04 +0200
Message-Id: <1256413386-20501-14-git-send-email-linux@dominikbrodowski.net>
In-Reply-To: <20091024194219.GA19546@comet.dominikbrodowski.net>
References: <20091024194219.GA19546@comet.dominikbrodowski.net>
Cc: linux-usb@vger.kernel.org, linux-mtd@lists.infradead.org,
	Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert PCMCIA drivers to use the dynamic debug infrastructure, instead of
requiring manual settings of PCMCIA_DEBUG.

Also, remove all usages of the CS_CHECK macro and replace them with proper
Linux style calling and return value checking. The extra error reporting may
be dropped, as the PCMCIA core already complains about any (non-driver-author)
errors.

CC: linux-mtd@lists.infradead.org
CC: linux-usb@vger.kernel.org
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/mtd/maps/pcmciamtd.c   |   14 +----------
 drivers/parport/parport_cs.c   |   37 +++++++++++--------------------
 drivers/telephony/ixj_pcmcia.c |   36 +++++++++++--------------------
 drivers/usb/host/sl811_cs.c    |   46 +++++++++++----------------------------
 4 files changed, 41 insertions(+), 92 deletions(-)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 52c07f2..fa00919 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -119,10 +119,8 @@ static caddr_t remap_window(struct map_info *map, unsigned long to)
 		      dev->offset, mrq.CardOffset);
 		mrq.Page = 0;
 		ret = pcmcia_map_mem_page(win, &mrq);
-		if (ret != 0) {
-			cs_error(dev->p_dev, MapMemPage, ret);
+		if (ret != 0)
 			return NULL;
-		}
 		dev->offset = mrq.CardOffset;
 	}
 	return dev->win_base + (to & (dev->win_size-1));
@@ -327,8 +325,6 @@ static void pcmciamtd_set_vpp(struct map_info *map, int on)
 
 	DEBUG(2, "dev = %p on = %d vpp = %d\n", dev, on, dev->vpp);
 	ret = pcmcia_modify_configuration(link, &mod);
-	if (ret != 0)
-		cs_error(link, ModifyConfiguration, ret);
 }
 
 
@@ -488,16 +484,12 @@ static void card_settings(struct pcmciamtd_dev *dev, struct pcmcia_device *link,
  * MTD device available to the system.
  */
 
-#define CS_CHECK(fn, ret) \
-do { last_fn = (fn); if ((last_ret = (ret)) != 0) goto cs_failed; } while (0)
-
 static int pcmciamtd_config(struct pcmcia_device *link)
 {
 	struct pcmciamtd_dev *dev = link->priv;
 	struct mtd_info *mtd = NULL;
 	cs_status_t status;
 	win_req_t req;
-	int last_ret = 0, last_fn = 0;
 	int ret;
 	int i;
 	static char *probes[] = { "jedec_probe", "cfi_probe" };
@@ -584,7 +576,6 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	DEBUG(2, "Setting Configuration");
 	ret = pcmcia_request_configuration(link, &link->conf);
 	if (ret != 0) {
-		cs_error(link, RequestConfiguration, ret);
 		if (dev->win_base) {
 			iounmap(dev->win_base);
 			dev->win_base = NULL;
@@ -659,8 +650,7 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	link->dev_node = &dev->node;
 	return 0;
 
- cs_failed:
-	cs_error(link, last_fn, last_ret);
+ failed:
 	err("CS Error, exiting");
 	pcmciamtd_release(link);
 	return -ENODEV;
diff --git a/drivers/parport/parport_cs.c b/drivers/parport/parport_cs.c
index 8fdfa4f..e56a4de 100644
--- a/drivers/parport/parport_cs.c
+++ b/drivers/parport/parport_cs.c
@@ -67,14 +67,6 @@ MODULE_LICENSE("Dual MPL/GPL");
 
 INT_MODULE_PARM(epp_mode, 1);
 
-#ifdef PCMCIA_DEBUG
-INT_MODULE_PARM(pc_debug, PCMCIA_DEBUG);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-static char *version =
-"parport_cs.c 1.29 2002/10/11 06:57:41 (David Hinds)";
-#else
-#define DEBUG(n, args...)
-#endif
 
 /*====================================================================*/
 
@@ -103,7 +95,7 @@ static int parport_probe(struct pcmcia_device *link)
 {
     parport_info_t *info;
 
-    DEBUG(0, "parport_attach()\n");
+    dev_dbg(&link->dev, "parport_attach()\n");
 
     /* Create new parport device */
     info = kzalloc(sizeof(*info), GFP_KERNEL);
@@ -132,7 +124,7 @@ static int parport_probe(struct pcmcia_device *link)
 
 static void parport_detach(struct pcmcia_device *link)
 {
-    DEBUG(0, "parport_detach(0x%p)\n", link);
+    dev_dbg(&link->dev, "parport_detach\n");
 
     parport_cs_release(link);
 
@@ -147,9 +139,6 @@ static void parport_detach(struct pcmcia_device *link)
 
 ======================================================================*/
 
-#define CS_CHECK(fn, ret) \
-do { last_fn = (fn); if ((last_ret = (ret)) != 0) goto cs_failed; } while (0)
-
 static int parport_config_check(struct pcmcia_device *p_dev,
 				cistpl_cftable_entry_t *cfg,
 				cistpl_cftable_entry_t *dflt,
@@ -178,18 +167,20 @@ static int parport_config(struct pcmcia_device *link)
 {
     parport_info_t *info = link->priv;
     struct parport *p;
-    int last_ret, last_fn;
+    int ret;
 
-    DEBUG(0, "parport_config(0x%p)\n", link);
+    dev_dbg(&link->dev, "parport_config\n");
 
-    last_ret = pcmcia_loop_config(link, parport_config_check, NULL);
-    if (last_ret) {
-	    cs_error(link, RequestIO, last_ret);
+    ret = pcmcia_loop_config(link, parport_config_check, NULL);
+    if (ret)
 	    goto failed;
-    }
 
-    CS_CHECK(RequestIRQ, pcmcia_request_irq(link, &link->irq));
-    CS_CHECK(RequestConfiguration, pcmcia_request_configuration(link, &link->conf));
+    ret = pcmcia_request_irq(link, &link->irq);
+    if (ret)
+	    goto failed;
+    ret = pcmcia_request_configuration(link, &link->conf);
+    if (ret)
+	    goto failed;
 
     p = parport_pc_probe_port(link->io.BasePort1, link->io.BasePort2,
 			      link->irq.AssignedIRQ, PARPORT_DMA_NONE,
@@ -213,8 +204,6 @@ static int parport_config(struct pcmcia_device *link)
 
     return 0;
 
-cs_failed:
-    cs_error(link, last_fn, last_ret);
 failed:
     parport_cs_release(link);
     return -ENODEV;
@@ -232,7 +221,7 @@ static void parport_cs_release(struct pcmcia_device *link)
 {
 	parport_info_t *info = link->priv;
 
-	DEBUG(0, "parport_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "parport_release\n");
 
 	if (info->ndev) {
 		struct parport *p = info->port;
diff --git a/drivers/telephony/ixj_pcmcia.c b/drivers/telephony/ixj_pcmcia.c
index 347c3ed..86f2767 100644
--- a/drivers/telephony/ixj_pcmcia.c
+++ b/drivers/telephony/ixj_pcmcia.c
@@ -19,13 +19,6 @@
  *	PCMCIA service support for Quicknet cards
  */
  
-#ifdef PCMCIA_DEBUG
-static int pc_debug = PCMCIA_DEBUG;
-module_param(pc_debug, int, 0644);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-#else
-#define DEBUG(n, args...)
-#endif
 
 typedef struct ixj_info_t {
 	int ndev;
@@ -39,7 +32,7 @@ static void ixj_cs_release(struct pcmcia_device * link);
 
 static int ixj_probe(struct pcmcia_device *p_dev)
 {
-	DEBUG(0, "ixj_attach()\n");
+	dev_dbg(&link->dev, "ixj_attach()\n");
 	/* Create new ixj device */
 	p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
 	p_dev->io.Attributes2 = IO_DATA_PATH_WIDTH_8;
@@ -55,33 +48,30 @@ static int ixj_probe(struct pcmcia_device *p_dev)
 
 static void ixj_detach(struct pcmcia_device *link)
 {
-	DEBUG(0, "ixj_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "ixj_detach\n");
 
 	ixj_cs_release(link);
 
         kfree(link->priv);
 }
 
-#define CS_CHECK(fn, ret) \
-do { last_fn = (fn); if ((last_ret = (ret)) != 0) goto cs_failed; } while (0)
-
 static void ixj_get_serial(struct pcmcia_device * link, IXJ * j)
 {
 	char *str;
 	int i, place;
-	DEBUG(0, "ixj_get_serial(0x%p)\n", link);
+	dev_dbg(&link->dev, "ixj_get_serial\n");
 
 	str = link->prod_id[0];
 	if (!str)
-		goto cs_failed;
+		goto failed;
 	printk("%s", str);
 	str = link->prod_id[1];
 	if (!str)
-		goto cs_failed;
+		goto failed;
 	printk(" %s", str);
 	str = link->prod_id[2];
 	if (!str)
-		goto cs_failed;
+		goto failed;
 	place = 1;
 	for (i = strlen(str) - 1; i >= 0; i--) {
 		switch (str[i]) {
@@ -118,9 +108,9 @@ static void ixj_get_serial(struct pcmcia_device * link, IXJ * j)
 	}
 	str = link->prod_id[3];
 	if (!str)
-		goto cs_failed;
+		goto failed;
 	printk(" version %s\n", str);
-      cs_failed:
+      failed:
 	return;
 }
 
@@ -151,13 +141,13 @@ static int ixj_config(struct pcmcia_device * link)
 	cistpl_cftable_entry_t dflt = { 0 };
 
 	info = link->priv;
-	DEBUG(0, "ixj_config(0x%p)\n", link);
+	dev_dbg(&link->dev, "ixj_config\n");
 
 	if (pcmcia_loop_config(link, ixj_config_check, &dflt))
-		goto cs_failed;
+		goto failed;
 
 	if (pcmcia_request_configuration(link, &link->conf))
-		goto cs_failed;
+		goto failed;
 
 	/*
  	 *	Register the card with the core.
@@ -170,7 +160,7 @@ static int ixj_config(struct pcmcia_device * link)
 	ixj_get_serial(link, j);
 	return 0;
 
-      cs_failed:
+      failed:
 	ixj_cs_release(link);
 	return -ENODEV;
 }
@@ -178,7 +168,7 @@ static int ixj_config(struct pcmcia_device * link)
 static void ixj_cs_release(struct pcmcia_device *link)
 {
 	ixj_info_t *info = link->priv;
-	DEBUG(0, "ixj_cs_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "ixj_cs_release\n");
 	info->ndev = 0;
 	pcmcia_disable_device(link);
 }
diff --git a/drivers/usb/host/sl811_cs.c b/drivers/usb/host/sl811_cs.c
index 516848d..4607742 100644
--- a/drivers/usb/host/sl811_cs.c
+++ b/drivers/usb/host/sl811_cs.c
@@ -37,28 +37,8 @@ MODULE_LICENSE("GPL");
 /* MACROS                                                             */
 /*====================================================================*/
 
-#if defined(DEBUG) || defined(PCMCIA_DEBUG)
-
-static int pc_debug = 0;
-module_param(pc_debug, int, 0644);
-
-#define DBG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG "sl811_cs: " args)
-
-#else
-#define DBG(n, args...) do{}while(0)
-#endif	/* no debugging */
-
 #define INFO(args...) printk(KERN_INFO "sl811_cs: " args)
 
-#define INT_MODULE_PARM(n, v) static int n = v; module_param(n, int, 0444)
-
-#define CS_CHECK(fn, ret) \
-	do { \
-		last_fn = (fn); \
-		if ((last_ret = (ret)) != 0) \
-			goto cs_failed; \
-	} while (0)
-
 /*====================================================================*/
 /* VARIABLES                                                          */
 /*====================================================================*/
@@ -76,7 +56,7 @@ static void sl811_cs_release(struct pcmcia_device * link);
 
 static void release_platform_dev(struct device * dev)
 {
-	DBG(0, "sl811_cs platform_dev release\n");
+	dev_dbg(dev, "sl811_cs platform_dev release\n");
 	dev->parent = NULL;
 }
 
@@ -140,7 +120,7 @@ static int sl811_hc_init(struct device *parent, resource_size_t base_addr,
 
 static void sl811_cs_detach(struct pcmcia_device *link)
 {
-	DBG(0, "sl811_cs_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "sl811_cs_detach\n");
 
 	sl811_cs_release(link);
 
@@ -150,7 +130,7 @@ static void sl811_cs_detach(struct pcmcia_device *link)
 
 static void sl811_cs_release(struct pcmcia_device * link)
 {
-	DBG(0, "sl811_cs_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "sl811_cs_release\n");
 
 	pcmcia_disable_device(link);
 	platform_device_unregister(&platform_dev);
@@ -207,9 +187,9 @@ static int sl811_cs_config(struct pcmcia_device *link)
 {
 	struct device		*parent = &handle_to_dev(link);
 	local_info_t		*dev = link->priv;
-	int			last_fn, last_ret;
+	int			ret;
 
-	DBG(0, "sl811_cs_config(0x%p)\n", link);
+	dev_dbg(&link->dev, "sl811_cs_config\n");
 
 	if (pcmcia_loop_config(link, sl811_cs_config_check, NULL))
 		goto failed;
@@ -217,14 +197,16 @@ static int sl811_cs_config(struct pcmcia_device *link)
 	/* require an IRQ and two registers */
 	if (!link->io.NumPorts1 || link->io.NumPorts1 < 2)
 		goto failed;
-	if (link->conf.Attributes & CONF_ENABLE_IRQ)
-		CS_CHECK(RequestIRQ,
-			pcmcia_request_irq(link, &link->irq));
-	else
+	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
+		ret = pcmcia_request_irq(link, &link->irq);
+		if (ret)
+			goto failed;
+	} else
 		goto failed;
 
-	CS_CHECK(RequestConfiguration,
-		pcmcia_request_configuration(link, &link->conf));
+	ret = pcmcia_request_configuration(link, &link->conf);
+	if (ret)
+		goto failed;
 
 	sprintf(dev->node.dev_name, driver_name);
 	dev->node.major = dev->node.minor = 0;
@@ -241,8 +223,6 @@ static int sl811_cs_config(struct pcmcia_device *link)
 
 	if (sl811_hc_init(parent, link->io.BasePort1, link->irq.AssignedIRQ)
 			< 0) {
-cs_failed:
-		cs_error(link, last_fn, last_ret);
 failed:
 		printk(KERN_WARNING "sl811_cs_config failed\n");
 		sl811_cs_release(link);
-- 
1.6.0.4
