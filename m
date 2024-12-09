Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DEAE77173
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WMYalnrnXKG+JQs/RltUp57OUEpYXOGxuOSn0LUWizM=; b=LnNto/88pvGwKR
	GI94FlCZovpSbvUXUkLn5oT2TuahFu4d0MzpvaKN+Z9NYVyf3eM9oK/YQ/G2L9kEbzodpcrsNKdbc
	c3ZYxlO8/S1V0AlBPYoQs/db7DUOglAumioNStbSexyTIqfKTolJUdCdNiK0rNrn85nwHagFpiT0s
	2SSjgXcISwqvnmp5aVJmu56+w6KYbSLSrc6PkBbC91wfk+XKVJXkWcqXWSyeIX3DyoK26YRPblgkl
	WBXm7/80YhMI0KZu7cjPSU+wUs7B/cXZhNhzLatREKFvkHpSRdwoIz8HaY14pY8ax1XQuHnp7SUkR
	BMnDKiJ2prjs9OYiARaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZeT-000000071my-2rZS;
	Mon, 09 Dec 2024 09:02:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZdr-000000071d1-1Cl7
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 09:01:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434f4ccddbdso11152775e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2024 01:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733734881; x=1734339681; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfmkzNoJxgWiG5Z0g0jcQ4NV+0tXwsBrqoBTR0SIamg=;
        b=uBdLFI/0Zeht+AC47u9Ww7NGQQjr/G7oBbsQ0JSzxUj3Ytjm6UdGKOT27in4TCY1an
         IAUvEFHFqBJfA0qubbZwJcZe6EuPHCyXmq8ULnBOZF1ikXIIZjTHiliDVt/V0FsBKBaZ
         HOpNUeMn/ydrPegSUZVZbLEWVN+lJ/qqCakG0g68ETL2eyPEWhSAnGlAWlO04NcWiodz
         7E3SHq6hW6mcuJhVNHGXLzlbJHA4yaUNzmRKUWkzNKc+eBuf0QcCH0JUISC6F+v3k5Mb
         jPfolwpJGTssNTri9Ng7ow+b/cBHK75jEGkcKwBU2FY+MNKjG1+Q9Axxe6EENnMUvpeI
         1uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734881; x=1734339681;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfmkzNoJxgWiG5Z0g0jcQ4NV+0tXwsBrqoBTR0SIamg=;
        b=imV1UOpzJ0Par1LhRsL5E2g6S3lnLjKHhF3gNWyQ3RppIMULnk9tNJRJwEJ0j3auuP
         XB8Zq45WO4MturokEWs0QAPS4Natx5xwapwqogxj39/ejdvutnDHtdJn3V9XLVmWn9gs
         GwQHNwZP2u4RhFwHUqArmGymuLtV+V8bBzzIdsKlZ2WHib+tezAHTMwi5cADNykuEFyu
         o9BhnPVGHgJbONettYOkroMySpQxu9F/VufKbgvEHTtPu7xWhamwGCOgU3zvphAp4Ihi
         tBcKM1JLXIrPwR5SMsnsq+aLDHjmV/YbGr8SKNd+GMMUhmS2atvRa2nkkkyutAGjd0jp
         5KGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+T3cEmu9xMv5TPrK9mY4AitVRr3t39d5aUsn/L9rwNVCvZJer1kgLHY8TQGiTszXwU6cBaP8lSfo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/ufi5LLvq6l14T7iF0vdBxAZ8C9GpwUIBFn5ppRkVzqd7bJW4
	xJslXVomQF8VGhADWjxHIKQEcc0jJ9OnsTeVi/on8Cq8If/Zeb2Lu8tpQZroJHE=
X-Gm-Gg: ASbGnctMebROCuFtsIIXMrqVoC/+sjElqfblh8E7YitaQc+04sVawOHrITu8sK7l+v0
	iSTDO5ZyN/wpKvatvabDfnou8jvYHVAQ1BoLpvBt7Yt1kDMBur2kq7+/H2XACNsgIKnbCV9l3x6
	n/GG6VfODOIUto+CEOAGFS+JM3CfyF+aEWWAsqv77naY8GmcXRNe4vyGSwWwAM5AqczHrBX1AxW
	7yvrC7O5eb8aSUgdCa/mFQ4KPpZjn7OumoEOFj1Xwakn8Rsdgl7KkA=
X-Google-Smtp-Source: AGHT+IFmp+9Cbk91wy/S26/TnevCyDFcz+T27bFU4Ss//r84rMuo+tniIyTuEqKycjEZM1O5HWZh/A==
X-Received: by 2002:a05:600c:3144:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-434dded67cdmr83625685e9.22.1733734880111;
        Mon, 09 Dec 2024 01:01:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da119abbsm151793365e9.43.2024.12.09.01.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:01:19 -0800 (PST)
Date: Mon, 9 Dec 2024 12:01:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <Z1ax3K3-zSJExPNV@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_010123_352259_58B74220 
X-CRM114-Status: GOOD (  12.97  )
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

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: fix the tags.

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
