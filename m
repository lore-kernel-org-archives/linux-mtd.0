Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CovlC-0006do-Ec
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 22:34:59 -0500
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id TAA04435
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 19:34:56 -0800
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	j0D3YtLV029031
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 19:34:56 -0800
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id j0D3Ytd4029029
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 19:34:55 -0800
Date: Wed, 12 Jan 2005 19:34:55 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050113033455.GA28985@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Automatic nest count for ENABLE_VPP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Comments in map.h indicate the .set_vpp routine must handle nested
enable calls, which doesn't seem to be the case for several map drivers.
And those that do keep a nest count may run into problems due to extra
DISABLE_VPP calls (by, for example, cfi_cmdset_0001 put_chip).

The map drivers can be modified to check for nesting underflow, but this
might best be implemented once in the enable/disable macros (and made a
property of the map, whereas most counts today are one per map driver).

It would also be possible to modify routines such as put_chip to check
whether to call DISABLE_VPP via the count (assuming the count should be
zero at get_chip time and put_chip time).

Any opinion on the way to do this?  Thanks -- Todd

Index: linux-2.6.10/include/linux/mtd/map.h
===================================================================
--- linux-2.6.10.orig/include/linux/mtd/map.h	2004-12-24 21:34:31.000000000 +0000
+++ linux-2.6.10/include/linux/mtd/map.h	2005-01-13 02:10:28.000000000 +0000
@@ -219,6 +219,7 @@
 	unsigned long map_priv_2;
 	void *fldrv_priv;
 	struct mtd_chip_driver *fldrv;
+	int vpp_count;
 };
 
 struct mtd_chip_driver {
@@ -235,8 +236,8 @@
 struct mtd_info *do_map_probe(const char *name, struct map_info *map);
 void map_destroy(struct mtd_info *mtd);
 
-#define ENABLE_VPP(map) do { if(map->set_vpp) map->set_vpp(map, 1); } while(0)
-#define DISABLE_VPP(map) do { if(map->set_vpp) map->set_vpp(map, 0); } while(0)
+#define ENABLE_VPP(map) do { if(map->set_vpp && (map->vpp_count++ == 0)) map->set_vpp(map, 1); } while(0)
+#define DISABLE_VPP(map) do { if(map->set_vpp && map->vpp_count && (--map->vpp_count == 0)) map->set_vpp(map, 0); } while(0)
 
 #define INVALIDATE_CACHED_RANGE(map, from, size) \
 	do { if(map->inval_cache) map->inval_cache(map, from, size); } while(0)
