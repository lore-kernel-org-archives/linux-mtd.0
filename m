Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D96606A33E
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rOxV4TXG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MoK14Zw3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=55rpJTrl4nNkyuh5OfpHDXVaPvEsaCvCtDkejAlbHos=; b=rOxV4TXGhNhK6iegoSnA1CTplh
	cqSjhjSsegrnws7OaPbfDdBcz1SKkcyuktRn3YrCE6pxX2vDJEv6ui66AnVE9+iTeNmkBQWypqfjL
	X20PZsZzGH0LT+adUt0b6hoXGKNuKOcxxcrIQ6/Ae/dqogjMWHVGyZ0/kbGjgO8PBDRUXm6eE6X/Z
	lXW/yUjOYlsTeiWjyouvA3kot6RA+u1ICfZCH8w4MVRiIK/XhA8hpJKcFsNw00WknH2mPxHfA/cPu
	sNXtmKfvwFtkel+kUaxcNotP9050oYkju5A40OkpuY+3jrsf4rkDfcn/rJiJyLJ3TdA/QOxLRqA9p
	wrtlqcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIt-0000000Gf6O-3Kqm;
	Sat, 14 Nov 2026 19:20:47 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIm-0000000Gf4e-3V9i
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 19:20:43 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-91ef011e338so33062246d6.1
        for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2026 11:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684039; x=1795288839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=MoK14Zw3+UYd2/WoBkFmA99zrQaLPiBe5lWwbIXnDEO4yykN7xvMLDO9BpGBbC2smk
         0GSa2jZLlqC2A0FqyM2BZyEyhYQgq1loJk+uEcj5WLEAtWGp2vO7/L5cKAvUtf+qd6WW
         uVdMf4FbVSOHxAmLFOoDpZyvqAIQzYdj3W/Dk4bj11GQscPXkYn8BuyNjrWP05EMEYq1
         CG6jMqrqX5HgWwwPF/rk++rbJAt+cOzFixi2Y3LHQtXJnTUJ5c2o3sA6YI7/a4XEOZ8Z
         bw2CNeoEizfqwTy8rLLKnA9vxKHpPoTPPfUqrJqQHJmVhGh4RXjYvUSZAlygG8YtYMlT
         cR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684039; x=1795288839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=KND0Axm/txL61rOaqcPBnpUm/OVpGbtIcwlEEAgBFgWhVez5G/PZMRisTiB1ucTqWh
         Qu/6kpJKtcpzhM97FivQZoLvmuTuBrcGUkrD9af4ouaWmNtKOVzMqUGTZY8Y/oGPelTT
         Jsp4DXJQLd/GR3mEoHaDHNQ63PQf6b87YXjopKArBOSw9RMAcGRdQ655O3xDt9GeGKjU
         uwo6cSZHziwuZzqBeMdFQZY4FgddL1pyBfLkPwhvU+6Tz1h3Mfv468PU2ORdyA6Wn0b6
         GPWlHXIPiIdGX0mC6LJwAco/LPPQZHTvtEJ4CdSccjxSV8Nqw7J4jfDT6hEIfqFDvu/Q
         D24A==
X-Forwarded-Encrypted: i=1; AL+hErH1RKwJeJz49Zzx+ZAhhvKzWe7pttg2Gf6uB92/23LnhKhRZ6EUbNLukOhCdny2OuKV+jhYt81UeTI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ro1QfntGWqrWPllhK/NwhVwUkZV+VH61MmUKDFxBpg6k4HqXF
	COzkzd+bM2Uyaxqr0XB/GPE2hAFg2701Y9PS7DN+aFH5mhr0+V/QScFu
X-Gm-Gg: AYBFou3YtLx+Sre2HdBTIUQ/kKYhJjBVpscheil3Brk9CI693oGU2Psw7AVALSt30T4
	dpwriz4Ac2rzop/U1MdURVBa1m5H0r7iYU+gcjPariPB3oF6Hs4k4Pfy86VfTu4HKc2h4W62oGH
	vUdA1KCldqFA+utjbsBNv5O/fWqLXXgEeR0veNAy6+eBB744oCPIG50P1n3S5m0/u9ZyENjtk1O
	kleLK2O1AjDJVZfmZdtAf8DYUWMwL8LgQlqXoKiWHREIqnNte6LkR5g6VxaqKuMmFIaoNe+ZWV3
	QdejANuSC1+GtKahLLH6qhyJrWnZRpkxrUaIMtJOpIJT7wYEUfm1W4YMKtlRd6p82+l8NKv2uvO
	Yoc3Kk1Nti2HhGw2sW+02SL4W8SCdjcI3qAdgD41fiBrAHIH5hpP8XAJUEYmLFvFoXtVvWs84ea
	b7RBuTnd8BbVfqFVSTmqD9Pw3nAqxDeHmkBFoe6rsYfybq91lK5xDOi7xSGRbSMbnsO6RlCaYUe
	RL2af71h/x5Al/0vtG6buabbiGoDk9/FNuc/+6ISLyxtwwF2KTZFOzATsp4oQkIPRb7CtDIEbsj
	dfUm40+brySTrDLOCzTNAqN2XNvnYWi6jgM=
X-Received: by 2002:a05:6214:23cd:b0:91c:62c0:9875 with SMTP id 6a1803df08f44-91f24193e5cmr101226126d6.19.1794684039539;
        Sat, 14 Nov 2026 11:20:39 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:39 -0800 (PST)
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
Subject: [PATCH v2 2/3] mtd: rawnand: vf610_nfc: keep a timed-out command from completing the next one
Date: Sat, 14 Nov 2026 20:20:30 +0100
Message-ID: <20261114192031.959376-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-1-mehmet.fide@gmail.com>
References: <20261114192031.959376-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_112042_434286_9CA3B2DE 
X-CRM114-Status: GOOD (  17.01  )
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
