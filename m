Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F423E7717F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F9LkGKHPs9AD+2PNL1apN3eNZQStxQfS52G7i4Ac4p4=; b=mbErXH51/Bb1Yz
	cv61K6w25eKkbT6ODMWw/iGDZuOF5gmrQvyw74t9SQZB0WNy4d1d4e2H4G0aYFmSo2SNNd2F2mEIq
	wkOjSNDhrTmIpuG98NE3BoxfYyyQGyFHIDtai8v1Y1jaYhIQ8C8e9Doxwf6lAdu7FMo+0lZCyHf+O
	6GYquxLnK3D7+bPIahl7BgqnThFF+eHvOOAx1aDGPt4yqGxZ++a9/igAAu9mu//5MWMAA7Elg4Xm5
	Evl6Vu9PUvI6di5alhwkEuM9MJXg6iOD82gwpE4Sd6mncEVjcxdVW0E1hfiVdE7j+RKXBsvOFt1wu
	X+IwfxgfaIkyOMjEDl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbOz-0000000ELHg-2t1q;
	Tue, 17 Dec 2024 17:30:33 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbMb-0000000EKqI-1j2O
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 17:28:06 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5676210e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 09:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734456483; x=1735061283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2t54CrKQ6piLdAMlXLuayjxNlOTnB8dnzrCmMMQ8BTM=;
        b=PRy6to0zC8UePolccVDzxB5zQuxD0VfHbtAYHUZiB6oRgwEHDju1n4p7kpXqXauNc1
         wDJECAzLodyfV6ff98eyekZL0t8jcCELVeP53V1+QFlZPswSaNQnDbcpNBZT5h+yBoti
         6EOlO8fk7C3uGOCOXHGr89+6YwpaXmQHrSq/RA9jQcgbDI5VyMRhP9m/dzCo6Va4li93
         UBcZYkz1/A7TsVKPUKmB05huYHc9plBCoSEgW3KkywT/2viclF2vPS6HxjdibYDYbOft
         +UpJlbHnyESDCQMtFcU/3HXY8LlRdavdErGCuJLKVugEiY0joweLH7YLPYM1ykQPchXe
         oXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456483; x=1735061283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2t54CrKQ6piLdAMlXLuayjxNlOTnB8dnzrCmMMQ8BTM=;
        b=C1uLBvISQoMMn2ntQKN8iWGir9oVcTJJGyPHxfJP1OYtX9YP9slMl5UjcWQ3DAcBy5
         RFHa5tOg1zjR+p7HT4um1q7uD+CuwICXlKGXfNDCkkh0J1kEmrlYbI6BXXG1UX/okQQ+
         wiGDbdK5SrlGB0+HywCB+ogjerDsbQEwfZ8qL02m784WzxQkxARX2RkQB8mFX2MQlkxZ
         SUtRyrF9K5iXBwlUaXE9WhS0vQq83YXaPNm1Cq9PRz7A4xQZYywmFOmRCpp3n/MYQFLD
         xIHiYGjSQpT0AeZp4nl9O6NZU8BXhJZoC9Sv9VPm2Rwj1uoKxbeFvuMto7qytCQDRwS8
         JwLw==
X-Forwarded-Encrypted: i=1; AJvYcCVvqcziSbi9WwMpd9cJ0bWBbv3pELWzglgkDQorj5nd/NnlH/ACCjiS4eu9df2tbo85FFM8BfaOwc0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr5wFXAtXg3HW7z7i083Ha/dmLLUlx9QN6UM1oSNU25KkBTUBg
	q+9D0i+cz20hFNqntHQmLgy4YcOjJQPXakrW6GMAgW8t/GsfHsiB3VPMnbtvN3pg+A==
X-Gm-Gg: ASbGncuWtyPARXtXLBPzzXMAWrp25VDnFA0cH7CMcvu3yn5F82u84Odz8GvJ6F1dMoH
	OZPfcrsBo1LUbCrC7iZj3jqkJ7GZAseYCCZk1eeYfOMJwlzGSAiJpSqxlDrd9Qyp9k41sNPk5QF
	PUmyOwaexSgNMfGl6YvlSTmpFmSrb3A8DY9nTeKpUKiF8Rb8Q29gT87J2XKncIP5vYVjEF1tEO1
	zJM4gUuIqy16E7GFDTXPSxut0qmBp812sCBFn+e/BZUstLUD5rsHttClkUy1nUUT5hV6JwiLUsx
	BTpb7afUFPFuCpnGJLwoE/7cfD13Mvi1YQjFhg==
X-Google-Smtp-Source: AGHT+IF46bHcgP2gjgn1LhWjieRlkcn1UlnKAYempJ/5hwXJwjqqoz51vG/edVBk1poO+UZSW+zVYA==
X-Received: by 2002:a05:6512:ea4:b0:540:1f7d:8b9c with SMTP id 2adb3069b0e04-540905ab0fcmr5966349e87.45.1734456483042;
        Tue, 17 Dec 2024 09:28:03 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9abdsm1216894e87.68.2024.12.17.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 09:28:01 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubifs-utils: mkfs.ubifs: fix integer overflow in mkfs.ubifs.c
Date: Tue, 17 Dec 2024 20:28:16 +0300
Message-Id: <20241217172816.316694-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_092805_446006_DB1B7642 
X-CRM114-Status: GOOD (  11.67  )
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

Report of the static analyzer:
The value of an arithmetic expression '4 * c->leb_size' is a subject to overflow because its operands are not cast to a larger data type before performing arithmetic

Corrections explained:
To avoid overflow, we cast one of the operands (in this case c->leb_size) to type long long, which has a larger range.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index b5f3892..9f276c5 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -858,8 +858,8 @@ static int get_options(int argc, char**argv)
 		/* Make the max journal size 8MiB */
 		if (c->max_bud_bytes > 8 * 1024 * 1024)
 			c->max_bud_bytes = 8 * 1024 * 1024;
-		if (c->max_bud_bytes < 4 * c->leb_size)
-			c->max_bud_bytes = 4 * c->leb_size;
+		if (c->max_bud_bytes < 4 * (long long)c->leb_size)
+			c->max_bud_bytes = 4 * (long long)c->leb_size;
 	}
 
 	if (c->log_lebs == -1) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
