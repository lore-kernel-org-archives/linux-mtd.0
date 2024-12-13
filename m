Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97A2E7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZGqsemsiWgoorQys6wLHzqQhIsy4VipO8boevhzQ6Ho=; b=poyAiinR0PdRp+
	Z5HZp3LVF6W/cdeAfpai3Pyfamyt7UWFQy5O/PY6DBMNh+GjA0LJ8HLUTISMXN2W70UPhHDfVW3b9
	+lb3XSU/psS4sYf8VUhe/054oCsVXiOsm70Ovj/HPL2pa10PpUSW6ho7pWjGWqYSPUo5mydKOb+s/
	68+Ei978zHycPBZLnPUl0qJFzjoZNsNB+ELDUQNW4RfmDEfMQow8fqQo20Nw8wGCpsXAzmkRsSI3d
	K2xE3/K4hkF5clPw2ySzgauv6Zs4n4RGldm43cLv0zrpPWjj/LDYWvXWwZf4xajZzasvluPQln5Hv
	/gDLMYNHu2ZA2moVRWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5VV-00000003nuu-3BUc;
	Fri, 13 Dec 2024 13:15:01 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5VT-00000003nu6-0fez
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 13:15:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54026562221so1813346e87.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 05:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734095697; x=1734700497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFDMQn2va6F0xGCg0E7PA391AhJCA9ez7uIuROizbkQ=;
        b=Nx7jwIu70k8VtlAsFmZ/yAw8soi+Nf50cvuMo3ZozxP56uqHAq4cCb/61u/Ugpcfcu
         kZARCkkdpSwgCtvLje1aoRv660YixLWqVin8TrvxWT5eKRDUHZw554cyuoisyUkqKAfj
         ePW7jm0BK78dzug2RJnfUle2q4ARSOEnRpyLCZAbWc58hVeC8Tb2TB1Aq/CXIMOiaTXz
         QsN45p6O4kKR0tyRbZD4FdMwjjyuFfeyUPk6+HpsnZK1GUzlcJ0Rfq2jnJcJwqSvSkS/
         zBNykYMdg1BZPcwu1NpMxhe6GFZaqrGrC/yVZHWS3Q1QyHGmfj0v+AOPFv+cx8yt5rWh
         FcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734095697; x=1734700497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFDMQn2va6F0xGCg0E7PA391AhJCA9ez7uIuROizbkQ=;
        b=UeMD6INGbOb9r5HJGeKCqcVmEK+P8zQtKSIFNFI65Gae5llCkm3ZImpNG6DJazns8Y
         0VLZy1G7ChVS9mfG4idrSCAhL+k2faxsEwsJYKvbOXaQQSomCgiko1gRjrQSjFhceMZ1
         LJ3u/DDYiuhnQfQBQIB/AgkI19XeMcFQxF/2qte8qjiLIDalAppqrlLPUSQNZxspcElu
         LaOFzW7naUEYq1Dx+hcfvGodOIdWIiSb7YoaBsfy9CL2jlRKCPtc4q6pCYR9nT5lZMgZ
         xw9et5arFaZQFIA5C6j/0MhMzxVwka0gceIYm9HoW2VnyHu2aWP5REyvPpto43+vb7TC
         L0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkjzJ3kYPc/rmPdC3mVDoV3007l9kkeKtHQ5SAVMmbdAqTsDzI6V8pUBGW01yNzQlHpIiRMpmo7A4=@lists.infradead.org
X-Gm-Message-State: AOJu0YymwkNomLEotuGYl/4zEE2XKWxXHdGb1ccbMnDikyH7cn/hP/Yp
	It6+mj0qWvkPmZfTca9KqwRqhGlhTSdzV3uqwSyKrbX00AVRVZiJ
X-Gm-Gg: ASbGncutB3UxpIXSe0xLT7hTYIw/W976zh6nWYQ5SmCbbfxL4n90JqFirK2djFiE6vd
	NQmmn5tMqNtl+zMgGl1EL0OVg+Wd5/0STVBAuxXNIlkuAXdp/nn9lLlHLmQbyzKNbaqN2n+lQVQ
	95waHYxnG3G0YVkp33um7JaqfDZf1cpf4oLkG/XfHrxixLZk1kchop15EnEU/p3QSIUaziMlQXi
	LXqcCQXJA1TIagbGScimwuP4OL8bhLR3+5yDgPX6TQzHqpKAuW4IveM7KenpaKBGwInM2e2PF+D
	l5ti8CEQVrIBagQ5KIY2j4D6nGQo73R+yBuEdg4=
X-Google-Smtp-Source: AGHT+IFDD4CYqrcFL5V4Nkubo04MgwoRzrLMcKgkanjg2bxNfD/SaVEEoD4IxZoO527rcYWNpXAe2w==
X-Received: by 2002:a05:6512:3d8a:b0:540:5253:9673 with SMTP id 2adb3069b0e04-54090555489mr735609e87.22.1734095696911;
        Fri, 13 Dec 2024 05:14:56 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2f013b4csm2302325e87.42.2024.12.13.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 05:14:54 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
Date: Fri, 13 Dec 2024 16:15:00 +0300
Message-Id: <20241213131500.99807-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_051459_200769_04E388A5 
X-CRM114-Status: GOOD (  11.31  )
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
The value of an arithmetic expression 'reginfo->offset + i * reginfo->erasesize' is a subject to overflow 
because its operands are not cast to a larger data type before performing arithmetic

Corrections explained:
Added casting reginfo->offset to long long

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 ubi-utils/mtdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 7dff0de..850297b 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -203,7 +203,7 @@ static void print_region_map(const struct mtd_dev_info *mtd, int fd,
 		ret_locked = ret_bad = errno_locked = errno_bad = 0;
 
 	for (i = 0; i < reginfo->numblocks; ++i) {
-		start = reginfo->offset + i * reginfo->erasesize;
+		start = reginfo->offset + (unsigned long long)i * reginfo->erasesize;
 		printf(" %*i: %08lx ", width, i, start);
 
 		if (ret_locked != -1) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
