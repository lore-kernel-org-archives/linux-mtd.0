Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asV5Z-0002ro-EM
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2016 12:49:10 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 4/4] mtd: nandsim: add __init attribute
Date: Tue, 19 Apr 2016 14:33:35 +0200
Message-Id: <1461069215-22795-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461069215-22795-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1461069215-22795-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add __init attribute on functions that are only called from other __init
functions and that are not inlined, at least with gcc version 4.8.4 on an
x86 machine with allyesconfig.  Currently, the functions are put in the
.text.unlikely segment.  Declaring them as __init will cause them to be
put in the .init.text and to disappear after initialization.

The result of objdump -x on the functions before the change is as follows:

000000000000059a l     F .text.unlikely 0000000000000239 alloc_device
000000000000034e l     F .text.unlikely 000000000000002e get_partition_name
00000000000007d3 l     F .text.unlikely 00000000000005da init_nandsim

And after the change it is as follows:

0000000000000029 l     F .init.text	0000000000000234 alloc_device
0000000000000000 l     F .init.text	0000000000000029 get_partition_name
000000000000025d l     F .init.text	00000000000005d5 init_nandsim

Done with the help of Coccinelle.  The semantic patch checks for local
static non-init functions that are called from an __init function and are
not called from any other function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/nand/nandsim.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1439459..527d23e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -569,7 +569,7 @@ static void nandsim_debugfs_remove(struct nandsim *ns)
  *
  * RETURNS: 0 if success, -ENOMEM if memory alloc fails.
  */
-static int alloc_device(struct nandsim *ns)
+static int __init alloc_device(struct nandsim *ns)
 {
 	struct file *cfile;
 	int i, err;
@@ -654,7 +654,7 @@ static void free_device(struct nandsim *ns)
 	}
 }
 
-static char *get_partition_name(int i)
+static char __init *get_partition_name(int i)
 {
 	return kasprintf(GFP_KERNEL, "NAND simulator partition %d", i);
 }
@@ -664,7 +664,7 @@ static char *get_partition_name(int i)
  *
  * RETURNS: 0 if success, -ERRNO if failure.
  */
-static int init_nandsim(struct mtd_info *mtd)
+static int __init init_nandsim(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct nandsim   *ns   = nand_get_controller_data(chip);
