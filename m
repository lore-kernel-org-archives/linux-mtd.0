Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03255C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEAyO5IgI10912zxbmPOLaXpMeGaJnOykN4XBQYkgZM=; b=brSDpjo9IgakSC
	ZeRUd3YeChvPogWiQdMahWZO5l47ryxfFDBaWCJke1eHIRcjwqfyhffE3m1aH2AKIPOt/dHzgTDkc
	RI86t/prz3lTckkgWzkYVqjT09buCRcQuLxX8rCZcDBtq+nYw67czYwMp21MlKJqI+4zew5RymDvp
	e48aHvnB+T3oyPTSxDYLaNTqiqwbzA0gEqAvQDRK498uIeJj88Kq06+D3pNA4vV4Zv8nFIcQgknCY
	voUOk9FwDAEtKu78k39EH1+Nzbf4iqkVaRt4btmVPvGfS2D2y0sSw0jO9+tTR2+1BI8rcl21R0QaX
	ZnpKd+p1i4Hlkg6YrYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85k-0086mt-23;
	Thu, 10 Aug 2023 16:00:52 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85f-0086hY-1E
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0E84B635D29A;
	Thu, 10 Aug 2023 18:00:46 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id i2OBkMkvY2wu; Thu, 10 Aug 2023 18:00:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B1424635D2A8;
	Thu, 10 Aug 2023 18:00:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vNycAkqY1e7l; Thu, 10 Aug 2023 18:00:45 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 55000635D296;
	Thu, 10 Aug 2023 18:00:45 +0200 (CEST)
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
Subject: [PATCH 5/7] scsi: fdomain: Switch to kmap_sg
Date: Thu, 10 Aug 2023 18:00:16 +0200
Message-Id: <20230810160019.16977-6-richard@nod.at>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090047_589337_C0C67CB2 
X-CRM114-Status: GOOD (  10.99  )
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
 drivers/scsi/fdomain.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/fdomain.c b/drivers/scsi/fdomain.c
index 504c4e0c5d17a..5d58a9ec1c66a 100644
--- a/drivers/scsi/fdomain.c
+++ b/drivers/scsi/fdomain.c
@@ -223,15 +223,14 @@ static void fdomain_read_data(struct scsi_cmnd *cmd)
 
 	while ((len = inw(fd->base + REG_FIFO_COUNT)) > 0) {
 		offset = scsi_bufflen(cmd) - scsi_get_resid(cmd);
-		virt = scsi_kmap_atomic_sg(scsi_sglist(cmd), scsi_sg_count(cmd),
-					   &offset, &len);
+		virt = kmap_sg(scsi_sglist(cmd), scsi_sg_count(cmd), &offset, &len);
 		ptr = virt + offset;
 		if (len & 1)
 			*ptr++ = inb(fd->base + REG_FIFO);
 		if (len > 1)
 			insw(fd->base + REG_FIFO, ptr, len >> 1);
 		scsi_set_resid(cmd, scsi_get_resid(cmd) - len);
-		scsi_kunmap_atomic_sg(virt);
+		kunmap_sg(virt);
 	}
 }
 
@@ -250,15 +249,14 @@ static void fdomain_write_data(struct scsi_cmnd *cmd)
 			if (len == 0)
 				break;
 		}
-		virt = scsi_kmap_atomic_sg(scsi_sglist(cmd), scsi_sg_count(cmd),
-					   &offset, &len);
+		virt = kmap_sg(scsi_sglist(cmd), scsi_sg_count(cmd), &offset, &len);
 		ptr = virt + offset;
 		if (len & 1)
 			outb(*ptr++, fd->base + REG_FIFO);
 		if (len > 1)
 			outsw(fd->base + REG_FIFO, ptr, len >> 1);
 		scsi_set_resid(cmd, scsi_get_resid(cmd) - len);
-		scsi_kunmap_atomic_sg(virt);
+		kunmap_sg(virt);
 	}
 }
 
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
