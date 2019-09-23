Return-Path: <SRS0=TNJo=XS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680EDC3A5A6
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 02:33:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EED7206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 02:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b9LPoVo1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6TfXXWA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EED7206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6JyG27AY+09Um8GqJkBQcmAZqCPx87nRN8yjjOx3HPk=; b=b9L
	PoVo1dpysL4GueNxBKfmbTh8rVolKJrCEQC3Ta2M2C3Hd7O5hvBfypm/HGQac1H2TEytUCGGdL9sy
	BLenpgBdb3gobGZIwTYSnW6bgXRGTlLCOr3mG6zSbEJ/CP1JudKXRhx9pbZ0BfMVXIXGR69pQy+q3
	ojqlUj3OHyNaYhqcMz6jTKr1IbyKwFbIpyIgERZvrblNco6+0sgA4Ug0hWgSMwNduzjlxcA3pq57h
	gGa7eG7sLnsg8YpVgr0xfI6XBoeQA25Yom3/DCzh2KiVxeV6+IUK2UfXgQElzufmCOeRTNEmDH5O4
	vDZDnooZ+U7Wb9+UUeIdaP5XOKgzX0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCEAS-0000mF-Mt; Mon, 23 Sep 2019 02:33:36 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCEAQ-0000lF-MH
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2019 02:33:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id q21so8168834pfn.11
 for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2019 19:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=L0CPgCufl3kk7hZTqN/fh/41VjDv8bX2l/BiIIFM92U=;
 b=k6TfXXWAJvRs1psBuPG1jMNUkik0szqKx/RocEFaswy2giB3LFcf4QugLXSmJLpBXD
 P4xlqNBqjO31tkqY2Npm2qH6lI/cVNw1NR7axGvWUQOHWP5XpvSbZEZu9a4+RqxEZpqV
 M9ht42Vi7WgBIdwKefDR5OztOQ/ehVxGGtRskxD6Bg6PmMUQAbEOCo+CLq/sWvnWwXJ9
 IUsgrfGKS1LYl28kNYrFFa3VLlUDYGNUQ6DOGP7pl8oouPbgABgT0VkECbvg9a49apyU
 PwmUgG0P3hf1QJSptFfsBeFeUQZJKqcROVaeunNxFiM+pkhDDT3BZaIaDHa8D0bdzeQM
 uwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L0CPgCufl3kk7hZTqN/fh/41VjDv8bX2l/BiIIFM92U=;
 b=KdVzMu5zJ5dUUFcK1NXUgL1pKfQmX3+EXnkSsbBVg+JI3iV/3V7eUvsy2AE1hYkX1Y
 oMoTFBF224LNATP4cN8Gu7OxkBW1uN4F0WTLkZBNc2m5bavLRhhSZg8hZ847Td8B6e0v
 zAPxV2mTZJRHZ4Ol5+CL8GZYJRVrDqeUucoej3cgDh9W3v5HoGmMb66XDvDDND5iO1mL
 +I+zLZcnBbjvU1JP2MTf7KVgmFkp6uCYzDp/lOmskKnTO4/koIOFyaEA/jzkNa0fHH4c
 3JK2nIx/zhDxBmZPwoDlF1r4DWgcXScCfStRmDr9Yt/x4y/ly/jIk2q6oVUOWv3CjRm+
 TDkw==
X-Gm-Message-State: APjAAAVPqyWoVsout8j2fC9RK/NIGANjNpJINaN1wsyYD7h+4MAlAZKy
 HXBE0/mxBtdJFonuy2D0V/Q=
X-Google-Smtp-Source: APXvYqy8JAFETTITBduEzj1zkSULkQzQoDOhOpNX2B3aJRWsyOz1XgaMD9qnrpqwQaEhI8O+TuHVSg==
X-Received: by 2002:a17:90a:7f89:: with SMTP id
 m9mr15098423pjl.30.1569206013055; 
 Sun, 22 Sep 2019 19:33:33 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id i126sm10010566pfc.29.2019.09.22.19.33.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Sep 2019 19:33:32 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Greg KH <greg@kroah.com>
Subject: [PATCH for 4.19.y] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Mon, 23 Sep 2019 11:33:26 +0900
Message-Id: <20190923023326.20230-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_193334_725553_E4D968E2 
X-CRM114-Status: GOOD (  16.80  )
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

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 72428b6bfc47..ba44ea6d497e 100644
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
