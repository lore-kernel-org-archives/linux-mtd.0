Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683C61099B33
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAnEMZGqfG1Fa+A+lDuoxOl+lnTzOnYTuHGDpN5pj1I=; b=VqWSAMiBYqi9ea
	hPMHpIjcs++jb1mmIioYzohe66mNiOaHLpyP5DSaQ18h7Focpu+csImp+2QPvchg0dtbFXy4w/E2W
	Q+7noCEma2ukVImA3Tx+8XW+FyaXRy+tQ++xLhm9OSOrfFicbkIfokO1SjzdT0IEkX9lsFRsPSmZN
	NvQXGgHFYHF2X8AEWIImKfOIzWgcl3Hjj6sGs2p8Y055GNPw35dHpkyhqoH/DMCsKRG0FNZv47/lA
	fwo5y/DnJcFOQYjMDiLZzVAsSVsCaHEmqXYQzwzFf/B/WAWzuSqBJkVFGsisQecLbVCZhQEoBXXkV
	NmB44dYMd0bf1vlj0PZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eIN-0000000DLyY-1RRU;
	Fri, 20 Mar 2026 18:10:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eIL-0000000DLxz-3Hl4
	for linux-mtd@lists.infradead.org;
	Fri, 20 Mar 2026 18:10:02 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-827270d50d4so2112142b3a.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Mar 2026 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774030201; x=1774635001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psYPSCUI3HObhz8STwDlZrZAaXEuyKQVGNn+8ySckI8=;
        b=JFgvvFT39M0cxfBrw22c3nLFn5QEoQ2JceVOPeP9HSor3+Mcdgi06RQxlziVOnvLR5
         MolIHc8f321AzwNZZzs565dTNNmQtv5azt8Psn80J43qQj9eyMJsmcS/3B34q/1oAhN1
         GLyLSv9d/ctDEZUehg7Ey5WVTsHfowNMk/3sUPq4rKxQoSCr8ZtwVX9d0HmgyUmDUO5l
         bzBoZ98Hk8DHisjLHkgYeFJRjZOu9Fd3AZWU0cSA84tF8QC+UAf8c+Zm4OErXdWmtTmY
         CWWn+Tts5aY7cLGqeik0GY89fUHE2dXP/kI8YDOQqMbeLJXrZdjis6bYpRkhdxzVhNbS
         9Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030201; x=1774635001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=psYPSCUI3HObhz8STwDlZrZAaXEuyKQVGNn+8ySckI8=;
        b=WVD43zVC48HW9onVXoIYQYvRi8UJjvGRQ++qfiI3lUX9qRJymmMeU+XuJQcCFRsUTz
         eQJmXOZEaPGFsfy+NoHw7nG4Rc0waiO/j7WIwzZEzEw7KzIuU9M6zglE1QwzTbvQdsX2
         MJR4UzCRSTlQMpVQN0FQ99ZmJBpvlktdyO4BjfruVvnaF1eLARNiBys9tv1I1XWTqsvw
         f8WhCAnx2NLw2a47LfHFwHRBX08TOZvADekhTyGPyLrE0DqlFdn1+W9OflB9xq01gfXc
         aK38aIhlfVwKOkMc5eDMQ6nDFFm15UZIK0AA8xNmH40XQ+QjJvs7XHMNKsyZjdpRiU3q
         5CPw==
X-Forwarded-Encrypted: i=1; AJvYcCVd9cp/I7Bvl3e9dTkdAJoHWqqoG7LuTT3uTvN8cyPeBdwa2yM516BWd2OB8y7pNziKCNrlKVwTH+U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPssRF60NZbSqMhYS4xp/USar/grP9WA/vxkDb55OF0k53NYxd
	2CUY9Mld2cU7FZtEICGxGv1xAH/WjlhkS8D3734JbbivpFKajgSBLRIS
