Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061C606A31E
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BZqtk1DP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9ZWrM52
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=x+6BLk15s+VC/x4XSbcSl/xKc07eTiK05lquaHV/v2k=; b=BZqtk1DPEDlWQd83ZZtY7F4+py
	KqHYuEMR345FNza1dF/HSWAuMp0suehZCrQsE3brw1Sw5/drLD4Pc1HQhOFr4Ml2roG4gcoVJDNOW
	l7CzBWXMb3mJgQ1irTLGDjL6/+h0zx+Ds88umKPZeeHsdrpp/ioJ67g9ivptWC/Qi6clPvufYZ5/0
	9fyHfvdx+IRo9AsQnVLteXJKph4jSIzTn8D2kWmbCLB7C3zOwEesNHdBryHhlwCekbqTbytHErEcl
	LGytwrKa8WVo5DF4trPNxueO9QBVp45QWUiYJSbOwaycE5+t4uNn+PF5q2aD9hJlUoOFBZrFpMUC/
	3b4ioxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUb0-0000000A3jO-2Z5O;
	Thu, 29 Oct 2026 18:11:26 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUay-0000000A3in-1vqn
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 18:11:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1400223b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297482; x=1793902282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
        b=t9ZWrM52tiLKhR2eNvyjq2X1s7HPgpzOWQYmm3kx0I3p03/Y4OD/+uGN97CZCMZig+
         Ab/wi/Lvn0oySkSlHd0bEbVATQsb6RZ7M9ek9r6OWHH9HyVma7ufC7sBFsHcWBLualr6
         fvefPrMGHeT48I+XGwW3nTGDxNkabVrqZ6XVgwTP4AxfiOvjfOKYRWPELzGyGLj6iO2+
         q3WV96wTqliVD4DdqiL89dLO036MV5YOdfPZywnKAeuZGXrcxawG4y+gwmQrHfO4ui/+
         u+jE/m5DB1zWLtvNA0tgENJKOLGlZILfhYixifZYPX4yM35OZQ/+6Ms6WcVv079EN0Nr
         4+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297482; x=1793902282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z2btZkpJ+TluBaKBtaVuSDSAiYPrkTDeeGPI5tssnY=;
        b=mpJHsjQ9lR6qZ1JCHqQ8CIf4xqAFJzS7g7OwreSpt564BwzCwbUgOQdUP7RUo2hLgK
         QLYDanNLo3f9UtRfl3U7ZvPdXwrmSQdKipOa1+3/GpsxoaDjYhYIJIjuISD6p/uQzA1g
         V1SrsXAQV8SqRWeCminqKTCiZQ7DM1FN2r7lIspFkDUvGK5/YrcXTK5Tmr+DPcpvqimc
         ajf47NyztpYkvMkKgAK0MT97/yHdmrQuz5eR6q2AEswyr17TEO7KCcpSGoDPnxVfrhF8
         +TtRZlZf1hLGrBnPk8YiH4cBhzEsnV9hN0MHrOO4eNMRhsj3K2u3d2dNEBKS7GxtdMi7
         CooA==
X-Gm-Message-State: AFq9FYJC+eBa6XrKS6vIsgB46xpMh5FN1hED9RY1A5E8B4UlNtz42cHa
	PI/LnpvM/Fic1oQoxERS3J7hBGk/k4X8cVBqtQCB8mh0CjPgVVjIR1cpELLS56Y=
X-Gm-Gg: AYBFou1YUXCwraSWHUj55xzrG4oqf45WE6aXUxJ27kJMG5xrvXuq3SESWvmx+AZ2TPC
	aTarrN1GuNgrRt1oqtrlmb4cJBgO7UMKFKLhXVOWotIt+F42o888cb0KMnr05Bb+UyuUnPKn9NZ
	EZEp3kLNcXpEQ/zjqLb3ZdEKwCRNPNOKWk0kas931utlZrCoguzgJhMZ4qi5zk/8KC8ikCN5sVj
	z1RY6gyxHodaF4BDLUwAxMrWHluuGxUIsKmCs9WNaAfExpbUuAJnFMVXWxoSSXeeDt6rQ7YGjem
	dEZvyN9yg717hjKYkvA80/matADB61GYTrppMiSP45Iz0lDVHlk4ZxLuK3Ldve91qgQzvwSwBec
	zjJAY/uK6H7w3X0UnaGJeVO5TcQ/aHLs5xZ/yjmj4rdD32m37Y/hzv+KR9r7UdKtDJCXj9r/9W+
	QUlCxAlR9gjvX+T0490dZZCD6XKoVbRdGaF3Hd4z2a1SV4/dKFVRPCYyN7reNVZDoegn/2RIMo+
	Js5SNLA+LWehGAbA7uxYZ+gF5WzLw2TTnW017U7Pu9qm3CJ8dwB88h7/jYr+YCcUC4xwfukoPdp
	t3Yr7iFqsA99mouSY9ZLToJlkv2RqQ04BHOLz4JSSGrU08Uwfl1c0QOSdMHemy/ZI5Wn
X-Received: by 2002:a05:6a00:22d3:b0:8a0:7573:4f20 with SMTP id d2e1a72fcca58-8a6e471283cmr5172733b3a.4.1793297482533;
        Thu, 29 Oct 2026 11:11:22 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:61c8:985e:fbe6:4d1e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98643466esm200114b3a.2.2026.10.29.11.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 11:11:21 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] mtd: hyperbus: rpc-if: fix an OF node reference leak
Date: Fri, 30 Oct 2026 02:11:13 +0800
Message-ID: <20261029181114.78137-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_111124_519690_DC2A1723 
X-CRM114-Status: GOOD (  13.91  )
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
Changes in v2:
- Move of_node_put() before pm_runtime_disable() in the remove path
  to match the probe error path, as suggested by Miquel Raynal.

v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/rc-review-20261023-ai33-33-fd231771d138@gmail.com/

Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
CONFIG_COMPILE_TEST=y.
The object was rebuilt from this exact base with v2 applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/hyperbus/rpc-if.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index f448e23f9260f10abe17842849b312365dcd8294..ffa6578b5d399d19d3cac27d7769cccfceb0be92 100644
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
@@ -159,6 +161,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	struct rpcif_hyperbus *hyperbus = platform_get_drvdata(pdev);
 
 	hyperbus_unregister_device(&hyperbus->hbdev);
+	of_node_put(hyperbus->hbdev.np);
 
 	pm_runtime_disable(hyperbus->rpc.dev);
 }

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
