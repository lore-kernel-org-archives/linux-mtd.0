Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E177C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CXLUg2zH4FAqXEs9tifa4NC0swPBmlfoU2crqVaA3y0=; b=3NGMh0HdmMooYM
	+YIJyrTl4YRDU/xiHS8/xYPL90G8XVNe7Msu+/dkhL2jRFj0HLbTzTCOkOM2inZcvl6/kOJJSZl0x
	/BPYjSKBY2q+RlJKYwZjBQjO4ZLyRiIRTEjutZKERJfU7BbwmPsjXVESgHpzh9lYEMqfn9J4ZYs78
	cLEyb/fHqEZSpTTghl6gHFZBYkNgfPvthNCxfdYdXo0PEiV7u7/WjYWt/XLn0Tdlne7rRJjlD+an4
	fOaC7wRwuXAsAs3piayls6XWFuTsyKuG/jeKVcXq+mgGti0Jb5nUJ69P8X+p3Gi82Cn/JNwUrt1nr
	GCbwLTQ1BdXBiQM6kWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBZ1-003gog-Q5; Wed, 19 Oct 2022 16:05:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBLH-003Vc9-ED
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 15:50:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id k2so41014286ejr.2
        for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2022 08:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CbpLPynP6HZZac7GMVRYIemOOCm93NrxP2CKMjPOpQo=;
        b=RJoCZ7lMQD9d5/ms8I/7BmlDscAp0Njz072MMZjJ4ouq0hG/OSUIkAiOBn0kxbdKJu
         AdV6whW8OFBUPQL3ol1irtTfpX144WFKqXZXlmA6tfP4f/pZ2EgM6EKxw3lZry8NDpdR
         P2xT/i/B4Zh6F2GCQOGr7UvoMWwVSuNorX1MJA1ivqP+giLkWd6guOC2c4cDI6aYV3O6
         Obf+PJvhH6WED0rY98Mj4Zmn/OP8sTtIIXhdhXiK+YXkLLXpdgobmrpyEzm8phE8ryZq
         lWFnn3WhG7/N+XfJdPrnO7WkG29wrYf3xPzOVz4n5Lp8ThNvpCBS47hRd92OL8jtK1bH
         2KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbpLPynP6HZZac7GMVRYIemOOCm93NrxP2CKMjPOpQo=;
        b=ZUzg7aOYYdYEereW2GX3Omo3Op5IaQSMNveH8FK/dhA07o/PdfINp/dGytAnDXxAb5
         e4LnsXh0Dg++/AGCKNqyosAgXaigMdsnahUEfozfPdeYmfxcex/Bww8rgI4A2L1nXCFE
         o0VEKaGwJ1KRYiL9+LlMJq0Y3bgwc6Qcp+iyaI1FtUp1Z/gbM2zNIFQWH8HXGjLVA48d
         DuauDsQuCAWJVdP47g/ZXhdZrX6ySNrdEg48YN8C6FRvtUA3j5SNdRI8d7TUacwj4KQD
         uQCPjYsXQVCzsL01deoBIvf5BVkkFor4rqYE4l/0gtXMIfKUWHIIemEiT9QVCz/W2zZx
         yGiA==
X-Gm-Message-State: ACrzQf3di9kuSHwDqci862hQ4L9q2ribFYI9oGhlfYfXfwsCvQLdlSDl
	yHHnXjceVpSgHuA1McPFx/E=
X-Google-Smtp-Source: AMsMyM6+FieisbX+9nPc2+AqRdPdP3Bfmn7g0B9M4SJ3iwpR2y7UcsHTE8vy7MXKrok1PItzGlE1fw==
X-Received: by 2002:a17:907:3207:b0:741:3a59:738d with SMTP id xg7-20020a170907320700b007413a59738dmr7340104ejb.110.1666194647624;
        Wed, 19 Oct 2022 08:50:47 -0700 (PDT)
Received: from penguin.lxd (ipbcc2d39a.dynamic.kabel-deutschland.de. [188.194.211.154])
        by smtp.gmail.com with ESMTPSA id ky23-20020a170907779700b0078a86e013c4sm9179691ejc.61.2022.10.19.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 08:50:47 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tokunori Ikegami <ikegami.t@gmail.com>,
	Andreas Oetken <andreas.oetken@siemens-energy.com>,
	Andreas Oetken <ennoerlangen@gmail.com>
Subject: [PATCH] mtd: cfi: add fixups to support MT28FW02GBBA1HPC
Date: Wed, 19 Oct 2022 17:49:24 +0200
Message-Id: <20221019154924.15088-1-ennoerlangen@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_085051_547119_87BAF519 
X-CRM114-Status: GOOD (  15.25  )
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

Apply existing fixups to MT28FW02GBBA1HPC from:
Commit 0a8e98305f63deaf0a799d5cf5532cc83af035d1 ("mtd: cfi_cmdset_0002:
Use chip_ready() for write on S29GL064N")
Commit 0fe3ede7941dfcd6fd540fc2b086453d3ee8f236 ("mtd: cfi: Add early
fixup for S70GL02GS")

Signed-off-by: Andreas Oetken <ennoerlangen@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |  4 +++-
 drivers/mtd/chips/cfi_probe.c       | 15 ++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9bd65f3f805c..4e0bc2a1abb5 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -441,8 +441,10 @@ static void fixup_quirks(struct mtd_info *mtd)
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 
-	if (cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01)
+	if (cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01 ||
+	    cfi->mfr == CFI_MFR_INTEL && cfi->id == 0x227e) /*MT28FW02GBBA1HPC*/
 		cfi->quirks |= CFI_QUIRK_DQ_TRUE_DATA;
+
 }
 
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index cf426956454c..102c1ffb9aad 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -186,9 +186,22 @@ static void fixup_s70gl02gs_chips(struct cfi_private *cfi)
 	pr_warn("Bad S70GL02GS CFI data; adjust to detect 2 chips\n");
 }
 
+
+static void fixup_mt28fw02gbba1hpc_chips(struct cfi_private *cfi)
+{
+	/*
+	 * MT28FW02GBBA1HPC flash reports a single 256 MiB chip, but is really made up
+	 * of two 128 MiB chips with 1024 sectors each.
+	 */
+	cfi->cfiq->DevSize = 27;
+	cfi->cfiq->EraseRegionInfo[0] = 0x20003ff;
+	pr_warn("Bad MT28FW02GBBA1HPC CFI data; adjust to detect 2 chips\n");
+}
+
 static const struct cfi_early_fixup cfi_early_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x4801, fixup_s70gl02gs_chips },
-	{ },
+	{ CFI_MFR_INTEL, 0x227e, fixup_mt28fw02gbba1hpc_chips},
+	{ }
 };
 
 static int __xipram cfi_chip_setup(struct map_info *map,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
