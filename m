Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040C3E9E31B
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 01:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2yi5Fi17KwGDhk47VDpRul63pvA/z9I81wG2T7QG5M0=; b=TnNIowcloZysJz
	BUOBSPDti35HWoVEhtgiezMwhvbt4LVrHwuMZxvvqlRVR9az1lApPMvU9YaihwJOM8pSCyZC4Wm2W
	KjsIl4ZwodddOUutbxAHLyfr+NYk6SdVykXKuIevgTjgykrVyq0OwhZb3mR3khhYqzYSAWSg1g5ZQ
	Xz/T5iF1inH/ClsWas7+l5PGfYtGJZrICcKXoi2QAthvHUJxbgq1mWA7pA3AIB5hIkBDhslagvixS
	ZGTA5ndmapIQOLep/uIHmsC/2b1zG3vImCyYjeHpKDwhckRwbQPl2OmDjQ10V18WozMvYtRhgd/1/
	WYDH1AhksCk/xj2gkLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLcv-00000001H37-3pwN;
	Thu, 12 Feb 2026 01:36:17 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLcu-00000001H2h-220q
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 01:36:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-824a3ba5222so698934b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Feb 2026 17:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770860175; x=1771464975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyj9qVJ+d5PGTRFtyEyJQqxrIudvTNp2ouLgJKsvN04=;
        b=PFMDhC+I9VRTCiSqYUV/c/WkULdD6vV9v8+hOLMi5A1KEMcLrUdQ7F1teu59PSr02h
         virsShcngrKVdFYZN50D3IgZ/992h+9B27iXnp67sfsfE6ccHp2pPEZ7d2wl2mN1aoJm
         fm7GWhvZJj7N75fTxeA6sd178JjGrkuUrukTdLqSCXaosVVPKjEGRCH5ombyGJjlMPQF
         njqbmqkYTaV1fNwmP735Qsi+4FFjEKyyZN6FQ8RiiFzgFYRHwkAUqxQPMbyO1ioR17Iq
         cH/cXjEEtLJIFjJCR1OzngpR6nTUXPJiuSYdMb1xkAn14IJnQMZB2n8ZSCCWGPcc4VDH
         p2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770860175; x=1771464975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fyj9qVJ+d5PGTRFtyEyJQqxrIudvTNp2ouLgJKsvN04=;
        b=prhl9QoPQQdXja4TZz0DNGFhvs3CgAysrS5ZGekfeICRmtl8aVJApCxNfjsoTrHcmb
         lj1XwpTa2wjOv2qe01rYFMfQ2V5MxgD/DhNhoBJhlOv4n1s3yQ/sGiZhBEUUfXqfhJZp
         asOIFTsx2V5NB/f8pXvu69ehkRkTpcvnBJxv+XwUBHkUqqLpKGgyVhhnJU7L6PXLy2u4
         Y0Rp7jdCTP1pZDPQ1QXkW33fjnjbH14S4MVa7n9RmWyH5Jsd79tC016ko4zdbIOWYiIx
         V+P9cj6X72sZMI7dkpcAsWDChvGl/wa2PVYSO/POy3R58kQiT8hicnKar3PhZHvejHiw
         mu7g==
X-Gm-Message-State: AOJu0YwrK67Hijj8DtUe1ei41akzZWZVUdYj7iELc/JPhGvcW2ThF3QD
	Lc2CNzS30FNuHsLV3X782+cRfHCVF0Hop6Rs/CM7SmxS/pdjjo5mxjND
X-Gm-Gg: AZuq6aJ7NYCjjXBcGifQIyEsYXIn6++Ikz/9mbDYaAtevlp28guty9RyRWA3DMiD+qO
	n5iOxkqFmxM9iDNac/U61+Gal6U/ZFzY1K2WgqreYBprShTVsbluscYgioB1qiHXASPQQsqMBp3
	H7ecs0KfWDG96C64xDZSLCNH12r3PpI/S9FeZyiqbNtN8jJxyHtsYL1CrGz8KEX3e/mU6bO5nj4
	rVqRTg2FE8IpKwl6dU807UaBMFNcbVS6CfK1IV+VYLZVGdPI7mLT9Ksq8stjeeE2kHSV2eo0VLD
	niUQRKBGA+1+VOYWcXzDRbB7M3b4uJeSYgxT5rHFbs06S3RzUbyIDuFw//SER8Vp/b4Z/HvOcQF
	s/znb+jo/6NtNR+b/8gKcvo1/4n+OUAyNZxTZ/JYavTQtSHQayXpJrKwXSaNXq4fpaDtzwBpMLP
	n1jW/ZefSOi56VBZjxchPjVlRUTOSgxNPGPIvVK0ZwWu52Lhc436CU
X-Received: by 2002:a05:6a21:339d:b0:384:d0fc:f517 with SMTP id adf61e73a8af0-3944880fa41mr1064655637.51.1770860175531;
        Wed, 11 Feb 2026 17:36:15 -0800 (PST)
Received: from ubuntu ([175.145.217.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1aec1b85sm2990237a12.4.2026.02.11.17.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:36:15 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: linux-mtd@lists.infradead.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH] ubiattach: fix wording in usage example
Date: Thu, 12 Feb 2026 01:35:42 +0000
Message-ID: <20260212013542.22699-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_173616_521239_5C83FE7E 
X-CRM114-Status: GOOD (  11.26  )
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

The usage example 4 describing reserved eraseblocks had awkward and
slightly incorrect phrasing ("is total flash chip eraseblocks count").
Reword it for clarity and readability without changing the meaning.

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 ubi-utils/ubiattach.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/ubiattach.c b/ubi-utils/ubiattach.c
index e758dab..11e171b 100644
--- a/ubi-utils/ubiattach.c
+++ b/ubi-utils/ubiattach.c
@@ -92,9 +92,9 @@ static const char usage[] =
 "           and create UBI device number 3 (ubi3)\n"
 "Example 4: " PROGRAM_NAME " -m 1 -b 25 - attach /dev/mtd1 to UBI and reserve\n"
 "           25*C/1024 eraseblocks for bad block handling, where C is the flash\n"
-"           is total flash chip eraseblocks count, that is flash chip size in\n"
-"           eraseblocks (including bad eraseblocks). E.g., if the flash chip\n"
-"           has 4096 PEBs, 100 will be reserved.";
+"           chip total eraseblocks count, that is flash chip size in eraseblocks\n"
+"           (including bad eraseblocks). E.g., if the flash chip has 4096 PEBs,\n"
+"           100 will be reserved.";
 
 static const struct option long_options[] = {
 	{ .name = "devn",            .has_arg = 1, .flag = NULL, .val = 'd' },
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
