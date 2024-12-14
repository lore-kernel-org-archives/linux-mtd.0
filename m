Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573A8E7716A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=38ZzLlo/pRiiStorjXRszo3KLkyEQdawmBjwxZYrDDM=; b=PxKlV+FmyDJz9n
	qFMkxvoz8aiH5MVBBromk8kJNQ9AFjGtI/FM01M56DREMoTFPWsXUsDRjgcLD6kEBVgaxw9JTtDTS
	4fnqavmtDIglLBMozY0gJsqsSapFD9Tw7R9cvlLgVqks+y3eAihl4lCfyaA04xBeRHmO5GvHiy/fD
	FQepm+Z86fxwMQGAQSNFRDkjYxX28V+qTj0QQWsjrKnW5i0Ccq4SIrCMSZecxuwsfIeMJdrvojBxN
	mQIyMBF9HYfBqJI0D7JnewG6zMovfkAQLp+SpssBsn4wThcLrWN8R2U6zcVRF6DphSOPEljxny3IB
	cu4VtqzOeJmJO68mA4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMR2r-00000006J0h-0hon;
	Sat, 14 Dec 2024 12:14:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMR2o-00000006J0A-0K0o
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 12:14:51 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53e3c47434eso2604928e87.3
        for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 04:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734178488; x=1734783288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQmBLrjEe68XwJgLR3oOQcMOmKu+F6Lw7UCBGUFLZvA=;
        b=bS8DN+i7NC9cLaXjCBhuWSWfWGv3117DagidsbmFS1vcSA1YbjpwfcwpAveXcvvTz8
         1PcZ8F9nBG1w/HZ/M8uMvVn0aSpPl19obYcTVKD9Kcyan6xu/ZZni1x3iVIccJs4malI
         H/AW6kysoGsss8yZq+mQrU/7KLvSbDhQG6zN/c7zrX+FxE+hLO8lsR4585TWR8IT9FY2
         JR2Eg4qRUuYoITeDT95/FSezQMwwYRl76PiQEAiuebk2x/pbNcEOmPlqk8fD7a+Jayoa
         XIvnqcsi//bRP/3t+rduCJy6IFaFDkviVOeaCI6QlFTzvrb18XzfvMhUsAHL4r7OhX8e
         sURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734178488; x=1734783288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQmBLrjEe68XwJgLR3oOQcMOmKu+F6Lw7UCBGUFLZvA=;
        b=am3zo3Va+fxqXG+53Oi6sMwidKL5MtzfJauUc8P2yRpK7DoSMxugWur2Ovb8Bohyyl
         76BEuzZc/svAecRRb9gmo2zbEg5C6tB7C+20XIOM0kl5hNPBc91EqPAhGasUXeD51pXW
         aGU+sy4c8uC1/rMwg92UzqvDnw+fzJ7wRMWeOfTLhuqCTfFqY22w7HtwagoAGVYvI4Cl
         wWyLDQtrU+Cgk8tovVqZmMZny1Hfz82PAtQhDLSqkkWHBTKDdHwyyguqALBL8tBXNcnN
         4KqS0UKDwesQLDmDnG77erfqCpTe7rnzbTOXHx+EvmzrDATj+cDvcKREkXoRjBkQN44B
         0+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnHdRHu63m+qdN7g9tEY86151djiLJg3GVpmlQL0JmDsnoWz3JySYMPWyrpDBcWirWC4pfPBJ4gXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/QHCzDKrWULnKx3k08B0miqcYZxe2XGzYtJvUOYvIQZNN0qBT
	NaN4iaYLqbd8pYkwQigvVEfyGSb/ZKo9JE5nNQFKbHpPqzFpDrA6
X-Gm-Gg: ASbGncuPdnRqT6MzO5LSDgpxBlZsqe3LBmv9Z0rikJz7qsO7NNW2kbpgj3lWKezf+Wb
	1kDx2Lsor2dIREr1axC/+tgN9K2MaZe6OD7SHL9WM5ByKsS+RtjnNj0BthX6iHEoZwmECgIDSZS
	30AkyMoxh6FklOI6/uxKXyL3RdKQ6559aS1duFWuL68nAGoVAkf336vGDt7FjZSPj1rYjSh+yPE
	RWzIEY4dcRiD6XTCQU6Sb0Eh+AkAJo1FQ0SDpC1/4IHxlFrpzRIAiugYl8HsSUyzZjTmyVTLWwR
	PLZm7l4HElowLwmq9tumwAV98ydbaKUqtcFlvF4=
X-Google-Smtp-Source: AGHT+IF4rPay8WepS8hpFGPtrn0UBK8NjPwYoO5O29UQmi2DIdxvdW2xPbUMGCDF/t0A9jDj/zQNVg==
X-Received: by 2002:a05:6512:138f:b0:53e:39e6:a1c5 with SMTP id 2adb3069b0e04-540917cb67emr1983630e87.41.1734178487313;
        Sat, 14 Dec 2024 04:14:47 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm202086e87.74.2024.12.14.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 04:14:46 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
Date: Sat, 14 Dec 2024 13:51:28 +0300
Message-Id: <20241214105128.37995-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_041450_115690_4838AD23 
X-CRM114-Status: GOOD (  11.38  )
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
Added casting i and start to unsigned long long

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
+		(unsigned long long)start = reginfo->offset + (unsigned long long)i * reginfo->erasesize;
 		printf(" %*i: %08lx ", width, i, start);
 
 		if (ret_locked != -1) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
