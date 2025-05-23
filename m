Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770C5C54EDA
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 00:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ibf7QSKkMx4pi3EUQjym6rS9BQdjvenHz/ANh0onEoo=; b=3Uz81ZgIvzPSRx
	fwCWE7XGVvh+/YZMlt1zRUVnMNDk8tSuqFW1RtzN5Q8PXVzUjE1Kh1FRoCUu9HvClBS5vCwyPZrGM
	+2AiJ7pbXYhkPsPc+ghnBJvTdblVvnIigRNKURPFN8jNXU1T0aj5y0gHm7ma4PYiswMM8lkC4IoB3
	zDub/FXYT5UHP6IkpEpdl1Emm5UY1CM6DYDvy3YkbOw5TgZvm8mz5Y8JJRX8JvOL6grp1J0Gom98g
	8wvy7nk6ePF8TglTjThyGJYSeupMNyKreRJ88kVinyse042tL3qwobfeackqrkkjdrJ9lixu3H41g
	fZSEetHS8gIRQ3uM0G3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIGCy-00000002aNt-3Fo8;
	Fri, 23 May 2025 00:24:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIG3S-00000002ZS3-1Bsv
	for linux-mtd@lists.infradead.org;
	Fri, 23 May 2025 00:14:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-231d4679580so61089625ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 22 May 2025 17:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1747959269; x=1748564069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp0QRA01GhKZcH3WzS0osTNI00rf/GlEFqf7jT8l7Mc=;
        b=bMlbq6a2lJKDAa4V68H7eKXb1UPhiv1ktqSFUMnhZl6D8d0DT4kbEO2lErn+uaydvC
         gkeYcRYw6OcP9xsTt9T4hIjJZFUl50ndNeiNA2E5BfziSDobyRdqfifpF8LmCRvaA+7a
         uqFC+/DjNux7bvS31SJtnBE8I5k5U7UWM7mPp00FimlN26gzZTW47NkNT4j7/EcqvXfn
         8/tmn91p1H4huSgTRCvsxKltU3I0yvjrq0O83u7wGEH+x4MDLqa+LVsbaYVboHwW3aMO
         fPfJ3kkeOrii0eR5uo4YXWUIx2++N7nxhgcV436kq6NptdspyN0QJxOrt17zDLLp+wEN
         0+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959269; x=1748564069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tp0QRA01GhKZcH3WzS0osTNI00rf/GlEFqf7jT8l7Mc=;
        b=MT5K8aK+43K3OKEcH+jsGnEqfTyBV+Kth/V9NP/ARldmbJPb2bWOGzB1V7BSJltwL0
         23HUZmGFtz3KgOi9sIW5w75JjgvYMWuP9+HXUWD3LOBjUMrMxeByEWJOqQo+75C03ran
         p7bj3ZFWwv49UzkRGb+ZNMkm9COXMmCfF72M7RlU/APlkKWOxtf/KYjAs7JM9zgAR4ee
         yBRy6o6sqd76tVrYhXVNnY5s/pzW/4/jWoH5wA77TJYsUFK1dOpC7qroZxQ9uk32K6z3
         6ex8M1ri2dauZ0/Q7FZTrQ1uDlCR1fq+gW1/hc+Wjb8X26+zH3ufO1o8W/WrooEzbz+T
         iJeg==
X-Gm-Message-State: AOJu0YyUy3ioHxTAMpEsgrkXYRxfkioPoqdp/9aOdqAwQn3bWTVjbjTv
	coQu4IsXVbto1jHRzxTl3IKcThjqqd/JNUOEXcw6/aW3NkANJKgMZVn6xf7atJXYtherzzOQ3In
	9pey5qYY=
X-Gm-Gg: ASbGncsXI8lSFgufHP9MY0bJklG0EmDx4SVqYsC//k9SIjflfIIOa+B4fxEwgBNcZgX
	sRdoEbBC1azDoN6YvnKvjKpavX8SntGsbtyuA/v3e0Q+/impP5T76LzH/4zt31XewEnrbS2wnAK
	aahNaPSqDgVy0F1ruZUT0kjMtv6qvZtyiWVheR/OGk984gl5QfLAmoH7wGv00N66Gu6x2hcevYb
	5syNt9uqYdH71sE6t1m5rkZSDtcRcEkvHBrHYuufccuUjaquSup92tPSqkY+nLOL+oYlGaVfv88
	nAP2l8HuY43MFR71+hn+bKv1uqNL1OXha4zQuqjRaU6SxFsqDFaGoxB6BjO+nNPvP9tWV4UVZYU
	/7/croeqmg8c439qjDYZ2yCM1UuTAKnK20KV0dgM=
