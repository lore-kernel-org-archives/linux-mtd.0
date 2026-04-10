Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2D3F44869
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oALX3wnGB4Ilwuj1yF5V6URC73w65GLiygb5QBL0Ko4=; b=eiJJPiNzh1Q6ob
	SBXShFz6t1tpvxAB6yqKETE5n8X5R2Y7dqTFEzZ2E5jTpUonfPHqWdwsa0Tmx+Kocp7kKE7vc7xeQ
	EKfgFI6FYpr/XeH07JNA0gJa1PmmWx0lQS3i5W2bD8CMGakrYZa/L/RgesbbiKbxrzHygmZULZmsC
	WffnoTV3t11S5gJaqrpbG8MBkZq0sYx9GY8U5Rp8CbkClLp/RK/4mt6OBYMxUz6nil2LuE8DdIrHH
	oGOSA2DxeTtSSs0Azmh4Ft7fX5DrGYl9V8AkdNRvp7rHhWJsCXz7+tS2CSVpZ9RoieKA1m5CrSUSf
	MOWPduoqS1gqWsUgOPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC3q-0000000CKId-1AmQ;
	Fri, 10 Apr 2026 13:38:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC3n-0000000CKIH-1Qw8
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 13:38:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so1283456a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 10 Apr 2026 06:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775828290; x=1776433090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15jM9BdqvKF6hlZCm8Bhf8yzyGOuJv3FUIc4LIiXT04=;
        b=kvRzAsE/5xWx9CTBPC886XnVttm8L2yhAI3/KqFLLWVdmy6SrM5kHHxj/XtzNLsfnv
         LKrMlotgLwlCfyUuPSPIF6hKBzao9VmD+lk2+/69KyVTekeo/pjTgvvJJVnkNovq0QNL
         lso+IadvGZKHxWEq9IQvEJpH8BK1BgzkDnNCuAbunRAgKw+OfzubeubVMz6z2Rkda8je
         3MpC0E6mKU6dHiy958mMjJa0laTS8nRI0yDhnJhZPOxx5CfayAJ/UO6x0Tn58gTh6JuC
         QOhbqC0+Ui+tvg9sPN1IEH2Xtr+WW08WFACJXPlxgzgIBtUFFKrKJ+OmDHQToTyMl0sK
         WNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828290; x=1776433090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15jM9BdqvKF6hlZCm8Bhf8yzyGOuJv3FUIc4LIiXT04=;
        b=Txta+/NvaCsywnLZnauj8yEz4Xss/+H+abZl1+sDzO2WgfRddp7u3CSfp+1UNca4f6
         1DVHrQt/etRV8uVX31CrRXz/S8fuIHz89khHb/LqKB+1bA2Qh22/jGn1IlsTZZoRdrZq
         BiGv8kg3nP35ZTyWdSv6LdrjiQF30fPxJU/S4R+1+aaSW1arRYcuhz10TyWRBZwwnZ7x
         0FHbDIoeyqVuOeRubB+HBK4RrbzTD5MyFvfHha+1qkwkLch/KS8ENHGyArKoQLsWMWev
         eIWR23/vQXgxiyh2zr2epLKk4xu76Rg0n167r9sANwPsffkqQzUs2HujEUsmMr/7RgL6
         yuyA==
X-Gm-Message-State: AOJu0YyI1DepGyUsOeWeNp3kb/8iDL9dau9M4m+uYHFj7LEM9wdfhqMn
	7AZrc+OkhXnKnkx9vhRPGCGkH1atCvMKuFEmokm3I4iqEFFmroA7NuNW1drOaM04QUE=
X-Gm-Gg: AeBDietD8GYfEJQakwp3/YK6gHH//tPoEuFCVDRfxMqcQCVFOoGoYdAAhIllpakHTxn
	RBf4JZSP050XiOTpkmams2t9CH49AgoWV5AsRcHQe9Vsm5fHnsFFQO0fwrajS/CdfTC/nDfdsKi
	YT6YY6tWxwjBck4b57TwjM0YoRCBcvpOEk6rAJlzdB1jm6Cxg9iGw0eHoMKzOIH37yUrHd6x23g
	CYjVNSjXPMV0N266VUosYoiei54zggc7SES7c4Hda1hihtSCVfdPjAY2y2HD8gaOKkV5RnX1Lrd
	coeH+97SthrNP5n+PqtfA0L5FN2PSSpZUh2SDblaSggZstk5kSqGF50aZpc+MndnKz8z0j1vSCq
	Q7Ku6QcQEieEg8m0ewkj85whW6NbZhG7/3XivML8YG4wOvvzGci6c/qjsGgOZg+O6Vgg/sVXjOQ
	SoqeNHpQI46Wdx8cF2+zk+ChpjK/SLh4p1e23yK72ICssA7kpZ8n179fbcuGcbvYvP
X-Received: by 2002:a17:90b:3d4f:b0:35d:a5cb:95c1 with SMTP id 98e67ed59e1d1-35e42837793mr3681773a91.23.1775828289900;
        Fri, 10 Apr 2026 06:38:09 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.41.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4122314dsm3442353a91.6.2026.04.10.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:38:09 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH 1/2] mtd: mtdoops: replace simple_strtoul with kstrtouint
Date: Fri, 10 Apr 2026 21:37:34 +0800
Message-ID: <20260410133739.1632-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_063811_381695_35664DBE 
X-CRM114-Status: GOOD (  12.99  )
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

Replace deprecated simple_strtoul with kstrtouint for better error
handling and type safety. The kstrtouint function provides stricter
validation, automatically rejecting inputs like "123abc" that
simple_strtoul would partially accept.

Using kstrtouint avoids unsigned long to int conversion and is more
appropriate for MTD device indices which are non-negative integers.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
 drivers/mtd/mtdoops.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index b88083751a0c..39df7ce8f55f 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -403,8 +403,7 @@ static struct mtd_notifier mtdoops_notifier = {
 static int __init mtdoops_init(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
-	int mtd_index;
-	char *endp;
+	unsigned int mtd_index;

 	if (strlen(mtddev) == 0) {
 		pr_err("mtd device (mtddev=name/number) must be supplied\n");
@@ -421,9 +420,9 @@ static int __init mtdoops_init(void)

 	/* Setup the MTD device to use */
 	cxt->mtd_index = -1;
-	mtd_index = simple_strtoul(mtddev, &endp, 0);
-	if (*endp == '\0')
+	if (kstrtouint(mtddev, 0, &mtd_index) == 0) {
 		cxt->mtd_index = mtd_index;
+	}

 	cxt->oops_buf = vmalloc(record_size);
 	if (!cxt->oops_buf)
--
2.53.0.windows.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
