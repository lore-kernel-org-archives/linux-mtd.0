Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C16C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhjtmkQMBkQYc+SVSZy0cztCF0+9fH0eowfx3BOLE7I=; b=hs9WU0+yDuL4pN
	BGtcP96PU1/wf960WArEFoSYQg0xgthJWmbmAXOJSYOx/agUj/74QlmPCvGEGfZ/lh5WDHQbzNAmX
	IGjwJjUN30Xmidq+GgW4scnlaKdO5RtB0su0XDhbGxOGueWB8StjXMNQEqvzE963rxjY7y/yvdl2V
	zvWhL8GuTNE8nHErhV/9r7VpzgkKaRAzNBWgK3qVfeCYCbia+F4G82aTyz9fOKUtp+Q0q+795NKnB
	qegJHYBfSKwrOTQlzjuSSzPf7214wDbgqRDV37yp0K/huNGFy8EcIs5wJUvnKRN4UKhw4Xo7heYFn
	eCU118Cnd9PF0CHLX3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHj0x-00GpgR-7o; Wed, 09 Feb 2022 09:11:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHj0R-00GpXn-P9
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 09:11:21 +0000
Received: by mail-pf1-x431.google.com with SMTP id i6so1273728pfc.9
 for <linux-mtd@lists.infradead.org>; Wed, 09 Feb 2022 01:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6fBapOS4kELcJVeAab6owIw8k+JpgNpaHHTbdvQgn7c=;
 b=QlczsW32PO9rImMmVGdUHnydD8i1PcXXB3ArxYKvvKVy2I3e5aL0vc3afXiUFkdoHL
 0mUWv6aguknwWOMsaIwRGmxRXUGH5MkpYzWIp2nO4L60nTSwsbBgF0XQxxwlcjwezehu
 yj3QtswwlRlh1EhD+szhLrHbhiuzG9NQiA9MHuKHIw90g2oaWgEI6qlfUnWqD9ovJUlk
 U+3PiDji0Mmhm00fXsUgFD5osy3sneCSJF+nk2EwDIGnHU6pzMQJxh9lAGfJ/BFt/Dy7
 4blVhmrv5lQc0rkrtReOqmL/47eGwwBgR9FtRCvarYWfJS8bKSyc21ujuaWE+giND8+q
 wxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6fBapOS4kELcJVeAab6owIw8k+JpgNpaHHTbdvQgn7c=;
 b=66vdHcuy7STQqJ0zfH4+aF7K6V8th3yOuPo2jlv9B70AcXcJyxaNEY+KWMif92JBoG
 QjCXcS+g4pcnI/BorKqakZUpOEhdb6KQnionGkLb0J8wcdlpq09zTFyj4wIVBGDtcwn7
 Vj/V+Yf0duRcAi/g5OALlHcBXIhRbF1aRMiRy/DIUIcyH+IKXDRef+ZxXcjkGCfQchU7
 flwzZW0npxhty9SvErgRL4M9MR9V1YXyLZ9jzIqF6oWpuZrDyJjAPO81i2mY4OICR9bH
 L31lZ0vDCaAYloaQ5jBn3lT8TJzzV8H1hbBECQqMA06s1kZPs7zFekTxa6PkQu7BWK23
 m5CQ==
X-Gm-Message-State: AOAM532YLU7PedoVWmNRxbc6Tm7RMKT6zNRwBXhFS0leWCExcnIAz5km
 7uqfpohLJIylOkD+CFNw+C4rlh6Ljne81w==
X-Google-Smtp-Source: ABdhPJxtWssMSNaJKuLt3EBaoXxMIVNqlXfV8Eoz4zOdjyYpYbDNCcgigzkF+ynqaITNFsL/4tXHpw==
X-Received: by 2002:a62:fb19:: with SMTP id x25mr553310pfm.58.1644397879069;
 Wed, 09 Feb 2022 01:11:19 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id v2sm5270643pjt.55.2022.02.09.01.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:11:18 -0800 (PST)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v2 2/4] mtd: spinand: Add continuous read state
Date: Wed,  9 Feb 2022 17:10:20 +0800
Message-Id: <20220209091022.30155-3-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
References: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_011119_868973_9EFF3F67 
X-CRM114-Status: GOOD (  11.59  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add continuous read state and initialize state to
default false.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 8 ++++++++
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index dc2e1dc1dbee..380411feab6c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,11 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static void spinand_init_continuous_read(struct spinand_device *spinand)
+{
+	spinand->use_continuous_read = false;
+}
+
 static int spinand_continuous_read_enable(struct spinand_device *spinand)
 {
 	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
@@ -1261,6 +1266,9 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->ecc_strength = nanddev_get_ecc_conf(nand)->strength;
 	mtd->ecc_step_size = nanddev_get_ecc_conf(nand)->step_size;
 
+	/* Init continuous read */
+	spinand_init_continuous_read(spinand);
+
 	return 0;
 
 err_cleanup_ecc_engine:
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 04be10ec8fb0..c296d4d0dda5 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -416,6 +416,7 @@ struct spinand_dirmap {
  *		because the spi-mem interface explicitly requests that buffers
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
+ * @use_continuous_read: record the continuous read status
  * @manufacturer: SPI NAND manufacturer information
  * @priv: manufacturer private data
  */
@@ -444,6 +445,7 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	bool use_continuous_read;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
