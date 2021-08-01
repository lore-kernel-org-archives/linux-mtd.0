Return-Path: <SRS0=6coP=MY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6122FC4338F
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 21:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29B2060200
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 21:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29B2060200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=molokov.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ff9zTl56KZ5mRABEi0qXJRLPsijW56ZGmvu+YAAuirI=; b=l1QEm7/R+wLsJx
	OkmwFOgGCUn4F+/uiEoXNDKdfFcc3F62hTq5LNaNxpfQ56d8BRVQdqj9SsUGBgxsHrcLHFtsrqZyQ
	Q7tf9jk6Mv7q4WTPMfDumimECq71DzoO5yUbFsLvuLWQ6ZlBqK1cWh+dNr0kwEO+Q799etBtQrSOF
	WmGBerALmelPmZCqSPuMINtKduMrcsKy757AWTENuj67Tyi6bCGpBsS46PT2gsy5K4+8r/vqKzYFX
	UHLJmld8Mp1iplr2QZdRUqTfOrfHejhA4m/Gfch2I6XQLEoFdcbkhm5bxDLN/KbNrhgNfE4Fct7wM
	yerRwGKiHgKc1BRFwkDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAIYR-00EDi5-7q; Sun, 01 Aug 2021 20:59:27 +0000
Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com ([46.30.212.3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAIYM-00EDhc-Om
 for linux-mtd@lists.infradead.org; Sun, 01 Aug 2021 20:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molokov.se; s=20191106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=zntIZiN1aWgyuEnfqIjr7MYyW7c6ejK8ECXmADTsz00=;
 b=T1PNww8YM07g8pMiDKHyascz8p6OPwU7N2rOOzlyDnIp/r3aJwJqR0OgkVc1L2NT6wO6eDbv0KQTC
 vwCo3eIXNz9pju/5gFAG5xgX2bzfcofLuqtROlfrQmoE8nVC5rWa62VlKArWoXEHygzImrGuTykhpr
 fLFSApNzOQxRhoEq+lAeTQUB5v6v7XKoD2f2jpJ3hMKEFWmzZSF/hZcNaMKKp02/Qxc8fukhlqij8i
 sFVb5tcdOrb+JNgug0opLPACfaSdOlGadlYNDyrZXSwKWXDMGB++15FqaLKaEp/ZRp/DKQlJm/Mzsa
 VSJHP03zgPknXCdJkGwZj9FGUgqx5jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molokov.se; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=zntIZiN1aWgyuEnfqIjr7MYyW7c6ejK8ECXmADTsz00=;
 b=pLgXwJa1qZYKXbsA4UjcrgGtohomhSkf8sUpPpsmP7/fu5qRQ1ymSLYLroUO3poLNYrqnZezrKP5K
 otMBF0MXJj4muujlx6l+M2zVuDlooeh9jG9dBJhx64OInSco+Ej465XE/lbAx+P0E7Lbet7in1PAcA
 s4qMAN4YcvN3ucX4gzcQowER9IN2FOYKazMnXlmMx1XKc9znwqxSpyLEC9gWM66rz8n2571E+QPw3P
 9OoOxcxlFQl+sPQzfDBEYdTZ/BHk2JCoKmitjKZeFernNLIuIEno4bXsvlPyKftQsPMNUnbPshSMgO
 hLf0HeXaUquPRu3/LhK9PUAyDBxU/Pg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=molokov.se; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=zntIZiN1aWgyuEnfqIjr7MYyW7c6ejK8ECXmADTsz00=;
 b=+cGQJwUIbnzTcHFARMMn5t9frX6SS5MCuM+u9kwFv5Ecap0eurexzpBBFKMAYTJJrzBd3cAP9zHEC
 qMSMvSABQ==
X-HalOne-Cookie: eba7e3c5350ff2da19df97c12572ff71bbaff9ff
X-HalOne-ID: 5100aec7-f30b-11eb-adf9-d0431ea8bb10
Received: from hence.mlkv (h-81-170-175-32.a980.corp.bahnhof.se
 [81.170.175.32])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 5100aec7-f30b-11eb-adf9-d0431ea8bb10;
 Sun, 01 Aug 2021 20:59:19 +0000 (UTC)
From: Vladimir Molokov <vladimir@molokov.se>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: omap: Fix kernel doc warning on 'calcuate' typo
Date: Sun,  1 Aug 2021 22:59:09 +0200
Message-Id: <20210801205909.7102-1-vladimir@molokov.se>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_135924_234516_2A9A8085 
X-CRM114-Status: UNSURE (   9.73  )
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

Fix a trivial typo which is reported after enabling W=1 level of warnings:

  drivers/mtd/nand/raw/omap2.c:927: warning: expecting prototype
    for omap_calcuate_ecc(). Prototype was for omap_calculate_ecc() instead

Signed-off-by: Vladimir Molokov <vladimir@molokov.se>
---
 drivers/mtd/nand/raw/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index b1839eef5b65..b26d4947af02 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -911,7 +911,7 @@ static int omap_correct_data(struct nand_chip *chip, u_char *dat,
 }
 
 /**
- * omap_calcuate_ecc - Generate non-inverted ECC bytes.
+ * omap_calculate_ecc - Generate non-inverted ECC bytes.
  * @chip: NAND chip object
  * @dat: The pointer to data on which ecc is computed
  * @ecc_code: The ecc_code buffer
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
