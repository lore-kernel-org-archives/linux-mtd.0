Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJp3A-0007z6-8g
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2015 20:31:04 +0000
Date: 27 Jul 2015 20:30:43 -0000
Message-Id: <2feb6039b908bbe7daf98c0fc3b7c8f725c36ac3.1438028045.git.hramrach@gmail.com>
In-Reply-To: <cover.1438028045.git.hramrach@gmail.com>
References: <cover.1438028045.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 2/3] mtd: ofpart: do not fail probe when no partitions exist
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Exynos it is necessary to set SPI controller parameters that apply to
a SPI slave in a DT subnode of the slave device.  Example:

flash: m25p80@0 {
        #address-cells = <1>;
        #size-cells = <1>;
        compatible = "jedec,spi-nor";
        reg = <0>;
        spi-max-frequency = <40000000>;
        m25p,fast-read;
        controller-data {
            samsung,spi-feedback-delay = <0>;
        };
};

The ofpart code checks if there are any subnodes on the MTD device DT
node and if so it tries to parse them as MTD partitions (example below)

flash@0 {
        #address-cells = <1>;
        #size-cells = <1>;

        partition@0 {
                label = "u-boot";
                reg = <0x0000000 0x100000>;
                read-only;
        };

        uimage@100000 {
                reg = <0x0100000 0x200000>;
        };
};

The controller-data node contains no partition information and no other
subnodes with partition information exist.

The ofpart code returns an error when there are subnodes of the flash DT
node but no partitions are found. This error is then propagated to
mtdpart which propagetes it to MTD probe which fails probing the flash
device.

Change this condition to a warning so that flash without partitions can
be accessed on Exynos with ofpart support compiled in.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>

--
 - add more verbose explanation
---
 drivers/mtd/ofpart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa26c32..a29d29f 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -94,10 +94,10 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 
 	if (!i) {
 		of_node_put(pp);
-		pr_err("No valid partition found on %s\n", node->full_name);
+		pr_warn("No valid partition found on %s\n", node->full_name);
 		kfree(*pparts);
 		*pparts = NULL;
-		return -EINVAL;
+		return 0;
 	}
 
 	return nr_parts;
-- 
2.1.4
