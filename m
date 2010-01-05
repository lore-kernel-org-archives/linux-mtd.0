Received: from [81.174.226.42] (helo=numbat.localnet)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NS7Wq-00023Z-Np
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 11:24:53 +0000
Received: from turtle.localnet (turtle.localnet [172.16.1.38])
	by numbat.localnet (Postfix) with ESMTP id 1516FE3980
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Jan 2010 11:14:37 +0000 (GMT)
Date: Tue, 5 Jan 2010 11:14:36 +0000
From: Peter Horton <zero@colonel-panic.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI fails to initialise in kernel update marker
Message-ID: <20100105111436.GA2046@turtle.localnet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The in kernel copy of a volume's update marker is not initialised from the
volume table.

Signed-off-by: Peter Horton <zero@colonel-panic.org>

--- linux-2.6.32.orig/drivers/mtd/ubi/vtbl.c	2010-01-05 10:56:13.000000000 +0000
+++ linux-2.6.32/drivers/mtd/ubi/vtbl.c	2010-01-05 10:57:03.000000000 +0000
@@ -566,6 +566,7 @@
 		vol->reserved_pebs = be32_to_cpu(vtbl[i].reserved_pebs);
 		vol->alignment = be32_to_cpu(vtbl[i].alignment);
 		vol->data_pad = be32_to_cpu(vtbl[i].data_pad);
+		vol->upd_marker = vtbl[i].upd_marker;
 		vol->vol_type = vtbl[i].vol_type == UBI_VID_DYNAMIC ?
 					UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
 		vol->name_len = be16_to_cpu(vtbl[i].name_len);
