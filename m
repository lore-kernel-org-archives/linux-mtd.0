Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316EA606D80D
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L38WqIOO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0y3Djm5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b23lSZ8drgsh19cT/O1s8bYP8rkuC2c5gsexUgg6Qos=; b=L38WqIOOf1fK7YrF433s3lK5hG
	GSYNI1lz4dqX4U7hkZKbUTwpC5PJMg8oQRJDdigXP7Umu5ToGAFHk6D2Tw/IYSAgZqFo9AvuVeQq9
	NDMRSUZ+Tr5UStt877rzpCr2IH+vCWIcl7SQ6Usvdg8xKs74RYWECdE9aDTjWVQu0LyuM5nAxB6rO
	sGfmBJAWDMwU5at1citTCjKPSkexUJtpuZ+a4U+KvejNcNUXmxehZ+9zNToOsjJcUqSulDwrvo9Eh
	qzhOTZZwtbKrtMNbqOMwf3aVXB81t2vakLAfC8/OLd5KyaRM0T+6M0C9lt4Jf77wvcgLnbA5uI+gP
	RI23adXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCe0-0000000Gw4R-3oWp;
	Sun, 08 Nov 2026 23:49:52 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdy-0000000Gw26-0g8F
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:49:51 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-53a448f86e0so140022b6e.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 15:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181789; x=1794786589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2nfNoHKtlD4mhlL1Yw0iPJLjruMz9pBLydXH0Gv9Rg=;
        b=J0y3Djm5hkgT7JqcXluYDELvK6iClVxdv6Zyi9YLAi3RVCUx1V40xhgTdnIXwF5UT6
         d03ytSCLbBrSNoCQ+X0d6mX3UStBuI3lkivki+XxuBFtVzw0jPfqio6zC3WqvLws5XCi
         tji538hyReylacCVRog+WJrJODaaQHsRe0z3CsDUmrzNnPhVenogn/VMki5Y2inoAYSn
         Z4FEhYG9Tzyg6bOYnaOzTfYmW828BtNR1K6NXJ73hENnSDm1nnTnQiuYCAv6+p+7jii5
         pWRarfgDuFlOowXQsktgwCo/T9AJz8D6DyV/YI6SKn/WxtIw7yZgfUrRdScsD5S+Nuwn
         A90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181789; x=1794786589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2nfNoHKtlD4mhlL1Yw0iPJLjruMz9pBLydXH0Gv9Rg=;
        b=Rr/FOil32pKFy+6SSZnfwXjHW0TMPxO6dxRoBijN1nZjNPa5xR3SfRTA4eatBbs0H4
         5DKKMy4Mc1OaMFxNQyznvtKuNkNQAsD5kINAvxeg8apTjRVbZ/SE48UoZg7+xOCEyRbl
         fHaWQyEAa39INSJ/Zr4pBOOX8vGkFlthKwzsKK76b5jtmyioU9Rw2l6QUmC0P7VdQSDO
         KQb37y1/kdvclLbpAaSm7TOSX5ZWz/FkLAoBj+ku1Xp6miI4DHGzSRVIO9Vk8R+T0JjQ
         OjGljwvTdFK578184e/gFy8NNmnRr0OXFFUowem3Lzgnw/ioKrWyKtuJg4qWrDE8wWiM
         ztDg==
X-Gm-Message-State: APuU4Z+FCkHR5nHVxAR7joMAslUeh6pZPHG8q5NmHP1wdj4nHJkFqp+T
	99hCBKs0xLPZkWU6p5j0yzw/2TEwDBDyXKBe9/fYrfvlCy1YMUodHMae
X-Gm-Gg: AYBFou2ofFuvxq/6FEXx7QGiHSfHVbhF2BoJ/kKzy/JWIgrKKxrZgDjCOfYN3ao3UmY
	ad3GBsedR/ANC6DFMASbDSuw0WGM+9glAvHLnUGbEchnnAatjXn2+Ax3au0tnYK0U7SRJM8r3MD
	SqZo2ZUmAV0rjjAzoioIe+GrHY6eokTbye85XI8YV1A/Y0/FEO5MZcfhbt4g5KDHfLSOqx20CZC
	7n2lhdmeqS9omgSTsYXi6DD0yVO6zX+mVjJrNow35utsfLEUh31loJ5vQUx5oxdgKx011KksPHD
	VAIdPNhvIszbh/iAJIuwRZjwJqSHZ/PGuPXUZ7sWpfHKvQsC5BZgpNJGINmPPiQ9Ium0icxYjDY
	Pu6OQZ0YA9AyiRQ3dSEeY8i3v+KEV8k09BPnB89gF7i8uFRGJcuNX6pFqsq+ZixKeV78JnhlNPi
	n0SBJx45wMRY9fH3GdRfbtjG1ojlkNkFwaVuAMeC2PDvjnL7BPgNb+YfpWocC/xauAw7U6TNoM+
	RUQ6rcVg+pjG4ta00C3Leg5qx3FLXVA0P+NS0qjMZmc/cf+TdM9Qvca1OiCGnMLJjzi5Y8yBHWc
	IlN0SUaSxqyPgw6o2L4mJufMkACXwxZR59m6CnsJrUZuJeoU/Du7iuRC5GvCOhU9qT6L5HReJLr
	S4AS1s0Zb73oMbn/1TjNQt6ZJaATzZwG5bOMoN9H/es84FTaAcbQAEfzDq6UwcTgofRno0dzCe9
	ZLEUCY1mgTEFSq/SNJvWmHXBxAdr825RznO07uhnVCV5lvmudIkcEU
