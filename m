Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7813DC25B48
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 03:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wY68qmO2Yhos3GMix0XoZZhh8f0tMpxl4VrD81M5IyQ=; b=M18NMeYrDBwhYA
	x7twsz8BCDmd64vUCSLg6QoSo8dqRawbwr+wOSDjD3NeKfl5Omwje8Vx9EG0JPlycBjbmXFGIKdiH
	r83mQRIKUdVD+x6FqHggMQiUp4soZl8iL1S+41GlUPQ3BU/U5LES597VDENjgx3tq62HrWG1arMB7
	DD6lm6osjMjSfneEz0pwfyl/HaCNLRBkB8gSsWw9Z9eoHQTBAjB6eIceOtmD0Gd5Z6NttiqMLFFW1
	wjaANYMCmup8HRUA7Jd4ZATLYS4mGYP74yRkpUOVPbLgN/dQPvu3BVT3e3sf78yUqvAfWyD4/OjMO
	hhhbWayJkV1gv3Q62ynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvUCm-00BEHV-15;
	Wed, 25 Oct 2023 03:05:12 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvUCi-00BEGr-1d
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 03:05:10 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6cd33d51852so3411865a34.2
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 20:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698203104; x=1698807904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=J2J+msM/oWEHBTBfFGIdBATMYCWzZZTEcIR2Uu0nKJs=;
        b=Ogh3IWYCPi94QIs9UDm0EaHZ4jn9nuvCOQizzcnoBmhQF82lh49aDE76uClaVTpr2d
         MTUVkHSTvV9iWlAz3WKEYdU7Wunt/Uxk6mHxVzuAz4P2KcbB6SIYet4Bd5B5mS2e73wg
         hRHEdOS5tdsAFjnx9Nw/YtqopgtOvgUDkQxc+wL/9w5CvjyAKgmoe6xixQ0jbKXa214f
         8Od2i1QM57OQfaGH3OadxlqCyMcQX1LHjxZFOlykacnSiW1QevvdHw9kQtXrgGt+6vPz
         Zl8sv9jjE9/eSOOURY7XCG+Qv5P4DJLBHabCvgY0viM34RIMZzHDLMXHVF7mwW9oKTsw
         KMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698203104; x=1698807904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2J+msM/oWEHBTBfFGIdBATMYCWzZZTEcIR2Uu0nKJs=;
        b=KAyOjfebLPjH+Yc3nHglogcBIhTbKqTkAQVEQypyTYjQg1BBAEts1tsO6tQIReL+j+
         MpOdZ74qR7Fzsy91ITGUjLZmDBoxuBYYn5CFp19fnb1gdFre5rYnj5wq/gWhFV2m48t5
         36uP8dIqz2Jm3T3pGjQ4xIh7VcCBinGdZ0IOIUhJ9Vr6Fc3LLrbgdr4IbUwVijWxoMUx
         odbkuyKtRb3NH+xiwF+NSe+rIAxUlZFF4rT5gFGioBzZHf6WjdPraIhKnmxJh4Ml+xUZ
         tat30Ha7MmdRrjSroKvs3sfE9pSn27dG+Xl9zRvnwNSPV78h1y261HTSiVqFqn/SjuF+
         GY+Q==
X-Gm-Message-State: AOJu0Yz6VJruPkmETzskhPBUij95OpzUi4Krfa2yw+rbu/gl0C+iZ0kK
	p30jSjG6BO3VjhINhRm06wo=
X-Google-Smtp-Source: AGHT+IHtgb1lylNWn3sPpR1wPW5dnAue/+pEsxDnLngtYcX/hbZzJx567JhNOh7AJ1stkbuTgXtBlA==
X-Received: by 2002:a9d:7ac6:0:b0:6c0:a98f:56e0 with SMTP id m6-20020a9d7ac6000000b006c0a98f56e0mr14244442otn.38.1698203103691;
        Tue, 24 Oct 2023 20:05:03 -0700 (PDT)
Received: from localhost (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id m26-20020a6562da000000b0059ce3d1def5sm6755753pgv.45.2023.10.24.20.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 20:05:03 -0700 (PDT)
From: AceLan Kao <acelan.kao@canonical.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: spi-nor: Improve reporting for software reset failures
Date: Wed, 25 Oct 2023 11:05:01 +0800
Message-Id: <20231025030501.490355-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_200508_568229_27FE0AF1 
X-CRM114-Status: GOOD (  13.18  )
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

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

When the software reset command isn't supported, we now report it
as an informational message(dev_info) instead of a warning(dev_warn).
This adjustment helps avoid unnecessary alarm and confusion regarding
software reset capabilities.

v2. only lower the priority for the not supported failure
v3. replace ENOTSUPP with EOPNOTSUPP and check the first command only

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 drivers/spi/spi-mem.c      | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..42e52af76289 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3252,7 +3252,10 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret) {
-		dev_warn(nor->dev, "Software reset failed: %d\n", ret);
+		if (ret == -EOPNOTSUPP)
+			dev_info(nor->dev, "Software reset enable command doesn't support: %d\n", ret);
+		else
+			dev_warn(nor->dev, "Software reset failed: %d\n", ret);
 		return;
 	}
 
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index edd7430d4c05..93b77ac0b798 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -323,7 +323,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		return ret;
 
 	if (!spi_mem_internal_supports_op(mem, op))
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
 		ret = spi_mem_access_start(mem);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
