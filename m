Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE02E7718A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AyONMzMSx6x2tYbZT/9kjREz49wrXY9TSh3tzj1PR+0=; b=vFvIsE+OqA4jLI
	8dgAOZnkQCKHDNo5VrwCl5B+0ra/yTbMx3uWYvnwH3UaSWV7HxFlKZvdnvqYQTK2iQXX2VH6sxRXn
	Zzr5/gW2ppSYL/uaQjIFc8cOtRtX7sG2VnUXEeB17+OkU3Vq23GLcKOZDeYVxsykd0Ia/v2lVDkR4
	RfOjPvOfWgGrp5IOJ+MPdQ2DtmsXo+s1hm0q+1spVMBKlaSthFWencDkGLdsayXnt7PwV8nwXyTBk
	B+7xHejdj/m2cxZRpYqojS1CLx0IH516kBfr7EMylCfuTyglB+dAPUYJOLobwwoISHtTamNPj35Y3
	ww9dTF+BBZ6nOfd/S1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGqo-00000001zA6-3ERE;
	Thu, 19 Dec 2024 13:46:02 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGqm-00000001z9f-0XPu
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 13:46:01 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3035210e2d1so7317101fa.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734615958; x=1735220758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8gZxHuIK+wQHK/yGo+a2WNfecIdn10k4LCF0ZQP6BY=;
        b=TpX1FfXE0/E4u5n81KxkyaU0OxGOdpEqR+j71Q0UvvVXD5E0QI2fxG8JzfQFFSvL9f
         UpUZaDIGcZn8nUyt0qQBqNBm7MSR99++QErs0bJlOBlcz7b4qW6Sz1jrj5TNGq5ovt1/
         lTZE/9D9lCYT5mVf4EMC4LWFKmSrDv5SMPXziIKOV6nB/SOZZF3Pz933+elVLqg3SF+9
         LK3bfok8t/b6dGjrRzF/U9mUW8HA3ameVNv3M7IwpjLUziL3d3j0kqEbyz/m1DaSiJ8l
         d8VQvT/nFbwPiEc7ME6zbeZtTVw2jK740nG7GFBPBsCWsx+St28faCOzXCE7+X3Mrv1c
         lNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734615958; x=1735220758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8gZxHuIK+wQHK/yGo+a2WNfecIdn10k4LCF0ZQP6BY=;
        b=rT7jY0iqsXqzgQ63AZaw3UkDObONjIy3eTw63bLgnlwtv2yATlvdiu8k++b5zpvOue
         hXGQqJXdHbHnT+UqdI12+iCpv92EolqT9DPYhuSJZWlaXiyVob+YXLW/DQqofLLvWNGk
         4qIN/SCMIU0gneO+/3QCpIH1N0j72Rq2AINez7VC/PGjmT9DN51CXNUU7O20YfB637vo
         P68KtDnamQLqiHvKtHxSFmdVluMgRniPlvcINc+/Sju4OWrd8Bxj/cLEB3ZiHpgc11H5
         zLnFJ7yxbvi1PvHoHBVvC3jDllBb4Zwzm+FsQs8IuXrZH6l10XpN9Y/zkMRVwwNVAbtK
         wt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXO6IfC7JPnjVThs9qf3SkOFeOkTVfGeMrN+BKTv6OKOseaFNn6l1a0lWMOME5QiR9Bhq28FVHH2qU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqtuP6tY2Lh61dPEAUrk8RUgEz6l7BkAH+XxYemyAKD/3O4UiF
	I2c76OhFMWy+or66g3sEOn0TX2CXKt3gyDtmg5HLiafKaErEWuzpPcIRq2JysKlPYA==
X-Gm-Gg: ASbGncuPucqT+s8+IT+R16GQlwV2vay6mic+Got7qn2U+eNu0yST5Syk7H5yd0S8H2I
	022Ll/pY6/yUtRCetlOpY5bo59tVHjQM9LxgXrzNaP7iMO+W7XGgBFd0/w61Cvv2lU016LLQxJS
	XMjO1iF7rrc3O1z/DJSOqpditgsxHJ4dY574FKUr6OfVhiQuNYjl+lUjXw/DbL8DHo8R8w3BYl2
	LJ64T8mr95iLyRnYwazFI7f7CpoCNL8eKtI5FKK/qbyF/2G29HInzFStDspqrMJ4knAe4OwNoVz
	KN1F034ZDRIuJ9Dk399rFJKjRKBKV0mRwmtxTcg=
X-Google-Smtp-Source: AGHT+IGjV3Owj/psFcjzVPvM9VFKJNnWfEZm8uEKBxHHXqiAiPFsIm4YGOxVQ6kzP8l1RuuuIZsONQ==
X-Received: by 2002:a05:6512:32c9:b0:542:2137:3a2c with SMTP id 2adb3069b0e04-54221373bbemr1113880e87.24.1734615957673;
        Thu, 19 Dec 2024 05:45:57 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223b28722sm164069e87.243.2024.12.19.05.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:45:56 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] jffsX-utils: fix integer overflow in jffs2dump.c
Date: Thu, 19 Dec 2024 16:46:12 +0300
Message-Id: <20241219134612.711532-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_054600_167755_1AC9DD32 
X-CRM114-Status: GOOD (  11.65  )
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
The value of an arithmetic expression 'datsize + oobsize' is a subject to overflow because its operands are not cast to a larger data type before performing arithmetic.

Corrections explained:
- Added a check to validate datsize and oobsize to ensure they are non-negative and within a safe range.
- Cast datsize and oobsize to long before performing arithmetic to prevent potential integer overflow.

This change ensures safe computation of offsets and prevents undefined behavior caused by overflow.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
---
 jffsX-utils/jffs2dump.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index 30455ea..5b0e144 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -772,6 +772,13 @@ int main(int argc, char **argv)
 		exit(EXIT_FAILURE);
 	}
 
+	if (datsize < 0  oobsize < 0  datsize > imglen || (long)datsize + oobsize < 0) {
+		fprintf(stderr, "Error: invalid datsize/oobsize.\n");
+		free(data);
+		close (fd);
+		exit(EXIT_FAILURE);
+	}
+
 	if (datsize && oobsize) {
 		int  idx = 0;
 		long len = imglen;
@@ -783,7 +790,7 @@ int main(int argc, char **argv)
 			read_nocheck (fd, oob, oobsize);
 			idx += datsize;
 			imglen -= oobsize;
-			len -= datsize + oobsize;
+			len -= (long)datsize + oobsize;
 		}
 
 	} else {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
