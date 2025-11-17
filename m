Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE8CE8D6B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 22:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNn7uKGxBMLJYE3d/LINzbidI4r1VbsYvNImK6KxWyk=; b=iITqhLXVf80AQI
	/svSkmGHcVbh4LHvKC/KgGNw1gG6Fy5epWnDPcoNKzVs/ZzjkBxT77UEnNzhc6HSXb3VJUp5A1otT
	idn8JdYvHWQnf8x8snLVXAvjHLytwpwqaxOjBmfDa88s2m0mOV7yDkMP86zqS6tn6j4rkNu+QzYyL
	a6hhcdsNiahOQSCwt3ze23xJ4qJyqWOp4hSWQSLIX3tDNKzjGD7zvNIvppONQqZjX0LiN7vPR1yQH
	YwHXFQU904JHQxuXDQBUnZQ/2EK7aITAKB4Q4MGFRZgFE8qOwEyTxo3smiFT0RMS+xzkUfLDP0C7l
	I2bRqbzcjvEH7jGClswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zw-0000000Gy9y-3ddX;
	Mon, 17 Nov 2025 22:47:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zu-0000000Gy8c-2MOv
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 22:46:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b72cbc24637so834502366b.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2025 14:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763419617; x=1764024417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kvi8PD7ux6OLYIZX+/H0obhuKo5+FvClrvPgKMpP5Nk=;
        b=V+aZjZjoIHW+tq/3BGWppturA3B/KE0KdzMRiPl+nKft07w9UZJsm9GOwbiBZIepfI
         GRdSLwjh5lYYakQtLL1DDUUykyo77PcjHbm9tFmchhvnL6SQNybgtHGqN03CyHo2Mzi4
         8OinjX4/wdchUQEy29bZByNmr9HPyxOAPem6/PLvV126NRYAB91DnqAlgNgwmeE9gWyo
         pvIeR5UssiEIi+UkPlq7wB4OJa3yRK/aaGNfv8XRptbewTv2M8yYtFwmiZVnE4D5+ugt
         5Kj74FW6RlQlc5bj5yztrQ/56zD6dzxemR0pvGVdOeGrHxt9a6AV5vwBdOaxa75YCjgR
         yxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763419617; x=1764024417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kvi8PD7ux6OLYIZX+/H0obhuKo5+FvClrvPgKMpP5Nk=;
        b=wOHieNWKMjtxjxXroK7/DTKa7duzIg+/hBzkEFdji+tJ+cSM81EoqGVfBFW1y68/BS
         amtcZ9MH1v/Qy+bs4hUyLIljSV0Exf+YCRgTKFl5zxr7vq1L641Yf+snQ9SNBKP/isUl
         WcBdVpjf/aFteEjZ+DZzY9YeCtk/vG30GM2cSjDCxfkg/57xNQ61mayhejVQspICmrAf
         oD9++b5bg3ZPrrBL89RkxdubmwKV6W/+lKpbp26kkmtiFJ2nUoj7YulAoUCFSSCp8jVg
         sbLlHtQ4WEKuAcOOEzcxSxQZnWuh0SOXgam+Cz97/0Chu9cdFrqXF7mwk1GyJGpMnKgP
         IAdw==
X-Forwarded-Encrypted: i=1; AJvYcCUDf2TdmafhJThrmZJ5z0xqPKJ+v3azNkeI0CFP8/2nsdZ58YDX6BOEIFaEWHDk5DuN9TasaaLwhvY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpXUNx3JepQ56vjHb0s18sC+HPpfDLfXbMXQ3HmC4kzazc1IFu
	oPjZfCf62zA7xtNNosp2I5pWO11cnzM35eJT2Pl57cQQXSX7vH65bsU=
X-Gm-Gg: ASbGnct5DmF4Cf+XSP6nrSHa7YoKHY47P8m1DzflXlkVjm2w9E4XZ32yZt5LPGFFn/Z
	k8nsabgOmoBiPmfHTrQGRQpsCMv07lBHRlBDv1i8gIp/fKvj9t9T6JZwwww8vEwZ2madBzsKkgy
	aEJtNdEh75ahTOfeK8vnMqkpZ8f7JUturZq+rGu5E/SR5bv/w61H5pOei4pNeqNdUHYq9oP55fS
	l4oLA+4tlIH+87Twl3PxAXLn3agXcpW60alkrhEmIUtYvQpENi3VVilTahE4aNxTOhu5nidXXUK
	ejFlHr32ftDRta1S4eTx1WDAVOG1SSZ2F2gtJiQfuQEj83ysehwxiYtafgzXoQn7aEZbfOLECoU
	eAX6mZs7WW9lz+GEmh+YG0t7zupGlk0Ud+HXX0wFgqDQbKrfOwxfLFpcM0Px1yBlIanyFXfWIBv
	+y3HFzkQveJRyyzKFUHnTl6hu9E9BTsUf+YaocREMCXctRDIrPYD5bhDCxonviWu2pHQV8
X-Google-Smtp-Source: AGHT+IES8z9W/ZUewPDopCjp1qbQPjkzW7d/3SgBKJxsPR6cY33LGwmeBi3Hmms3epl6sy2024347A==
X-Received: by 2002:a17:906:fe43:b0:b75:8b9f:de3a with SMTP id a640c23a62f3a-b758b9fe481mr127507866b.59.1763419616710;
        Mon, 17 Nov 2025 14:46:56 -0800 (PST)
Received: from localhost ([2a02:810d:4a94:b300:232f:6d66:f093:4e68])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b734fed9e9fsm1179130666b.69.2025.11.17.14.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 14:46:56 -0800 (PST)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>
Subject: [PATCH 2/3] mtd: maps: vmu-flash: Fix fault in unaligned fixup
Date: Mon, 17 Nov 2025 23:44:07 +0100
Message-ID: <20251117224408.498449-3-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117224408.498449-1-fuchsfl@gmail.com>
References: <20251117224408.498449-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_144658_836687_1E465E07 
X-CRM114-Status: GOOD (  11.98  )
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

Use kcalloc() / kzalloc() to allocate the memcard structs, instead of
kmalloc() / kmalloc_array() to prevent access to uninitialized data.

This fixes runtime error: Fault in unaligned fixup: 0000 [#1] at
mtd_get_fact_prot_info.

Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
 drivers/mtd/maps/vmu-flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 53019d313db7..d0793f1b0fac 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -609,7 +609,7 @@ static int vmu_connect(struct maple_device *mdev)
 
 	basic_flash_data = be32_to_cpu(mdev->devinfo.function_data[c - 1]);
 
-	card = kmalloc(sizeof(struct memcard), GFP_KERNEL);
+	card = kzalloc(sizeof(struct memcard), GFP_KERNEL);
 	if (!card) {
 		error = -ENOMEM;
 		goto fail_nomem;
@@ -627,14 +627,14 @@ static int vmu_connect(struct maple_device *mdev)
 	* Not sure there are actually any multi-partition devices in the
 	* real world, but the hardware supports them, so, so will we
 	*/
-	card->parts = kmalloc_array(card->partitions, sizeof(struct vmupart),
+	card->parts = kcalloc(card->partitions, sizeof(struct vmupart),
 				    GFP_KERNEL);
 	if (!card->parts) {
 		error = -ENOMEM;
 		goto fail_partitions;
 	}
 
-	card->mtd = kmalloc_array(card->partitions, sizeof(struct mtd_info),
+	card->mtd = kcalloc(card->partitions, sizeof(struct mtd_info),
 				  GFP_KERNEL);
 	if (!card->mtd) {
 		error = -ENOMEM;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
