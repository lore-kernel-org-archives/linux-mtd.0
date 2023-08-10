Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B41C04FE1
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mma6/41E3jusOudNgoCk1JLbveSkQS+oylahfrX2sGw=; b=pWbFWizUvHMJ/a
	i0czaUkY8/kDWhTUkoYNX39sQtVlhCyjwaPsmEhuguR9TLVUlZk9ccFf92m70TvvNPKcx04SKtdbK
	PQ+eZDnpLFLdDJFHhHMXF/wo5aenHAxsnJ/QvduvEKfUgrWO20l2vJ65CBInXEvEcQzGi3PGHpSd7
	JgPeP27lY4ei1Apjf+nR9p2bcgFtkTxufQ76pjGzzIbuXcdMD9awMApIPqDZb+tFonyGr/XZtMfa5
	b0IyJ4LvpxSy5qdSNDosTdN/JgcFGKdkkBlIBgZsKJ2Wm9/fOxcP8O1tmPsrCqozGh4sSqkC/xhvz
	xCwb2zpPI3AzCURhY7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85k-0086mR-0C;
	Thu, 10 Aug 2023 16:00:52 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85d-0086et-0b
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 63D92622F56E;
	Thu, 10 Aug 2023 18:00:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HGDQ1P6SpJc5; Thu, 10 Aug 2023 18:00:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EC415622F592;
	Thu, 10 Aug 2023 18:00:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5wGKZt-JMm6Y; Thu, 10 Aug 2023 18:00:41 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 9000E622F56E;
	Thu, 10 Aug 2023 18:00:41 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Christoph Hellwig <hch@infradead.org>,
	Stephan Wurm <stephan.wurm@a-eberle.de>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Oliver Neukum <oliver@neukum.org>,
	Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 3/7] scsi: dc395x: Switch to kmap_sg
Date: Thu, 10 Aug 2023 18:00:14 +0200
Message-Id: <20230810160019.16977-4-richard@nod.at>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090045_562863_26BE1B53 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Switch to our new helper from scatterlist lib.
No functional change, the mapped region is still used in atomic
context.
Maybe local_irq_save() can be dropped, but I don't know this driver
well enough.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/scsi/dc395x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/dc395x.c b/drivers/scsi/dc395x.c
index c8e86f8a631eb..4a4e7a35328b9 100644
--- a/drivers/scsi/dc395x.c
+++ b/drivers/scsi/dc395x.c
@@ -2122,7 +2122,7 @@ static void data_in_phase0(struct AdapterCtlBlk *acb, struct ScsiReqBlk *srb,
 				local_irq_save(flags);
 				/* Assumption: it's inside one page as it's at most 4 bytes and
 				   I just assume it's on a 4-byte boundary */
-				base = scsi_kmap_atomic_sg(scsi_sglist(srb->cmd),
+				base = kmap_sg(scsi_sglist(srb->cmd),
 							   srb->sg_count, &offset, &len);
 				virt = base + offset;
 
@@ -2165,7 +2165,7 @@ static void data_in_phase0(struct AdapterCtlBlk *acb, struct ScsiReqBlk *srb,
 					DC395x_write8(acb, TRM_S1040_SCSI_CONFIG2, 0);
 				}
 
-				scsi_kunmap_atomic_sg(base);
+				kunmap_sg(base);
 				local_irq_restore(flags);
 			}
 			/*printk(" %08x", *(u32*)(bus_to_virt (addr))); */
@@ -2339,7 +2339,7 @@ static void data_io_transfer(struct AdapterCtlBlk *acb,
 
 				local_irq_save(flags);
 				/* Again, max 4 bytes */
-				base = scsi_kmap_atomic_sg(scsi_sglist(srb->cmd),
+				base = kmap_sg(scsi_sglist(srb->cmd),
 							   srb->sg_count, &offset, &len);
 				virt = base + offset;
 
@@ -2354,7 +2354,7 @@ static void data_io_transfer(struct AdapterCtlBlk *acb,
 					sg_subtract_one(srb);
 				}
 
-				scsi_kunmap_atomic_sg(base);
+				kunmap_sg(base);
 				local_irq_restore(flags);
 			}
 			if (srb->dcb->sync_period & WIDE_SYNC) {
@@ -3290,7 +3290,7 @@ static void srb_done(struct AdapterCtlBlk *acb, struct DeviceCtlBlk *dcb,
 		size_t offset = 0, len = sizeof(struct ScsiInqData);
 
 		local_irq_save(flags);
-		base = scsi_kmap_atomic_sg(sg, scsi_sg_count(cmd), &offset, &len);
+		base = kmap_sg(sg, scsi_sg_count(cmd), &offset, &len);
 		ptr = (struct ScsiInqData *)(base + offset);
 
 		if (!ckc_only && get_host_byte(cmd) == DID_OK
@@ -3308,7 +3308,7 @@ static void srb_done(struct AdapterCtlBlk *acb, struct DeviceCtlBlk *dcb,
 			}
 		}
 
-		scsi_kunmap_atomic_sg(base);
+		kunmap_sg(base);
 		local_irq_restore(flags);
 	}
 
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
