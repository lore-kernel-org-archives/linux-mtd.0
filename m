Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A53606A334
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 02:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bvFr1rcY;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CZMCxM5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M4hkupKcB6vRm9hNS6wbG2myuU8L2WSoPM0Kqyb4S5A=; b=bvFr1rcYnRW+cxX7p10YIt6Uu8
	9aYZEg4DFHlgDvpVqPFCO3h62qLBXdu1LTft1iWlhOd2fxh1YLQr0urJhnrhzp1vqaqr7fos60RFP
	LyK94klrG7by6FvnoIKowQ+QZvkp5uTO7UxzJzTp0BX96skp1lglXBrXyAA3MWzhYhe9++kyE8LQO
	K6YOXnug7Ufd1imMDyqZKIuAIXhKLLJWle9R9WyJAditwJnqa4iJnO4PnZoEHmU5QbSpgV5d1jIYy
	JZwAXY+g4BQUEos3PiWNFbE4Rrc0KC6oR3FgPFyGnRzT8Xt977jqBw7+TCmOjMVRIpmeK94EeSVfZ
	HSNBeNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVAT-00000007W5y-15AW;
	Wed, 18 Nov 2026 02:13:01 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVAP-00000007W5K-0CNw
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 02:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CZMCxM5yzAbpEyndOO+lsm/wltU2YIuSyeuxtGDIGTNGioRN2zbdnysGgmxiHshKG9ayboxuRK2/J
	 h0sGiRY94EsfuhFvY8AutxCMP8dP4fgh+k3hPOpNmkXu9sSJwQuvFmxSUSHc4qSq9IoyJPFrGSiWCB
	 I6k4qJC5FA8PHd7s=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76afd09a33ff-0f2c0;
	Wed, 18 Nov 2026 10:12:52 +0800 (CST)
X-RM-TRANSID: 2ee76afd09a33ff-0f2c0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afd09a1cf7-c534c;
	Wed, 18 Nov 2026 10:12:52 +0800 (CST)
X-RM-TRANSID: 2ee66afd09a1cf7-c534c
From: zhaofeng2@cmss.chinamobile.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 2/2] mtd: rawnand: arasan: drop manual GPIO CS release
Date: Wed, 18 Nov 2026 10:12:47 +0800
Message-ID: <20261118021248.1952-2-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261118021248.1952-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
 <20261118021248.1952-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_181257_674695_0FC32BFD 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

With rawnand_dt_parse_gpio_cs() acquiring the CS GPIO descriptors
through devm_gpiod_get_index_optional(), the descriptors are owned and
released by the device-managed framework on probe failure and at
anfc_remove() time.  The manual gpiod_put() loop in anfc_remove() is
therefore redundant, and would double-release the descriptors once the
core helper is switched to devres.

Drop the manual loop.

v2: respun together with the core devres change (1/2).

Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current upstream master.  Not runtime-tested (no
Arasan hardware).

 drivers/mtd/nand/raw/arasan-nand-controller.c | 9 +------
 1 file changed, 2 deletions(-)

--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1478,14 +1478,7 @@
 
 static void anfc_remove(struct platform_device *pdev)
 {
-	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
-
-	for (i = 0; i < nfc->ncs; i++) {
-		if (nfc->cs_array[i]) {
-			gpiod_put(nfc->cs_array[i]);
-		}
-	}
 
 	anfc_chips_cleanup(nfc);
 }



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
