Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA23CDB470
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2026 05:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y5JF4JaU9h2zm8C1JHYMJQBwS9g+EJsmPLsgPZ1blyo=; b=rhiMB+r5Og9/2m
	9UA1NzuwcDGUctw5LWVTrm33S59cv+AOzT9d2kpvE4w4UwqHA2HzyG1Bvq8TPfuHsaeTEZsTPDJd3
	uHaLASwjJJ77Hl0AfegUOgmCvrEjz/seKi0OKscLwqajT8ZAaOw/tJiWZsfWjDwSao3n/yr3UJFEA
	+7qAYc5SvPq4+yoRI68dLsOp+/vRZhFsDGNlv7H8UD/VVOmI+Ws6SMGoE3aA3PjYF4aAFP+LHk4IE
	RYq3NemtdBxvF12177EKR6kkOwEpMLhQb7ORGcaRWBVHfGm92WuG8T9yu+LPnBlY+eH/gpDNq53kO
	y85SqI7QMMxmx95fT1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGZS-00000007Bxw-3QEd;
	Wed, 24 Jun 2026 05:54:46 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGZP-00000007BvG-1Cz4
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jun 2026 05:54:45 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHG5IgcTtqph2tFQ--.64303S2;
	Wed, 24 Jun 2026 13:54:40 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: mchp23k256: Use SPI match data for chip caps
Date: Wed, 24 Jun 2026 13:54:40 +0800
Message-ID: <20260624055440.35226-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABHG5IgcTtqph2tFQ--.64303S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF4fGrW8Ar13uw17KrWkCrg_yoWkZFb_uw
	1fXFyqqwn5GF18KF4xKr1fZryS9w43Kr97Zwsayr93KF4Ivr13uFWkXr4jyr1UuF40kry8
	JryUXr45Gr4xWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjiID7UUUU
	U==
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225443_704370_1A92EAB9 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

The driver stores chip capacity information in both the OF match table
and the SPI id table.  Probe currently uses of_device_get_match_data(),
so a non-OF SPI modalias match falls back to mchp23k256_caps even when
the SPI id table selected a different part.

Use spi_get_device_match_data() so SPI id-table driver_data is consumed
when OF match data is absent.  This keeps the existing default fallback
while avoiding the wrong MTD geometry for id-table-only matches.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/devices/mchp23k256.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
index cef5f9677d39..66e058df4c32 100644
--- a/drivers/mtd/devices/mchp23k256.c
+++ b/drivers/mtd/devices/mchp23k256.c
@@ -188,7 +188,7 @@ static int mchp23k256_probe(struct spi_device *spi)
 
 	data = dev_get_platdata(&spi->dev);
 
-	flash->caps = of_device_get_match_data(&spi->dev);
+	flash->caps = spi_get_device_match_data(spi);
 	if (!flash->caps)
 		flash->caps = &mchp23k256_caps;
 
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
