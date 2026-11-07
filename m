Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5401606A32F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 05:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HvqPqu3N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhTk0eA1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4hhIQEJwaGAI2F7RXqOFifSSUJOT+PRu1lz0zu5egF8=; b=HvqPqu3NNd0KyXnA7CuLEo2QSk
	CJoE8/9eLhnPw4WaRDyNcO9KXUaHY94T9CAKy1M3bhDdP94spSFt1oI0aQj4cOgZ9b5mPxBEjqhI3
	g1ooXb8HMEnLQyaRQFD70n4lPB5T0FZXxXBPNgt/X0D31OBbA1J051Md7JZdAsSgduIuSKw4CevFn
	KvwMIQLfTT5tRVudJwp8/1T4lCHpTM8klnLFYDKo0X8WGmNxrD0vRhkFDHg7YVc29u1YFWvGe21/y
	ROJfHVNhSwVIPjyYlel+OSg6mMXXiSXj8aAqjdb89skeeRHEZQCLnZB+AVEKoV536skyTJEZKX1/W
	ZRKymI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYrD-0000000EDvS-1uS2;
	Sat, 07 Nov 2026 05:20:51 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYr9-0000000EDtT-17IP
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 05:20:48 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-567cb8f983bso638455b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 21:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028846; x=1794633646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=FhTk0eA1MxVx/6GG3nX6+gFgjgsIWn1OtNu2tFYMPGrJf4MHXmjEcEgV19MQRYlULW
         9uhvNzXMi7VULvPSwMhFI0aP9yATpV8msQuOJ/trkCgiSW/8x/5fcUTVrnWmhy1TPt/Q
         T5DkKywB5OmqYVzRMk2NUfLNRbyafqIvxfNKqWBv4WF67+du7tSBkY5/ZQLcUNrGuvXU
         YqN+6mbB/DqV0p8NNaDlHgM/A2DH18uzKtaMfynglUnugwmgbvRFxGENA/jHj8ASKjHf
         AIjxnFUyj+SG531z3+yvPFso6vl6mcBetRjCWJYgwrWWvXVP6yV5AeHiOeDh1njh0CES
         uYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028846; x=1794633646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=zX4/ZhCcGFLWDUprwU+583pG2YGACjWxyMzuD1oQpP6bzU7WpevvcH9SmSA7ysedyu
         8WfGHd/OUIuEK71fAqJEkFTc+Q/RQwGrzhXYQFcjw7VHYvO/gaV/u1SLwYgL9M6ZaHMk
         tKfOK1Zeed2yzVy3FEmll8AwxcHXxyUaMEF7iulMYZ3s/lGsq5EqccxYUW5HOQcH2fok
         8vKfb6NHGtclr71+Dv57JWtrG3VWQiU5XVHfpdH8yLRw6QakPuSxWNWHKldUA0M89r+I
         R5PM2vPUeYr3GOVMOgfOVAfM+QTJJhZ7cw0JZQo/HxZYx8jQPais/pkMrzF4BoRSPNrZ
         j37g==
X-Gm-Message-State: APuU4Z/lnVHHJVuCNtsqPOqptZiHY6rbnwV/QGK2Ha7PPZcBwNichFWt
	R4/KhA54UlHlfZhL4NU10onOaGTHnd7E5EXHkrtuiEHJ9XiPZb7BPc3/
X-Gm-Gg: AYBFou0WAf0r+nSfKoXrbOdkO50V13440q7BphjliLB516MSNfAIfBoH9rs4TIwZB2J
	wan4xHHjRflmgc6N0R1U8T/oOFRgS9EKyIrZej9VGYTbtYQ41nfjN21tusX3dzIgLj+MFPKEDc9
	0onhmT/wbGFUMwUlB5Nee8WxNn4KkxaWJzvTDZsdSJvvbFohLu2qCw33iaahiAArUXzNxqX3DlQ
	bovhAJrB2ftXRIqJwTs5GOlyqhw5rTKsCl5wI2TsZ64BZbiDmLmdd5LPfdoRa18WnP5z9b4AOKl
	c+6dZoSG5jBRhvpujY7bRUS/MIfwg8+Y9cqQi9z0SWhdAKFUmv4Saxq523vU1j5OBJPWkrn6RIM
	HWpAt2jvfaghYAAjNciESHmm0gZosG1t8HbcX9q58NbIvd7aROiGYJ85H5wXnEZaiWCFfztiRSx
	7z4HQ2kgGkW1+7grMOTlVjsz8yg2ceFkdVB22c4v/ZAGxscxjGhrpEPe/gAn+Rlg6zCCXvWYCH7
	zH0qsxjzUUuPpwQphg/kvhxAqnvp/x2UOCqtdb78v6RWHVLmsPAJIu58mlunFD7V+pJsB8fGwiS
	dwFopfm9L7/wq0fcJTw3E3YdxLJop58fOJBZyEOX2We9RfW1KtNZymcHO5/OJC6UxwHODufIJCZ
	NOATCqwp1YHMejWQLZKtU68j6t52fm7MxwtDLdtcsZa4IauAy7TzJBzzRIOaYD8xsJnlLaIyiZG
	wVHTKSo1TA+Lss2TM+d+G41Dns8KHfIkN/o4OQvz3OYEK7Y7Z7+kedxQ==
