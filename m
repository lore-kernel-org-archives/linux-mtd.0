Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB00EC43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF80206BA
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ac1yGR/+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WpT3fRrm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF80206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeN7nsiFTpoGCsL8KhQ10ccUqJsPhPUTq7lkybmX2Fw=; b=Ac1yGR/+00c/lm
	bLxqcPa8mBUdJ5JSMAwFAAn+ZjIC083CMOWg4/NCAqgXJd10j6KUX4A60VO+2Ysb69AT3XGM7/2cJ
	YcOdmahxNRl5CeLWUtUyetsk0BAPJ+4uR9MCK90+ZeFmfTKxTLN+2FJpsPOaPf5K4haHi34SLaAJb
	Dfczj4h9waSI6iWMJreCpyCTkxMz49zKqko86NOfwnJZuIGZUcpIqWUObHDGttmMYgne37FGU8NBS
	Ybf52tXAS+iqOlTb1rUMphX/LflLgTj8o32bpPND56XtGAB5aeMIbdCx4Vq6xOLHilZvs06E5pnKe
	Oz6c/XjAvYpZGgvZ3egg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzm80-00057K-2m; Fri, 01 Mar 2019 17:39:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzm7f-0004bd-Ch; Fri, 01 Mar 2019 17:39:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id y15so13053587wma.0;
 Fri, 01 Mar 2019 09:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7OjYhQ1sxkg2lrErPUHFawejB35OfwkS5HMv+Kb+3Oc=;
 b=WpT3fRrmmDGKLng1Pk9RdeeAjfVOrhpOxK+2rcL8c4ekji3V6VAE9E/fZWqQ9PsLsI
 R9fk0ZkieXy4+MTCF7ds+h1OLFLnhXyuNiMVdDtxnNoA1MtJunXl5Oql5FXHDCivyjOL
 t7HvwlxVHVZIhHVOtYjLpKH5UpCrbTN2GmJ4JNUtG6u7xHuBcWx2Ceu57gxzy71elwgK
 j7UiArbrcSZGtx0OyA7GHRXj3mvx197tnVI8n52kLFozqzEHfzLipo6SceOcM7SsjDrZ
 FseWprmhlF4/vFsJQ29Dh0vUKEqxtvUhPCP1bwV1dbt/rUK8upGapmQhRQ6nLTv2RD4p
 wvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7OjYhQ1sxkg2lrErPUHFawejB35OfwkS5HMv+Kb+3Oc=;
 b=TkKwwrW7Znrb2ZbOE2Z5FTdLzj/hX5pMazam/h8qxI0o+UsUxWKqWar9FkwTQCX1Rd
 gcC5V6sAGUxJYTeq/gl/RvZJv6rJFx5fVGpXj4M7cp+ZAcgS+KfMwxgv7YHRYZ4CwQxa
 jLMXYbsbjk+p7L1gU0mXZbTF41IO2kMQw9N5F/4PXsmqz3g4g6PYyuqKmvQ531AYzhvT
 d63r6atAv9LmRHPz1CsClteunNk+SYTmi0+iGZ5QI/5yig7fId4n6c3h08M6YLtAWP4b
 fC/KzRNgCQtVzAygmASHXMb0T0gGHVuB/kR8gMVM1bOuTK98qEtfmrNihfxdNKcp0V8R
 ik/Q==
X-Gm-Message-State: AHQUAuYGeqEPD2lLu4Ke/Mv9E1dMND6HP3QD1SYJ8hG7kG4DH6+mfX5Q
 THO+pwa1YVvQ+gcWLDmjln2JxwLn
X-Google-Smtp-Source: APXvYqxPBMvwJOxGPJ2ezVujNqPpc/iom6/bkF4dQqhJATg6ewnFZIJtY02psxa/42QMHieOf6Sw5g==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr3767359wmg.136.1551461936366; 
 Fri, 01 Mar 2019 09:38:56 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD7109200428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d710:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id y5sm48577069wrd.97.2019.03.01.09.38.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 09:38:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 liang.yang@amlogic.com
Subject: [PATCH 2/2] mtd: rawnand: meson: fix a potential memory leak in
 meson_nfc_read_buf
Date: Fri,  1 Mar 2019 18:38:20 +0100
Message-Id: <20190301173820.30776-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301173820.30776-1-martin.blumenstingl@googlemail.com>
References: <20190301173820.30776-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_093859_572615_29437F5A 
X-CRM114-Status: GOOD (  11.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

meson_nfc_dma_buffer_setup() is called with the "info" buffer which is
allocated a few lines before using kzalloc(). If
meson_nfc_dma_buffer_setup() fails we need to free the allocated "info"
buffer instead of only freeing it upon success.

Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index a1d8506b61c7..38db4fd61459 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -534,7 +534,7 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 	ret = meson_nfc_dma_buffer_setup(nand, buf, len, info,
 					 PER_INFO_BYTE, DMA_FROM_DEVICE);
 	if (ret)
-		return ret;
+		goto out;
 
 	cmd = NFC_CMD_N2M | (len & GENMASK(5, 0));
 	writel(cmd, nfc->reg_base + NFC_REG_CMD);
@@ -542,6 +542,8 @@ static int meson_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
 	meson_nfc_drain_cmd(nfc);
 	meson_nfc_wait_cmd_finish(nfc, 1000);
 	meson_nfc_dma_buffer_release(nand, len, PER_INFO_BYTE, DMA_FROM_DEVICE);
+
+out:
 	kfree(info);
 
 	return ret;
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
