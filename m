Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4fid-0003Ld-7t
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 02:03:32 +0000
Received: by pacdm15 with SMTP id dm15so78481650pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 03 Dec 2015 18:03:09 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Simon Arlott <simon@fire.lp0.eu>, Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH for-4.4 1/2] mtd: ofpart: don't complain about missing
 'partitions' node too loudly
Date: Thu,  3 Dec 2015 18:02:08 -0800
Message-Id: <1449194529-145705-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ofpart partition parser might be run on DT-enabled systems that
don't have any "ofpart" partition subnodes at all, since "ofpart" is in
the default parser list. So don't complain loudly on every boot.

Example: using m25p80.c with no intent to use ofpart:

&spi2 {
	status = "okay";

	flash@0 {
		compatible = "jedec,spi-nor";
		reg = <0>;
	};
};

I see this warning:

[    0.588471] m25p80 spi2.0: gd25q32 (4096 Kbytes)
[    0.593091] spi2.0: 'partitions' subnode not found on /spi@ff130000/flash@0. Trying to parse direct subnodes as partitions.

Cc: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
This one really seems like we should put it into 4.4. Basically everyone with a
DT-enabled MTD using the default parsers will get this warning, even if they're
not intending to use ofpart at all.

 drivers/mtd/ofpart.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 669c3452f278..3e9c5857c991 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -46,8 +46,13 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 
 	ofpart_node = of_get_child_by_name(mtd_node, "partitions");
 	if (!ofpart_node) {
-		pr_warn("%s: 'partitions' subnode not found on %s. Trying to parse direct subnodes as partitions.\n",
-			master->name, mtd_node->full_name);
+		/*
+		 * We might get here even when ofpart isn't used at all (e.g.,
+		 * when using another parser), so don't be louder than
+		 * KERN_DEBUG
+		 */
+		pr_debug("%s: 'partitions' subnode not found on %s. Trying to parse direct subnodes as partitions.\n",
+			 master->name, mtd_node->full_name);
 		ofpart_node = mtd_node;
 		dedicated = false;
 	}
-- 
2.6.0.rc2.230.g3dd15c0
