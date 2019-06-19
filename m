Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C06C31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:51:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842E0206E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZUOIXpbo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZGZMiml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842E0206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t6+w5hH7P3dLYr4OIF4zu0g4QbedMDnzJKA7jrkdOAw=; b=ZUOIXpboiovNGaMWp8lbvRecWr
	H8+BFigyvCYZrnRPs36iPq5ohmizjnJlAGUKECHRrKbGcjN4y7xTtdZY2uNdOmoa+7c6DRTqYO3lC
	VRmo5EXNEecTT861Z1m+/qpx9mbzzoM1kycIytz3/iorIM0s3pvwlInQ3fugyHL0yMTn4bkNJhLpR
	OgF8EH95Km/AGEyto4FHMrNjfUH2cOrrQa0X59WadOcmeCB49twmIoNj7Qbw9QnV9ZjN2hz8PZsZ0
	xAouHddvLSeSYKw9kh4Wtj6QdS7Q0Uwaf6xo426exiS5C3H/QMw5SqV0YYBreth3SLbbhsSpuzZbH
	H8FoMF3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddnf-0000zC-6u; Wed, 19 Jun 2019 16:51:07 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddmw-0000FX-ED
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:50:25 +0000
Received: by mail-pl1-x641.google.com with SMTP id c14so61737plo.0
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ozmqltjjmE5Dif+cHO8QWJrQyO00m0H0FC8u2KbSQ+g=;
 b=VZGZMimlmr2Azv6DE0vHmdaSvCAP1MeFXqUP8EQTmlGaejN8fbOu2ddKYAhxFR+m/7
 /qr7QIVv7U0OhQRN3w+HZnAWe+5CzH7JPdGcPtmK7PBeCTirmJ/sQ/8jXqAY4GnNUTpB
 gmz5g91HwxaJ4eo8Zfpf3+PadiSCrCPrlfiSJEjhNHBiITxRx2dFBftPO+ytrFOcq6zp
 cfCBwIAHHhBVWEvXRhFV/hWpFQfu0X63n6NciAiULZ9YsS8xx92KXbNIn8TjHx8dtE9C
 4Gcv6kFBqtc8rxstFlGtDDIX8m5zuJ0hp8mD3DnFojQdoR6ye1ukKLOCHIZPWAHOzj5i
 UtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ozmqltjjmE5Dif+cHO8QWJrQyO00m0H0FC8u2KbSQ+g=;
 b=qX84+408IwMIfxQRRgqnFFxae5aTYaOQ4IXfPTzti1s7EIiC3jvaG8VZXOMhIJ4Nj1
 YzoOHxb3FZHPkN51q3QWztHgj7tZqlZczDIAea6KFxTz2ohoszFN2S2cc71HlAW5hdn4
 883nnY10vQQay03FSlBkwc8dBDJXi7Epa5z/qqZ8pRTl9o3a3Ze7TNOT4zpqbTwPQhFc
 fJXuKN7EnUslG8bdL7ZZSIPpcmS5kcuZ3BzohC5OHyGYMx0bHiAYapmDLApuwwiZ2BjL
 08So1AfzHglc2N898KdxbUQgLz0mC5N+eni8TPIgzGPoYqomOX6fHKren+MvtI/iM+aZ
 39xw==
X-Gm-Message-State: APjAAAW9LnG9xRVtNnzVJkgH3fmpbGS2eOvM0uUl6JS5Sqt3qJHBuxui
 LadRq3e+aH2V0HhnLM9ZM0w=
X-Google-Smtp-Source: APXvYqzxNvJwe99RtOqhwXC0dNnYumM8Au+qsnfushvZg2498081sNqErL1r0dcOkhUNNWvViKhsFA==
X-Received: by 2002:a17:902:a60d:: with SMTP id
 u13mr51977390plq.144.1560963021627; 
 Wed, 19 Jun 2019 09:50:21 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id j1sm21344894pfe.101.2019.06.19.09.50.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:50:21 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 2/9] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
Date: Thu, 20 Jun 2019 01:49:54 +0900
Message-Id: <20190619165001.28410-3-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619165001.28410-1-ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_095023_840811_A2A94AF6 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For a maintainability by reducing the goto statement remove it from
do_write_buffer().

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.
- Address the ./scripts/checkpatch.pl issue.
- Convert to use pr_err() instead of printk(KERN_WARNING).
- Squash the v6 03/11 patch into this patch.

Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Split the patch v1 3/3.

 drivers/mtd/chips/cfi_cmdset_0002.c | 51 +++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index ed3e640eb03a..60d3669ce5cf 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1887,40 +1887,41 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
 		 * the failure due to scheduling.
 		 */
-		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum))
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
+			ret = -EIO;
 			break;
-
-		if (chip_good(map, adr, datum)) {
-			xip_enable(map, chip, adr);
-			goto op_done;
 		}
 
+		if (chip_good(map, adr, datum))
+			break;
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
 
-	/*
-	 * Recovery from write-buffer programming failures requires
-	 * the write-to-buffer-reset sequence.  Since the last part
-	 * of the sequence also works as a normal reset, we can run
-	 * the same commands regardless of why we are here.
-	 * See e.g.
-	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
-	 */
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	xip_enable(map, chip, adr);
-	/* FIXME - should have reset delay before continuing */
+	if (ret) {
+		/*
+		 * Recovery from write-buffer programming failures requires
+		 * the write-to-buffer-reset sequence.  Since the last part
+		 * of the sequence also works as a normal reset, we can run
+		 * the same commands regardless of why we are here.
+		 * See e.g.
+		 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
+		 */
+		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		/* FIXME - should have reset delay before continuing */
 
-	printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
-	       __func__, adr);
+		pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
+		       __func__, adr);
+	}
+
+	xip_enable(map, chip, adr);
 
-	ret = -EIO;
- op_done:
 	chip->state = FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
