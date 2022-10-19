Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8054C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y4sekQazDF0hAuoMgc5SjGaB5/YDf4tdiGfwSVKl3yM=; b=pS7/zoKjyAsu0M
	Ad9qpALNYlBYP62bu3l7c7cvKKYwlKkQ79LmgJ1qJNB21dTApXtdV07q71PunfMCVNggayyq7/4yU
	MiQDFlCrteWJaBGagINrwJMv8QMMm0pHGTH0vtFepp00Lnq656A6bvTanmyANMirGB4ifMUOPLTEy
	w+puWt0uOJ8kci8k8qoajUkU6oPyWHrFJUIBmJzaiKcKq/6HkMG51O/7P0DTwKTSv7wTws10t6TdJ
	0VwKA/qRTdos2/jYJKaVnXa4OJtavZ3Zn8o/5XG8aNhJI7SJrxP3YfB51b4DAWuJZ9SE8t3iR5KDf
	fAp0vkJVyD7bw90lJz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9Tx-002JgX-Cs; Wed, 19 Oct 2022 13:51:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9Tt-002Jcx-FR
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 13:51:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id fy4so40071138ejc.5
        for <linux-mtd@lists.infradead.org>; Wed, 19 Oct 2022 06:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V5rsWxy6mxVNpBtppEhN4ngzoP+zKtBp3obxI/sO/xI=;
        b=Vfc+IjHUyS4nvwiOZQgyEjgKXAxlBtBeALnDH/1IELk3Dt2TDuR6D8cWFppdFc4jkQ
         UcTy17Lw4l8XQWpGQQbJL0KJRLeS8F5U8vH9vPO//5GXjZKDojoNr1epJptZ79PUKHeB
         FVh4EIy8oWnFlqK5NUyp0jUYxZpElE+zzhMUYVDeSZxNFKjKjHawnOMBAik3Hqj7UNgc
         IxaisjcYf+BQsxPdXjqlvcfisehsHGqNZvTKopLpQg+DFbwKJ4a15LFYuUdiqUHd6IHM
         /LHHioKWmnmhoW1KMuTy/scYtV4Go/FQqeFwU4wwuDzR/eVcZuaiNObdqKczSojw6bFx
         8QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5rsWxy6mxVNpBtppEhN4ngzoP+zKtBp3obxI/sO/xI=;
        b=n4yll/wGos4+NhAPPiQqep+2R2RX5IuUIYxjuro1N/WyOrETwspDvxo9ve/FsQzr/V
         xvESSydWEtYi0DQIHvQZDE+U5AoDTLs1uitLUIAV5AF29JGe0zQjo+fnlwcawecS8JSG
         6MuXa7kq5GCSojNzm1uxsb5dzp025A5pOF0Itb+Uxhd0XrkIW81D+dUEzbhQDxpJgy6Y
         7cIGrjfMXRQZJCfRndeoe9U/UFTA8ML9+9cTf7cc71cwTCTAlsaO9hzv+w0v76R3cNny
         R8nQ1kHTy5oNF9wGja2RZnkv2nF8/ilVY+kMAiCq8kQD9FB509eKhOjXIuiosaMm5GaZ
         Nf4w==
X-Gm-Message-State: ACrzQf06xDiSvcY5pFsBSz6zNlLQaQ9h+KBojtYAFZgox9OGKSiX+I92
	DIKnJ0z6wH81I2bEd/9C8SQ=
X-Google-Smtp-Source: AMsMyM7S3bJl7cMHe70p6z/YrGTReD4ksaCZBNKJa6xLymsRgAAgUnALNVlxBPC2tfbm/lmNFWhG+g==
X-Received: by 2002:a17:906:5dae:b0:78e:302f:4218 with SMTP id n14-20020a1709065dae00b0078e302f4218mr7203504ejv.22.1666187493084;
        Wed, 19 Oct 2022 06:51:33 -0700 (PDT)
Received: from penguin.lxd (ipbcc2d39a.dynamic.kabel-deutschland.de. [188.194.211.154])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709067e4500b0078a83220609sm9161299ejr.13.2022.10.19.06.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 06:51:32 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Cc: Andreas Oetken <andreas.oetken@siemens-energy.com>,
	Andreas Oetken <ennoerlangen@gmail.com>
Subject: [PATCH] mtd: devices: add fixups to support MT28FW02GBBA1HPC
Date: Wed, 19 Oct 2022 15:50:07 +0200
Message-Id: <20221019135007.15932-1-ennoerlangen@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_065137_529871_0BC48DCA 
X-CRM114-Status: GOOD (  14.77  )
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

Apply existing fixups for MT28FW02GBBA1HPC from:
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
