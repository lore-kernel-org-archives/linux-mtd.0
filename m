Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE0CC19F2D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nLElgx0OA8dnypCpp9syTwA7sL4JBZn+BgF68/J4WU=; b=oZkedUj6AmL9e0
	WVk/xaB0Vkg7davGWGe/AuVb4ThOb6x3jgkkIbG4PP0ctxEo8aKALh/r6mway1Gbtv4X+tl+lmlcA
	ddLJ/pavCgFjFdtK3aqZRd2P3DHeO/AGAl07M8k2xOriDX7C6R7q4fP27CkKM4/rygds0LvlfZsup
	WP289Je+bfTp3Co+PTAJhdjcOxeFproFu/BkbrJhfiYnn8XpTmiBgJQtA8miwFp+clorGW2TPhMDz
	XzTZcdJmC4xyEvaOiYfPcEb3aWnBSQVSjQEhDKFoYlJyYDGw4ond3S5ZX9hr2iQIwcdl0S9wxa/Mu
	kTbN3INCvAhQ1KDw2T5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4lC-00AskG-Gt; Thu, 11 Aug 2022 09:45:50 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4l8-00Ascz-FV
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 09:45:48 +0000
Received: by mail-pg1-x530.google.com with SMTP id bh13so16694974pgb.4
        for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2022 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=nOP9/7cM3csW3iIYH12C9Ae3gJpw/rV2ZLCjhAy/mGQ=;
        b=BZt8n0PErJ28ZzeIW+04UvHZ/vTMYSL2gmnQ50vf/hiN5LhtsitHqbvfFbinDrXpA8
         6Ag8lLsifgDF7TY9gKEbYdI06B0DMBR76UzwOtarK1jr0WyuaWbQIkaZDkUyk8bGM/Nl
         zoQGw3z4uQL5UKyPh/3ksAPTE4t2T3W5HU1j4mdJJBzucbfuJAgBSANAJi3/HNGdapqT
         85XfRHqvxYFtssySQP5snX2dXGem7n73YIKaxtIYGLs4zLv2zBN94h08Cu7pQNzoZQHA
         8Xils8YZ4Bkqh058WOVKYbZ8+b2WDaL2U9OE51DaJM0p/ccNokBmfG96LkoHFAElQTxB
         6uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=nOP9/7cM3csW3iIYH12C9Ae3gJpw/rV2ZLCjhAy/mGQ=;
        b=e00Hu2tZHOUlRL3wsQat/KLF1Hg8wSs/o/bzSfAo8qyVHGSTu0O/QcZX47jBQ/F/kh
         SSwwRGPPYr5RMG3ChtGEaI3847Vq/hBcIYodjZgVTF06rDpWhHCiltYGypjkZUP96sPF
         pknSCGbsu3E8enhtueSSnsveMSn1jXJaXaxifQlfqYkeviHZhGWYpFoFTRGrqUfxW33K
         Zl0qe2RG92ptNv+QcI1lpUEf1jXVyuuUpUcKHq6HNjXCrWEQKS0DO8JdhcjO/uz4X1LE
         M4/6D5slScB7a3CuWDVB39clN7/d1h9bWG5Z1Eddvgviczy2frRAedy9bOnRshcyqjho
         oyqA==
X-Gm-Message-State: ACgBeo2C/o1/eR795JoadYPCaMaaFCvDwJ5WpGHFdKgZObH56tOThDVM
	kkkZm6XvMzHpgG06Pfr/iNyQfTgYr7c=
X-Google-Smtp-Source: AA6agR5cv2jK4olqqr5mWQfdNPbSni0vrtr0UYmWzcXDU0m3uFfrveF9kZU6DlydlmCITw/FuPVXOA==
X-Received: by 2002:aa7:9157:0:b0:52f:20d6:e4f6 with SMTP id 23-20020aa79157000000b0052f20d6e4f6mr19739057pfi.40.1660211143395;
        Thu, 11 Aug 2022 02:45:43 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id x14-20020aa79ace000000b0052d7606d144sm3586922pfp.74.2022.08.11.02.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:45:43 -0700 (PDT)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: jaimeliao@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 1/4] mtd: spinand: Add support continuous read mode
Date: Thu, 11 Aug 2022 17:45:33 +0800
Message-Id: <20220811094536.24498-2-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
References: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_024546_577060_4D584955 
X-CRM114-Status: UNSURE (   9.43  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch supports setting the "CONT" bit of the configuration
register and create spinand_continuous_read_enable/disable functions.

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 11 +++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2c8685f1f2fa..dc2e1dc1dbee 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,17 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static int spinand_continuous_read_enable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
+			       CFG_CONT_READ_ENABLE);
+}
+
+static int spinand_continuous_read_disable(struct spinand_device *spinand)
+{
+	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE, 0);
+}
+
 static int spinand_ecc_enable(struct spinand_device *spinand,
 			      bool enable)
 {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6988956b8492..37b46c556bd7 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -154,6 +154,7 @@
 #define REG_CFG			0xb0
 #define CFG_OTP_ENABLE		BIT(6)
 #define CFG_ECC_ENABLE		BIT(4)
+#define CFG_CONT_READ_ENABLE	BIT(2)
 #define CFG_QUAD_ENABLE		BIT(0)
 
 /* status register */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
