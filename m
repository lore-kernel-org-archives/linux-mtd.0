Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431ECC624D3
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2026 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DjkQmg4wTBbcBIhUbokR194Z3DbibZKFOpP2rm5++0g=; b=nc0FJhbzckCPOf
	tJvs/Go/LxHwAmbA4gabBwIyZ2P2K4K633XaNSfgcMxjtwAX4PftlPXvYKdBEOtWKyzfyhzY+f+bg
	TvCw8WlXoCt0a4mmAkZiWh/iVnp2fym0Noami66NsEGYWjTZce6aivD//hdAKM3uvSFRhJa0pI/by
	1AiUx/jZbZgL5hP+QAoGBIul1oAZfebGInvusYGP5wI0BLp+4QJpsBoWJmOkwSGkvEltPhxmPDmVZ
	4Lkxs10ux6Gct/wjhUBIa73D9KnR97wyygIv11GJtqpKXzRYiICdQoTMEUr3PkNWmFvZjr2oBnWPI
	R0IgrqmBIDBX2iiUo3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2nXF-00000003yOY-448Q;
	Sat, 05 Sep 2026 10:22:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2nXD-00000003yOD-1EfA
	for linux-mtd@lists.infradead.org;
	Sat, 05 Sep 2026 10:22:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so14397365e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 05 Sep 2026 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788603725; x=1789208525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NXZ02MgQP9rhY+kMSGPxQ2Ibr+2kxN6S4tG7AE+Zdc=;
        b=Bm2loPuqg4pSIhfcwMH15O0bjr0KvE3KjsIp1GmNUt/Mxv7FRpXqjN3G9hgD8dZMoV
         jgMNwcA6yi30SSMVyzke/qd39nqB3tkv0CYSakDdrPI1Dub79RVC1QhF4qbCfOPt2B/Z
         AOQSQcCX//Bk1Uujr4lZg+jeDY++I5erhprh9Sq351xW4WSjVkeGJYXN2Wv5Eicnnpjc
         0SZaDZUJzK3SDpzGG4N0qtUEtfH0hfNStCQovX73zCHNBGbi4paBGg+jZV5IZg3BRl2s
         sj5p+4VAwuGmHa3ICRUNA9WJ1e4F6qbdd+71/TGvBS+yoHsHwP/jTN+kWuZQjg/MgsyT
         pJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788603725; x=1789208525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NXZ02MgQP9rhY+kMSGPxQ2Ibr+2kxN6S4tG7AE+Zdc=;
        b=GfFlI+j92lq9cgJQ+bEh3UXvK3+YmmML18QfBOXszMDKiNfboGNqVdD/hJWH+PJHo9
         zjvpzt+mID10owDhXzyYqemY/n+J5FNFll7to/dZKnrq6XpZ3/BJGxlqcsBOcahhHLvd
         btkH/V43qFDRNInbOnq5hfrSLjmqXbMXCR3LRDT0Wrcc//qLCRO3qel9/y6ODD136Cp4
         lhRIqMsOipHs5UxEwBz21rb6mBD0mHMZkLRPQNwDlmiP5rNVQsMD8ojrFEp9pndQBPp7
         KFmM63VjYBDczOpAcrneaNUrX3DVLLLr/oyl4LgHLBq3T+ZnWq3H8rhXSfWvD9jlUEq3
         tCCg==
X-Forwarded-Encrypted: i=1; AKwUvByHTMatXWthGfOo1RQnLSOaHZcFl1MsfpbFboL8Wg6mCGXIT/GRVM+9a04PeIaf4NzIGJ1R3jMbE3Y=@lists.infradead.org
X-Gm-Message-State: AFuF++kF76Y0z6LWGU2H7t2IPA1vhb77puG4J8IAMAo8B+v+vy+aB8A5
	zGF8F5soLfKpxDWbbQdKcib5TAnoF8VtIF3coqfXDpL8QduCQ7mloUH4
