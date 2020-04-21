Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEFDC54FCC
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA31206A1
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 16:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MO7v6kDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA31206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f7EeXxKyC3wNgDxONQmLRqlbWupZEYI3QV+rJw3RdY0=; b=MO7v6kDKUEIxnS
	dBOKyjVoS5HZJ4zLpXrhqklxrVTcffhqk7CSB+AH1cCsk4u2zIcVIJj0Xip0WlcRHLLf8XUni3Eg7
	yVRtiQCes6CDidDIecVpgITG8XY5P1DDxp3DmRe5MLeiKGSyC1fWQa262JM66zEiSzDXEo0N27dUd
	DztA0vn6JIfQu0oj7syDPYm5sw3rHbPT178RRnZHBcAKdqBqd2WcyLTaBk7qO2ZcQOMraf9pjVPiw
	h3nmaMHM/rejbtRFIAY/BvDA9zeutFg/7QzKgr5yxqE9zgIxXt0UoLvjJ7wxlGGIgbEIbh9YiC6Gs
	gd3B0d0gfDWwf8V3Pzdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQw4U-0005jN-AD; Tue, 21 Apr 2020 16:48:30 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQw2r-00042i-Ix
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 16:46:51 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2BD9D20002;
 Tue, 21 Apr 2020 16:46:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/8] mtd: rawnand: jedec: Use an intermediate variable to
 decomplefixy conditions
Date: Tue, 21 Apr 2020 18:46:36 +0200
Message-Id: <20200421164637.8086-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421164637.8086-1-miquel.raynal@bootlin.com>
References: <20200421164637.8086-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_094649_800337_C6BA1E49 
X-CRM114-Status: GOOD (  10.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Before reworking a little bit the JEDEC detection code, let's
decomplefixy an if statement.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_jedec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 9b540e76f84f..4cc1ea512887 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -28,6 +28,7 @@ int nand_jedec_detect(struct nand_chip *chip)
 	int jedec_version = 0;
 	char id[5];
 	int i, val, ret;
+	u16 crc;
 
 	memorg = nanddev_get_memorg(&chip->base);
 
@@ -54,8 +55,8 @@ int nand_jedec_detect(struct nand_chip *chip)
 			goto free_jedec_param_page;
 		}
 
-		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
-				le16_to_cpu(p->crc))
+		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 510);
+		if (crc == le16_to_cpu(p->crc))
 			break;
 	}
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
