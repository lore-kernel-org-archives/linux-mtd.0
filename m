Received: from wip-ectls-mx1.wipro.com ([203.91.193.21])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IKWbq-00010l-0C
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 05:53:42 -0400
Subject: [KJ] replacing kmalloc with kzalloc in drivers/mtd/chips/jedec_probe.c
From: Surya Prabhakar N <surya.prabhakar@wipro.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Aug 2007 15:22:44 +0530
Message-Id: <1186998764.29518.11.camel@bluegenie>
Mime-Version: 1.0
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>
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
drivers/mtd/chips/jedec_probe.c.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 58e561e..ba5fc39 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1853,14 +1853,12 @@ static int cfi_jedec_setup(struct cfi_private *p_cfi, int index)
 
 	num_erase_regions = jedec_table[index].NumEraseRegions;
 
-	p_cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	p_cfi->cfiq = kzalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
 	if (!p_cfi->cfiq) {
 		//xx printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
 		return 0;
 	}
 
-	memset(p_cfi->cfiq,0,sizeof(struct cfi_ident));
-
 	p_cfi->cfiq->P_ID = jedec_table[index].CmdSet;
 	p_cfi->cfiq->NumEraseRegions = jedec_table[index].NumEraseRegions;
 	p_cfi->cfiq->DevSize = jedec_table[index].DevSize;

--
thanks
surya.


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments. 

WARNING: Computer viruses can be transmitted via email. The recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.
 
www.wipro.com
