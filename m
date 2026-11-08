Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181E2606D80A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPpZt8YI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SOyQeDlK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4hhIQEJwaGAI2F7RXqOFifSSUJOT+PRu1lz0zu5egF8=; b=QPpZt8YI7AV0yvpUrAGm6Hjm0D
	0OqRE+MVBPIJ8o7ZBx3gGfCU0EbZu+/Cqgmg7QgfU1hY4jh5gpZf5hcjI3qfEwOUeJe1FJUXQTHC7
	aToa5oFd2i9QGpgbtbcNz0y000lqwJlbq3PmAyuQXd6aeM2CZUGLcQVee0w/GP2HjwGa5YSQf20JM
	/qY7mj05QufhBbis9VZMNDEzt4x26tTY8HjfHbUjNsHPko6enqwX5uPrPvna7byX0Jl17S84XOk7z
	Vp/iKwSJzrFRXBYN2TtHtFeSh7aICQ5HMEbQdrbXfi/Nxlojm3dE++Y7dmsTnhebrEOqCl65KluuY
	hvRfmnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCe0-0000000Gw49-37WF;
	Sun, 08 Nov 2026 23:49:52 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdx-0000000Gw1b-09Y8
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:49:50 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-539a57a0b1fso81225b6e.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181788; x=1794786588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=SOyQeDlK4dnVe4nsPdNjEtPK72DxJta+Pnfh/paic1MMFvXb7fgbMHImniVfIf/Ms2
         CAHE9a05q7awwHaluB/wCLvLen7a+xqzb8A9a9snZ38bLdNVTcYVQZu4JhMFqGJKmKZi
         s5yZ4tEiyslZSwrMTGbAyWCLxNpXfCSc0RBjx38uiJrLUJiwQwHZ0k0yEjJzuCKcUTE4
         MEHWPe+Nys1mX4pqxRW4esGhopoqDhKVV0d8Im9n3w28hYE1ymyy03erujDy6mmlUnqa
         TfmONXB+uQSpAZRHsJUGabcWnHcmnqGIESHKR4PsUoPnnLmNJ5N3iMlIqDlYRTEcSUNL
         qhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181788; x=1794786588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=ZCVYNvGD5v7IPcmp3tLC4HViX5Ep3J3jkpCzl3ciYUwSOmiHO0ixVDUfl9HcK2F0Tc
         nhH1XmqbAWOA+2H9z1Rt5XbpDT5S3qP74yYx5s6zu5OPkLLJZuXKn56FCaUh9dmnbsel
         YvC11glVTWJilAMEqiz6ZAIbu4JIeTo3c+5dwp0Z0g2q74WmcS4Bu5oszGMFbSuoOIGO
         kyqpiFwycYS3tipz+2dqOvOnEdfvVkhd8xFwvDGOI5bYvhG7EZwQOxKfK4p7pUvvLyBk
         SQdHmIzEWEP3MuQgNeSV+IdOJJ8PBU0qisSpyQJzCD9RJnSbt3PzG9ykxwQq0d7tjBIk
         9O7Q==
X-Gm-Message-State: APuU4Z/DAlwPWqdshR8ON87FJlvh9sr9Y3VQc4bLfhKJubUC0TjMfJIp
	iP142UzHKyYqAD2ETDm2Jw9943ii98IYhNLtWZsSLNvgrmTc3g8OjBlQ
X-Gm-Gg: AYBFou18WrpiAnKa3u3OLvcuqbC0Wv57ErIHMMaESyZYYYsNqDy68CPYKsKj6nRzNny
	HzVxkPIqw+apxqq9Q1J+9H7dtyog+HWOpmiBCt1FGG/b329ycPnUICaV8w17wJWAeI6riCIVYU0
	Y2cpHqKLGzsUPmicHq/uQtxW9h2+ZOB3I3Z8TVken+0Hv/8CUVLGbORlsV91PJVdT/kMTtjOUsx
	yE3s5wcYiXKvmFd6NWSst8gK8Zirv+E+Tv0aYgqXxz/omV+hOyz5Dmz5GjH1iy4Oa6QOeeo44GJ
	oPxefWbVVututhK/iorzvEXhyBf7FtxfAmhUldBsaATtxUna/Ld96ZvX5L2zsCFGIoqoprtWCho
	NspHbMwtj+R0zdfNZX1A7Cq1Hw5cN3Z9QcddwHx7FNhP3hjAcNPYJiQrS6DkKe8UUD8y0Df6zUj
	G1kwcQxucg3p8CGR4Jbh1gDGMp50ArEk3bEyzOeX4MG57+k3lgB+mPsxiHlnO5mFqh/SgCHCDjL
	9PN/hDI9prPJDsQuOPRtz5d9UccvRC0yW2qpDR8UhkHnYzbS3n/gY9eZsGQ7sOVDyNDeFJEBSmC
	9k6KrDMXxNzrx8I2jHU7IuXwJkQRxiIuPW1M5zIaC5rhiKy3oHua6jTzSmhFm9mdridgIRN9/Ed
	md8tuEsry1NZoT87h+mfkO+zxCsNX+MZh/aV5naAv8YXPXF4/Ybt8vl1jF5MK0kpZQyQknw9r7M
	pukBRagCY9CJu0KhN6NjuCH0eFNP1f/z2/tWNZXrFY8C8h0yI8YRk=
X-Received: by 2002:a05:6808:bd1:b0:4f7:f874:8cba with SMTP id 5614622812f47-56814714267mr1383882b6e.48.1794181787763;
        Sun, 08 Nov 2026 15:49:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:14 -0700
Subject: [PATCH v2 3/4] mtdchar: keep OOB chunks aligned with their data
 pages
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-3-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_154949_080584_426534B8 
X-CRM114-Status: GOOD (  18.55  )
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