X-Received: by 2002:a05:6808:3096:b0:4bb:ac05:9ebf with SMTP id 5614622812f47-5681431e1dfmr2132113b6e.14.1794181789040;
        Sun, 08 Nov 2026 15:49:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:15 -0700
Subject: [PATCH v2 4/4] mtdchar: finish OOB transfers after the data runs
 out
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-4-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_154950_215787_68D24547 
X-CRM114-Status: GOOD (  15.31  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A combined request can consume all of its data while OOB still needs
another buffer-sized chunk. The ioctl loop then stops because the user
data pointer remains non-NULL. MEMREAD reports a short OOB count and
MEMWRITE can return success without programming the remaining OOB.

Continue until both streams are exhausted. Limit combined operations to
the pages covered by their data and pass a NULL data buffer for the
remaining OOB-only operations. Advance past the pages visited by either
stream, including a final partial data page. Limit OOB-only writes to one
page, as required by the raw NAND write interface.

Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 85e98905f732..cbbc258109f5 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -613,6 +613,20 @@ static int mtdchar_adjust_io_lengths(struct mtd_info *mtd, uint64_t start,
 	return 0;
 }
 
+static u64 mtdchar_next_offset(struct mtd_info *mtd, u64 start,
+			       struct mtd_oob_ops *ops)
+{
+	u64 next = start + ops->retlen;
+	u64 pages;
+
+	if (!ops->oobretlen)
+		return next;
+
+	pages = DIV_ROUND_UP_ULL(ops->oobretlen, mtd_oobavail(mtd, ops));
+	return max(next, start - mtd_mod_by_ws(start, mtd) +
+		   pages * mtd->writesize);
+}
+
 static noinline_for_stack int
 mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 {
@@ -662,12 +676,12 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		}
 	}
 
-	while (req.len > 0 || (!usr_data && req.ooblen > 0)) {
+	while (req.len > 0 || req.ooblen > 0) {
 		struct mtd_oob_ops ops = {
 			.mode = req.mode,
 			.len = min_t(size_t, req.len, datbuf_len),
 			.ooblen = min_t(size_t, req.ooblen, oobbuf_len),
-			.datbuf = datbuf,
+			.datbuf = req.len ? datbuf : NULL,
 			.oobbuf = oobbuf,
 		};
 
@@ -684,6 +698,10 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		if (ret)
 			break;
 
+		/* Raw NAND accepts only one page per OOB-only write. */
+		if (!ops.len)
+			ops.ooblen = min_t(size_t, ops.ooblen, mtd_oobavail(mtd, &ops));
+
 		/*
 		 * For writes which are not OOB-only, adjust the amount of OOB
 		 * data written according to the number of data pages written.
@@ -703,11 +721,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		if (ret)
 			break;
 
-		if (usr_data)
-			req.start += ops.retlen;
-		else
-			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
-				     mtd->writesize;
+		req.start = mtdchar_next_offset(mtd, req.start, &ops);
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 
@@ -782,13 +796,13 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		}
 	}
 
-	while (req.len > 0 || (!usr_data && req.ooblen > 0)) {
+	while (req.len > 0 || req.ooblen > 0) {
 		struct mtd_req_stats stats;
 		struct mtd_oob_ops ops = {
 			.mode = req.mode,
 			.len = min_t(size_t, req.len, datbuf_len),
 			.ooblen = min_t(size_t, req.ooblen, oobbuf_len),
-			.datbuf = datbuf,
+			.datbuf = req.len ? datbuf : NULL,
 			.oobbuf = oobbuf,
 			.stats = &stats,
 		};
@@ -806,8 +820,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		ret = mtdchar_adjust_io_lengths(mtd, req.start, &ops, req.ooblen);
 		if (ret)
 			break;
-		if (ops.len < req.len)
-			adjust_oob_length(mtd, req.start, &ops);
+		adjust_oob_length(mtd, req.start, &ops);
 
 		ret = mtd_read_oob(mtd, (loff_t)req.start, &ops);
 
@@ -826,11 +839,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 			break;
 		}
 
-		if (usr_data)
-			req.start += ops.retlen;
-		else
-			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
-				     mtd->writesize;
+		req.start = mtdchar_next_offset(mtd, req.start, &ops);
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