X-Gm-Gg: AYBFou0n3jPkVe2s3tudTJink3lG/b++miptv+PHZ3pkk597ahS7eC2yznvYAUOqZQW
	BzqB11+d8seemMU3OCKSiTziHZIe+X7/42gSEOlMY/WbX9huTq+Cq4SPGWoWi6dlffWnGHvMGHK
	5kCbY/KODy2s8ogOQd0ZlMOUWlqM0j5rZM1IoA04pPB3J0YnhsdW5y0f1carNlx1dGSslhCjaN1
	qgtavKEBCFNS5vkkTybyBkFXRKPzHXvlUqO6O+69QlaoIulYlmRQlLxZdo2h6tC5vKthQhAwzak
	lJGxCZbIHYZ2iDZzx7RV1vlGWBks3H4bAbd05pj/4YhPNa5HxCfaf7Ct83QDQLOJpyBIMncgWYx
	pQc44GXK33lRB1EsSdwt8zcm6sI41UWKx5TfFD8t8Q98BzR0QldoGhidvMrmxBatWuoCGgYBSkb
	zlW0f4zWDUcnLfynEtFeo1UB+1DBV4oajIh/1F7I0L0Vto4AmqILI5wN9yZCRkoA+3rrcQiLOgf
	ipj7yiR3dYj9osUZ/C+zC7LjUIFFtx/ct5O2X1P/miEZyt6JVQPO9zuC2Q3F9bHHN+gqvFfPQZt
	89e/GD4rPyC9T5J9kkzUJwZDtJy2A7jVd1JnWqO5TZ4wWpuP9eoraXo618Kji1M4jV27S1IdekB
	BRQ==
X-Received: by 2002:a05:600d:8481:20b0:49c:fde6:8b39 with SMTP id 5b1f17b1804b1-49cfde68bacmr59793065e9.29.1788603725049;
        Sat, 05 Sep 2026 03:22:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm9998416f8f.3.2026.09.05.03.22.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:22:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	Stefan Schaeckeler <sschaeck@cisco.com>
Subject: [PATCH] ubifs: Use the errors_* attribute names in the sysfs ABI document
Date: Sat,  5 Sep 2026 12:22:01 +0200
Message-Id: <20260905102201.42933-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_032207_360115_1F1A8884 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

fs/ubifs/sysfs.c creates errors_magic, errors_node and errors_crc
(UBIFS_ATTR_FUNC(errors_magic, 0444) and friends). The ABI file documents
them as error_magic, error_node and error_crc, which do not exist.

Use the errors_* names.

Fixes: 58225631cf9a ("ubifs: Document sysfs nodes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/ABI/testing/sysfs-fs-ubifs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-ubifs b/Documentation/ABI/testing/sysfs-fs-ubifs
index af5afda30220..3c69ed5eb35c 100644
--- a/Documentation/ABI/testing/sysfs-fs-ubifs
+++ b/Documentation/ABI/testing/sysfs-fs-ubifs
@@ -1,4 +1,4 @@
-What:		/sys/fs/ubifsX_Y/error_magic
+What:		/sys/fs/ubifsX_Y/errors_magic
 Date:		October 2021
 KernelVersion:	5.16
 Contact:	linux-mtd@lists.infradead.org
@@ -10,7 +10,7 @@ Description:
 
 		The counter is reset to 0 with a remount.
 
-What:		/sys/fs/ubifsX_Y/error_node
+What:		/sys/fs/ubifsX_Y/errors_node
 Date:		October 2021
 KernelVersion:	5.16
 Contact:	linux-mtd@lists.infradead.org
@@ -22,7 +22,7 @@ Description:
 
 		The counter is reset to 0 with a remount.
 
-What:		/sys/fs/ubifsX_Y/error_crc
+What:		/sys/fs/ubifsX_Y/errors_crc
 Date:		October 2021
 KernelVersion:	5.16
 Contact:	linux-mtd@lists.infradead.org
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
