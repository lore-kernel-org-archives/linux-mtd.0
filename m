Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7tr9-0006hP-TV
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2004 06:51:17 -0400
Message-ID: <41496FA5.5010901@arcom.com>
Date: Thu, 16 Sep 2004 11:49:09 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [patch] Only probe for device combinations that fit in map's
	bankwidth.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Recent MTD changed how chip probing is done and it now probes for chips 
of all bus widths.  On my board (IXP425 with 16-bit AMD AM29LV128 flash) 
probing for 8-bit wide devices cannot work because 8-bit writes/reads to 
16-bit devices aren't allowed (they cause data aborts). So...

Make genprobe_new_chip() only probe for combinations that fit in the 
map's bankwidth.

Index: linux-2.6-armbe/drivers/mtd/chips/gen_probe.c
===================================================================
--- linux-2.6-armbe.orig/drivers/mtd/chips/gen_probe.c	2004-09-15 
17:06:44.000000000 +0100
+++ linux-2.6-armbe/drivers/mtd/chips/gen_probe.c	2004-09-16 
11:37:15.000000000 +0100
@@ -172,8 +172,9 @@
  		for (type = 0; type < 3; type++) {
  			cfi->device_type = 1<<type;

-			if (cp->probe_chip(map, 0, NULL, cfi))
-				return 1;
+			if (cfi->device_type * cfi->interleave == map_bankwidth(map))
+				if (cp->probe_chip(map, 0, NULL, cfi))
+					return 1;
  		}
  	}
  	return 0;

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
