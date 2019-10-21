Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BF1CA9EAE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 02:27:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F258620679
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 02:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nD+//kkZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="Zf2TycnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F258620679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MGxlXNcOccnnWTSfu6lIdEjnN8KcDblPRNMyJS1ZwYI=; b=nD+
	//kkZI8kZ5c6XgpqVFhVRXmFeLGmgDLXcXvDtl/CuOlfYcTIAAkgmoonjLftgCcinSrddqDa6z2XL
	MXwd9VjDgsJYaQOOmBuPTggDVSchhZhmN1QfVi18aYowHlqxa/yx+2oXhCCHhYil4ODGhuZjbCgKu
	K5mpa5bYGetQ5yug0epuaB807e/sb3nsJOMohiUGPyxHwPhmh2TqX9/4hXbrQLzxXRoklx4ImVoOz
	LG18gVawQo14RHyLD5VpJfJbTuCJIxNyem/gAqSRt/CCUoJ60P0eueGAZs9/CSfeVlLV/76laOFq/
	kko/Zjj8GeHWWwywyghezSLFj4ItTng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMNPy-0005uz-K9; Mon, 21 Oct 2019 02:27:34 +0000
Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMNPv-0005uU-Am
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 02:27:33 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id x9L2R0jj001059;
 Mon, 21 Oct 2019 11:27:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x9L2R0jj001059
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1571624821;
 bh=rGwnrypchAXWsBh4eydVJnNqPcxPycvJ1jDHIQCeQ0o=;
 h=From:To:Cc:Subject:Date:From;
 b=Zf2TycnXa0108kxAeWiLD9OPuZMkAuLjw6uVI2yAOpHXf1rdibSWDIv/Dvool7CCK
 67cK30LQB5PydvMv1FC4wotcZRNWHV+awDSDcBb0hFXHk+UeUAtPPFUzlQqZY/iQBC
 2rg8bKR1PIyb5O2teKgsw/jufYS1VVp4QeHsCBT1ij0ltvSGhy/LpS0VYKSG0mHF/2
 3XG+LQUCezSDo+gQK9mHNOu2iDKtVAdB+TlkUtLruDjxHDXjHWv13juuvXqbOVZaKD
 2gExpQQa3k5T0WydTcK8zOYYWqSbdeeG/dfgQcE9yLxdp0TInuH2wDIAAIXIa3yHS1
 qi3XcgxHav1Fg==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: denali: remove the old unified controller/chip
 DT support
Date: Mon, 21 Oct 2019 11:26:54 +0900
Message-Id: <20191021022654.13886-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_192731_709646_7ECF5E85 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit d8e8fd0ebf8b ("mtd: rawnand: denali: decouple controller and
NAND chips") supported the new binding for the separate controller/chip
representation, keeping the backward compatibility.

All the device trees in upstream migrated to the new binding.

Remove the support for the old binding.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/raw/denali_dt.c | 55 +++-----------------------------
 1 file changed, 4 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 5e14836f6bd5..4cce9ae33b8e 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -102,47 +102,6 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 	return denali_chip_init(denali, dchip);
 }
 
-/* Backward compatibility for old platforms */
-static int denali_dt_legacy_chip_init(struct denali_controller *denali)
-{
-	struct denali_chip *dchip;
-	int nsels, i;
-
-	nsels = denali->nbanks;
-
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
-	if (!dchip)
-		return -ENOMEM;
-
-	dchip->nsels = nsels;
-
-	for (i = 0; i < nsels; i++)
-		dchip->sels[i].bank = i;
-
-	nand_set_flash_node(&dchip->chip, denali->dev->of_node);
-
-	return denali_chip_init(denali, dchip);
-}
-
-/*
- * Check the DT binding.
- * The new binding expects chip subnodes in the controller node.
- * So, #address-cells = <1>; #size-cells = <0>; are required.
- * Check the #size-cells to distinguish the binding.
- */
-static bool denali_dt_is_legacy_binding(struct device_node *np)
-{
-	u32 cells;
-	int ret;
-
-	ret = of_property_read_u32(np, "#size-cells", &cells);
-	if (ret)
-		return true;
-
-	return cells != 0;
-}
-
 static int denali_dt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -213,17 +172,11 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_disable_clk_ecc;
 
-	if (denali_dt_is_legacy_binding(dev->of_node)) {
-		ret = denali_dt_legacy_chip_init(denali);
-		if (ret)
+	for_each_child_of_node(dev->of_node, np) {
+		ret = denali_dt_chip_init(denali, np);
+		if (ret) {
+			of_node_put(np);
 			goto out_remove_denali;
-	} else {
-		for_each_child_of_node(dev->of_node, np) {
-			ret = denali_dt_chip_init(denali, np);
-			if (ret) {
-				of_node_put(np);
-				goto out_remove_denali;
-			}
 		}
 	}
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
