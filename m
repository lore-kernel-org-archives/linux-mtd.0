Return-Path: <SRS0=9i30=ZW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18497C432C3
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Nov 2019 05:31:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD469208E4
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Nov 2019 05:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KxpnuxqM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTBT8UKK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD469208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tN0xxtixOLXHS2x1GlUndC0tcS7N1b2mI+8ydERXep8=; b=KxpnuxqMYlneKd0VkaiP54mo8Y
	P/AeaSPvqD+lkHwyACNDjhDDZXBkBWx1JgYfSpFixH5ntPjimoHeqa6mPaCKo+sx9oe9+CTYgmjml
	mq3HPo9Q1t0Q23xwPYn1t1XlaxCVd0K5UiV13BC4+knyXqXPwRsnHI7ZVJyNFZfCWMJy4FJd5hwgl
	IFyc1ij7fzMQQW7eM5OfBX9BLCzarU0Q5DQAwQjzcyLd44MZFkeeC0ZFpjyUFhwuCjpRIe2KW7oNd
	JFf3CUNattQwJ805rVTAcmGG8HI5lrd1G5JQX9ppln2dE4PZeeqHx2TDUDCZtj5XXv2igCZo0cokj
	nm/MYCUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iavLo-0001fo-Rr; Sat, 30 Nov 2019 05:31:24 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iavLl-0001dw-RO
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2019 05:31:23 +0000
Received: by mail-pg1-x543.google.com with SMTP id k1so7123882pga.13
 for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2019 21:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vw3rC7pffNNcciKNW8GALTh1NKcZNgUJHxJWIV46+IQ=;
 b=QTBT8UKK9yUITRVyFfiYMom5BZg89YGsEzgcN6Ysm4CvfNOo1aUz9n83Bt2HWsz5LM
 nRyX1eeWgFXLJKlPkpmyyju0gEUuWJ0X0v6fgyh/HuWx9WJOWxyIJ5+j0upSMpupRdQh
 pMM0oanTxpjUBVKYEI9vcqAAOEnRGt7G/7VR4kBBVYQ1/4L7AktgC0zSLB+1OO9WWpEg
 GU6bKa7qCf9HcrUuEubih9LUwQfFCfpnyqbywLQs12WvQV0BEtdptgpXs8RHA6VfHTcH
 VriOGXHIOpd1+HAZL86mfD73n3063vP0YD8EIHCljzpubRjfwiN/VnKRAivE2x4v01Nw
 sIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vw3rC7pffNNcciKNW8GALTh1NKcZNgUJHxJWIV46+IQ=;
 b=UIwhKFRuwHRqKhpFhAz6QClSj3MzCKw1pgeTK560ErudpQUDBuWiTbeI5DsStL7+Dk
 AVUHOq/ZWj+oj2J4gqjRrh220XypfVdAiG5BnOgFEgSzq+o9g3LQ6PYGKMFHoGhqJgET
 5MyIIKRCYE769cgDgSq88pS3DcF19JQS0jBybkBPywH0difv7omlJoqVUghizRnlcFDe
 appb8ylfUrXGHUajtF+e1+QpxllKc5wLbKYvFA/izOSop5A/2/xkE5haW8WuLMc2fOxV
 TmkuHwH+zMHb61D8CAFRFFyiRPxaW4LYoB9lsEh+l4JY58XHS55fA6HHdi3F6sLmbL0f
 5n9Q==
X-Gm-Message-State: APjAAAWZmJd6/Nx38pvdQL4W9HHl1e5kKhmpuWGysL0rmUyALodDd0+T
 k6f9+6gumolFQIJVx05E310=
X-Google-Smtp-Source: APXvYqyKLE9MPEOfva5JmfnqKbKoz5o2n2ZiCUAM4Gm+j89Z0YMto0rYLtIj75X10hjrQIYJyzB12Q==
X-Received: by 2002:a65:58ce:: with SMTP id e14mr263048pgu.153.1575091880926; 
 Fri, 29 Nov 2019 21:31:20 -0800 (PST)
Received: from deepa-ubuntu.lan (c-98-234-52-230.hsd1.ca.comcast.net.
 [98.234.52.230])
 by smtp.gmail.com with ESMTPSA id a13sm26131734pfi.187.2019.11.29.21.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 21:31:20 -0800 (PST)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] fs: ubifs: Eliminate timespec64_trunc() usage
Date: Fri, 29 Nov 2019 21:30:28 -0800
Message-Id: <20191130053030.7868-6-deepa.kernel@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191130053030.7868-1-deepa.kernel@gmail.com>
References: <20191130053030.7868-1-deepa.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191129_213121_886973_2D8F6C05 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, richard@nod.at,
 linux-mtd@lists.infradead.org, arnd@arndb.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DEFAULT_TIME_GRAN is seconds granularity. We can
just drop the nsec while creating the default root node.
Delete the unneeded call to timespec64_trunc().

Also update the ktime_get_* api to match the one used in
current_time(). This allows for the timestamps to be updated
by using the same ktime_get_* api always.

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: richard@nod.at
Cc: linux-mtd@lists.infradead.org
---
 fs/ubifs/sb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 2b7c04bf8983..93d550be4c11 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -84,7 +84,6 @@ static int create_default_filesystem(struct ubifs_info *c)
 	int idx_node_size;
 	long long tmp64, main_bytes;
 	__le64 tmp_le64;
-	__le32 tmp_le32;
 	struct timespec64 ts;
 	u8 hash[UBIFS_HASH_ARR_SZ];
 	u8 hash_lpt[UBIFS_HASH_ARR_SZ];
@@ -291,16 +290,14 @@ static int create_default_filesystem(struct ubifs_info *c)
 	ino->creat_sqnum = cpu_to_le64(++c->max_sqnum);
 	ino->nlink = cpu_to_le32(2);
 
-	ktime_get_real_ts64(&ts);
-	ts = timespec64_trunc(ts, DEFAULT_TIME_GRAN);
+	ktime_get_coarse_real_ts64(&ts);
 	tmp_le64 = cpu_to_le64(ts.tv_sec);
 	ino->atime_sec   = tmp_le64;
 	ino->ctime_sec   = tmp_le64;
 	ino->mtime_sec   = tmp_le64;
-	tmp_le32 = cpu_to_le32(ts.tv_nsec);
-	ino->atime_nsec  = tmp_le32;
-	ino->ctime_nsec  = tmp_le32;
-	ino->mtime_nsec  = tmp_le32;
+	ino->atime_nsec  = 0;
+	ino->ctime_nsec  = 0;
+	ino->mtime_nsec  = 0;
 	ino->mode = cpu_to_le32(S_IFDIR | S_IRUGO | S_IWUSR | S_IXUGO);
 	ino->size = cpu_to_le64(UBIFS_INO_NODE_SZ);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
