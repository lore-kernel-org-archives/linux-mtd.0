Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E0C6FD18
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Apr 2023 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qbAWy9nzMQv1Zn7p7jNqj9iCdD/4JCdM/AQxz9VsrFM=; b=YciY8xLS5+1C80
	VOIvTl0bWavQTOzqRbLVjx7D4p0w8wrC8Cs1JBYfu16NDBMxxE2ZSgm+gkZXVk7oX9Gqd+UD5F35+
	0UM6ahC3LSuz+zpBUR354GBuLt7TXuMoHk7lU5mtNsb+mCE6UPNLMwqf1IRTa7nFuQhBJiQk+Lg+O
	4stw0Wy9n1M6UUwUFNVJXpL3p4IdM/5zCSeI8xYITwy46Uo3JeyYROreUAlMBFo1hnDdYDfZB3aHO
	zOUQQZ95eqWVs0clGdSrbTdeloHEGYdFtyeymLzwTbsWTmV4gmumVC2JLb7u56SxBc2Vdz2Y6U2nN
	Sy22NQocVS6SLj6BP1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pq7kP-00CVMC-2V;
	Sat, 22 Apr 2023 07:33:29 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pq7kK-00CVLq-1e
	for linux-mtd@lists.infradead.org;
	Sat, 22 Apr 2023 07:33:26 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-246eebbde1cso2439924a91.3
        for <linux-mtd@lists.infradead.org>; Sat, 22 Apr 2023 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682148802; x=1684740802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hI05MYaQG+eP7o3UFQxypbe25hsO82kmxAKI2tQo8pw=;
        b=T9EhsDwNQxxKNpVObExbFYq3D71kJM5e9Ot7/4eXC2g5loqBDWOPiAA5IaBxyH/zpF
         CWiCrpexrcMG9+PvrJw2oEicQEXp6OcyjcukVxCTmblVSmq4mulw3+ocbOu5LH2UtGC0
         g2DIfM0PyONRUgWE2axd9GV0P8rFrXapB9GYCzXDONbHCYia/KpBj1UwpPSIhbamovJ4
         YDRYEnhtrU1oSNaHQnEkgMTOLKPKlhmknbTQog8CHlpw2XiHjFAG6dpYv8EGuBCfIRWk
         fwXY007ZLNSDQ3cOEkpsPx4qnG4DSVrnadkoeodlsRLRQpw/kN9yGE6W5c7bnIL/oCNG
         r+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682148802; x=1684740802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hI05MYaQG+eP7o3UFQxypbe25hsO82kmxAKI2tQo8pw=;
        b=cGs0tnCjZCKIsdGf8Sovy9QppX1dHyIrgn/Y0cEIob0JJQQYSwoqFGfMZSyZNWYi9N
         ImO1AywNBbS+a6ZucYYMR+5Fgi6K9HVJniCMUnkep5b2h5WYEyGq2KwsbsCAEM3y0757
         0rDRll6vvuwk4h6L9coVnnUn9+9622Acf9HkJ0hP7VKYAR9RvFBmjfFJm3kycyIJrvSE
         1n2hG5PIwIDMC75iVAIJuQSEt5+s9mev0BThCsVEVmKHMbcSr8bNKQaa1NZo1UnjTCfx
         TfCWbiQI/VPfqN17Bm5qQH2I4fWH3FBUBS84IF2Ll2EUL9Jc9azoTF3AZetNcJ/YppIf
         jfxg==
X-Gm-Message-State: AAQBX9cAgpOK1DLGxL5iCyW5qkhnKL+L4hx5aDRCDhj4aqYN1o5Pr/5k
	eIvt9WlDhjx6gW3ZnZZLQ48IMpElOm5few==
X-Google-Smtp-Source: AKy350YxN2dH4vcOJuCv1zpCZg++9ZnMcxOzfbVC4+O90iQYMd14saWtpS8s6SY1d6S4s1Ji3oTSAQ==
X-Received: by 2002:a17:90b:118d:b0:24b:755a:9e99 with SMTP id gk13-20020a17090b118d00b0024b755a9e99mr3691293pjb.31.1682148802409;
        Sat, 22 Apr 2023 00:33:22 -0700 (PDT)
Received: from cosmo2-system.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id v1-20020a170902e8c100b0019f9fd5c24asm3601506plg.207.2023.04.22.00.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 00:33:21 -0700 (PDT)
From: cchoux <chou.cosmo@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: cosmo.chou@quantatw.com,
	cchoux <chou.cosmo@gmail.com>
Subject: [PATCH] misc-utils: flashcp: correct casting for percent display
Date: Sat, 22 Apr 2023 15:31:15 +0800
Message-Id: <20230422073115.3555981-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_003324_554533_2228F4E9 
X-CRM114-Status: UNSURE (   8.57  )
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

Add correct casting for written to prevent overflow that size_t is
only 32 bits on a 32-bit platform.

Signed-off-by: cchoux <chou.cosmo@gmail.com>
---
 misc-utils/flashcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 2e8d4c1..50f8c04 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -371,7 +371,7 @@ int main (int argc,char *argv[])
 		log_verbose ("\rWriting data: %dk/%lluk (%llu%%)",
 				KB (written + i),
 				KB ((unsigned long long)filestat.st_size),
-				PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
+				PERCENTAGE ((unsigned long long)written + i,(unsigned long long)filestat.st_size));
 
 		/* read from filename */
 		safe_read (fil_fd,filename,src,i);
@@ -403,7 +403,7 @@ int main (int argc,char *argv[])
 		log_verbose ("\rVerifying data: %luk/%lluk (%llu%%)",
 				KB (written + i),
 				KB ((unsigned long long)filestat.st_size),
-				PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
+				PERCENTAGE ((unsigned long long)written + i,(unsigned long long)filestat.st_size));
 
 		/* read from filename */
 		safe_read (fil_fd,filename,src,i);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
