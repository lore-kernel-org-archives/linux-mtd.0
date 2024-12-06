Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0682DE77173
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WarGYS+rk1CA2Jsa8Rp/1+Kad7WpNfGIrIXqHXwfEo8=; b=LV2pev0TiNiQQE
	wBjGsHwWk7im3UFnSLLolyTk5mcZ5UdZoXwnnYdC1GPoauXNpKXkWzIJPnLS356XIwu9M1d1HoVPn
	5buhRj7W4QssP2p0GynzvjymgGELPR24fu7QxlNGEdqtQVpfmZ+QeJRjmWYMVnkb12Qp6N3j/b+OB
	vCqVSyALmJmLIg+deZzTVAREWzuc3y5whTe3dJ0hnwUez/KQK28DRzMs+4zUYqWuTUplmtTCqsFBi
	KHU0iT2KTgxY+lqIHOQcuRPt5CCYw0Nl34cl+4pdJs1+tld/7Oqwvda8QMHsLTuEqx8WmWebQ3kIJ
	2w4TAi48II9HeGnVnAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeuU-00000002gQ8-1Iyp;
	Fri, 06 Dec 2024 20:26:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeuR-00000002gPW-0Kda
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 20:26:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3862d161947so699098f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2024 12:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733516800; x=1734121600; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjkawNe/zvVX+h0jYqx9NDeU0TKqmCFwHGIOk1udH/c=;
        b=btdKNnlvGuEhKvogr/uKfpVoRJQ/zSL16wZuldHRyV5VicF68sJs6myy+0lqtZJWB/
         sd/XsL1i+FYMAg/DkehgUIML8vMgadVATzIJL/6gjoXLeNRGFAQN8S1JpYr4va1hi0ot
         kLp7T4x5PzaSHw2EVtLQuZXkSalZAeT19LOo2/ZHLnDItXpgtvY5+FGaGkRMIRg1P/TO
         7al3HDl4RZWUlquo1tmuM0Lgjc0tTeK4QcXDOT6V9AtZ5Vg0n4Ji1Am62jvRzYvGAqYi
         Rkw0TXaZ8U+N594Il+3O2XFDrSh34rxedjZcuAZINxIIxEtsNlvuZWTx264Vq5gelDK2
         7QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733516800; x=1734121600;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjkawNe/zvVX+h0jYqx9NDeU0TKqmCFwHGIOk1udH/c=;
        b=VM0NrI9ZYwTYJOKldvwTAkCGNeZEC9tfBvipj1v8Rtiv76Jy6qyDKGwif0HPdXY6hq
         y/zGufgus/4/ONZ4GRgggSee7VIghcXNyMTBPpV4Nedn8MSU3Ha+rhf3cP2r3hsZp7aA
         vznpjbHihruvITIXZRiU8SA2joHmmB4RVsg9gneblyzXSZQnb9+K0yTmo91diH40lyd4
         RK45BIprf74aY7P1ZFAwO8iQil+WBRJ4HqWFtqPopslv/bytSVUcK+UCJ+DH+Igg/dSx
         mksZV0U6K2DhZ2D1UixyZqERekV9p/GvFa7OXrr4vW5LpZCuutLH6VEQgbTdw6NhOg9k
         xHzA==
X-Forwarded-Encrypted: i=1; AJvYcCWVHdB8XMdxkmI9ikseXD+BODSY4o/NQaYvGg7ad2fNsM7R7hhkAD4Q7bPd0pYZZOWEaH60LEpvCE4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcDa9K4XcoogZUS3ow/iX6OJUbOBC0bfAq1HaHety17pSvOE+E
	sZ/vF3INgMbTUHb9FsVhb1Ihw1msAZ9bQpxwyn5qARVGkKBtClbb1Nlx2v0ty9k=
X-Gm-Gg: ASbGncvGkeIiHGRjtaEQ9XYMV5NKbkSThzmTd4ylcoOeMkFJSvt5sdl7wDmZrI7LmPb
	hFvir1hTM9HR6AMDpAZ4UhZJR3gIt3O4TfMUPq8aR8Yu96c7MHMWyq4pUXGDeCDOIG5qazJyvT1
	Wr3XTe+W8w+V0xa107O03wJdRXYfFQvqrsY+vhQON7RdrCJdejRAjnF8TOio4ePjamJLlDEOCnA
	d9ftQMdxh9RPiUx5WeesHygKRTdmdDCXnzX6tArcb7HRrqCAJaAN1M=
X-Google-Smtp-Source: AGHT+IHuuNn8PhPAm12rBVa+8Uo5b1NeCY06qOcGgQGqX87r5PhjVJ2tEF0YYVoSm7KTEvHFh633VQ==
X-Received: by 2002:adf:e19e:0:b0:385:ed1e:2105 with SMTP id ffacd0b85a97d-3862b36cb56mr3597056f8f.26.1733516800528;
        Fri, 06 Dec 2024 12:26:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280497sm102052885e9.23.2024.12.06.12.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 12:26:39 -0800 (PST)
Date: Fri, 6 Dec 2024 23:26:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_122643_131817_6C175E8A 
X-CRM114-Status: GOOD (  12.17  )
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

The "req.start" and "req.len" variables are u64 values that come from the
user at the start of the function.  We mask away the high 32 bits of
"req.len" so that's capped at U32_MAX but the "req.start" variable can go
up to U64_MAX.

Use check_add_overflow() to fix this bug.

Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/mtdchar.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8dc4f5c493fc..335c702633ff 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -599,6 +599,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 	uint8_t *datbuf = NULL, *oobbuf = NULL;
 	size_t datbuf_len, oobbuf_len;
 	int ret = 0;
+	u64 end;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -618,7 +619,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 	req.len &= 0xffffffff;
 	req.ooblen &= 0xffffffff;
 
-	if (req.start + req.len > mtd->size)
+	if (check_add_overflow(req.start, req.len, &end) || end > mtd->size)
 		return -EINVAL;
 
 	datbuf_len = min_t(size_t, req.len, mtd->erasesize);
@@ -698,6 +699,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	size_t datbuf_len, oobbuf_len;
 	size_t orig_len, orig_ooblen;
 	int ret = 0;
+	u64 end;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -724,7 +726,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 	req.len &= 0xffffffff;
 	req.ooblen &= 0xffffffff;
 
-	if (req.start + req.len > mtd->size) {
+	if (check_add_overflow(req.start, req.len, &end) || end > mtd->size) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
