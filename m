Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD43FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czuMcKMS6llGEknVGvZ0i7kY6DWEKC7I/k3VLMGUw2s=; b=qA0yWZpPcgZLer
	g53mNBzbg4xYE8PKE2qpmDsaTEayfwkXtJvQyRFfuQwIZTY1hRJPufsKbuU+1c8YBxsoQrEpFVKo8
	hSR3b6lBYpoOPAwGlz4Vi8wEt6Bfvw31e12eX6NH19fU+vtxJqA/ptlVQ9/XwGk/Np5S/ABVPAxTE
	xV8QW446nQJOiqgJKOcO3C1MzI5aR0kM4y+8E9sMk3ZkOiygF8eEg8aIDGpDKXqqonloN0SEkFTHK
	D41+QYiLYlwxtnjSYYSXRvUhxYrH1FxHjQWePLczOJqitOnnzMxk+kK7VCMXo3EHhoX9Mvd/CahW4
	MCuWdLFntCQXXP4Q5D8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXjCM-00255y-Ee; Fri, 25 Mar 2022 12:37:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXjC1-0024zx-L9
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:37:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 553E0B8282C;
 Fri, 25 Mar 2022 12:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE87C340E9;
 Fri, 25 Mar 2022 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648211843;
 bh=aXm+/EMiPGTBOXkMG0o+LiBNARi0puGc3dM/fhCENmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=digXl3nsnjDGSqWj6NnS6B8sWVQiVorkAFfMwLaFKXPKcBs19SILZwcL0i0h7NyXq
 dCunTb1FW5T2O+CUmcu8k9FQV7MB3XRrBR70oZL7jh85KVGSzgoEpKpDeQdPZ10R25
 HRoMUyyVY1kHTOjllhdaQNwOuBbSxnZLzsAz7QcMN/X5zC8vXqx76Y3RZ39eWKgLUh
 Y6swYLzPaIAPRCor7Gt67B9WgOpo3X9ypIvpw3mqSZdCcDa4WIGR73OSWzBgQThFx4
 cJP8gVwYdQw6Myso0T1AJn7VFak2kTUqXM7kllG77CxMgMpRtQP5g78Hus+OdJQTY2
 pjtEwI4jbDjGA==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, krzk@kernel.org, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 3/3] mtd: rawnand: omap_elm: Add compatible for AM64 ELM
Date: Fri, 25 Mar 2022 14:37:07 +0200
Message-Id: <20220325123707.22020-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325123707.22020-1-rogerq@kernel.org>
References: <20220325123707.22020-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_053725_864147_74CED643 
X-CRM114-Status: GOOD (  10.37  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The AM64 SoC has the Error Locator Module. Add compatible id for it.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/mtd/nand/raw/omap_elm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index db105d9b560c..aa7f49c3f372 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -550,6 +550,7 @@ static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
 #ifdef CONFIG_OF
 static const struct of_device_id elm_of_match[] = {
 	{ .compatible = "ti,am3352-elm" },
+	{ .compatible = "ti,am64-elm" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, elm_of_match);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
