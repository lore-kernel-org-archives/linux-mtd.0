Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asV5t-00031r-Az
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2016 12:49:29 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 3/4] mtd: pmc551: add __init attribute
Date: Tue, 19 Apr 2016 14:33:34 +0200
Message-Id: <1461069215-22795-4-git-send-email-Julia.Lawall@lip6.fr>
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

Add __init attribute on a function that is only called from other __init
functions and that is not inlined, at least with gcc version 4.8.4 on an
x86 machine with allyesconfig.  Currently, the function is put in the
.text.unlikely segment.  Declaring it as __init will cause it to be put in
the .init.text and to disappear after initialization.

The result of objdump -x on the function before the change is as follows:

00000000000000c6 l     F .text.unlikely 000000000000091c fixup_pmc551

And after the change it is as follows:

0000000000000000 l     F .init.text	0000000000000917 fixup_pmc551

Done with the help of Coccinelle.  The semantic patch checks for local
static non-init functions that are called from an __init function and are
not called from any other function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/devices/pmc551.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 708b7e8..220f920 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -353,7 +353,7 @@ static int pmc551_write(struct mtd_info *mtd, loff_t to, size_t len,
  * mechanism
  * returns the size of the memory region found.
  */
-static int fixup_pmc551(struct pci_dev *dev)
+static int __init fixup_pmc551(struct pci_dev *dev)
 {
 #ifdef CONFIG_MTD_PMC551_BUGFIX
 	u32 dram_data;
