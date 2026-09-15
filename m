Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D66C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7kQbJIWZblIbb3yba53dEPxx3n77W60ms+xV75fmFl4=; b=0lnogng9WfA4nF
	F6oXYZDDnyU2LTyxeBa2sgmsrT4TLGBArxIXPUX3MRY7LQg+4mDRK8UQ78I7KeFVS3StAMTrLnSiL
	PHsGangRtABTisfdTkA+F10okhgS749Dbnl8If5MIGWtDLlv0hjh3pUPvE7F8uy3N3e9nV7vDfQYr
	HSPYTDj2bZuxZH+/jX+VGHZVYMhWmERP1G7H+oB+1sEDiodVRoXksRiEzc/6nYxLiyzCbOZreONw/
	gcgPZ59NzV91uEdw77ALaD3B5dd/zAw3BZFFrd95bLzuHe1rg4/CmbASFbFqviZk6BW2S/hJdpMXu
	hJqlkSwPbsEDnd6ChpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6W6t-00000007PuS-0G6P;
	Tue, 15 Sep 2026 16:34:19 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6W6r-00000007Ptf-1skX
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 16:34:18 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e211a3so2693681b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 09:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490056; x=1790094856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5PBkSmo/nkOEVN/SlyuYsHkoJMTZFtCBpXsEWdCJrQ=;
        b=NNFNcAJFh8nGlwMhSLN80SElO5XzGV/GFboOQsRtuD5w06+NaPQVdb7xrtmJt3n4Wq
         7JgP6YAWTEvhe+JSVeFLuFnZUH6Kcp0ULqS/b+uFLyem5sns/Nyw+sFO9857hbMwO6qD
         aFJfVjI/woFEYCOAD5CQKArJRT9zrX/MToo9yyGhMNbsp90VknTz88nB1UuykKT8xt50
         +GYFlTcBV4+jghujk/y39+QaPwkYDJRt72NTNNbzCh7VAydpJaderqDcnj7ApGRx49NA
         5iMrv4Twf0MpwgDJZ5gZnC6ey01WnyaFDSrG7H0zUoskEd9yOtvg7xvbwjww179UASbN
         e6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490056; x=1790094856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5PBkSmo/nkOEVN/SlyuYsHkoJMTZFtCBpXsEWdCJrQ=;
        b=Msb0W6bePAkskcW1wuHo8GKVSbG2/7umO1WarwBTO13ZGC5mZDT4Xjn+AC+C0+o6az
         0UanfkjdlGoMgwK7Ttj3rqdt6af2jc+NQHCshLpd/EwQprSBMrBFkebF1i5sgleHeaHK
         IhxklGFhvy+fU6fiYoM+hlSKANdlAGo5BvDQI3+TC305RsMzmMeHidONaRHHlvfP7ubn
         XAGIFiqJvTtG0u8jVFXeYJpcPyag5JmVLqBlEtqpXMubT/tUUItUm/5v4x6FV/VAfTCU
         ZONcxR0xy0wm16PqHRlT/zd0KXlC7yokoRNfjU4/tQH+C+sL7skswJ/WJh4pm6BxvMQ3
         tDqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuG8HayKucY+Riz159xlZSyEecnlLa7/Cim78KuQnc7+uHDNnxqvPRFcHVQ2uWOUrfmQXXUReMSR4=@lists.infradead.org
X-Gm-Message-State: AFuF++kQZRjE+TXjbCFDYd0NmcXqrCNJuRTxRIjZWXbflxy8GwnoY5gT
	WWMlWV1klSBKUqoyPyt7n4gGZZgRJlzLwFJFmpWqmPTCseDke7nia7Op5H5eTCqQ
X-Gm-Gg: AYBFou39u0ahJPMENpLGil1nkWwM4AO3U5ihi36ofvrVeMwrTnoY9Rxqz22Th1/STaX
	uMwX1hRbXlzJKf25Yj3ulkoZAf8CkjhHQIOu2dhC3FgEmKwWWM0Guxn/NPcvrWPD8oYsH5a6sWF
	m7K5eN44CTxrihzMtamoTXlNTyQx7BwJOz98y0fQGrF6wO7VWul1cQyf3i4DvqZlxzNCteJ8g53
	EN8OFsTWOYjXkLfnW/61H6q+OsCACMU37zrSeWdkmbrqovm0001HNK/p6Y0US3mdDEDy+2T3Vpg
	vNtFCIcDFKJYULQkmAutnKu7io5cR8w6ZsIXCixfeW0jRuJc7KQVpWalSi6dqtOLrPlB979kL/F
	aSJO5gpaRf5u3fl5Gyixq90Qn67MurdV1C1qmp326xPe1jqikfcpsirfq07UX05rvKqT1zDh/zo
	OUyPdaakS99mVMP7v5LLosX/eDjLbIzELRDuMcn702cmj0nMUjpWxsZg==
X-Received: by 2002:a05:6a00:1414:b0:868:ce97:b9f4 with SMTP id d2e1a72fcca58-86f831509aamr15268715b3a.5.1789490056334;
        Tue, 15 Sep 2026 09:34:16 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c4e5esm6888113b3a.19.2026.09.15.09.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:34:15 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: intel: fix OF node reference leak
Date: Wed, 16 Sep 2026 00:34:07 +0800
Message-ID: <20260915163407.2487869-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_093417_493764_9F650208 
X-CRM114-Status: GOOD (  13.02  )
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

ebu_nand_probe() gets a reference to the NAND chip node with
of_get_next_child(). The probe failure paths release the reference with
of_node_put(), but the successful probe path keeps it for the lifetime
of the device and ebu_nand_remove() never drops it.

As a result, each bind/unbind cycle leaks a reference to the NAND chip
device node.

Drop the reference in ebu_nand_remove() after the NAND teardown using
the flash node stored in the NAND chip.

This issue was found by manual code inspection.

Fixes: bfc618fcc3f1 ("mtd: rawnand: intel: Read the chip-select line from the correct OF node")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 01cefdaf115d..9f3e3a6cec71 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -711,6 +711,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 static void ebu_nand_remove(struct platform_device *pdev)
 {
 	struct ebu_nand_controller *ebu_host = platform_get_drvdata(pdev);
+	struct device_node *chip_np = nand_get_flash_node(&ebu_host->chip);
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
@@ -718,6 +719,7 @@ static void ebu_nand_remove(struct platform_device *pdev)
 	nand_cleanup(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	of_node_put(chip_np);
 }
 
 static const struct of_device_id ebu_nand_match[] = {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
