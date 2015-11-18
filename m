Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzB1d-0006xN-RG
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 22:16:26 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 1/4] mtd: brcmnand: improve memory management
Date: Wed, 18 Nov 2015 23:04:11 +0100
Message-Id: <1447884254-26336-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch addresses several related memory management issues in the probe
function:

1. for_each_available_child_of_node performs an of_node_get on each
iteration, so a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
@@

 for_each_available_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
(
   return child;
|
+  of_node_put(child);
?  return ...;
)
   ...
 }
// </smpl>

2. The devm_kzalloc'd data is not used if brcmnand_init_cs fails.  Free it
immediately, using devm_kfree in this case, instead of waiting for the
remove function.

3. If the continue is not taken, then host is added to a list, that has a
lifetime beyond the end of the for_each_available_child_of_node loop body.
Thus, of_node_get is needed on child, which is referenced by host.  A
corresponding of_node_put is needed in the remove function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

One could consider whether the of_node_get should be on host->of_node,
which looks more similar to the thing that is stored in the list.  I used
child, to be more similar to the of_node_put in the same function.

 drivers/mtd/nand/brcmnand/brcmnand.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 2a437c7..b0cb55d 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2237,16 +2237,20 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			struct brcmnand_host *host;
 
 			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-			if (!host)
+			if (!host) {
+				of_node_put(child);
 				return -ENOMEM;
+			}
 			host->pdev = pdev;
 			host->ctrl = ctrl;
 			host->of_node = child;
 
 			ret = brcmnand_init_cs(host);
-			if (ret)
+			if (ret) {
+				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
-
+			}
+			of_node_get(child);
 			list_add_tail(&host->node, &ctrl->host_list);
 		}
 	}
@@ -2264,8 +2268,10 @@ int brcmnand_remove(struct platform_device *pdev)
 	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
 	struct brcmnand_host *host;
 
-	list_for_each_entry(host, &ctrl->host_list, node)
+	list_for_each_entry(host, &ctrl->host_list, node) {
+		of_node_put(host->of_node);
 		nand_release(&host->mtd);
+	}
 
 	dev_set_drvdata(&pdev->dev, NULL);
 
