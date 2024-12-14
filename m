Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B3E7716A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hfHzvK+Psa4aoI/PKzvanM5wNEPkchAkQjd/pDv/w7Q=; b=EebWQ/hSdO0E3W
	z5Cs03mh3Mh0xr0oJWr/0AbxrfHMPths6ZxhgRAJecvXpjQCfImTBxtiyCcRm1y6ZWOoMptygNpqD
	4upPC53t+JkFrFWpkoHDjQKhcdSOnpVq9Pu+DVP2uz/OFEVFdOSUJchpQXlb5lIzstz9pe/+iJrXR
	33tDvjC/5vnSsbqQmrgkzFUfJ9lvaHjMVKUHQV6ugvxxWgr15T03XhMQtCPMp4Ok+QCU4vxdtlI+e
	ddbXmjsTeWsLhhvxjC05B9Fts1tx0yBnp4HvP4JP602R9N32tGx37u4oHsN67JpNackxCN8fHQCKN
	cKMNrmnLjWJu+bjK8x+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMRIP-00000006KJ1-3Yl8;
	Sat, 14 Dec 2024 12:30:57 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMRIM-00000006KIU-19cr
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 12:30:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53e3a90336eso2853793e87.3
        for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734179452; x=1734784252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dz80CjF1SWtWBOlu1LnYvVTZDNl171GSFFc467ZmsI0=;
        b=cAp6YzaSx/Apwvc6L4E5LaA7BeJvbKpO3umw/uEEk/uuuens0TEs8ZqmoVBOTwnM7e
         iLLu1fhweg4ZaqTAxMYf3J5XGmBeEejOkKHak5lhduBc6fQuQuPhZrASuxuXc43n/V1T
         05EXE1puSUTgj4WBPIQBIhj8nsVulnldUYFLRhgR2TRMLokn1N8D98W+J5eTAUlyAvD2
         Wv7AkZsJwROFrnSplFGzChr6gwEmHKqv/jJpbOaptoVS9h51pSPhldYfAZvhtxpBIxNY
         ZrM0qkdqf3qBP/VRNmBy9opMZfBQdmMQ44kRc+ocGdbOs4F79n9Xx9VerXClBP5Y97fb
         XNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734179452; x=1734784252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz80CjF1SWtWBOlu1LnYvVTZDNl171GSFFc467ZmsI0=;
        b=Jv7MaaQy/ZpbxiGup15R5Ibp/pWEkZQXWD3Ttsvb0TwUZ0winO14hnzfgyBC5X8B3S
         QOmrUZFUfymOzj6c/RtEAnAciJT4vjTDtM9Yqo53Pvvy61s/JYUXHWRJhYRIpMZzv6Zt
         KZPK5tXB22SPcKpmq4pI1ybEeF1XOVKB48a56nYBLSZEl/G3XFXfTF4GnMljcU/oK4+k
         xaWusk8vjtARV76V8dXm3XFHHKWT2VnISmwjPBuwNHLQVTZEyjKXB2rTVvfiSPLSauhf
         gyKLjXuG2WRhXnfl79SSN00sBlheTfH31NXy8yr9FGcMeF66tWQbGNkHyteEe+BfF5H4
         J1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWi+tTMfyA6z2YV/Fda+NYJsANL0ZJ/03apvb/07HSDSfqQz2QmqXfgMXBpyb8h++JCMFp6yqEWUe8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9l68AY9BPbKwbmefA8CaPsJNmWZislkwowjVbzMoCq1qdyKyx
	6zNthxtCM1VNBo3rP74Wdt3CW7GUVshY22mlciT5gHqDQP5JWXQq
X-Gm-Gg: ASbGncsjMvwDdrEoRVwPuXikipx0hDA75VoycDPTApEZeu4SI4uH0g5FqElfXScU0Ac
	qMhWFPZCkMjuFR3w5DD5rTxgwroIn5qg2oPzVLTImj9RkxUNxYK5mJbQmHKCLiZpgUgaApZ0S78
	JdE0HKspzEdlAND5WIFRi1A0GoMOXMRvVquaIVtyNMvGR4hSqDxs0djCHp560jITsdX34FxQgDT
	0VTDYrOmRiIcdKxcM8E+lFJruvthLqrQ1KbZS8lFj6DTXPPq7P/Z3OGhdJJ6ZKCOb5W2oQDVjN6
	UU598z57FcZcN+ImwworizWqXE/AOTcpdQgACHk=
X-Google-Smtp-Source: AGHT+IHld0mdgcHWXnc4I05m8eCrZW3Ilyo4lHZfXjMvfsbtwl7LUNFd0kY8minmHVYXnwGs7gfatw==
X-Received: by 2002:a05:6512:3d8a:b0:540:2ef4:9cf0 with SMTP id 2adb3069b0e04-54090553e1cmr2135433e87.18.1734179452196;
        Sat, 14 Dec 2024 04:30:52 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120bffd10sm201814e87.161.2024.12.14.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 04:30:50 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
Date: Sat, 14 Dec 2024 15:31:05 +0300
Message-Id: <20241214123105.75618-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_043054_355061_7F9DB5E0 
X-CRM114-Status: GOOD (  11.74  )
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

Report of the static analyzer:
The value of an arithmetic expression 'reginfo->offset + i * reginfo->erasesize' is a subject to overflow
because its operands are not cast to a larger data type before performing arithmetic

Corrections explained:
Added casting i and start to unsigned long long

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 ubi-utils/mtdinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 7dff0de..12d35eb 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -185,7 +185,7 @@ static void print_ubi_info(const struct mtd_info *mtd_info,
 static void print_region_map(const struct mtd_dev_info *mtd, int fd,
 			     const region_info_t *reginfo)
 {
-	unsigned long start;
+	unsigned long long start;
 	int i, width;
 	int ret_locked, errno_locked, ret_bad, errno_bad;
 
@@ -203,7 +203,7 @@ static void print_region_map(const struct mtd_dev_info *mtd, int fd,
 		ret_locked = ret_bad = errno_locked = errno_bad = 0;
 
 	for (i = 0; i < reginfo->numblocks; ++i) {
-		start = reginfo->offset + i * reginfo->erasesize;
+		start = reginfo->offset + (unsigned long long)i * reginfo->erasesize;
 		printf(" %*i: %08lx ", width, i, start);
 
 		if (ret_locked != -1) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
