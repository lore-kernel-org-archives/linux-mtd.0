Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A19C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 20:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14KIyfRU9+Wc+sHwwLM1c8y0ToGvSQ5UE1/8Vqty2cU=; b=T80+fSb1jjzEVq
	MIMsAqmvpxdC5pu4aZSi5OP/1nGAk5CFaZwRfoef1vU+QzIbbDWUwYbD7xpi93bV+g9+/6DN6fCnn
	nPiG32ejH4L9fEALgJ1vuA/qPD11GWeeeQmFgfzG2zrNG7U2FlLmajPS7Pdw7zcivqKUnhGLrWgSB
	eGqHb7h6R+5u+rlcQT1pqNA9WScGAhbW4Oezppfo4DB1/KXfIr/3VEJsi68H8wR1k/eQPsj8PHAbU
	UoVqH0neQot6BAkSp3esXLV+j0RXOWI6lLJLD3hSr/lRQ2eqZNBRPjW2eiLENUQaoB9jSKnyOXkOi
	0XFZr63USaZiyVxdSucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIGHH-004slR-Qa; Thu, 10 Feb 2022 20:42:55 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIGH3-004scM-IT
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 20:42:43 +0000
X-IronPort-AV: E=Sophos;i="5.88,359,1635199200"; 
   d="scan'208";a="5603090"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 21:42:33 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] mtd: spear_smi: use GFP_KERNEL
Date: Thu, 10 Feb 2022 21:42:21 +0100
Message-Id: <20220210204223.104181-8-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220210204223.104181-1-Julia.Lawall@inria.fr>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_124241_920373_09328DC7 
X-CRM114-Status: GOOD (  11.02  )
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

Platform_driver probe functions aren't called with locks held
and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.

Problem found with Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/mtd/devices/spear_smi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 2e00862389dd..24073518587f 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -969,7 +969,7 @@ static int spear_smi_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_ATOMIC);
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
 		goto err;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
