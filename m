Return-Path: <SRS0=vbdM=HB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDC3C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 03:55:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BAB64E05
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Jan 2021 03:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BAB64E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6JN70svoy/4yRlQKmZOOBHvWzSBWTYvMlVh71CSpa5E=; b=qlxdb+pVW3yY5Mefz2ttoEm7eN
	x/focqQCCzhLjaQlTYwpd26U5RaiUX2KZRUwmQPSzdrcej3QTMJhDwrDoooU+xEQh0TwlXticbtZp
	jVVy9DYI+z6Q8CyIDP2d9BqGe4IpLHiHVfGLkL72w8iriQ27NVrK4PfNAi55apCuDwxrljrGU4c2h
	Xl9gggEZN4YvRmPMj+gA760xmYpwPsOP2zuzU//PAUYN1IN94PLLMPATA3H18ms7N3NcSxXWxviJA
	ZDurLieLp/5jF7uMdlkDTNG1duqncSWubechlamLF8GGaIdoRPAAkaWKXb6AXLEt26brSMUBOS19R
	hdWybCdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5hLB-0002p1-16; Sat, 30 Jan 2021 03:54:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5hL6-0002oK-NE
 for linux-mtd@lists.infradead.org; Sat, 30 Jan 2021 03:54:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id e9so6500930plh.3
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2021 19:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHqgS7ucbwBNs/xYikNa19+1cgFYDYneB3HI2cZIiLg=;
 b=QpSOCqCL06OtJJACvhlnNDSyMt6jGyXnBwTO22QdMm5Nq9s1zYPoQp0p2jRJz5+gbT
 qb2P7/62Fo440yVavgQPxjjCNbFGZG4VpaJTX1Vu04aP8c6lsrS412CZDypw39ZvfIaz
 +62HG5L1Qta0MvDf91m7XfbZYc7xpD8oVYrmeBNiUdiQCBfJJObDuwnvc1atDuMd3cRP
 Vp0yr4dyNWFDw3Ufi5Cf1j3Z10ZHn1z/xIxQPFQdmnS+/X6IeV2aFjYQLem5fXaFh538
 XTg6TLmJceKf1XbAJ/Pua6X7jRQB4DKGSBtnIVG2UgjFUZNRn4TtD/4FNs54XhDSX9mv
 WD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHqgS7ucbwBNs/xYikNa19+1cgFYDYneB3HI2cZIiLg=;
 b=BJvG2lGjld8uzAa4iF8ngvJZfdCstTLr1u/WZMjP6Kpe9N3KCG0kn6ml5YTbwFn8r5
 uC0Dn8f/PwqC0XfFd3yD9PnsRBPvKWGGcNeHsVDCfiCpwnhu0xTp+Cw7r5vxH5FBF67b
 3hpNmm9kqh41IS8tN6US9yB09iM91/1RpIb1oHPQeL1XHna3tT/H+y4IkzctpFSj880b
 YrX/WfEzhKGU33d27LCRmgd1gb8JKdWFRMZAoPAaOo2wKSba+eMJFNfsuAJCsvRo2grD
 /RZZNjT4wb05UrECkIB4UHrca9Mk/9XhtQLLjaSr4WFiZdywtG2NpuLPlOHnCWZLADMp
 bcDw==
X-Gm-Message-State: AOAM5331EtcKIGfOcGSUH2VcpHeL4qpzUUlSzJ4wETr4L8PdKLGZyqjQ
 nqOapw9dkNKtO49xlfdU7sJKR0MhQWbP
X-Google-Smtp-Source: ABdhPJzG642wXylctGzoBrw6niiXdDbet+kcoGCLR3M0N+z/rKswlDuRr7oeHZsafQVOP2P+XikvCA==
X-Received: by 2002:a17:902:bb87:b029:e1:d1f:2736 with SMTP id
 m7-20020a170902bb87b02900e10d1f2736mr7723660pls.1.1611978860811; 
 Fri, 29 Jan 2021 19:54:20 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.140])
 by smtp.gmail.com with ESMTPSA id y22sm10309808pfr.163.2021.01.29.19.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 19:54:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH] mtd: rawnand: Do not check for bad block if bbt is unavailable
Date: Sat, 30 Jan 2021 09:24:12 +0530
Message-Id: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_225425_069484_DC6D0986 
X-CRM114-Status: GOOD (  14.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The bbt pointer will be unavailable when NAND_SKIP_BBTSCAN option is
set for a NAND chip. The intention is to skip scanning for the bad
blocks during boot time. However, the MTD core will call
_block_isreserved() and _block_isbad() callbacks unconditionally for
the rawnand devices due to the callbacks always present while collecting
the ecc stats.

The _block_isreserved() callback for rawnand will bail out if bbt
pointer is not available. But _block_isbad() will continue without
checking for it. So this contradicts with the NAND_SKIP_BBTSCAN option
since the bad block check will happen anyways (ie., not much difference
between scanning for bad blocks and checking each block for bad ones).

Hence, do not check for the bad block if bbt pointer is unavailable.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/nand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c33fa1b1847f..f18cd1db79a9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4286,6 +4286,9 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int chipnr = (int)(offs >> chip->chip_shift);
 	int ret;
 
+	if (!chip->bbt)
+		return 0;
+
 	/* Select the NAND device */
 	ret = nand_get_device(chip);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
