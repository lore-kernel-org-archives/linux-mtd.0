Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asV5Y-0002ro-7l
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2016 12:49:08 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 2/4] mtd: maps: add __init attribute
Date: Tue, 19 Apr 2016 14:33:33 +0200
Message-Id: <1461069215-22795-3-git-send-email-Julia.Lawall@lip6.fr>
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

00000000000001bc l     F .text.unlikely 00000000000006a2 ck804xrom_init_one.isra.1
00000000000001aa l     F .text.unlikely 0000000000000764 esb2rom_init_one.isra.1
00000000000001db l     F .text.unlikely 0000000000000716 ichxrom_init_one.isra.1

And after the change it is as follows:

0000000000000000 l     F .init.text	000000000000069d ck804xrom_init_one.isra.1
0000000000000000 l     F .init.text	000000000000075f esb2rom_init_one.isra.1
0000000000000000 l     F .init.text	0000000000000711 ichxrom_init_one.isra.1

Done with the help of Coccinelle.  The semantic patch checks for local
static non-init functions that are called from an __init function and are
not called from any other function.

Note that in each case, the function is stored in the probe field of a
pci_driver structure, but this code is under an #if 0.  The #if 0s have
been unchanged since 2009 at the latest.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/maps/ck804xrom.c |    4 ++--
 drivers/mtd/maps/esb2rom.c   |    4 ++--
 drivers/mtd/maps/ichxrom.c   |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index 0455166..4f206a9 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -112,8 +112,8 @@ static void ck804xrom_cleanup(struct ck804xrom_window *window)
 }
 
 
-static int ck804xrom_init_one(struct pci_dev *pdev,
-			      const struct pci_device_id *ent)
+static int __init ck804xrom_init_one(struct pci_dev *pdev,
+				     const struct pci_device_id *ent)
 {
 	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
 	u8 byte;
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index 76ed651..9646b07 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -144,8 +144,8 @@ static void esb2rom_cleanup(struct esb2rom_window *window)
 	pci_dev_put(window->pdev);
 }
 
-static int esb2rom_init_one(struct pci_dev *pdev,
-			    const struct pci_device_id *ent)
+static int __init esb2rom_init_one(struct pci_dev *pdev,
+				   const struct pci_device_id *ent)
 {
 	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
 	struct esb2rom_window *window = &esb2rom_window;
diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index 8636bba..e17d02a 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -84,8 +84,8 @@ static void ichxrom_cleanup(struct ichxrom_window *window)
 }
 
 
-static int ichxrom_init_one(struct pci_dev *pdev,
-			    const struct pci_device_id *ent)
+static int __init ichxrom_init_one(struct pci_dev *pdev,
+				   const struct pci_device_id *ent)
 {
 	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
 	struct ichxrom_window *window = &ichxrom_window;
