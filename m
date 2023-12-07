Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F5DC4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 07:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OobyR0SOlyJiUu86ddbwzM/VfMZTIC6ClYLiVW9Rubk=; b=QCIljBOvPCI9Zb
	FzJ+9+HgfVvBATVv6mXWsAfCz3JThXaFC9T52L5JVg1ezb8ffz678K9CRd4q+rNdMFQ7cSDlMvm30
	TMPaw3kU+wy/dBibklb8gF/VusoufHfLiE0JWoA94Y4fW2jHYpmPewOUkmbk+H/xGCMH5ucmkpZy0
	uyCvhrtrERo5US4mrVzd2wDawqPvoDuxpcrzrCLL+ZhZPPJaDZ2E4cmJ0Zu88MgsyD6s1TvnchtB3
	6L/QERXIOBAlrCu3AAlUdwpXMlIdIYsZVtpUo38mvCNn9rpY4B3Su0O6MEOkgoOcHuiUn7e0JobQE
	d8DvWZltNNTcGzcYQvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9Au-00C7Rw-1I;
	Thu, 07 Dec 2023 07:52:00 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9Ar-00C7RO-1f
	for linux-mtd@lists.infradead.org;
	Thu, 07 Dec 2023 07:51:58 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so494593a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 06 Dec 2023 23:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701935514; x=1702540314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+/jtfUogS9jCFTDvn8/FAd/hA5IH6sFjYPx1JB6ZFY=;
        b=lw6bqsjtZnibq7I1ermfbxJhLLG9ozInLwEU106Lxd8Yh7ZvKvYWeLXZMbGMpeGX3b
         9+x7tgqYuOuR6AMojrmnn8dzokAfnaQ5g2szqtZzP57hJI+2U2gjK3wS+Wbs1jZPAi8A
         qjIJO2acxCgA0DwIpluY1OlcQgLiyBsjvECU+IugI4gZSzxdiLbEsDZthQdYLxMQO9PH
         z5qIjKU6qIMBOia6gMCbYJTOhuu+bh20Kw9VqiX0Hx6+eIfa23fDpauheV6imtIFYfid
         a2mg3N/MCQD0JQzaOl4LuQfCc9YmNK9ds8JFva4nkJIOtsrWwav43GI1YbI9GiMw2Epr
         SoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701935514; x=1702540314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+/jtfUogS9jCFTDvn8/FAd/hA5IH6sFjYPx1JB6ZFY=;
        b=Cc/I2ijEr+AgpetoTemySPEwJRCZJgHUkBUAiHsHuxyF1kgV/WXFfD4oCfyZa7tMe1
         cySCirmPIXtLMyPp7MZqFUiKJx4Z0IqAo3r8WCcXhSk539TEt0L6D3sj+LZhlAG7DpHx
         RTwAso+x2djhPBRcy50uOli8WHKAOKUul7FVfwLvQkH9dxYXufDPuQQVBt6KAnPiXpTF
         DpuTf0aDfD2fS22xEMlLcOHJYB71KfPwyixclLJ/+Ym82ds5YsTI8q7L/4Rn2hQw5sis
         Dh7F6z+ZSBBS1VgT26zhanCyahK5mgjxaSnKAwrbquJmIjOTR4cPJZljr4CatYDfLjVC
         Ep8A==
X-Gm-Message-State: AOJu0Yw18n8Njkq24Yaf/hfHpd9UayWE+L3mV/xEiEcM8UQT3EvDcXL+
	fJgDKfp0OpfdersA9OYuosw=
X-Google-Smtp-Source: AGHT+IFtZYDkJsqHB0qPAw+KvJAe+/wPd85TEyKbgdSXE+6f9ezhk/TEsmsLlniHSrpkLerXi/EJlg==
X-Received: by 2002:a17:90a:348c:b0:286:ab9d:c6be with SMTP id p12-20020a17090a348c00b00286ab9dc6bemr2135479pjb.16.1701935514440;
        Wed, 06 Dec 2023 23:51:54 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id pb11-20020a17090b3c0b00b00286ed94466dsm650659pjb.32.2023.12.06.23.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:51:54 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id BE74080423;
	Thu,  7 Dec 2023 15:56:24 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
Date: Thu,  7 Dec 2023 15:51:47 +0800
Message-Id: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_235157_555020_EF90A752 
X-CRM114-Status: GOOD (  11.84  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Some flashes contains 8D_8D_8D information in SFDP but did not enter
octal DTR mode if conditions are not satisfied.
However, still carry the opcode and dummy cycle for the octal DTR
protocol.
So that spi_nor_abort_octal_dtr() could abort octal DTR capability
then recall spi_nor_select_read/pp() for re-select a suitable
protocol.

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..7cefab1d29d5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3083,6 +3083,29 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	return spi_nor_late_init_params(nor);
 }
 
+/** spi_nor_abort_octal_dtr() - abort octal dtr capability
+ * @nor:                pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_abort_octal_dtr(struct spi_nor *nor)
+{
+	int err;
+
+	/* Abort octal dtr capability and re-select read and pp */
+	nor->params->hwcaps.mask &= ~SNOR_HWCAPS_X_X_X_DTR;
+	err = spi_nor_select_read(nor, nor->params->hwcaps.mask);
+	if (err)
+		return err;
+
+	err = spi_nor_select_pp(nor, nor->params->hwcaps.mask);
+	if (err)
+		return err;
+
+	return 0;
+
+}
+
 /** spi_nor_set_octal_dtr() - enable or disable Octal DTR I/O.
  * @nor:                 pointer to a 'struct spi_nor'
  * @enable:              whether to enable or disable Octal DTR
@@ -3094,14 +3117,14 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 	int ret;
 
 	if (!nor->params->set_octal_dtr)
-		return 0;
+		return spi_nor_abort_octal_dtr(nor);
 
 	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
 	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
-		return 0;
+		return spi_nor_abort_octal_dtr(nor);
 
 	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
-		return 0;
+		return spi_nor_abort_octal_dtr(nor);
 
 	ret = nor->params->set_octal_dtr(nor, enable);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
