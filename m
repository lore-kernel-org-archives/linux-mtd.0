Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB72E7717F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 20:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6klkb0iVm9Wu1pKNgkimLWROdi/SDOH5jiVyFwQgN4g=; b=Xs+Tv2YcLceG02
	AjroXqOmTRFhZoG8R4a3XZGZjGd8N85FMPq829/JwoFE7xx/65R0rpSffxQGT1IrbcJ6u8xNwHaO2
	sOprU6gjNkrDnUi2CxGK78T+FR9b7DKOaJz8/Svg/jqDjA4w0jL2Cd/XylP5p5n9eu3mA7lpDGqs+
	hNK7uvOJFqDWddOCkG5TOZ1FcwVIqbp5T3vCbF5Gw0gYpGOdKXz1ICtVJJQ7Tqgj3kFG3yOCvneqc
	zSPk2JKQ/ou6IltBQoD/H169XREEuSSnFpLRDT5+ch/2VUXjKwfweSAldx9ZtyqehIbXVRxAPDjkM
	+mAlbjpsvDRj/7olXp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNePN-0000000Em55-00Lm;
	Tue, 17 Dec 2024 20:43:09 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNePJ-0000000Em4O-2kDa
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 20:43:06 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30229d5b1caso58258571fa.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 12:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734468183; x=1735072983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XyVLk3q2sonALF+MqTAOvJbPXZyYdr+nfKYD4flnZbs=;
        b=QwxIMynK5Ao1SkjRbo1//BcVo+YmSKWNC+rZc+FY3Ueh22VYP8ll4OdUfTJoFFiiB+
         nxASbEpLDYpfz4S24sklQNoDWB4ghOiGHJKJ6fAw0XtnvPNm5ZdXstaxUbK+BdF3RHZL
         LKpBxT/7EZqBYUsP7r58j/+m/rdtxQDWjrCc/39TA6g/YEAdO5Gc5/yrM4AhCY/qdfV3
         aqt0BlaX6GhUd+5wqOcmq73fgYRZCndM61BNOVF+mnIggAd/RAm7cw2Q9nG2qmH24T6o
         8z/cXrWVEGFTXVgSukQGfLW5TuMHEHZpAQsPrtmYrWUaq9sVurFmDqJyxmWPQ0rESUC2
         DReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468183; x=1735072983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyVLk3q2sonALF+MqTAOvJbPXZyYdr+nfKYD4flnZbs=;
        b=MrDBWK4lwGMOBwVIQZw7coq9eGXGeQfK5sieukYKaGmCwBe4MD7UD8O5FQGBjQX3PZ
         Ql+NIbzWCh2pSsdZcw03JK2biaxh8ezzny1D+HlqkNfArbaF9E9OhhagWHfkA0WOm03I
         A9rrFscSnwqWYD5fAY/aF85ATycCnsaQiS+ZlE4nbq5dYDx3+mMfqnYOCWkogddlWAp6
         LEVmhbi6Tqe2HHANJGgDoj/76b1ykPRaweq/k8WZesjYWfaeV5t916YvbtP6l3/IBQTb
         WePK0vUj8zdM08um9ck3az1prqLtdD5CLuMG29SXf2ntTNWbiU9I+Wig0RoQGpM4Y/a/
         umAA==
X-Forwarded-Encrypted: i=1; AJvYcCULpyUsI3QmtQDSAkfR7affKw5mNJH2ikqIuH9HvsHN4LpPQPwP2MxooV32H7blrSs/QEi81F1Brsg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrcbK594bO+Ug3cuIzxZhV7YnloOHSVSEVY++sHuyzaVAlyjPt
	jKV0EyWsTuAs/EwSCReah/7t5NjiQbyzxkQCST1l+RytRPFwo2VrTyl1pdTVgIZ+AA==
X-Gm-Gg: ASbGncvwogJ+T/7lG7D0ysA/zPQfEhT1dOTseCLzWToANRKDH9UVCyZib8qepk60udx
	OKf63flhPp8J4HmTjsFehxhUlZbS2ZGfJUPebGVkhyh2VKXNBvCXFS45creHmz1/1R0JIKwmD6L
	dMJRHnc8RvFdUaCSXCDCTrClzYyqgLNqje+GXj/R4/zpMj+0vPdaJEimaR/YQXhPqfuZndsjcz7
	bOAU2qTcX000i8VN+bTJRO8+Jc+EBP99lnzt2A9pRPmE0wP3fg/CKbRxgWWjXZid7tGTjidTran
	UT/bEhejQlo36uxebFgEpapieYkAVowuxqYIgg==
X-Google-Smtp-Source: AGHT+IHh3sAxmT7kF3bXrW/JZXaRcLranQrxBOsqx3OMsMyCYRLxHq3rf4alWY9OVc0zY5vyrAGGfg==
X-Received: by 2002:a05:6512:2807:b0:540:20b8:7341 with SMTP id 2adb3069b0e04-541e674453dmr153088e87.8.1734468183146;
        Tue, 17 Dec 2024 12:43:03 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00328sm1243943e87.151.2024.12.17.12.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:43:01 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ffsX-utils: Fix integer overflow in jffs2reader.c
Date: Tue, 17 Dec 2024 23:43:17 +0300
Message-Id: <20241217204317.383644-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_124305_713338_570DF694 
X-CRM114-Status: GOOD (  10.65  )
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
Pointer 'path', returned from function 'xstrdup' at jffs2reader.c:690, may be NULL and is dereferenced at jffs2reader.c:692.

Corrections explained:
After calling xstrdup(p), a path == NULL check has been added. This prevents a possible NULL pointer dereference in the event of a memory allocation error.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 jffsX-utils/jffs2reader.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/jffsX-utils/jffs2reader.c b/jffsX-utils/jffs2reader.c
index 87a2167..f776466 100644
--- a/jffsX-utils/jffs2reader.c
+++ b/jffsX-utils/jffs2reader.c
@@ -694,6 +694,11 @@ static struct jffs2_raw_dirent *resolvepath0(char *o, size_t size, uint32_t ino,
 
 	pp = path = xstrdup(p);
 
+	if(path == NULL){
+		*inos = 0;
+		return NULL;
+	}
+
 	if (*path == '/') {
 		path++;
 		ino = 1;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
