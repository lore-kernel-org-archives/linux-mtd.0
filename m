Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB963C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Mar 2022 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czuMcKMS6llGEknVGvZ0i7kY6DWEKC7I/k3VLMGUw2s=; b=Qs3OjU44WRutew
	ZKH32vjsmfPqTENt4Bh7lVUZzi18vDPZ8iPgixRILOpDtOuqatAIjuSguZQsZGLWVvcIBJZaGYLZn
	Ij9XMLMCISUG0SFj38r1GRC/AMmwjqU9OotGCtYSd0Mipy1XRepWrjxaaokFuZXVBqPvzqjuNBbBo
	LZVd5YtImlpj6P8BE1wglqZ80LpD0FKotEQnEMYlI/J/jlc+LXWY9y+4S+vedainreBVHiMMROxXx
	Yl4as27ivv6oQPH+BSAcAo1HTtag65VzsSYfVsfwher81sbi41hCgVfvq8T2XBMFQihra4TU9tS18
	iZXGyPCd9EhcyUqHqeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1Sx-003ySL-Pq; Sat, 26 Mar 2022 08:08:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Sc-003yNZ-2u
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2022 08:07:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA87B60CA0;
 Sat, 26 Mar 2022 08:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69E8C34116;
 Sat, 26 Mar 2022 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648282065;
 bh=aXm+/EMiPGTBOXkMG0o+LiBNARi0puGc3dM/fhCENmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d36AEMRsvicEHBnWgOclYD5tgBL4i/mWby4t9DVwnBmyBsXxBJa19rkyueP2W33n5
 bvChsNzAbGWodlxH87GZhd4t/R896m4jWAVbvi+1JrgqPGwDCG6lEIzQ1R/BnlRfjW
 Q5zKF+o0U8BMAw5l8tXsA8QcOPkbVhfCSVl26rjtJUcGRrh1dLktHQu7XziQqfO8TT
 xarn8ifj5LpOen3bcVejgs5zBNdoVDdfX7O7zMybknAkpiGs3cIrCXa2x1GgZEn54O
 +7smnn3ICeJfdkNcXPQuvfRf82y8UL5sd+0uFWSi2eR9e5yMDOOnNtPrUJ/GenJvvD
 K49rIvqXucf3A==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: krzk@kernel.org, richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 3/3] mtd: rawnand: omap_elm: Add compatible for AM64 ELM
Date: Sat, 26 Mar 2022 10:07:26 +0200
Message-Id: <20220326080726.30372-4-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220326080726.30372-1-rogerq@kernel.org>
References: <20220326080726.30372-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_010746_263341_B969021D 
X-CRM114-Status: UNSURE (   9.44  )
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