X-Google-Smtp-Source: AGHT+IGyriXvVaDtGmLTkO0pmYK5X9MSri1TecWPB1OUf3Ug8GWD5/2TBrkBh+ZgQX8XZ506G6IsWQ==
X-Received: by 2002:a17:903:3bd0:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-233f262a7d2mr12221715ad.52.1747959268808;
        Thu, 22 May 2025 17:14:28 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:10b9:7db5:9893:e976])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebae71sm113650795ad.190.2025.05.22.17.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 17:14:28 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH RFC] mtd: spi-nor: Sleep between ready checks
Date: Thu, 22 May 2025 17:14:11 -0700
Message-ID: <20250523001412.878560-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_171430_520257_02381C2C 
X-CRM114-Status: GOOD (  17.36  )
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

We have SPI NOR devices that respond very slowly (200ms+) to some
commands. This causes our CPU to stall while repeatedly polling the NOR
with no cooldown in between attempts. In order to reduce overhead, this
patch introduces an exponential backoff in SPI readiness polling, that
self tunes the polling interval to match the speed of most transactions.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/mtd/spi-nor/core.c  | 56 +++++++++++++++++++++++++++----------
 include/linux/mtd/spi-nor.h |  2 ++
 2 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4b960101cc..75d3a4a1c1e3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -714,27 +714,47 @@ static int spi_nor_ready(struct spi_nor *nor)
 static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 						unsigned long timeout_jiffies)
 {
-	unsigned long deadline;
-	int timeout = 0, ret;
-
-	deadline = jiffies + timeout_jiffies;
-
-	while (!timeout) {
-		if (time_after_eq(jiffies, deadline))
-			timeout = 1;
+	unsigned long deadline = jiffies + timeout_jiffies;
+	unsigned long sleep = nor->ready_sleep;
+	int ret, sleeps = 0;
 
+	while (true) {
 		ret = spi_nor_ready(nor);
 		if (ret < 0)
 			return ret;
-		if (ret)
+		if (ret) {
+			/*
+			 * We want to decrease the polling interval in cases
+			 * where multiple requests finish in a single iteration
+			 * or less. We don't want to do it for single outliers,
+			 * but we give more weight to short transactions.
+			 */
+			if (sleeps < 2)
+				nor->ready_sleep_down += 2;
+			else if (nor->ready_sleep_down > 0)
+				nor->ready_sleep_down--;
+
+			if (nor->ready_sleep_down >= 5) {
+				nor->ready_sleep >>= 1;
+				nor->ready_sleep_down = 0;
+			}
 			return 0;
+		}
+		if (time_after_eq(jiffies, deadline)) {
+			dev_dbg(nor->dev, "flash operation timed out\n");
+			return -ETIMEDOUT;
+		}
 
-		cond_resched();
-	}
-
-	dev_dbg(nor->dev, "flash operation timed out\n");
+		fsleep(sleep);
+		sleeps++;
 
-	return -ETIMEDOUT;
+		/*
+		 * Exponentially backoff the sleep, but hard limit at
+		 * 1ms to avoid responsiveness issues.
+		 */
+		if (sleep < 1000)
+			sleep += (sleep >> 1) + 1;
+	}
 }
 
 /**
@@ -3449,6 +3469,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	nor->info = info;
 
+	/*
+	 * Pick an initial sleep value that will get downtuned.
+	 * We want this value to be higher than needed for most flashes
+	 * as it will clamp down to the fastest transactions.
+	 */
+	nor->ready_sleep = 127;
+	nor->ready_sleep_down = 0;
+
 	mutex_init(&nor->lock);
 
 	/* Init flash parameters based on flash_info struct and SFDP */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..27bb4243db64 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -406,6 +406,8 @@ struct spi_nor {
 	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
 	u32			flags;
+	unsigned long		ready_sleep;
+	unsigned int		ready_sleep_down;
 	enum spi_nor_cmd_ext	cmd_ext_type;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;
-- 
2.49.0.1151.ga128411c76-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
