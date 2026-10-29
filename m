Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73686606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iKGreBLQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxQWoxUP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OSf7brhzUTqI/VsAbUF70qw4LcjPM42O9X0urlPr1xY=; b=iKGreBLQBkJElWZRebMkDEGI2a
	XkARxQzLF4bIoSpW3u40ZnmGFwQ4FCfzJQg7lxcGf8kmCPJnyPEYikIyWfJvueYnZXaQstE+hP01j
	mEE3wvi2da4nvOexzGmLh1hGY9NRO1cJlgJR74vKTGeG01ZOCg9W1IKpJVAIOl7j7BFubMTCDmyTQ
	5lfm+ZHorhkENA/if7B7A55m08wtpaDzbTL7EKfzTrID0aR+xIRccKwWBHKt+TKEUrqT1GO9p5+2Z
	eeNzmoWOnja3hVzCVaw4K6fEM0GNV00nBvB5BbhT3WEcZwdYCEOiZPMHJEunUxGscs6SNHQaHFML+
	doM+1kOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOrR-00000009700-1UTE;
	Thu, 29 Oct 2026 12:04:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOrO-000000096yu-45pa
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 12:04:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8a089dfee18so377929b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2026 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275437; x=1793880237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R99c13rJmmVI5HHtTBBCwH1hsxjSn5bH0+cO75Pba6I=;
        b=jxQWoxUPfYRY9NoQ3g5egzNgpdmxdcq1Mz1P7RDcVlTO5Erkef+0km06xjsnQDokHy
         R8MbajU41SOIh1zktm3KmeMvcUpI508mt/IO9bgGNIr4j5HNOfLxlVGqqBB6OrqNYqQS
         beESrQ5UjISV4tCFmeiPXEkgdsJnv3y04O1C8Rj7rLVLQ9ICxyk/6s3ej/9pzkWl1fY7
         Xi6NLlxX7tpMUhCL9wPySgnWT3EsyACH5Syvz2JsJ/J7H68tZXv33kZHZViyAlgZ9/yv
         b21AKEwx7oHU+KZDAP/51ng+cecRmRJCNdBS1V9Npyk4B31/vh6We1kI4J8yIL5ReQ3a
         /mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275437; x=1793880237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R99c13rJmmVI5HHtTBBCwH1hsxjSn5bH0+cO75Pba6I=;
        b=CsRj3bjQCV+ImZpljn0LET29MSdkP3hzPUEX7+nAEGy6yDSj9xtqkU/w4d/N7TIPlK
         PIpV/0PrK4lC7RTEde17Fbd8eCi1lWE1uhYP30xyXyCqt/o9tp30KLFRacR6tkdG+MD0
         5eo7LdphVOf9HOxTueu/Vzcy4tTQO8NhUQmYaJVN2i7CTy7OFJ17EiTJeXY+sxHGtlAg
         l4GRE2VHgcURpmGW1LuFiIkKMbuLqDzucKbtoIRSRu1Gh8s29cEn1HtSDINKGyWDwbKc
         ANUOPWYXr+j/iFxPvYUXa0gY5P4f4N1Xd3/hPBRog85/KRV3GxJeYXmH9MmHOMTvx3iJ
         SeHA==
X-Gm-Message-State: AFq9FYLJDZG3qShhSvUKSU+6qaZNckuxYc998dbRO2qbdBuI+0wuNvmC
	rISWNlCOQPiaAESGyYHAeo2nmnPMPXj9H++rE9AmjKjg5lslCaL/yICLea6C6qA=
X-Gm-Gg: AYBFou3t7E/QQoNMjFMYgoUcQth663rd8rxsgC7RpJyliqfOZHjm/1OEsgkIpA8GeYI
	GGXRnxQVwO3GiNr47Wz9M3LILQZzCc9dWlHxBlMeNSBCo6bnqR+JLOXXPfTJbd5rxE+57P/7J5Z
	uCj3aJO9ok9Fq6PD/Yril0b/5/VOkRGaoqf7fI1UlTfNwJqFahuvVUeU66er4gsTmiwul+Ne7sC
	A9rNuMWwWKy4WvlMV1Q6PNJruNS3rtyhc6hQ/G6hh1xBERfT0m3pYzOigac3uVBntblK+mLs0ve
	udGLlCy9dIsHluu4VdVwoJh0frB/pE0elRHrZANUpa7YS8U+TAK5J6De2B2kVHdCZmY7IJY6Jx1
	xjpYevV2/vIkvfFPQdZhc5YDZ/Ul30UPBmQdm77E26X1qQwWMJiivo91bIjushos1G3NCEqT5mK
	xy0eyBpn1HPLZdGIvHn8a9ZpkPYyJiTyuNjoPdGyCCwOZF24El4pzIu7DHd8lPouiB0cYKbE5Q8
	uxAX+t/fg6fCZN+SSTldWoXy5UEt6PXxgCzVSwACXDK+UWLPPqV09AlVn3mtVbQevyvz2oYrKYK
	x8JJaraMpjGtHE3Lt9d2PQb2BDEsdR/4FgkVmqx4ObQbCmO2vRz2MCT9gjv3f7BUJexv
X-Received: by 2002:a05:6a20:3c8e:b0:3e5:5ba7:2e7e with SMTP id adf61e73a8af0-3e913da5fdfmr1811507637.51.1793275437374;
        Thu, 29 Oct 2026 05:03:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:7583:67d7:1072:ccc0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccbaaa9sm5188758a12.23.2026.10.29.05.03.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 05:03:56 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] mtd: rawnand: omap2: release the ELM device node reference
Date: Thu, 29 Oct 2026 20:03:47 +0800
Message-ID: <rc-review-20261029-ai12-12-5b57d6320701@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_050359_014080_FA437150 
X-CRM114-Status: GOOD (  11.93  )
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

omap_get_dt_info() acquires an ELM node reference through ti,elm-id
or the legacy elm_id phandle, but never releases it. The existing
put_device(info->elm_dev) releases a separate device reference.

Register a managed of_node_put() action immediately after parsing the
phandle. This releases the node on later parsing and probe failures
and after NAND cleanup on unbind. If action registration fails,
devm_add_action_or_reset() releases the reference immediately.

Fixes: c9711ec5250b ("mtd: nand: omap: Clean up device tree support")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was built from this exact base with the patch applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/nand/raw/omap2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4fa89aee934ebed9d04dd37e441243b6779af042..25414390af6174bc5f5e4b6b6c4fe516ac646cb8 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1669,6 +1669,11 @@ static const char * const nand_xfer_types[] = {
 	[NAND_OMAP_PREFETCH_IRQ] = "prefetch-irq",
 };
 
+static void omap_put_elm_node(void *data)
+{
+	of_node_put(data);
+}
+
 static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
 {
 	struct device_node *child = dev->of_node;
@@ -1691,6 +1696,10 @@ static int omap_get_dt_info(struct device *dev, struct omap_nand_info *info)
 			dev_dbg(dev, "ti,elm-id not in DT\n");
 	}
 
+	i = devm_add_action_or_reset(dev, omap_put_elm_node, info->elm_of_node);
+	if (i)
+		return i;
+
 	/* select ecc-scheme for NAND */
 	if (of_property_read_string(child, "ti,nand-ecc-opt", &s)) {
 		dev_err(dev, "ti,nand-ecc-opt not found\n");

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
