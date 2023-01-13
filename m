Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A3AC677F1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOP60lM96yDaIaHtpPFl8qGrgKplciJNEnmv2JUsAWQ=; b=1cXSvc19VO1GR2
	6ZEN6rIvkpfGukLmgnytVMZ/Kd3ynzWMK3DJ6J/kIHCMKEY5zRZTGBjCOegxIaAZN9e93idDmRiwI
	Uq74ufxrz2KkWwzt7aDRM2YwhE2hCTTLbu/uBJkITFacb7csZdN+Mn/pDKZ01T0dA88pdO0RjnPQr
	2vc275WB1iVPSo1y7vMNqvRIBTjV9ALTDjlGFF2Cf97h+D6Ev3tO6d1JmOZvTROtHZWi75LnWSV+P
	GY4nj3KOJNrrcznEs6eWKITcZlh3IHg4Xgmm7paxhoD/qPOvDX05KAwcygJBw97ipUnzpVrcB2Ws5
	ujyP7GcnO8UlwSvdkSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPD2-00497k-KL; Fri, 13 Jan 2023 18:55:24 +0000
Received: from smtp-out-06.comm2000.it ([212.97.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPCz-004972-Co
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 18:55:23 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id E26E0561D3D;
	Fri, 13 Jan 2023 19:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1673635552;
	bh=eOUqIWF2Ec0dmxMwvHrDf6eQJQ5/BljXOsPjJIhvS5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jqBdTj7m9iimyNB2zNQJ0pcYU3Q1s4PRedRarU1lhASbfBaq9LUMeUtJHUmdJYOrS
	 R/KJsxIscIzuX8NEl4/MwGea23nw/MPLV6W0Q/5rV0sabOaeHNaiqNYBGoNaTqGKUy
	 5ki0uTPkQ+UZyU6TPE+tON1nc7uzqATpbwDy0QpO9cNJB+d5cZ/ifhIxXZ4vRmcaOT
	 z7fsYk3zbiGNjpVWoTu+OwXuHq9fvcy4AVRW+1tzDx2grN9+5X4aVJMAwycSG4YgvU
	 L2TIS0xYjb6o2YxBXiUFS7JtgWUTYur8LQFJZT1dT5oSlg40vQNLjt7qPFfztUeMqv
	 4YjAbjdzYbcvg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Marek Vasut <marex@denx.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
Date: Fri, 13 Jan 2023 19:45:45 +0100
Message-Id: <20230113184547.487322-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113184547.487322-1-francesco@dolcini.it>
References: <20230113184547.487322-1-francesco@dolcini.it>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_105521_592415_FD1F301F 
X-CRM114-Status: GOOD (  22.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Fixup #size-cells value when updating the MTD partitions, this is
required to prevent issues in case the MTD parent set #size-cells to
zero.
This could happen for example in the legacy case in which the partitions
are created as direct child of the mtd node and that specific node has
no children. Recent clean-up on Linux device tree files created a boot
regression on colibri-imx7.

This fixup has the limitation to assume 32-bit (#size-cells=1)
addressing, therefore it will not work with device bigger than 4GiB.

This change also enforce #address-cells to be the same as #size-cells,
this was already silently enforced by fdt_node_set_part_info(), now this
is checked explicitly and partition fixup will just fail in such case.

In general board should not generally need nor use this functionality
and should be just deprecated, passing mtdparts= in the kernel command
line is the preferred way according to Linux MTD subsystem maintainer.

Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
Cc: Marek Vasut <marex@denx.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index dbceec6f2dcc..3aee826e60cf 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -877,27 +877,20 @@ static int fdt_del_partitions(void *blob, int parent_offset)
 	return 0;
 }
 
-static int fdt_node_set_part_info(void *blob, int parent_offset,
+/* This expects #address-cells and #size-cells to have same value */
+static int fdt_node_set_part_info(void *blob, int parent_offset, int sizecell,
 				  struct mtd_device *dev)
 {
 	struct list_head *pentry;
 	struct part_info *part;
 	int off, ndepth = 0;
 	int part_num, ret;
-	int sizecell;
 	char buf[64];
 
 	ret = fdt_del_partitions(blob, parent_offset);
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Check if size/address is 1 or 2 cells.
-	 * We assume #address-cells and #size-cells have same value.
-	 */
-	sizecell = fdt_getprop_u32_default_node(blob, parent_offset,
-						0, "#size-cells", 1);
-
 	/*
 	 * Check if it is nand {}; subnode, adjust
 	 * the offset in this case
@@ -992,6 +985,31 @@ err_prop:
 	return ret;
 }
 
+static int fdt_mtdparts_cell_cnt(void *fdt, int off)
+{
+	int sizecell, addrcell;
+
+	sizecell = fdt_getprop_u32_default_node(fdt, off, 0, "#size-cells", 0);
+	if (sizecell != 1 && sizecell != 2) {
+		printf("%s: Invalid or missing #size-cells %d value, assuming 1\n",
+		       __func__, sizecell);
+
+		sizecell = 1;
+		if (fdt_setprop_u32(fdt, off, "#size-cells", sizecell))
+			return -1;
+	}
+
+	addrcell = fdt_getprop_u32_default_node(fdt, off, 0,
+						"#address-cells", 0);
+	if (addrcell != sizecell) {
+		printf("%s: Invalid #address-cells %d != #size-cells %d, aborting\n",
+		       __func__, addrcell, sizecell);
+		return -1;
+	}
+
+	return sizecell;
+}
+
 /*
  * Update partitions in nor/nand nodes using info from
  * mtdparts environment variable. The nodes to update are
@@ -1037,12 +1055,19 @@ void fdt_fixup_mtdparts(void *blob, const struct node_info *node_info,
 
 			dev = device_find(node_info[i].type, idx++);
 			if (dev) {
+				int cell;
+
 				parts = fdt_subnode_offset(blob, noff,
 							   "partitions");
 				if (parts < 0)
 					parts = noff;
 
-				if (fdt_node_set_part_info(blob, parts, dev))
+				cell = fdt_mtdparts_cell_cnt(blob, parts);
+				if (cell < 0)
+					return;
+
+				if (fdt_node_set_part_info(blob, parts,
+							   cell, dev))
 					return; /* return on error */
 			}
 		}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
