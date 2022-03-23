Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502B3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czuMcKMS6llGEknVGvZ0i7kY6DWEKC7I/k3VLMGUw2s=; b=VwoCrhJiGKNH7S
	7Lsd8P8AaRMlBa+OjX56NVk3eEPt8KWjC6FsyKKasUbKMqn67ojIO9WzGYSUo+AmzhqpsC3/FdcxL
	W1Br1t3pxfAalAUorfdA7S19po3U8wsez7mAecPEcwaIAjAfKsxotJ18ccY8fjTbrQA6dseiKHLDl
	H2SqPsv1+hESeQTDuLQvfU+p4Bb7W6EMDDFQdyYuBZgODIvIQmiC2Jj90EyzWJlHoKPK3RKXtmHmY
	OmcZC4Oq08pANcOMDzh8HLePB1OePug9aKqhWFvSzDYj1oT3Q2kI7XYmwQo6NvDkDjKRBE5JFEV/a
	iQpcNI0rkaJ07NXBhTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWz1q-00DROa-CJ; Wed, 23 Mar 2022 11:19:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWz1D-00DRCT-8F
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 11:19:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB031B81E66;
 Wed, 23 Mar 2022 11:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF7BC340F3;
 Wed, 23 Mar 2022 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648034348;
 bh=aXm+/EMiPGTBOXkMG0o+LiBNARi0puGc3dM/fhCENmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gSG32VvnpivgYGxEvZF3+xwuHXp9ad5Nl8jbH88EIa9I8Wnu/n4hDmKe29jPh4Rqp
 t/nmmDPunOPrmWU68egA9KNNakh81Z1lwt0ljkfUSy+4yDjeeqofX14GboFC2lCzkz
 1qS6zcAM9woVc6Sz8QQyOYi6GGxH6locQksYKeInOkMHJyA2dRCkP4Y2ISxi539hdF
 6Sw7e8JsLC3O2ud8nVq3X5qQwrQnU6aY85tcYJoXlnDqvuwuw1ivAV8xsHTpjaLqbK
 5M2CNHjDVUotacsjF7bII5OtV77g4roUZclphjxopNwTyyI3qK9rJZsCdG6ZwPHkUd
 w7aOqeDn+BNNA==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 3/3] mtd: rawnand: omap_elm: Add compatible for AM64 ELM
Date: Wed, 23 Mar 2022 13:18:51 +0200
Message-Id: <20220323111851.4699-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323111851.4699-1-rogerq@kernel.org>
References: <20220323111851.4699-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_041911_491175_DB70DE33 
X-CRM114-Status: GOOD (  10.18  )
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
