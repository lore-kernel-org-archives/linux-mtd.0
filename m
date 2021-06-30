Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D582C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 17:57:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A4561461
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 17:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A4561461
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renard.ga
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9CYCnMtjnqt80jfsgWgG6yeLXw1N1VHfhjKkmb6EToc=; b=yFP+4haoUz3u/9
	FpofqzStEzl6a547mJmQxTwYZ4jILVRN4M06HZ+PMnmKCwuYEyOx3ZmzDCZqlfv0ccoGTalVK5uxQ
	EMqcZPnXspj7GF+JDopt4/ZUb+n0FINKIbKdW8jYQlrDv3puXjtHBdXHl4wvpeMEEJSENr64wacNd
	MRd0qkO6x062JHQH4CPFJcOQkrqt/pMsklIy8DhlJ7Cr6vVY2Ra56fud+aaYyvTV5QBOyx0d02bak
	tl5bQhvLtJnBqmpTW/umwRXKtdQ27g7Wo9PAsVKBc9uJKZGyep7lqa8X7o9Sr2H7XbLqN//Ry1zce
	BO8K5tqkN0RTLwGxBH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyeS7-00EsRP-74; Wed, 30 Jun 2021 17:56:47 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyeS4-00EsR0-9e
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 17:56:45 +0000
Received: by mail-pg1-x52c.google.com with SMTP id h4so3075544pgp.5
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jun 2021 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renard-ga.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZN1tHuk034ZaFIsRIK6Z5onlBi+YP3NzcqB1k6qQqA=;
 b=OatmRiDTuSw25Qbq08BfsxVjSJanRlP1R2DIwj9lZOcD+TEZXUkaRcFUIa/cbk1wZc
 jB09mQxNwEVc9V6BX0clmgknRFzCiZiEdm2tSLKDVugJjCTuu8K0JVacfsFQYJRUy73V
 a18RvfEt4BHujVIp5Fu4UBYUN5ZNEvt5wBvzoXrcqLLjoFzvcdWsfRF5XvHl33NMYkQB
 kHZZQ7zmL/eQXNrRLHlr1UJc3FSUmiPW4A5UvuGOExnMR0wZ1gscIkVq+G5nL0kUjCpT
 quqyqtsOxhhiu3SbAwM9GYOc4YbXAl1mzSQMvYFr/do18b8m2VCjFkuvVrP7M+x56UQn
 /KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZN1tHuk034ZaFIsRIK6Z5onlBi+YP3NzcqB1k6qQqA=;
 b=HmvV97oKzq9atxtTGElwHGe5ZVA28eaqvNKm38WkR9Ci2YI40hhwE4/5xqNa0b/l9B
 z5oyinhggtAH8JIWoYttYq/7wH/p2gVJ84EvL4dZtFUPp7/A0v/LOYjdQ6awkrqGCVXL
 8EDZEniVH3mh9fpWjEf/9c64p0b6rHNDOcXsWZnQOZ8AV+3XJkWUZ+vhdk585NWBKeRl
 VsQUii9zZk/OK4d7kB2izPN9glaok9JbLD3Uo+7CAKO0yebDI/nXAMyoFEQNSEDHHveZ
 lAJzFwY82Y/gXOSpyA3C8QJ1ad/Q96Paj8a2zOz6MaEcGFQn9yZyhRzMOasMNmMyRWxP
 lqjA==
X-Gm-Message-State: AOAM533zYxuAJRu7KJJn1uy4dWfINExrQDlAyQDjkJ8pezywIeq2sIfG
 QaF9UgLpveK5LMWGw0tELEB7KrLFdE0JA7F1
X-Google-Smtp-Source: ABdhPJz3AXviYcP3bzNGBK/I8qOGFFK85gyNx9DZEDpmLool2vAeAkPHtS6EAPJdmiGMtb0/q0ELrg==
X-Received: by 2002:a65:618b:: with SMTP id c11mr35585347pgv.292.1625075802088; 
 Wed, 30 Jun 2021 10:56:42 -0700 (PDT)
Received: from DESKTOP-RR6JF8H.localdomain ([183.108.85.135])
 by smtp.gmail.com with ESMTPSA id 202sm3264120pfu.113.2021.06.30.10.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:56:41 -0700 (PDT)
From: Jihoon Han <rapid_renard@renard.ga>
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 rapid_renard@renard.ga
Subject: [PATCH] mtd: spi-nor: esmt: Add support for F25L16PA
Date: Thu,  1 Jul 2021 02:54:46 +0900
Message-Id: <20210630175446.17680-1-rapid_renard@renard.ga>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_105644_452965_A02518BF 
X-CRM114-Status: GOOD (  10.70  )
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

Add support for F25L16PA which is 2MB SPI-NOR Chip manufactured by ESMT.

Tested on Qualcomm QCA9557 based DW02-412H router.

Datasheet:
https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L16PA_1(2S).pdf

Signed-off-by: Jihoon Han <rapid_renard@renard.ga>
---
 drivers/mtd/spi-nor/esmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index cfc9218c1053..2ebeecd6c957 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -10,6 +10,8 @@
 
 static const struct flash_info esmt_parts[] = {
 	/* ESMT */
+	{ "f25l16pa", INFO(0x8c2115, 0, 64 * 1024, 32,
+			   SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
 			   SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
 	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
