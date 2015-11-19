Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzWot-0003Vr-Q1
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 21:32:45 +0000
Date: Thu, 19 Nov 2015 22:32:15 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Brian Norris <computersforpeace@gmail.com>
cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Jason Cooper <jason@lakedaemon.net>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH 1/4 v2] mtd: brcmnand: improve memory management
In-Reply-To: <20151119192632.GH64635@google.com>
Message-ID: <alpine.DEB.2.02.1511192231330.2106@localhost6.localdomain6>
References: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447884254-26336-2-git-send-email-Julia.Lawall@lip6.fr>
 <20151118224440.GC64635@google.com>
 <alpine.DEB.2.02.1511190713140.2008@localhost6.localdomain6>
 <20151119192632.GH64635@google.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch addresses two related memory management issues in the probe
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

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

v2: Drop of_node_get addition, as another patch will get rid of the need
for it completely.

 drivers/mtd/nand/brcmnand/brcmnand.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 2a437c7..551d474 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2237,15 +2237,19 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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
+			}
 
 			list_add_tail(&host->node, &ctrl->host_list);
 		}
