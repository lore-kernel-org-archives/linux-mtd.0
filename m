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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8BBC4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 17:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A44120640
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 17:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8zvdNyi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfc3aLnN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A44120640
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FAjZj5sb2NfLW0sSCYJxfgzY2GnmiVq9cwMaqt/LFF4=; b=I8z
	vdNyiGhClY9IWBKsxbtBwWrwLHCi9MiwBxNkwRDLo4r1Aw5P11K6ga7FD8aNli0dtwYQbyPqtEXMN
	2kM5X1w0K1h8Q9Je1bb3vXML0Lpu7fpOAgbx92eipV+0k2Mwcke7uu4SEPNPOmj1lcL8yL1CbCCH1
	scCxlo63yKqKsUR6/W2j4p0Vrnari9sfGAHbwZBQBZEz4kMQbAkGKXRGw/45lQJwQ8Diw05MqYGbp
	OpYvUIW8MjBwJVy7inBixVNvkEtfuA+LijZ2BMCsJaspuvgKjcSqpmpJesaciu3elyCuNhT1TdHTX
	FIaNqT9ohRD9/VMLC2PWGnGrOaNTm9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAHgS-0006w4-VZ; Tue, 17 Sep 2019 17:54:36 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAHgQ-0006vF-6w
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 17:54:35 +0000
Received: by mail-pf1-x443.google.com with SMTP id y22so2604560pfr.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2019 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=onUVZCBtscC5yuxfoy+zsVbxl2PIwO0NVQMjTwxZqeg=;
 b=nfc3aLnN69+bt1y7/dIbf8WtiUmT8BJWb6cOUZfM2bUV+P8QZK+rf4wGlI2YtZ7IhQ
 cK0BLdUdjK/IsJ5hgiQSGju1p6RwgSJOKrHvlv4ycGYnOHAdXigp8fhCauhtEr9tZujS
 hSqIlp1a3iAgN0Ryxrhb4ta6H6UqSUEyZr/9uGHhFnnwHGwQf2GtpIHHJAzxHSLBE2Lw
 lv3oWObg1w8Skp/YyCwikjpPtWWgQFyFAVRuNNnKGefFxNfZ9lNB7JNcCwvSe5wjJViB
 D6b8UtUO1YQ+pTlrxMDkk5qEfzGqTCgNI+mp9TSSVsfohv0huMDTTnB6NmyK0PE1opeZ
 xGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=onUVZCBtscC5yuxfoy+zsVbxl2PIwO0NVQMjTwxZqeg=;
 b=A5YQw4F0amFOjaes72bzvtHc/ZZgoDstIEbZ3UYEcOgeJEx7VEsfkL+kroxodayA0N
 63NKS/NdHf6b9G4y7Dq30k2Jvw3Z9e8Z8tk0Pte0LvfozyjdsRl30Xe+HIIzKUaKji70
 h2mtZQCSAPUdAK+UOsshAmZNVe2a9myWbJoYV7Avod6IzJCZ5BwkjB37K2Of7eyVFeoN
 yU3KRaDHZmoEaGGK1kE/oDZGFyHQ+Gd+k19lgztRA+4U0+N7HO10hJtKyR8VFkFdVrrO
 vqsPMEB2gMsu0jzM0QQ7R1qV4xKRp3S+qkXpFDmT89POmUpkHl92+XxoFISCSaBRuGnA
 J0mw==
X-Gm-Message-State: APjAAAXDRoVkrxCL8T66xJW70ciKkPsF7tcWJXp0JVJNb8Ui6orpgpY5
 6wIf1Q1L4xTGFtGYiX+Tq9o=
X-Google-Smtp-Source: APXvYqzlYXc6UcokK2JRSKaWgD2ZROhMynTr0wgcSaUXVcWjEVFlHEcPokkxvP9YPg1EscUh8Aj16Q==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr53303pgl.103.1568742873677;
 Tue, 17 Sep 2019 10:54:33 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id l124sm2841929pgl.54.2019.09.17.10.54.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 10:54:33 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Subject: [PATCH for 4.9.y] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Wed, 18 Sep 2019 02:54:25 +0900
Message-Id: <20190917175425.20141-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_105434_248033_E6346D11 
X-CRM114-Status: GOOD (  16.68  )
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
index de35a2a362f9..8725e406a9eb
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1624,29 +1624,35 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
 		map_write( map, CMD(0xF0), chip->start );
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
