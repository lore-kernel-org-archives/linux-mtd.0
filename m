Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33642CF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 20:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qLAwvAwgpyceNMk7n4cyJE69a5Ls1lVdAZwKiJASBiE=; b=yGhtzCJzfa3lAq
	b2zYyZUWhs7tNwWwcDjhpj1r+McvV/AmdSwI5kQbmpNpkhS/3XHwF6NY6axR9cFkbt4ulNUFzmM0u
	htEqC/0QqdjCCmAV/MUI/jEVw/DsGZtyhjDBQJIgcgh8hDqVab9RMLCM3CGicvgW6qkamVvVuq3zk
	XKtQHckFNqcwe8dmuYwqjApmiflJG4r81qtoCJJyH2Pi4GDARCw2fgzWSIjPXJgtJl/QR+bgA4tH9
	q7yG5jOa4eB8SY7F6PPe/ZHN/Gb8KYcR0LRyuh6rnS5eG69DCW6HKr+BNGdvRGc4kRNJTmLgxCZ42
	fwyL5sb6sIqxkzUjUBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sspvh-00000000Sgt-1FWG;
	Mon, 23 Sep 2024 20:45:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sspvd-00000000SgS-3uBd
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 20:45:07 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2da4ea973bdso3789309a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727124304; x=1727729104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwYgGW4Hkal4dyK3ptLG18HmvynE977o35mtNmIrZ/c=;
        b=kTQiLnXXW/1ehP1bgIphlhuI2kP+6f57Rq7B3p+zk4Eunhh0qeFxhx16YDMzJU9swE
         sLO87dlpFxlv8soiEpl87DgKUGbGyHqqY4iX0ZBSaiWzttUOlQSYnG/1xSa15FAd7DEG
         hVo38mIpacQY74wCgjXPFerfNh4bhXHOk4sptth3v0JyYJhOdqMUIgsJKvycB7tSK8NJ
         RqzI05mFFuDzdrz4+Sd1wmy9D8pZYQtor7w/rTkQ6+b0nbJXBH4sl1Tqw4WJzOBa98hW
         b5R4qqzbGRAXtcbxGTQjg8g7UTlUmTX6j4BvRu/HIEe2oHxwLvUoZ0pmDGQlme6lqdtg
         5Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727124304; x=1727729104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwYgGW4Hkal4dyK3ptLG18HmvynE977o35mtNmIrZ/c=;
        b=DWKcS6ilrbDF+wJqWg9OCW7aXA4auho4Skjn4pGfSAYp/6wnuWPljEuqBIQSb7IKB6
         9w5ba2IEq1pdoF0UrTQEeJYznBFa+jEgHRWP3CC7Af9Li3LlprEAWGG0rrBkXEysH6il
         60VPHRYoOSyd9Q1iLU7lKolYli3C8DrZqI0HmuVXynNxMQZUZzANBLn70im9C02laxxZ
         DKwExSMLik1lVdtVyJZwmTVjekSQ6LwWZuWOM5CfeYKCE8URWt3+2qAezqv7l/9NgVhA
         u3NSXo/InSjmd4RX3DEJfuNHMvZBXT4/VKoSbWg4gG9qNiGTEexHbafGcnp9WqPiNIxo
         grrg==
X-Gm-Message-State: AOJu0Yz8jgMMlE07ar3ZobYnp30JGVpiPVqcq/tQQiqxiJABQbnEwpB1
	cbGqnKjIBje1GYB/fNe3XNneUs6+VOOcJAVRsiWeOyv9amb4yvZcUEecFQ==
X-Google-Smtp-Source: AGHT+IHImAOlqWVfA8OmQwXGnNMEBOdZ8aF6dlnx0qu2/SJJMOQvDwckv/1DbS3jQdoA3H3qkz2ujA==
X-Received: by 2002:a17:90b:80c:b0:2d3:bc5e:8452 with SMTP id 98e67ed59e1d1-2dd7f71b8ebmr15937134a91.32.1727124304359;
        Mon, 23 Sep 2024 13:45:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ee7bffcsm9962173a91.8.2024.09.23.13.45.03
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 13:45:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: also check for static libuuid
Date: Mon, 23 Sep 2024 13:45:02 -0700
Message-ID: <20240923204502.823673-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_134505_999625_0AC6C385 
X-CRM114-Status: GOOD (  11.16  )
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

PKG_CHECK_MODULES confusingly does not check to see if a static version
of the library is available.

Actually with older glibc, it might fail as lpthread needs to be passed
to linker flags (Libs.private in pc files) which can only be obtained if
--static is passed to pkg-config.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 configure.ac | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cf3a959..6222356 100644
--- a/configure.ac
+++ b/configure.ac
@@ -145,7 +145,8 @@ AS_IF([test "x$with_zlib" != "xno"], [
 ], [])
 
 if test "x$need_uuid" = "xyes"; then
-	PKG_CHECK_MODULES(UUID, [uuid], [], [uuid_missing="yes"])
+	PKG_CHECK_MODULES(UUID, [uuid], [],
+			  [PKG_CHECK_MODULES_STATIC(UUID, [uuid], [], [uuid_missing="yes"])])
 fi
 
 if test "x$need_clock_gettime" = "xyes"; then
-- 
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
