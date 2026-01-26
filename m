Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07980D19506
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jan 2026 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KekFqSY6fJ/JB2oHieOviyRrpdpXA02PKFMVKm+JLys=; b=ySXk7dNIaECcUV
	gpmf+ueVaAxq76aO+wYIQdWS4R984LqYukpap0liFTBV8QxSQnVy5bje9h9jn28+Vok4yOMpT6dN+
	tc9UC5fmQsUyjlE4zfXtq2VxjMC+Iye4oWSRVnhrlAQgQl8L845E7S/8cKVhAvJgbPYSMRu3WUKd1
	vNEFwKu7RfAWDwDvoP73AFcJ6flni0edpPF96SNIatNKDsEqwaau5btj41GOZpyvkn3IX8zWPQYc8
	b6/mymMH+1YzjXr51MvjizgoRirqdKCUG4eWuLeRUgx8i8BInJ8BAeDoeBNs5TA5nsl9V/5zFBIa7
	6YlG2TXwq/vU7J6GqhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPvh-0000000CuYQ-01Qc;
	Mon, 26 Jan 2026 16:59:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPvc-0000000CuW2-4AW4
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jan 2026 16:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7DD2F40527;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AD16C16AAE;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769446743;
	bh=UUE836v8cvihk8IfosjMQaRYSGydDbQU3XprtYIeQiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tCs9IqaZltdmyzLN4gEjLO+OJ7vXG7AurFGq2U0/Mskflrt6M91NXg+NmJ9a/P/cw
	 f2rBcv8WlsG/V6oXGbeGJ/kBPu9ffJLXaZnK2C5Fyt9/ngE2sSZ+W8dhcOifgjr0Rv
	 4zAhzwEwRah33v3nDlVyPEzQhz4Rq4KSewPzVk7Yf6U1IubDvauzJ3DNd9n9VIEKoh
	 kWN1OutHJJsE3uBzO6Q/qlC+LHRunUCLMTbGKbG7t3uzdZRYEFdm5tZlRR8B8RUYtD
	 AMkaZ7nAHIr/dOZJ95c2HKD6HcQbIPewicW6cDMZMvTUS8uCUAB0bogp6se5XzU/JC
	 zWTqD1tavnJRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512C4D19501;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Date: Mon, 26 Jan 2026 17:58:55 +0100
Subject: [PATCH v2 1/2] mtd: rawnand: pl353: Fix software ECC support
MIME-Version: 1.0
Message-Id: <20260126-pl353-soft-ecc-support-v2-1-fcd74b6e955f@dave.eu>
References: <20260126-pl353-soft-ecc-support-v2-0-fcd74b6e955f@dave.eu>
In-Reply-To: <20260126-pl353-soft-ecc-support-v2-0-fcd74b6e955f@dave.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Amit Kumar <amit.kumar-mahapatra@amd.com>, 
 Andrea Scian <andrea.scian@dave.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769446742; l=930;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=pjp7e5XqvjwdI+0l+aByZIcrYrWvIGxc1jaHj+aNu4Q=;
 b=XqkcYEu2zoXUaDXq30sYtPT/NnekjpeCT3cOKfKNN1+YiL3zej8d3DiZpVfT9Nx5rwkAb/U0/
 +74MntHAS0kDFwCdVVtOXNPlXeXK0I9a+KuigMg+5RjWATmN6WcPJxW
X-Developer-Key: i=andrea.scian@dave.eu; a=ed25519;
 pk=PMQL72nEsyoiJCobnq0uEXwUFpVmkwoWIx317WvaQOU=
X-Endpoint-Received: by B4 Relay for andrea.scian@dave.eu/20260121 with
 auth_id=613
X-Original-From: Andrea Scian <andrea.scian@dave.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_085905_058271_BA2ED811 
X-CRM114-Status: UNSURE (   9.09  )
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
Reply-To: andrea.scian@dave.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Andrea Scian <andrea.scian@dave.eu>

We need to set another couple of fields in ecc structure to allow
choosing SW ECC instead of HW one, otherwise write operation fail.

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 11bd90e3f18cb..fcb62b9ec947b 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -976,6 +976,8 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
