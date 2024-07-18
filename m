Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B64C3DA60
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shIzYCBPwz5/+gNzpqGbhCXbs/rirNr0LthVh+/GwhY=; b=1PL7XQTsPfas8D
	bwCOGVqZPYrL7bDJxEHTf9Ffn4P20CSU6zcQ9lU90hfJT3oUgLiCpZWctdN+O3WUlFaSs6hBq+DnG
	aUJNlTDXF+gtDk/tjgrh3k1eveMKkDJ7PdjmAuYDxSFglbN7wquZVJtmxUMVBbHGUTfCsXrJuxA1j
	tkNYjlMHEACv6wUjQ8f/wDLUCMnGfs8uMftxUhq0imqQvdHc/7iw4K6aH5UqtveQj6Q+v7UJswWg0
	qHR4tUCO/Qbja1111ImvlofvHF8zJ9gCGMOnt9JBGSjnvxtLPZ1aR28S4YMQDBrDhfBpHxGeWxh5Z
	+mwIBlgHFtVK9BP6bChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7T-0000000FeUm-3LF1;
	Thu, 18 Jul 2024 03:47:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUI7P-0000000FeQO-0YkA
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:47:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70b12572bd8so241772b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2024 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721274466; x=1721879266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGxTXo990ti5lAyVI8ZehxzUFXPwz6MqQx7qAzjMfhw=;
        b=C6QK4n4OzejCgu4ZhP5KgzVJ2jYZsXmI7IEks5bKmqE97OqYS0jK8Q3mfvLksdirBz
         Rd49l2rOCgnpLKoA05TNCNT4pTTUeeMz3LvD3qA/n33dO6b/cjij1kMKPnVQQ5JZ5s/8
         PDco6AaVdtuxyiIjGqrP8v9mgeBgSLeVN4u5+B/SdSL8LFjxSZinc2u8myZ14bsv7Mhj
         avShKSftmkCEOWEZNJxJPJCrDXEvn0b6GQe0KRQZu+om1knq0NRz7fc9sRm2rSzThn1C
         Po53lGl7fNICYkySDO08USUdEMkhMDwJEIcOU18NMq86wk8eQchyJ+zQKBCScALIKZbP
         VW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721274466; x=1721879266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGxTXo990ti5lAyVI8ZehxzUFXPwz6MqQx7qAzjMfhw=;
        b=PdqerrrfPCEsxGv23vTxl6EGdS8UA2YJ0CEGEunGPVx/+btYZ36ynEVYpqQxd0gKT8
         tyRFhHZLc0AYxnFp09mAu9oE1jXvIt/fSTuoMV5NtUZorZMhLQ7yyITowpkSkRy7Hm90
         6SNFq6qA3zArNRsFMaObCLXyKiCRQaQw85Ty8K3NPiZBDmdwMlzyEjpq1XK2LAek26pF
         +QDuxOLe2FZliSeqJtl5V1k9mC0O6ZQGobg6DXq1wX0kKRQq2HbgYyd3x+4+qteL4JmJ
         4VzrA4nAlDK8yFfV/Z3jMXjMOSjwpmOj1nCKVus4EHpkd0utjLGfHRs9BLyB6l8WA0A2
         2SJQ==
X-Gm-Message-State: AOJu0Yy9EUGNYSDOHkKMF95CjECnzO7P3WSFovZZQ1hzm+el2s4zBD7g
	UHO+IL+/Y85Nf1ivriBXajdHygi45SOHuhdy3Pj94AqZ1qs/i+MovWkvGA==
X-Google-Smtp-Source: AGHT+IFHhgdm/fpkHpJp5xeIvoQlchgAmcADiPZHZAKYg0ls+CPuWC+Msqnn+IJRt9GxdMHY5Hry0A==
X-Received: by 2002:a05:6a00:23c3:b0:704:32dc:c4e4 with SMTP id d2e1a72fcca58-70ce4d8392bmr4782637b3a.1.1721274466500;
        Wed, 17 Jul 2024 20:47:46 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecabf2fsm8838583b3a.182.2024.07.17.20.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:47:46 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 5B94580720;
	Thu, 18 Jul 2024 11:56:57 +0800 (CST)
From: AlvinZhou <alvinzhou.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: chengminglin@mxic.com.tw,
	leoyu@mxic.com.tw,
	AlvinZhou <alvinzhou@mxic.com.tw>,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v9 3/6] mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
Date: Thu, 18 Jul 2024 11:46:11 +0800
Message-Id: <20240718034614.484018-4-alvinzhou.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_204747_206348_9122F9EC 
X-CRM114-Status: GOOD (  13.79  )
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

From: AlvinZhou <alvinzhou@mxic.com.tw>

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
The byte order of 16-bit words is swapped when read or written in 8D-8D-8D
mode compared to STR modes. Allow operations to specify the byte order in
DTR mode, so that controllers can swap the bytes back at run-time to
address the flash's endianness requirements, if they are capable. If the
controller is not capable of swapping the bytes, the protocol is downgrade
via spi_nor_spimem_adjust_hwcaps(). When available, the swapping of the
bytes is always done regardless if it's a data or register access, so that
it comply with the JESD216 requirements: "Byte order of 16-bit words is
swapped when read in 8D-8D-8D mode compared to 1-1-1".

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
Signed-off-by: AlvinZhou <alvinzhou@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 4 ++++
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 028514c6996f..31f57b17023f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -113,6 +113,10 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
 		op->cmd.nbytes = 2;
 	}
+
+	/* SWAP16 is only applicable when Octal DTR mode */
+	if (proto == SNOR_PROTO_8_8_8_DTR && nor->flags & SNOR_F_SWAP16)
+		op->data.swap16 = true;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 442786685515..baf6c4b5912b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -140,6 +140,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_SWAP16		= BIT(17),
 };
 
 struct spi_nor_read_command {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
