Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B1DCAC5B5
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Sep 2025 21:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewn3JkAdxO7QHQliOqoKA4H+nacyp2vczWnttSA727k=; b=vBpD6mr7ItgrqX
	rtj4O9fs8ZdjUNPzvenaE04JJh3dmAIaOeV+dRSIogedIK1o62xIDJAUgdn5FmiVY4sR6e9Q1h/qz
	zaGBwoODgKkm6P6y/KkFp8YMGSoOgBQpSlKedR86Vze0ycHbSli2QWyUlbHI+qmYa6n50zNue0S6V
	oYgafeVtsZyb2m4J9kIyWGGLwpN6U9t6hEZEuMaK57g/wC/foAOxiy6vbAXaPAxQUVSMYnlneWy9U
	rhuPOMNd1G125Vy7BqI+AKP+Gk0EsYNKM8Uxx1wc01zK5D4qACa4XuVWYfZFQAvULDiiQ9aeVahSU
	Ecvhj40leXyNIDcRFWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ybA-0000000050x-3r5T;
	Sun, 28 Sep 2025 21:06:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2yb9-0000000050K-02yj
	for linux-mtd@lists.infradead.org;
	Sun, 28 Sep 2025 21:06:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso3030553f8f.0
        for <linux-mtd@lists.infradead.org>; Sun, 28 Sep 2025 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759093579; x=1759698379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7GOZxADKetbNWmP18yfkEj41q2tuf7F+8JZh0ODXm7w=;
        b=TelEol5/yAQVZL8rm/8t1DHlAGdJ0HE/Uz7HU1tYndj/LIVfzxV4J9/wxU+gmTdNvz
         B65rEFhjS/jAvu2PFw1BgO+0mpOlTC4AvJek5P7m9QAp1s81EXg9OGR2/KF30AB9mG+Z
         +qDXyC2VxV26Ajtwn4B4nn98jegO24w3x6LtbpDMJzWNAWd4ZigWyfgzOwrBJexAJoyV
         xRueViTEdll+rXUmtQu7Suyw6JDkCDLkmq6BddND7TIQKYU0wwcdKv1HTlsZ0tQVvnbp
         LvISXO3/JI75xsYB3xCVKAqv9TiBd41jUgPELVbE1iHxJsM+8TIHAwihB14BmDAF6we2
         FLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759093579; x=1759698379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GOZxADKetbNWmP18yfkEj41q2tuf7F+8JZh0ODXm7w=;
        b=C600Ab6oaGgkb4Rfa/uvC4wPYxks0CPCx4hwK5sMz36zHlZ1WOjYHOoVsPkRsPp83i
         uoZfiR+sig+t1hiYug08s37/ZJhfBlw5qs/fZufZiPHoMPiETY3JFse+MQP7WY8fxPcs
         wdeHL+x3levLDnCPJtMCppNXNAXFt2FOeDSSpb/Z6mQE+2mQsgtEQqDSR1NpPlmqkvmQ
         4IZUpdFnwwipU8IzBrCX57w+DXjuwYgceIdJsJhxVc+qJ0mMI3mygozvdVxbnl3CV2Q0
         UG3jOwFFnhbmWj74sEXCnup9BnH0kqlCKrsnroPZXUMjOq9cNjoD/iEDYQ4CUMv6vhMg
         3HkA==
X-Forwarded-Encrypted: i=1; AJvYcCUNrsY9jUR7P1kPnWF8KULCdlDACjAdGyXlaX7PxSOJjfj5w5W3UN/A//3YuG/fngU/P9raVkXdqTw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD+ck8fNVFT1yee5iKhY6Q+LSOpjOtDlH57LIBT4qAFPY2uEgq
	v9cvKzRiDAfEIY8EPX5bln41nICfe8L+ZVjQSZRLbUBPLhWlsKYDYa3s
X-Gm-Gg: ASbGncupUGHUY8RA2rENwTQtNH1aPPe6he9aL2lTGnCZV3d0ZEJM25p9y/b7WE/kcpA
	0v+eL02ASMkZyuECxDyeVdOUnpSGKDtf64lpHk/dHWrjDErl2K5owzEa3bTETOcMiMAnrL0VBNx
	aZ3J1CfoO6w8Sm/rmvzkEz1AXPPHjmyrOMOEiNa3zFtv+u/j/yEVV/vS/lVTYSaBmp4FjOBoe27
	syLQFQkGCualQ3GzSK7bhqh2xWT+y3be4I5Q3n2Rwj68QHycEKR9nGjSBP7desOghXFGgy80BF/
	GRQe3D7Ls0sJ2kM3x5NQJVPxmQGDmJFu9oqw47KXaNsUYVxNJgXTcqCmjzsawx6CXFRbrruij16
	1OPpePiblBPns2Dk1Dok8Aw==
X-Google-Smtp-Source: AGHT+IHUTJAtPXtQmR3XeP0zOt9RmSQ9hMHtdnuAfVVnI2fiBfQPProKSkthhRtOdJndpA7ra6vBVA==
X-Received: by 2002:a05:6000:1847:b0:3fc:54ff:edbb with SMTP id ffacd0b85a97d-40f60fdfde1mr13463024f8f.9.1759093577811;
        Sun, 28 Sep 2025 14:06:17 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc5602dc2sm15520842f8f.32.2025.09.28.14.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 14:06:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] jffs2: Fix spelling mistake "Synching" -> "Syncing"
Date: Sun, 28 Sep 2025 22:05:28 +0100
Message-ID: <20250928210528.243027-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_140623_057203_12F627F0 
X-CRM114-Status: GOOD (  12.69  )
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

There is a spelling mistake in a jffs2_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/jffs2/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 1b833bbffcf5..116567899e23 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -83,7 +83,7 @@ static struct jffs2_eraseblock *jffs2_find_gc_block(struct jffs2_sb_info *c)
 		nextlist = &c->erasable_list;
 	} else if (!list_empty(&c->erasable_pending_wbuf_list)) {
 		/* There are blocks are waiting for the wbuf sync */
-		jffs2_dbg(1, "Synching wbuf in order to reuse erasable_pending_wbuf_list blocks\n");
+		jffs2_dbg(1, "Syncing wbuf in order to reuse erasable_pending_wbuf_list blocks\n");
 		spin_unlock(&c->erase_completion_lock);
 		jffs2_flush_wbuf_pad(c);
 		spin_lock(&c->erase_completion_lock);
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
