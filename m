Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58113C04E69
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bWsdri5vYjTMpPeAY19pGUO1h/EHAJflteOzxYdbkU=; b=altAFYwMXaXHI+
	Kai5n2hSy7tKEHROiNHIPDTOfG2Ub3DbEs6nHywOVc/Nwngn5UdW2FIn1nHpErU90PEHvQ/vS7AYk
	YwWk1CmHGkz2JgFOeiq8mFSK01rb+wqkRFinRdMegJxjfgB9oElwq6qMd9yrkkLHwiIl7RzP92EiF
	UqyehNnM/az5Lt8IXPIok8JQlJvyg4NEExmRE6N5s8eSEcwllXr5c745j3GQ1hL6tuF9mBTffdsXn
	pRdBcWFJo08+BGlmOh651tF0h1tOQt38RSlOdBhmqk2MZRSB5mTOYYhSx2NjiJWUZtztIUSHox6eL
	xP6NIbO55gdfN46XutIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85i-0086kq-0P;
	Thu, 10 Aug 2023 16:00:50 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85d-0086fr-1A
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1FC74635D2A1;
	Thu, 10 Aug 2023 18:00:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IScXaYrAKO0A; Thu, 10 Aug 2023 18:00:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C9DCB635D29F;
	Thu, 10 Aug 2023 18:00:43 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Xcer7PJILGKE; Thu, 10 Aug 2023 18:00:43 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 6F83C635D296;
	Thu, 10 Aug 2023 18:00:43 +0200 (CEST)
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
Subject: [PATCH 4/7] scsi: esp_scsi: Switch to kmap_sg
Date: Thu, 10 Aug 2023 18:00:15 +0200
Message-Id: <20230810160019.16977-5-richard@nod.at>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090045_555657_848848B4 
X-CRM114-Status: GOOD (  11.15  )
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/scsi/esp_scsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
index 97816a0e6240a..10d2fcf65f28a 100644
--- a/drivers/scsi/esp_scsi.c
+++ b/drivers/scsi/esp_scsi.c
@@ -1355,11 +1355,11 @@ static int esp_data_bytes_sent(struct esp *esp, struct esp_cmd_entry *ent,
 			struct esp_cmd_priv *p = ESP_CMD_PRIV(cmd);
 			u8 *ptr;
 
-			ptr = scsi_kmap_atomic_sg(p->cur_sg, p->num_sg,
+			ptr = kmap_sg(p->cur_sg, p->num_sg,
 						  &offset, &count);
 			if (likely(ptr)) {
 				*(ptr + offset) = bval;
-				scsi_kunmap_atomic_sg(ptr);
+				kunmap_sg(ptr);
 			}
 		}
 		bytes_sent += fifo_cnt;
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
