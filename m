Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF9A606A335
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGI3hak+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/FWCe6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4Ce3lVJuoebXx5lv7MPDSDCGZ1i9NFKTveOZJp+BP4o=; b=DGI3hak+lsflEdP32c+AhWaZJ8
	CFGNpNdYxXzg4V3v45P9nnMUMTP0bv0FXnMLdwlrX8W4lA03dwUDJrozU/hSIemo6REUvtFej+joZ
	UklMtLU1pwzjsCnS64eP703SkWl1mgYDGAGoRdrE330cPag5u2MIwvpTEGctRjjlvVZUpcRjHLyyi
	rYku1t0mfFwOTgKTRxc+sgwb35PTcVGvSdNdbqNOS58ZBYh5b8cfApEi3CtsiMFRMFYruzk/T+NZg
	6e+7S6Ymg1pnlSWs5kWn+iYW5sc2p+GYXFWZHog/48+Agi1NAgTmiFkA4bjKgzbpTXk+iBhC/H3Gl
	XMlZuaPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6od-00000007a9T-1IJu;
	Wed, 28 Oct 2026 16:47:55 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM6oa-00000007a8Q-2kN1
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 16:47:54 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-369f3e9e431so944765eec.1
        for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2026 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206071; x=1793810871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
        b=P/FWCe6FbklC6APdC7E299nmwo2OYw4IWL+Yc18meuMNRPlhxCuqtN7twl0pjEbDwn
         5d136lVuoxtO3xzGYMZMkyUNZa9JObl2Bg3hZReq4E604Z0nuOMJAurpfRnWvLtKdrt8
         HSg0iwwrUjNwjuX5FqAxcWn1ZYoGMjxAO1y3x0NVS2SIrkmGrPgRo0LBxxZcEEVFLt81
         AH2qyxbZefZlnuq0FruSg6WRbwvsTljBdvs9LctLrD/7a7BMAh9ZUDSGfeLbwjNzV23h
         QIA6rCMh2BBkV4WmNevcaMAEowiVFxU7k5z84oMf3hix/cJOdexMucO+osJjhAv+txqx
         FPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206071; x=1793810871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
        b=EYUUcUh34LWjT0uBnR07JLvpEZb40lMVwVJZ3n/ftvMHhUm62lUPhOb0O/fjdIwMyC
         V/p2baVYZZVcDK8SBFmjgWGOIS/dg5Zo3nB+QfF9eML4k7JikU/RJOEajHSe7jYISwgG
         gAyTLdMU/nJGYJGxo7QKPtT/SxpkPC/DiMtkeEOFj6kDe7BOMKTu/bxezyRXUCaMwm5q
         8QjltgRxPiX4WOt2EYJden8dWSQ1iQkhzEs6hZRQ6mz6185vko70dlPOAuHeeZAO/zL7
         1KlvO858SGxYR7ZCL7TtJM1gbLryfVeNMqPN6oANLydwXQHcOq8g/EIJdsCFSebEjTD1
         GXtg==
X-Gm-Message-State: AFq9FYKkkiIZ4DiHxUPwDTSpdFu7XFSBfEbcf6ZqHM8/uZaXhuDn1bkA
	wOaV8zfBhaovTDpdmNixhdUHpJTTol0cpsidr1ERqmP3drqB9K1M89nJYXaai3w=
X-Gm-Gg: AYBFou2FeCOlwAZV92JOSBBGyKA3YoRcnzlL2AGvo68NOfKV4JRsXEcC5cpCWDPU/TH
	72J3nzMrtC78wEfEdq13E9FLnujGVLyX6QultJcgaQDpLjWeAiaitw2zKDyZZcrXndUOleRIgX2
	yL2d2758cY8Ez8AfALFhNJlr5+jpq7VjC6h5ZaifafSMet8zLYdIvTQEclzkPCNaBqTsmufB7zj
	rVdOLF1+yvEY0FK6W3wakjoA8Ri7THkMbGN76p9h1YMi32KUbCcWRT/M90mqz1w3KVVqpfAB63w
	cYmeMcp/2SAHWeEiejoGrDAzFFWFRnzwdOWBwqtDCJeCRO6BKP6jvNRSwVvlMwHHJbXhubh9Rcb
	KyOsFopBdQvnb9rtrl7RGQLWfQpa3k75Xgm6hzioPHXfOwXQU8eFPn2O4yw6/pFyHa7/yD5gP0q
	NQ/b6dngG1qemqs5l0/rfV5IPCVK5JXegxWDEcQK+91N5+Lz7s3em2Z5VebTk49oUbsWljxtyZd
	7J3WwresGmG+kJQO398z82WSXk56c34ElTMwGWEp4vxDOH73nFuMa1eb93O0qrqIECwryLnJOjD
	TcB4vQrPPOw4vIAMKI3loP1KWzMsmdd2fGndZsW/YpdwHgis/M6nlgIrHT5/vdhSSUV7
X-Received: by 2002:a05:7301:c009:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a2fd52a75mr120073eec.4.1793206070780;
        Wed, 28 Oct 2026 09:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:7583:67d7:1072:ccc0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm16894099eec.2.2026.10.28.09.47.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 09:47:50 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: hyperbus: rpc-if: fix an OF node reference leak
Date: Thu, 29 Oct 2026 00:47:40 +0800
Message-ID: <rc-review-20261023-ai33-33-fd231771d138@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_094752_692926_459B3BDF 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -1.9 (-)
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

rpcif_hb_probe() gets a child-node reference with of_get_next_child().
The HyperBus core does not consume it, so the driver leaks the
reference on registration failure and remove.

Put the node on registration failure and after unregistering the
HyperBus device on remove. Leave hardware initialization failures on
out_disable_rpm, since no node reference has been acquired there.

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was built from this exact base with the patch applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/hyperbus/rpc-if.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index f448e23f9260f10abe17842849b312365dcd8294..aa69abe6d6bc674bb8cdb531bbadfb7b356e3123 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -145,10 +145,12 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
 	error = hyperbus_register_device(&hyperbus->hbdev);
 	if (error)
-		goto out_disable_rpm;
+		goto out_put_node;
 
 	return 0;
 
+out_put_node:
+	of_node_put(hyperbus->hbdev.np);
 out_disable_rpm:
 	pm_runtime_disable(hyperbus->rpc.dev);
 	return error;
@@ -161,6 +163,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	hyperbus_unregister_device(&hyperbus->hbdev);
 
 	pm_runtime_disable(hyperbus->rpc.dev);
+	of_node_put(hyperbus->hbdev.np);
 }
 
 static const struct platform_device_id rpc_if_hyperflash_id_table[] = {

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
