Date: Fri, 17 Dec 2004 11:08:24 +0100
From: Dominik Brodowski <linux@dominikbrodowski.de>
To: akpm@osdl.org, linux-pcmcia@lists.infradead.org
Message-ID: <20041217100824.GK7232@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Subject: [patch 10/21] pcmcia: remove mtd and bulkmem (replaced by pcmciamtd)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of "memory_cs", BIND_MTD, {FIRST,NEXT}_REGION, 2.6. kernels
use the "pcmciamtd" driver which doesn't need these functions. Cardmgr
still calls it in default configuration, so warn the user about changes
necessary to /etc/pcmcia/config , and remove the now unused code.

Signed-off-by: Dominik Brodowski <linux@brodo.de>
---

 drivers/pcmcia/Makefile  |    2
 drivers/pcmcia/bulkmem.c |  154 -----------------------------------------------
 drivers/pcmcia/ds.c      |   54 ++++------------
 3 files changed, 15 insertions(+), 195 deletions(-)

Index: 2.6.10-rc3/drivers/pcmcia/Makefile
===================================================================
--- 2.6.10-rc3.orig/drivers/pcmcia/Makefile	2004-12-13 15:41:11.000000000 +0100
+++ 2.6.10-rc3/drivers/pcmcia/Makefile	2004-12-13 16:04:33.337881129 +0100
@@ -10,7 +10,7 @@
 pcmcia_core-$(CONFIG_CARDBUS)			+= cardbus.o
 obj-$(CONFIG_PCCARD)				+= pcmcia_core.o
 
-pcmcia-y					+= ds.o bulkmem.o pcmcia_compat.o
+pcmcia-y					+= ds.o pcmcia_compat.o
 obj-$(CONFIG_PCMCIA)				+= pcmcia.o
 
 
Index: 2.6.10-rc3/drivers/pcmcia/bulkmem.c
===================================================================
--- 2.6.10-rc3.orig/drivers/pcmcia/bulkmem.c	2004-12-13 16:04:22.622372684 +0100
+++ 2.6.10-rc3/drivers/pcmcia/bulkmem.c	2004-12-13 15:43:42.640427408 +0100
@@ -1,154 +0,0 @@
-/*
- * bulkmem.c -- 16-bit PCMCIA Bulk Memory Services
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * The initial developer of the original code is David A. Hinds
- * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
- * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
- *
- * (C) 1999		David A. Hinds
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/errno.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/sched.h>
-#include <linux/timer.h>
-
-#define IN_CARD_SERVICES
-#include <pcmcia/cs_types.h>
-#include <pcmcia/ss.h>
-#include <pcmcia/cs.h>
-#include <pcmcia/bulkmem.h>
-#include <pcmcia/cistpl.h>
-#include <pcmcia/ds.h>
-#include "cs_internal.h"
-
-#ifdef DEBUG
-extern int ds_pc_debug;
-#define cs_socket_name(skt)	((skt)->dev.class_id)
-
-#define ds_dbg(skt, lvl, fmt, arg...) do {		\
-	if (ds_pc_debug >= lvl)				\
-		printk(KERN_DEBUG "ds: %s: " fmt, 	\
-		       cs_socket_name(skt) , ## arg);	\
-} while (0)
-#else
-#define ds_dbg(lvl, fmt, arg...) do { } while (0)
-#endif
-
-/*======================================================================
-
-    This stuff is used by Card Services to initialize the table of
-    region info used for subsequent calls to GetFirstRegion and
-    GetNextRegion.
-    
-======================================================================*/
-
-static void setup_regions(struct pcmcia_socket *s, unsigned int function,
-			  int attr,  memory_handle_t *list)
-{
-    int i, code, has_jedec, has_geo;
-    u_int offset;
-    cistpl_device_t device;
-    cistpl_jedec_t jedec;
-    cistpl_device_geo_t geo;
-    memory_handle_t r;
-
-    ds_dbg(s, 1, "setup_regions(0x%d, %d, 0x%p)\n",
-	   function, attr, list);
-
-    code = (attr) ? CISTPL_DEVICE_A : CISTPL_DEVICE;
-    if (pccard_read_tuple(s, function, code, &device) != CS_SUCCESS)
-	return;
-    code = (attr) ? CISTPL_JEDEC_A : CISTPL_JEDEC_C;
-    has_jedec = (pccard_read_tuple(s, function, code, &jedec) == CS_SUCCESS);
-    if (has_jedec && (device.ndev != jedec.nid)) {
-	ds_dbg(s, 0, "Device info does not match JEDEC info.\n");
-	has_jedec = 0;
-    }
-    code = (attr) ? CISTPL_DEVICE_GEO_A : CISTPL_DEVICE_GEO;
-    has_geo = (pccard_read_tuple(s, function, code, &geo) == CS_SUCCESS);
-    if (has_geo && (device.ndev != geo.ngeo)) {
-	ds_dbg(s, 0, "Device info does not match geometry tuple.\n");
-	has_geo = 0;
-    }
-    
-    offset = 0;
-    for (i = 0; i < device.ndev; i++) {
-	if ((device.dev[i].type != CISTPL_DTYPE_NULL) &&
-	    (device.dev[i].size != 0)) {
-	    r = kmalloc(sizeof(*r), GFP_KERNEL);
-	    if (!r) {
-		printk(KERN_NOTICE "cs: setup_regions: kmalloc failed!\n");
-		return;
-	    }
-	    r->region_magic = REGION_MAGIC;
-	    r->state = 0;
-	    r->dev_info[0] = '\0';
-	    r->mtd = NULL;
-	    r->info.Attributes = (attr) ? REGION_TYPE_AM : 0;
-	    r->info.CardOffset = offset;
-	    r->info.RegionSize = device.dev[i].size;
-	    r->info.AccessSpeed = device.dev[i].speed;
-	    if (has_jedec) {
-		r->info.JedecMfr = jedec.id[i].mfr;
-		r->info.JedecInfo = jedec.id[i].info;
-	    } else
-		r->info.JedecMfr = r->info.JedecInfo = 0;
-	    if (has_geo) {
-		r->info.BlockSize = geo.geo[i].buswidth *
-		    geo.geo[i].erase_block * geo.geo[i].interleave;
-		r->info.PartMultiple =
-		    r->info.BlockSize * geo.geo[i].partition;
-	    } else
-		r->info.BlockSize = r->info.PartMultiple = 1;
-	    r->info.next = *list; *list = r;
-	}
-	offset += device.dev[i].size;
-    }
-} /* setup_regions */
-
-/*======================================================================
-
-    This is tricky.  When get_first_region() is called by Driver
-    Services, we initialize the region info table in the socket
-    structure.  When it is called by an MTD, we can just scan the
-    table for matching entries.
-    
-======================================================================*/
-
-static int pccard_match_region(memory_handle_t list, region_info_t *match)
-{
-	if (list) {
-		*match = list->info;
-		return CS_SUCCESS;
-	}
-	return CS_NO_MORE_ITEMS;
-} /* match_region */
-
-int pccard_get_first_region(struct pcmcia_socket *s, region_info_t *rgn)
-{
-	if (!(s->state & SOCKET_REGION_INFO)) {
-		setup_regions(s, BIND_FN_ALL, 0, &s->c_region);
-		setup_regions(s, BIND_FN_ALL, 1, &s->a_region);
-		s->state |= SOCKET_REGION_INFO;
-	}
-
-	if (rgn->Attributes & REGION_TYPE_AM)
-		return pccard_match_region(s->a_region, rgn);
-	else
-		return pccard_match_region(s->c_region, rgn);
-} /* get_first_region */
-
-int pccard_get_next_region(struct pcmcia_socket *s, region_info_t *rgn)
-{
-    return pccard_match_region(rgn->next, rgn);
-} /* get_next_region */
-
Index: 2.6.10-rc3/drivers/pcmcia/ds.c
===================================================================
--- 2.6.10-rc3.orig/drivers/pcmcia/ds.c	2004-12-13 16:04:31.417148488 +0100
+++ 2.6.10-rc3/drivers/pcmcia/ds.c	2004-12-13 16:04:33.342880434 +0100
@@ -506,34 +506,6 @@
     return 0;
 } /* ds_event */
 