X-Received: by 2002:a05:6808:f13:b0:4c3:4e34:c69e with SMTP id 5614622812f47-567e0fa6011mr3158855b6e.8.1794028846024;
        Fri, 06 Nov 2026 21:20:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 22:20:41 -0700
Subject: [PATCH 3/3] mtdchar: keep OOB chunks aligned with their data pages
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-3-2973a03531bc@gmail.com>
References: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
In-Reply-To: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_212047_323206_17168EC5 
X-CRM114-Status: GOOD (  17.87  )
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

MEMREAD and MEMWRITE advance the flash address by the data bytes
transferred. OOB-only operations transfer no data, so another buffer-sized
chunk starts at the same address and repeats pages.

Advance OOB-only requests by the number of pages transferred. Round
non-final OOB chunks down to whole pages so the next call starts at the
next page, rather than repeating a partially consumed page. Allow the
buffer to hold at least one page of OOB and reject requests when the
selected mode has no OOB capacity.

When OOB is the limiting buffer, also cap the data chunk to those same
pages. Otherwise a combined request can exhaust its data before all OOB
has been transferred.

Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 53 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 189e462a9df0..85e98905f732 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -589,6 +589,30 @@ static void adjust_oob_length(struct mtd_info *mtd, uint64_t start,
 	ops->ooblen = min_t(u64, ops->ooblen, pages * oob_per_page);
 }
 
+static int mtdchar_adjust_io_lengths(struct mtd_info *mtd, uint64_t start,
+				     struct mtd_oob_ops *ops, uint64_t remaining_oob)
+{
+	u32 oob_per_page = mtd_oobavail(mtd, ops);
+	u64 len;
+
+	if (!ops->ooblen)
+		return 0;
+	if (!oob_per_page)
+		return -EINVAL;
+
+	if (ops->ooblen < remaining_oob) {
+		/* Keep a page's OOB together when another chunk follows. */
+		ops->ooblen = rounddown(ops->ooblen, oob_per_page);
+		if (ops->len) {
+			len = (u64)(ops->ooblen / oob_per_page) * mtd->writesize;
+			len -= mtd_mod_by_ws(start, mtd);
+			ops->len = min_t(u64, ops->len, len);
+		}
+	}
+
+	return 0;
+}
+
 static noinline_for_stack int
 mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 {
@@ -628,7 +652,8 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 			return -ENOMEM;
 	}
 
-	oobbuf_len = min_t(size_t, req.ooblen, mtd->erasesize);
+	oobbuf_len = min_t(size_t, req.ooblen,
+			   max(mtd->erasesize, mtd->oobsize));
 	if (oobbuf_len > 0) {
 		oobbuf = kvmalloc(oobbuf_len, GFP_KERNEL);
 		if (!oobbuf) {
@@ -648,13 +673,17 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 
 		/*
 		 * Shorten non-page-aligned, eraseblock-sized writes so that
-		 * the write ends on an eraseblock boundary.  This is necessary
+		 * the write ends on a page boundary.  This is necessary
 		 * for adjust_oob_length() to properly handle non-page-aligned
 		 * writes.
 		 */
 		if (ops.len == mtd->erasesize)
 			ops.len -= mtd_mod_by_ws(req.start + ops.len, mtd);
 
+		ret = mtdchar_adjust_io_lengths(mtd, req.start, &ops, req.ooblen);
+		if (ret)
+			break;
+
 		/*
 		 * For writes which are not OOB-only, adjust the amount of OOB
 		 * data written according to the number of data pages written.
@@ -674,7 +703,11 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		if (ret)
 			break;
 
-		req.start += ops.retlen;
+		if (usr_data)
+			req.start += ops.retlen;
+		else
+			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
+				     mtd->writesize;
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 
@@ -739,7 +772,8 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		}
 	}
 
-	oobbuf_len = min_t(size_t, req.ooblen, mtd->erasesize);
+	oobbuf_len = min_t(size_t, req.ooblen,
+			   max(mtd->erasesize, mtd->oobsize));
 	if (oobbuf_len > 0) {
 		oobbuf = kvmalloc(oobbuf_len, GFP_KERNEL);
 		if (!oobbuf) {
@@ -761,7 +795,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 
 		/*
 		 * Shorten non-page-aligned, eraseblock-sized reads so that the
-		 * read ends on an eraseblock boundary.  This is necessary in
+		 * read ends on a page boundary.  This is necessary in
 		 * order to prevent OOB data for some pages from being
 		 * duplicated in the output of non-page-aligned reads requiring
 		 * multiple mtd_read_oob() calls to be completed.
@@ -769,6 +803,9 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		if (ops.len == mtd->erasesize)
 			ops.len -= mtd_mod_by_ws(req.start + ops.len, mtd);
 
+		ret = mtdchar_adjust_io_lengths(mtd, req.start, &ops, req.ooblen);
+		if (ret)
+			break;
 		if (ops.len < req.len)
 			adjust_oob_length(mtd, req.start, &ops);
 
@@ -789,7 +826,11 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 			break;
 		}
 
-		req.start += ops.retlen;
+		if (usr_data)
+			req.start += ops.retlen;
+		else
+			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
+				     mtd->writesize;
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
