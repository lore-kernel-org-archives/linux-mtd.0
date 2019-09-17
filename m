Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F30C4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 17:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C820B2067B
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 17:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WGRW5ozh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9xyCHQJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C820B2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=kSMBDTiPfXuNVdewg9WfzaN5MNvVh9Rp6RicVxT7Iok=; b=WGR
	W5ozhAXxG7mMPFDhq7rathO12+KmUEe6UV0WGJEQXrJulYVE9UAGKpoulqPZABiVg7yXMCnI3RrfB
	JC/fg08FdpD5o0t235Vk5uIqhZxCDnZWMrrIrx6oaEt5R89GnjaMD5lf4JIH++Syh4wTo5uOzkAlz
	9rprNSRBGN6UK0jJhlzhSFS5yoC1giKs5HzK/pX2B+4gIkfmO8Vv0Ml0gHjjIgevH+vHmgHDitjw5
	BC4CW9nnDYm+6TPTkZPKOpO+0HbB4//QfFdw6s+WlaZxqSRZseQ63vByxdfLOextP+rwgI+Mj6+hl
	4yFHlwhKgiMeunvRlsHjnouOJNvNwcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAHeE-0006Li-JT; Tue, 17 Sep 2019 17:52:18 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAHeB-0006K1-C5
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 17:52:17 +0000
Received: by mail-pg1-x542.google.com with SMTP id z12so2396622pgp.9
 for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2019 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3xoBbv73tKSb35chuDrteuMuwVgmL1EzbHL+TVxu3jQ=;
 b=Q9xyCHQJH1qy1vs1PCxRWSI66qtGbBnvVQwOdEF6n5JUvIuk/rwRf5ZdocSugS/Nut
 5X+z02U1efaJxSjOUauiF40qW7bALSnqnImhYRGvh7aoRSI8uVzs0J5VM434qrmB7Y2C
 QV60jCVj8aI1XPKSCpNBPOxdxxjLvaOEI48O+miqVlJnm9307YZSIzbPX/jIC1KIO2WT
 rDaaqpp6hwDfjB6LQgi7FYJLsLI7QnOC+bn71mztR66I3KGhFFUjRTqtT9T6GN8YpHdJ
 9oAUuPWZPL3KAcr0oJmDxu+ZOyjPWGkJb1kBbxAblugrzdg6wNmZHsWF+wlEPjOVKe2Z
 CjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3xoBbv73tKSb35chuDrteuMuwVgmL1EzbHL+TVxu3jQ=;
 b=NMgdR2kssXbAmqPCqCqkT29gH08f53VPBrGk9FHwOh1psuBzQVWsFw4mHeSSLyEJMZ
 +ZoM587hUtDQ0aDQtNoR9+cgNK/CwzogZgGF64Fuusifa4jsuxiO2YEMSb2x3GUYqVVm
 FdJC2OlQB8HPdxNGZy09PxHPMT+ikP55Z+6JKhx3Ebg96iPdmi77soe3onfxVdxb1Wsa
 QDSOhTElcnhr5bsnjFOrTcY9WCYyp+qFtVSz5G2X7t6csSt9KNZZY7ksPs//rqxu1ywX
 ruWlMXy93wOFUdj9D/VaZIGKhZp/s04qWWn/70SWTKSnQO0qavAz1YjblduBze/FJm9h
 8i6w==
X-Gm-Message-State: APjAAAWOqmzTE3LS3IMKZmTszxLc/EmlkR7jvyp2KfUBll4nyaIBP16r
 DBKWXZQEyABmjDqkOLYPZ5Y=
X-Google-Smtp-Source: APXvYqzaCxaVPRz71zRicfCrWHia/Xp7uKyeMWb7VDV58mEXRUOmgs0fpQ3oD48fri5n9LvCES90GA==
X-Received: by 2002:a63:4423:: with SMTP id r35mr36954pga.235.1568742734496;
 Tue, 17 Sep 2019 10:52:14 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id r187sm4634283pfc.105.2019.09.17.10.52.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 10:52:14 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Subject: [PATCH for 4.19.y] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Wed, 18 Sep 2019 02:52:05 +0900
Message-Id: <20190917175205.16391-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_105215_486944_2FCA2E58 
X-CRM114-Status: GOOD (  17.06  )
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
 Vignesh Raghavendra <vigneshr@ti.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 stable@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As reported by the OpenWRT team, write requests sometimes fail on some
platforms.
Currently to check the state chip_ready() is used correctly as described by
the flash memory S29GL256P11TFI01 datasheet.
Also chip_good() is used to check if the write is succeeded and it was
implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
checking").
But actually the write failure is caused on some platforms and also it can
be fixed by using chip_good() to check the state and retry instead.
Also it seems that it is caused after repeated about 1,000 times to retry
the write one word with the reset command.
By using chip_good() to check the state to be done it can be reduced the
retry with reset.
It is depended on the actual flash chip behavior so the root cause is
unknown.

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
Reported-by: Fabio Bettoni <fbettoni@gmail.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
[vigneshr@ti.com: Fix a checkpatch warning]
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)
 mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
old mode 100644
new mode 100755
index 72428b6bfc47..ba44ea6d497e
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1627,29 +1627,35 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+		/*
+		 * We check "time_after" and "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
+		 */
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
+			ret = -EIO;
 			break;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_good(map, adr, datum))
 			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
+
 	/* Did we succeed? */
-	if (!chip_good(map, adr, datum)) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 	xip_enable(map, chip, adr);
  op_done:
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
