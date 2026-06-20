Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECB0CDB466
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jun 2026 22:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3htxhyONKHiCDCFiBf6o9/0m5caB9LUd3GnAESXzUpQ=; b=wAOAzPZXbmiFpL
	xNYqG3Io6dbEieEvJ5VzmLnphv0dRy4XFA6Fk14l+aU5/xAPN8EJEvJYOYjLbYGCU4SmOs3hrdhHe
	ZgmyeeJoL3/juvH+3UwYVwqlvrhyUC86nJTR+XSBbppGOLwRpOsFlUbKCVJyGh1KDowTX2uYu27ty
	n4kJzc6kFnNpzTQOUacWtPymb8F44OTnh2RTT1A74AnlZlzQtryGSzjLsxMRulTgrQyJ3dK8nSfPw
	4I4Tmb1/98b2CIBTFUf7F8+9Bk1yKgQCZY5ocY1w0swULQJr9Dc+Q2tfNJG0cDuALoYDZ7bWvGx7q
	ZzbYBxkjpDoUD7kc4hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb4cU-00000003c4y-3oJ1;
	Sat, 20 Jun 2026 22:56:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb4c6-00000003c47-3HAs
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jun 2026 22:56:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c68190ade4so30281365ad.0
        for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2026 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781996193; x=1782600993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs7b6kK6vyQ8Tj7IknUcX7lymT61ql9jRNgRQ30+eHE=;
        b=d3rK6ehJstEkyKe9nT7/ofY+k98WwN/GlhJXTyGZLXsnR0F66hwUqnbh3n6/DA7g7x
         vUDI5WBrc4ZqjG9RN20EX3bc/a0KrHaL0wX1s4/cvtT0xK521Dk3E4UqurlWFzXi5A93
         pZMlj9irYecyJfOE+R0dSXLODElUI08G02oxIG8NE0D9Dwur+V2hBXg9E9U72jzxnJSs
         L5Gv0TPq+2kFKLbic6785K2znGOh2+xt939hetMTi+gM9DmXnva/9kDlPEf08Q2MvbFu
         dmZb4/Cf+l8vrCYQ+Jgv1etmiDDyMBBPdsRVIF6yHjH5grBzMMfCu4Q93jWtTs7Ly7J9
         gRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781996193; x=1782600993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs7b6kK6vyQ8Tj7IknUcX7lymT61ql9jRNgRQ30+eHE=;
        b=IFY/DA2WvhUHeLVdxtAfB6cwP7O1Ed9F2O907yq+AtteJEeGbRJoedi3rRF5B0ZP2j
         w8uTMSAXqKn4beThWTmRZShq49irw5eB28qj4Hf/AtYjyP7aqocaLawKiYWwQ1BB4Vuk
         VM7HrHVS/fOoTYE0zbYBW+lhbk6HcBsxK0OB4uHIRjvBuDL5BYnansIHhXeXmWbk6PrN
         ftoEfD00tddb7in9crGXk//eqabJ3JKf5AwemuyRR0cy0wc++PcEJeNE7Qi8wMqKJgyG
         BmjdBYaMy2axLIC0+beAdGiUbVhJadeKrdhhVxAFWq8pYFyUmcrnZQ2glNSjHZNhP1a2
         n/gg==
X-Gm-Message-State: AOJu0YxiLXUXCOU93SiFtmFkXJmGyLPgO+Kg6O0jS6dmjvp9GNbmY5Vl
	hqu72Q6GB2JQZ9aMl70cfk3lw/oGu+UsAX5GA3ruofessgBcr87gP8U/n09aGg==
X-Gm-Gg: AfdE7cnndJ+wAevbCHsqmuTGK5U/5M84DTSwka5ada+lUlecpK21wfUlnpLMVoP47xl
	8XfbBeOjAuUSilLIX4RbWN3ojWyuTzABKulxyqTSHxa8eRdqCiq+AGvbT/B3LXH5mCXUk2FFRXC
	oPCajgbtNQOJc/aIZyIvT+MtbbnPcVgsT1yk/fN9dnkqhUNp60yaQw/+vBBNBnMN1Pvcq1GipaF
	usKUiypGfiq97Xsda9LSFT2ap3cEZAmhOWC+2Fyww26iG2S8l02dJQ3fEVomljMg0NBqz+ESwCo
	lWXRVA2xuuDwbw2eIlzgvWowCE+SII5DEZsiB7b2cechto+kBhKVnO3fKzOpg4WDpUyffajDmwf
	svFC83DiG95LTFpbd74hia6q1P4dXLm4N3Vk8MA5FB2IIbM7km//ORzZcB98aBQv6Di18xxbxLw
	xB1QZo9eDROslI+JtlJJSRVLzMZrGl2zLZgrklyQ1lz9rPyz1RVrefyvyxp9qhnEa+pdF6JS3iJ
	w+HWE8=
X-Received: by 2002:a17:903:2ac3:b0:2c6:b429:f100 with SMTP id d9443c01a7336-2c7195c4e8bmr76603445ad.15.1781996193368;
        Sat, 20 Jun 2026 15:56:33 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:6622:5068:7fd9:7931])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfd9ddsm34254705ad.55.2026.06.20.15.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 15:56:32 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com
Subject: [PATCH] mtd: mtdpart: validate partition bounds in mtd_add_partition()
Date: Sun, 21 Jun 2026 04:26:25 +0530
Message-ID: <20260620225625.45243-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_155634_823794_00034480 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

mtd_add_partition() checks that 'length' is positive but does not
validate that 'offset + length' fits within the parent partition's
size. A userspace caller using the BLKPG_ADD_PARTITION ioctl can
supply a crafted large 'length' value that passes the length <= 0
check, causing add_mtd_device() to fire a WARN_ON() when it detects
the oversized partition.

Fix this by adding explicit bounds checks before allocate_partition()
is called:
  - Reject negative or out-of-range offsets.
  - Use u64 arithmetic to safely check offset + length <= parent_size,
    avoiding potential signed integer overflow.

Reported-by: syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3ae80219c633aca5431c
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/mtd/mtdpart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 795a94e6b482..1a0e2207e440 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -264,6 +264,11 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	if (length <= 0)
 		return -EINVAL;
 
+	if (offset < 0 || offset >= (long long)parent_size)
+		return -EINVAL;
+
+	if ((u64)offset + (u64)length > parent_size)
+		return -EINVAL;
 	memset(&part, 0, sizeof(part));
 	part.name = name;
 	part.size = length;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