X-Gm-Gg: ATEYQzyrhf05+w27rPzPJL/MX+/1ymeyOKLRonfE94ikL/+nPYi8J1MMhaQGzZoJlou
	9fZ3hOH38u+CI1Mxx0IpCM3gEj9208RweL2QSohh7XVptPFA+LPdrhi3ZAJJTWW5YwHuKSiTctP
	jLIwyJ7LFpt3ak2kSnbiNVdOgNz07fVhkCS6V0nBRmrUWHWDSVnR8yBZ0SJ26MFyxesOtIjSucO
	gsKpPwXiLOXVBFGp43FylZLrvnL/UR+tvVvkp6AbEjdgKYg2nFZfRFw0c/Zc4MDHYtAcJS1fKl0
	b2WhLBvnd4rGgz0M2Lg0hQwPW2Jo0HKO8lv8Xaf34BPfdT66z2uQOnz81nMk78A1XrKz2ijz6fN
	HViQo9MxSBuZxTu7GgA7mCvcQVk73MLynJpvzUBFxQYwbD2S6WRYncM6wXnpFVUTN4RdFWU8pOp
	16KoL275PT4uK6fZo9N+CJx0PRKQB1dRRoelnGacMdOZ8/9bjXuGuo1KsMOodw0puSJLaEo0uKa
	rcxyuRj59dI3/hzjg0gMHzTy022HdEAfjx6FE4=
X-Received: by 2002:a05:6a00:3e07:b0:829:7d31:dd9a with SMTP id d2e1a72fcca58-82a8c335460mr3681559b3a.51.1774030200703;
        Fri, 20 Mar 2026 11:10:00 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040d7e56sm2582318b3a.40.2026.03.20.11.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:10:00 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: richard@nod.at,
	akpm@linux-foundation.org
Cc: chengzhihao1@huawei.com,
	hch@infradead.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 1/2] ubifs: Remove unnecessary cond_resched() from list_sort() compare
Date: Fri, 20 Mar 2026 18:09:37 +0000
Message-ID: <20260320180938.1827148-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320180938.1827148-1-visitorckw@gmail.com>
References: <20260320180938.1827148-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_111001_839683_148F350E 
X-CRM114-Status: GOOD (  11.09  )
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

Historically, UBIFS embedded cond_resched() calls inside its
list_sort() comparison callbacks (data_nodes_cmp, nondata_nodes_cmp,
and replay_entries_cmp) to prevent soft lockups when sorting long
lists.

However, further inspection by Richard Weinberger reveals that these
compare functions are extremely lightweight and do not perform any
blocking MTD I/O. Furthermore, the lists being sorted are strictly
bounded in size:
- In the GC case, the list contains at most the number of nodes that
  fit into a single LEB.
- In the replay case, the list spans across a few LEBs from the UBIFS
  journal, amounting to at most a few thousand elements.

Since the compare functions are called a few thousand times at most,
the overhead of frequent scheduling points is unjustified. Removing the
cond_resched() calls simplifies the comparison logic and reduces
unnecessary context switch checks during the sort.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 fs/ubifs/gc.c     | 2 --
 fs/ubifs/replay.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 0bf08b7755b8..933c79b5cd6b 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -109,7 +109,6 @@ static int data_nodes_cmp(void *priv, const struct list_head *a,
 	struct ubifs_info *c = priv;
 	struct ubifs_scan_node *sa, *sb;
 
-	cond_resched();
 	if (a == b)
 		return 0;
 
@@ -153,7 +152,6 @@ static int nondata_nodes_cmp(void *priv, const struct list_head *a,
 	struct ubifs_info *c = priv;
 	struct ubifs_scan_node *sa, *sb;
 
-	cond_resched();
 	if (a == b)
 		return 0;
 
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index a9a568f4a868..263045e05cf1 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -305,7 +305,6 @@ static int replay_entries_cmp(void *priv, const struct list_head *a,
 	struct ubifs_info *c = priv;
 	struct replay_entry *ra, *rb;
 
-	cond_resched();
 	if (a == b)
 		return 0;
 
-- 
2.53.0.959.g497ff81fa9-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
