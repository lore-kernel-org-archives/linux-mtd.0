Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662C8CCA470
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 12:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B5bgU7UP4kh8vPWvcaSqnBv4aR3Sc0CI5GwqfQRMl04=; b=UwBCY0UW4Ns26b
	GraPnPEunTHGQYH2ES1veaCDIE95742Rrd4gYRzL8G5AHXWz8LVJi2rMcdY9goBLuWxPepf9OqiWE
	HIbmfkaMG6srq0mOSLt9r2lNqIwfT44KYulufgeHXg3Hj0gA83sUfEmU0rHhFFpQTQwBmddr6Ma4t
	WwMiiriyvlBNbu0f5IkwovtZJOIsIXOvCW0UXuNLnXChJUR8s0LIi3LTO41GRflkKQrXxhOZif2Ly
	0p6oljjE4rC0fNVyVbIIpArdFcADvVqHum0AazDtLL/Hpy0WYxZntuwk8EYnvLOB/S9JpwsZUVmwA
	AICqmSzAbuc2hQ+78DQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZXA-00000005HgE-0JjV;
	Tue, 30 Sep 2025 12:32:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZX6-00000005Hfr-2LM5
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 12:32:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e317bc647so37897015e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2025 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235558; x=1759840358; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oo5sOp/6AYH4FHUPQLIVvo5r8GtAmL8I6jk/YzlSnfk=;
        b=GwXg77YIqukkmUbHrBYGP32b6rF9ju9c8dDxPq0Uf99NZybrr7+pDNhtIoU/rpJuRn
         UL7h4DZzeNfcZFfSWOckHFX07agWL7xt9krylxkv79MVo5C3rjv2ZWh8Hd/r19w/PTHS
         O6SebcNOJ/lk5bXi2yBfut/PQNPprlGTUJ4sXxfQlttSi7PRgRlS1i4ycQFr0C18eTVZ
         xr4q1GiAfZ6pvnmDCn9e9dZlQofnL3nqzKx7giXko4ScOwybELlAHA1qYe9/LPRouSAu
         twRw3ke7KnsAschFDSZo5JSzre1e+VS/X3UvDxk2UznCbYGypQebZHti/pW5LMt6ddGK
         2ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235558; x=1759840358;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oo5sOp/6AYH4FHUPQLIVvo5r8GtAmL8I6jk/YzlSnfk=;
        b=cz8nDvhSBsq6mWjv3wvnVEbuuAGAc4cgktTsWw4WLzqUPc8Yk3fc3EJrjSWTy49Xkc
         G2LQeWAGDemY9i3LuMaO8S1en05hC0s2WqG7bozsogALxXtstQO8sSVPida0uNtuGWD4
         P984sJpNTJO8iosrktHd2v87Nyn0qk9oItzuKDGOPtOEohSoUKRBcNYINEq90wD5K7Yu
         DE3pD81dtuleZJHmCKPSpBcgY+3ooi1voGuvNFMSfIxMRdO4h+TSGS9t2rdV4CSqg72M
         1yU13jLAH+5jR1CFFX58X652tS6zIKoWYpvokcgf/GuiN+1y/Hk9kUDvV0B4DEkxEKce
         ENSA==
X-Forwarded-Encrypted: i=1; AJvYcCUXnF2oppuAtFAgEXg6fYVQM4DvdkKhn8Vop0bbMYZ9kjOgsxhm48ageoJthQhGOg9jOM12vO4G8bs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFa5om0EbwB8+YZvYdmCw1jv9gJIJrE65ujG/z76SUMbkgryP
	QDArgXy4H7JnQGyBCgWkQWoq0sdqhIeFWDbjo/n+S4N8WJgMyy96vbx0x9PF4aJ8bldaQQrZazm
	AOYWh
X-Gm-Gg: ASbGncsKEZk35/TRmYGi3qC/hcVnwRNPr4RhBeveLQl4mH9O1oxX9JOOZP7KR8B57lZ
	cjZzjyj7AoiwRPPx8/kjWRBxqKynHPZRHMTfuvwaneM0zGF3wATSP9oLVoK3rQjTXHwjxH3gXEs
	fRSsByc+mmk3qZqOxkQ1o9VeKa8b+B1VxT7oi0exl5F//0Njfs/GzVqlh9jR42jJ8N8fiBpenJ2
	uSHmqAOR4fUILqjdcOHh2avWiaIpzZJvr27jgnEOJEwGZAXeVhv9fc+5F48d1A7Dz5UOretyX98
	HjsFA7c4SnK8ALfFIs/c5weMMMnQxP0uy0art41rUz+G8BjroxlV8W8ZdnUua92DD+V1sN0NVr+
	PsS1Vv0cRuIHBqDiMQV5PSZz3Uaegu6qOmaX+AzCiazuyinv1zYmGSbm15TxEoMY=
X-Google-Smtp-Source: AGHT+IGtnuuyKdDtHZCb3YIUp4ExKAmej4+wqFfGXxKG2xkl3FbcmieoXV3KE7JoIKB5oOnwCudRlw==
X-Received: by 2002:a05:600c:154d:b0:46e:4581:6634 with SMTP id 5b1f17b1804b1-46e458166eamr108608805e9.29.1759235558058;
        Tue, 30 Sep 2025 05:32:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e5707c1e7sm54805665e9.21.2025.09.30.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:32:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:32:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 resend] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <aNvN4kfJ2ROB353Q@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_053240_625744_A9C97BF4 
X-CRM114-Status: GOOD (  14.07  )
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
up to U64_MAX which means that the addition can still integer overflow.

Use check_add_overflow() to fix this bug.

Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: fix the tags.
RESEND: I sent this last year but it wasn't applied.
https://lore.kernel.org/all/Z1ax3K3-zSJExPNV@stanley.mountain/

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
