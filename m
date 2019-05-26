Return-Path: <SRS0=EZ/G=T2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348C3C282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:40:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 059DA20815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCK5KWKF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uxb5ic7r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 059DA20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cFavVK8HejD453BUOpfcw3LhZyYQT7z4pLuPY3QpnxE=; b=oCK5KWKFWcWNchzrYfbQtD0f6f
	Lg+WXEp8nfeS9emkWBmjLXMrF3IAhFBWnYtFyaC6KUjCKg73eMm96+QN/dzynv/1MxsVrhsVDk75S
	d4zLY2hKpfJsvAOjHGhLDaWhoGwqExIJb375cPv8nEzRepGVJujpqHvWR0Ysrcjq7k94NEvzXZvsi
	sDdJvkIxTAA8+3eYfIr221ohKHh7mIDmLsj9FrVAqE4ZtEsc77fLiTTANrmRU2nV0QbmM6+x1YqW6
	vsj6N2ekdHwm/wPnktPTB3AbjDR/0DvvAafN+Y6twZUzEkktLpZI6CBT7vzcsMMOdOX0SZV8swltg
	PUM0PGTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvGZ-0002AO-M0; Sun, 26 May 2019 15:40:55 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvFL-0007uu-Va
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:46 +0000
Received: by mail-pf1-x442.google.com with SMTP id u22so796256pfm.3
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8/8Ddd/nz7LQ52CTh3XzT80IEsI9tKMHyvxNDRT+tkU=;
 b=uxb5ic7rOsMzK+saQ2hBgcBS1YIfK9ZstjGR3FWef+fCb4Bl7UIhp/x/YpnZQsdwfp
 spt+L6V2+URmKB4kLeMEVMSscrLrZ1VZT8xJR+cd1gd5E6kB0wEQZ8lo/5p8ycVYbTL7
 Pr4sElx6R8/F5l5jG3RfB2ZCDovdHG5vhCe/dWMZoGrnq7ZGIuhrk8wuUrtvPFIe7cvQ
 81Eb5SvWFAvmViDfZ+aTXhpnRIkbUnLljwQik2tQAKfgXIz1IXf/NB4Cj17Wev74ABHH
 hw//7WbB8/7Gbss0Pt4hd9EMLfetin3Z4VYjHnRgpXgYY3ozS5M+rQnRndlLl6EXZBOa
 DT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8/8Ddd/nz7LQ52CTh3XzT80IEsI9tKMHyvxNDRT+tkU=;
 b=nvju38XHCRaZPm3K9QnlCFlLJrPKQ1rUBgEussxn1xJbNuChwviPdvD6Y3/buc7WXW
 3NP9Rh3gxnKIDbaTStxoxn4KCaxrDvU2vWuQ6fzOcp4Q53facMJrneOYVRrPigTHngx6
 +WLlFLYI5dbUg5yVBVGazkjVi7xby/vk48D3nTcC3GHVKlhTM1fFekRkl04sJTC3RZRw
 oNtUQi6pq2x06oFz8TtMtPM7TVr5vo2nx2oymuD0GQihkrk5ca7lyDs5WVZBkzwkHFz/
 mbyh43ilS6bGucC4fB1sSKbrZy9wIiXdoklkL7vYjdtq72vexK9L07GjZqxcTHJpGGy9
 TCjg==
X-Gm-Message-State: APjAAAXINh8aHzFKjkeibC5EEqM6Lt4u5Dn5Q6SjUgp27Hvl9YYuM5WY
 kFxyo6/f2qC+DVcYvV9Lceg=
X-Google-Smtp-Source: APXvYqw56n3g/qVMh0poczuL6NXfLEHs8CGj9SX8ILIBxDYzJYB8Kq28OX85AxFXeu7SuzQUWVtG2g==
X-Received: by 2002:a17:90a:8982:: with SMTP id
 v2mr24520237pjn.138.1558885178968; 
 Sun, 26 May 2019 08:39:38 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:38 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 09/11] mtd: cfi_cmdset_0002: Split to wait write buffer to
 check if completed
Date: Mon, 27 May 2019 00:39:02 +0900
Message-Id: <20190526153904.28871-10-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083940_391228_28A1808B 
X-CRM114-Status: GOOD (  18.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Just refactor to split the wait from do_write_buffer().

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
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
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 89 +++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a3e57788bc40..ebf420e1db43 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1825,6 +1825,55 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static int __xipram do_write_buffer_wait(struct map_info *map,
+					 struct flchip *chip, unsigned long adr,
+					 map_word datum)
+{
+	unsigned long timeo;
+	unsigned long uWriteTimeout;
+	int ret = 0;
+
+	/*
+	 * Timeout is calculated according to CFI data, if available.
+	 * See more comments in cfi_cmdset_0002().
+	 */
+	uWriteTimeout = usecs_to_jiffies(chip->buffer_write_time_max);
+	timeo = jiffies + uWriteTimeout;
+
+	for (;;) {
+		if (chip->state != FL_WRITING) {
+			/* Someone's suspended the write. Sleep */
+			DECLARE_WAITQUEUE(wait, current);
+
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			mutex_unlock(&chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			timeo = jiffies + (HZ / 2); /* FIXME */
+			mutex_lock(&chip->mutex);
+			continue;
+		}
+
+		/*
+		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
+		 * the failure due to scheduling.
+		 */
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
+			ret = -EIO;
+			break;
+		}
+
+		if (chip_good(map, adr, datum))
+			break;
+
+		/* Latency issues. Drop the lock, wait a while and retry */
+		UDELAY(map, chip, adr, 1);
+	}
+
+	return ret;
+}
+
 static void __xipram do_write_buffer_reset(struct map_info *map,
 					   struct flchip *chip,
 					   struct cfi_private *cfi)
@@ -1855,13 +1904,6 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/*
-	 * Timeout is calculated according to CFI data, if available.
-	 * See more comments in cfi_cmdset_0002().
-	 */
-	unsigned long uWriteTimeout =
-				usecs_to_jiffies(chip->buffer_write_time_max);
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
@@ -1918,38 +1960,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				adr, map_bankwidth(map),
 				chip->word_write_time);
 
-	timeo = jiffies + uWriteTimeout;
-
-	for (;;) {
-		if (chip->state != FL_WRITING) {
-			/* Someone's suspended the write. Sleep */
-			DECLARE_WAITQUEUE(wait, current);
-
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq, &wait);
-			mutex_unlock(&chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
-			mutex_lock(&chip->mutex);
-			continue;
-		}
-
-		/*
-		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
-		 * the failure due to scheduling.
-		 */
-		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
-			ret = -EIO;
-			break;
-		}
-
-		if (chip_good(map, adr, datum))
-			break;
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		UDELAY(map, chip, adr, 1);
-	}
+	ret = do_write_buffer_wait(map, chip, adr, datum);
 
 	if (ret) {
 		do_write_buffer_reset(map, chip, cfi);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
