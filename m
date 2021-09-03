Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E113DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:27:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5623B60F92
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 08:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5623B60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ozwJ0uKGyZKuUM6z0nuvSnBArQ7SCwy7RFLHq+4hw38=; b=RI+phlkkZJxC+N
	Gka6wKK+oB3jkydhubs+F3eWB1BhdBqeLAW5KQbxdssSqkdon5jewGhS+9X3QlfoIm4j6yDxUTyFt
	xUBgFe/evDa+e0wMiSxY9RRwHa3RxhS+6+bGMX8/uNpjMPX9sP6EkexHJgf6I3CL9uy0FXWYWQWbP
	DR/hZxrF2zWyMdNz2s71EywjUNhbvKen2vTzDiVAfUlny1IvGSFchtpK1cw3+uKX/CHuOqIBj47WZ
	LN0+HDSi3jR7ky2jv4npW0AepDFwQOHhFFSjRu4LwKpChrH8IB2r+zgdNGbl1fjJeScNt/5LJ3J4t
	JXMdb0QyWrdCYHEdBIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM4Xc-00BGZ9-E1; Fri, 03 Sep 2021 08:27:16 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM4XZ-00BGVU-PL
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 08:27:15 +0000
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
 by mail.ispras.ru (Postfix) with ESMTPS id 324EC40D4004;
 Fri,  3 Sep 2021 08:26:58 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Evgeny Novikov <novikov@ispras.ru>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 Anton Vasilyev <vasilyev@ispras.ru>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH] mtd: rawnand: intel: Fix potential buffer overflow in probe
Date: Fri,  3 Sep 2021 11:26:53 +0300
Message-Id: <20210903082653.16441-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_012714_071833_36744595 
X-CRM114-Status: UNSURE (   9.97  )
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

ebu_nand_probe() read the value of u32 variable "cs" from the device
firmware description and used it as the index for array ebu_host->cs
that can contain MAX_CS (2) elements at most. That could result in
a buffer overflow and various bad consequences later.

Fix the potential buffer overflow by restricting values of "cs" with
MAX_CS in probe.

Found by Linux Driver Verification project (linuxtesting.org).

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
Co-developed-by: Anton Vasilyev <vasilyev@ispras.ru>
Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 8b49fd56cf96..81678088fdca 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -609,6 +609,11 @@ static int ebu_nand_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to get chip select: %d\n", ret);
 		return ret;
 	}
+	if (cs >= MAX_CS) {
+		dev_err(dev, "got invalid chip select: %d\n", cs);
+		return -EINVAL;
+	}
+
 	ebu_host->cs_num = cs;
 
 	resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
