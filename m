Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6414D606A330
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lDH6rrvJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxTdMhbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=55rpJTrl4nNkyuh5OfpHDXVaPvEsaCvCtDkejAlbHos=; b=lDH6rrvJAqawHOLWrtqHQ+Nbj+
	BBO70mQI2siMegTg4WvwtfPSSvqPQGIWNps8DEZEXUoH4hSAFXL0VX0S4uktiTKfEXkCTHF59/ieF
	vTt50Jh3PYGEC87RL7VmVPyO1svoFBQYUjzL5vZC62vMTFXiL8c5Y15qejRf5EtbPfRwwNTBYsbQi
	ysfDgbBFYSQg5ca2wBfwjnmqkJP41waGZj/nO/ISKhOiVAv+8VB5c9AbkyibX0D4N3+ITlUlL0O93
	gZM2hdXayw79Qx9ngmg5Se6TOnA+T8D5UbHLA9Ps9JXPK7QCyxd3WFp0CUry4CrNFTtgB9PGkQ1X9
	t3ZooUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wg-0000000BzlH-1O96;
	Thu, 19 Nov 2026 13:12:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1wb-0000000Bzj4-0DVm
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 13:12:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15728405e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 05:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093971; x=1795698771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=jxTdMhbbUiHwbzE8VCzLM0zqwPxl2RE49jp5om6K5/lQbWhgfQGbqhnh/QlWx3HMcW
         k+CtaUJmK9UXk0VsDsd14Qa2j3wDwk7Qe6qrwL+2QsBwWgOw3cHuvcML6QS9C5lwImIT
         9GzrVsRo0lBVrGXcE1AXOoohq8oG/2Vgz5ohAudsk4B6fT8Hy1H4N6im58ab1Qr3+iR7
         Pxy+cmY1537jUoD8BK8wSXw2GR1Cg4YIy0J9mvrdhcL1+hHN8VZ8pFLHnVlB48TPK/zc
         N4bckQPV/wsZHsmOFEefT/5Fuu1PSMBpDgWaNDbIhRVG60WcK3pWShPSbdcHUkXx1n3K
         helw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093971; x=1795698771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=VY53rsyGwzGt/tj1X8xeZ//cLI9Qbx23p8SGkbseWsNhb1qkuf8C3dmXG3qw7wYNZd
         Amo0Rm8Xtasw42P5I0rtaAN9ln1nSe8BWUHhpJvN121uYe/hYGMWjNATGS8ZAMrgGa6K
         RXxsxR7GVNkC3nJec5BN+fzlHklA4ksqtKQzoEQT+zw5P+Xd+5lin0C+UHeS1jyrszME
         WPyxoPA1TGaciwhxg8wiyJC+HvqLhNN05F/UmbUHeqetznhIkX+thQrqBXDlGRtyObIr
         C7FE+snpTzFc3Ux2BFVaQLIljWcHOF/AcDkey+/nzZRJpU81BEZecrkfKR8Rg/x3hha1
         iBTQ==
X-Forwarded-Encrypted: i=1; AL+hErEYe83Y/Tpj6TbtIhinlh5scEJCnI9zO6IPUSWBhkrMjUBwYss3p+wVB+tz98HPgnMzXfGNEmhl5+c=@lists.infradead.org
X-Gm-Message-State: APuU4Z+l9d/1YwknyKsqxPajCIDVw9+xDNCLFhsvtznt02UIktlQO5rr
	JK61SVejV9MmoDrG+EJc7ODFm5vnxGo3G/bSnPIC29tIlIyGaLhV6en8
X-Gm-Gg: AYBFou0oUAC5K6ZBSPrOoUJLzXV1tcN/uGdbBSSR2VIQK3Q3LplRoL6Z1YHpgWF6ACB
	liiHgKd4ejpN+DQ3JKPhWrG0TT3mBjk6WwKkvE/SjcMN1mf9k/j5iaxmLZQgG5BFInubAah0Y5v
	Oy8J9aU71e0EQ3ABwAAutJYg73XCfv7+Jgn0yd9Y4ztLuwaXuFkDnBfcy7qDukG+V89As0eecT0
	NfRbb7w5A0quI6Qd+8jJPYzc/yY8nTZymSW3kePulbeCDibMsRLiWgFR6gg7yk6G5TuTtjGjW2g
	kosT6TNzFCKERxhPMUWoN8ULVIqtesp3wqo0UZTArXPyKhIm0IQRwOlhnvczo9p0KgWmNz/vtcD
	5in5QqfoH6KQDoeyLKjI0HAggHAobRrL0kIkiDJeHA0Sea7x8PmGKjnZI1D2+NM+cHywgUel3LK
	OQqWKnxivtqw2xyw+anF7EC90izY2+R84w4a8gCuit/5iCQ0W7teEx+3dxv7Zne3dPlTkummexF
	fQqSVBduxLDHgRmJwxp0dsqTv2g/AB4ob+SyERCFDto+Z3R840LdYsihLlL/eAvCU2xlgFFC9Cy
	UcIN2iLqqe5mXx+UeLnFMUw7KAVdtWqIvwQ=
X-Received: by 2002:a05:600c:3509:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb7d5d66efmr124123865e9.4.1795093970512;
        Thu, 19 Nov 2026 05:12:50 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343645sm38588485e9.5.2026.11.19.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:12:50 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v3 2/3] mtd: rawnand: vf610_nfc: keep a timed-out command from completing the next one
Date: Thu, 19 Nov 2026 14:12:45 +0100
Message-ID: <20261119131246.187406-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119131246.187406-1-mehmet.fide@gmail.com>
References: <20261119131246.187406-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051253_111316_7E9A9B3F 
X-CRM114-Status: GOOD (  18.09  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A command that timed out can still finish later. Its interrupt then
completes cmd_done and leaves NFC_ISR[IDLE] set, so the next command
returns before the controller is done: the completion is already done
or, if only the completion is reinitialized, enabling the idle interrupt
raises it again at once.

On a timeout, disable the idle interrupt and wait for a running handler
to return. Before a command is started, clear the status flags and
reinitialize the completion.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
Applies as is down to 6.6.y. 6.1.y and older differ in the probe context
around platform_get_irq(), I can send a backport for those.

 drivers/mtd/nand/raw/vf610_nfc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index acc9ff282083..547eb1513893 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -154,6 +154,7 @@ struct vf610_nfc {
 	struct device *dev;
 	void __iomem *regs;
 	struct completion cmd_done;
+	int irq;
 	/* Status and ID are in alternate locations. */
 	enum vf610_nfc_variant variant;
 	struct clk *clk;
@@ -291,6 +292,9 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
 
+	vf610_nfc_clear_status(nfc);
+	reinit_completion(&nfc->cmd_done);
+
 	/*
 	 * Barrier is needed after this write. This write need
 	 * to be done before reading the next register the first
@@ -301,8 +305,11 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 	vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_BIT);
 
-	if (!wait_for_completion_timeout(&nfc->cmd_done, timeout))
+	if (!wait_for_completion_timeout(&nfc->cmd_done, timeout)) {
 		dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
+		vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
+		synchronize_irq(nfc->irq);
+	}
 
 	vf610_nfc_clear_status(nfc);
 }
@@ -885,6 +892,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(nfc->regs))
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
