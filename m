Received: from wip-ectls-mx3.wipro.com ([203.91.193.23])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IKWYj-0000mf-5A
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 05:50:19 -0400
Subject: [KJ-resend]replacing kmalloc with kzalloc in
	drivers/mtd/chips/cfi_probe.c
From: Surya Prabhakar N <surya.prabhakar@wipro.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Aug 2007 15:19:33 +0530
Message-Id: <1186998573.29518.6.camel@bluegenie>
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org
Reply-To: surya.prabhakar@wipro.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
   Replacing kmalloc with kzalloc and cleaning up memset in 
drivers/mtd/chips/cfi_probe.c. Kindly ignore the previous similar patch.

Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 60e11a0..efb51f7 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -203,14 +203,12 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	if (!num_erase_regions)
 		return 0;
 
-	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	cfi->cfiq = kzalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
 	if (!cfi->cfiq) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
 		return 0;
 	}
 
-	memset(cfi->cfiq,0,sizeof(struct cfi_ident));
-
 	cfi->cfi_mode = CFI_MODE_CFI;
 
 	/* Read the CFI info structure */

thanks
surya.


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments. 

WARNING: Computer viruses can be transmitted via email. The recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.
 
www.wipro.com