-/*======================================================================
-
-    bind_mtd() connects a memory region with an MTD client.
-    
-======================================================================*/
-
-static int bind_mtd(struct pcmcia_bus_socket *bus_sock, mtd_info_t *mtd_info)
-{
-	struct pcmcia_socket *s = bus_sock->parent;
-	memory_handle_t region;
-
-	if (mtd_info->Attributes & REGION_TYPE_AM)
-		region = s->a_region;
-	else
-		region = s->c_region;
-
-	while (region) {
-		if (region->info.CardOffset == mtd_info->CardOffset)
-			break;
-		region = region->info.next;
-	}
-	if (!region || (region->mtd != NULL))
-		return -ENODEV;
-
-	strlcpy(region->dev_info, mtd_info->dev_info, DEV_NAME_LEN);
-
-	return 0;
-} /* bind_mtd */
 
 /*======================================================================
 
@@ -1098,8 +1070,6 @@
 /*====================================================================*/
 
 extern int pcmcia_adjust_resource_info(adjust_t *adj);
-extern int pccard_get_next_region(struct pcmcia_socket *s, region_info_t *rgn);
-extern int pccard_get_first_region(struct pcmcia_socket *s, region_info_t *rgn);
 
 static int ds_ioctl(struct inode * inode, struct file * file,
 		    u_int cmd, u_long arg)
@@ -1220,10 +1190,21 @@
 			buf->conf_reg.Function, &buf->conf_reg);
 	break;
     case DS_GET_FIRST_REGION:
-        ret = pccard_get_first_region(s->parent, &buf->region);
-	break;
     case DS_GET_NEXT_REGION:
-	ret = pccard_get_next_region(s->parent, &buf->region);
+    case DS_BIND_MTD:
+	if (!capable(CAP_SYS_ADMIN)) {
+		err = -EPERM;
+		goto free_out;
+	} else {
+		static int printed = 0;
+		if (!printed) {
+			printk(KERN_WARNING "2.6. kernels use pcmciamtd instead of memory_cs.c and do not require special\n");
+			printk(KERN_WARNING "MTD handling any more.\n");
+			printed++;
+		}
+	}
+	ret = -EINVAL;
+	goto free_out;
 	break;
     case DS_GET_FIRST_WINDOW:
 	ret = pcmcia_get_window(s->parent, &buf->win_info.handle, 0,
@@ -1256,13 +1237,6 @@
     case DS_UNBIND_REQUEST:
 	err = 0;
 	break;
-    case DS_BIND_MTD:
-	if (!capable(CAP_SYS_ADMIN)) {
-		err = -EPERM;
-		goto free_out;
-	}
-	err = bind_mtd(s, &buf->mtd_info);
-	break;
     default:
 	err = -EINVAL;
     }
