Received: from wip-ectls-mx3.wipro.com ([203.91.193.23])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IKWfU-0001L2-SN
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 05:57:03 -0400
Subject: [KJ] replacing kmalloc with kzalloc in drivers/mtd/devices/docprobe.c
From: Surya Prabhakar N <surya.prabhakar@wipro.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 13 Aug 2007 15:26:32 +0530
Message-Id: <1186998992.29518.15.camel@bluegenie>
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
drivers/mtd/devices/docprobe.c.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
index 54aa759..53be397 100644
--- a/drivers/mtd/devices/docprobe.c
+++ b/drivers/mtd/devices/docprobe.c
@@ -254,7 +254,7 @@ static void __init DoC_Probe(unsigned long physadr)
 			return;
 		}
 		docfound = 1;
-		mtd = kmalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP_KERNEL);
+		mtd = kzalloc(sizeof(struct DiskOnChip) + sizeof(struct mtd_info), GFP_KERNEL);
 
 		if (!mtd) {
 			printk(KERN_WARNING "Cannot allocate memory for data structures. Dropping.\n");
@@ -264,9 +264,6 @@ static void __init DoC_Probe(unsigned long physadr)
 
 		this = (struct DiskOnChip *)(&mtd[1]);
 
-		memset((char *)mtd,0, sizeof(struct mtd_info));
-		memset((char *)this, 0, sizeof(struct DiskOnChip));
-
 		mtd->priv = this;
 		this->virtadr = docptr;
 		this->physadr = physadr;

--
thanks
surya.


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments. 

WARNING: Computer viruses can be transmitted via email. The recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.
 
www.wipro.com
