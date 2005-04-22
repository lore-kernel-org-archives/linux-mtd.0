Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DP4DL-0007RK-3k
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2005 15:53:24 -0400
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id MAA19158
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2005 12:53:25 -0700
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	j3MJrPLV012130
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2005 12:53:25 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id j3MJrO6c012128
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2005 12:53:24 -0700
Date: Fri, 22 Apr 2005 12:53:24 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050422195324.GA12115@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: DEBUG_LOCK_BITS fix for Intel NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch seems to correctly access block lock status bits for at least
one Intel StrataFlash model.  Without at least half of this patch (the
chip->start adjustment), DEBUG_LOCK_BITS won't work well with
multi-partition flash, at the least.

I also needed to change the code to follow the flowchart given in a
recent StrataFlash datasheet: write command 0x90 followed by the block
address + 2, then read block address + 2.  The old code writes command
0x90 followed by hardcoded address 0x55, then reads block address + 2.

Can anybody verify whether Intel flash models exist that require the
0x55 address for block lock query?  If so, know of any way to
distinguish the two cases?

Absent any dissent this patch will go into CVS.  (Why all the concern
over a debug feature?  Because I want to also write code to query lock
status for other reasons.)  Thanks -- Todd

Index: linux-mtd/drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
--- linux-mtd.orig/drivers/mtd/chips/cfi_cmdset_0001.c	2005-04-22 19:15:05.000000000 +0000
+++ linux-mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2005-04-22 19:39:12.000000000 +0000
@@ -1823,8 +1823,9 @@
 	struct cfi_private *cfi = map->fldrv_priv;
 	int status, ofs_factor = cfi->interleave * cfi->device_type;
 
+	adr += chip->start;
 	xip_disable(map, chip, adr+(2*ofs_factor));
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	map_write(map, CMD(0x90), adr+(2*ofs_factor));
 	chip->state = FL_JEDEC_QUERY;
 	status = cfi_read_query(map, adr+(2*ofs_factor));
 	xip_enable(map, chip, 0);
