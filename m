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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801FAC4CECD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 17:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD9B2067B
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 17:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t4336QLE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1SGu4Z9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD9B2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7a0NBWvyUfivTyYaiVCzcWI5RpBKP/4agojnG863q70=; b=t43
	36QLEYTo0x4wRzBQG+TQw4qv+Wi73YAcSXGv7dRYl7JtqceQVjYMin/QWiBHF3VLVQzBR2NGQBRfT
	I+aZnNwazZrpSQnzm7lfI7QF4zN8eboPv5qbI367M4kuh3Xr6KLgE8jj7SAnpAx5z37cX8XIFfF0M
	3pIQ3nPeMg77HVquALNv1ty0Cc0yzIZLRc310tSr0c0ZMDpnThEjjdzh42qzbU2+DKV2+C1SytCxr
	gyYOsTv/o7BXE3remZzXMHdVafO7LzkLRfyHUd9PphuOrranBOu+JjM1p0NbcMEYdJLWegPrLcqBR
	WNAwt3nFUsU7Zd/Jw3L3TE2YQQPHBeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAHdg-0005oT-Gy; Tue, 17 Sep 2019 17:51:44 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAHdd-0005ny-EZ
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 17:51:42 +0000
Received: by mail-pf1-x442.google.com with SMTP id b128so2610176pfa.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2019 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=arc0Q3//8NiGztCishs5Ian0XaU+QKrsL3I7zsZs3HI=;
 b=C1SGu4Z9wn3/SidESbKaPc9/so+NbfhWdmhudo1z7/dvSNZsjs/01bFMTazMDHZx8k
 xmig8u8v+Kq9OLln0kvBesOdhSPZrFCFFV3eqkBeFX6h9b8ydFX/FCuaTDTZhfca2vW6
 paqVXLmPQD9oS9njOuHha1ykKrdS7XrWz2Tma4zwsmLZX7ekBBd6qcJbp7IwEN9t2c8r
 IW0nFO8TqbQxv11TMQJRYhSIMQNRBLs5kQ7rj1OETQJB6/kbEKm537R785PgShWbVx69
 l2qIP9vfhSk7FXBOKamQapu9bzzSZds/USIPngDOllinkXdM1V9kzcdNAX3eCWzw3SGD
 824Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=arc0Q3//8NiGztCishs5Ian0XaU+QKrsL3I7zsZs3HI=;
 b=oa/5I8Wys18A+y/r/cyL/ZVmG1VNTU6Tn7vIb/l2dhDXwsJY1hiOBqM3+87DOk8dJB
 6H318kZyirEvwwMqaF0toLof7OIViYxraCu2Wdms+XfpSxUKXMdtXNz8gLUD6YT4dSeU
 9TpWOfa9zErWsHShyY0nXKNDa3iavKalnn25WwTf52gPpoi0UEgw0CqK3QanWFjrLMQg
 YeHuNR/ngSPexJAntmfmx8Q0MHOyaM1BGAGp0Gb7TBilfes44ieZVzau+fZ0Qa8cE9Kg
 MDjBwsF7DXn6dnLpGn0KPbI7z42ytz5+vegHl5y68XKRBcwgsB9SYBsUfyguBIpqGh4L
 XlzA==
X-Gm-Message-State: APjAAAWsZKMngs0OvZL651m4lqDZ+FreIMy4yxSQLuQT0HMM05o43FKf
 ZU+LxbLHOkI4Cl+ckl+HsVE=
X-Google-Smtp-Source: APXvYqx21Iqp6XLCjswc5VV2O1jafFLvq+IEdCTeBHMIVU7lUlR3X5S5YALsRq3siVl2K60Ra7rWfw==
X-Received: by 2002:a62:788b:: with SMTP id t133mr5568345pfc.218.1568742700286; 
 Tue, 17 Sep 2019 10:51:40 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id y80sm3353310pfc.30.2019.09.17.10.51.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 10:51:39 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Subject: [PATCH for 5.2.y] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Wed, 18 Sep 2019 02:50:48 +0900
Message-Id: <20190917175048.12895-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_105141_516742_C077113B 
X-CRM114-Status: GOOD (  16.66  )
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
index c8fa5906bdf9..ed3e640eb03a
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1628,29 +1628,35 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
