Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06077C021AD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgWYVIakGEtNak1Qo8q3VXluRqrhluiNOO12ezBULD8=; b=C7nRpx6SQrHmzG
	b2GN15z9hrHRMiXPV/Ojx8yMYlakHw48ja3Zwl1FnjFqucXLiYXlgm1Cu3nAd6dRCEnhjTSujClSF
	6Tgr1c5KVJc/LGJDoNJYKl0FdFhkhMA9IlBXjjAaTeBOOPhtWok1/hISJJIQZShjciZN6C2p7uzPI
	7Y8DdWCYEIPJOO9gnefhk7E+eTV7nxqd4cDreXjy0PVycOl6VS5L9fBZ7OgQml9uu+iYc93GfAfiv
	WzVuiNiluVpShGaKyst3/R93C7LFtVu4mUh7LTACKdkZk1L50bqneCE6EaqnW12a6OZ3SYkKVoNQJ
	9nbr53MIKE0sAlxaSh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMBy-000000082W7-3OGz;
	Tue, 18 Feb 2025 11:55:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLpH-00000007yLZ-1xOa
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 11:31:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220ecbdb4c2so105111985ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 03:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739878303; x=1740483103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdDgsi9Yxnnwxq20yIl32EPq9U2L0ppEcQVTGdeHHrE=;
        b=NQ1up6Nxwm2NfWfgTRphgV0oi3+9rSD6/Wz9tZuxhySeBqgtqTp04LCdrQSyWlXLGt
         CpuOGuKWS301bZCaH3Hf3PLDWohtuDtyD3dIQPzLpqXjZRO28RoAfqYP4RrAWNMm8zIq
         lbrT0OgDenkyHX3eJkyl+JzblJDSGwmHDPdRVnWmX4BjW8psYBKsKFvUv//hCXSBYf/9
         HpVJKyHT+QRrDls8+qchan13kZJuwVhp3mmGeCUp0F1p3m7shzi67ASnwu7Yt0A/j8Lj
         wTwBYAIIY5GVbxP6TAdkNDnhPSg0gC3yQXYfVJNHFpd39pjsI5vXg05uNXWv4x+6BI13
         RMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878303; x=1740483103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdDgsi9Yxnnwxq20yIl32EPq9U2L0ppEcQVTGdeHHrE=;
        b=VizqyT02DuYCasZmHQoUI7hV/vfsXy46+g5EVwcthZh+uv2aCON3UF6z7lxLOAychb
         WMbvuGasCszh3K5Ifyucz4XJCFBUut09OhkX78kl7J6ygfO6xhjDvGEDZ5fgE4Cb0MmI
         7PHipXjExe1gXMY57paxIafMFa63EKhrVvO7z2A2JFsHsm5h8nJa+sviH42mydRLNZQC
         3rKh+nws9aC/A4+kempc3bF0Bx/dxhW4Qvb5pgqr8LiHm+kAZ90ISnppSfMiMYQn9kiz
         CXBVP0eQDOI9+sVvawwjaGAjUsRIidpRJyiDHjCpuFAULCQKJaOHsWj77J/DyKRwL93G
         N1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCULHrMHpUXcZzH6cutxSdT/Jygeq6wQ+yF73IjZmjH5/BbIkQKx3CY49Iq3aI0wAp+dIIMHqMsNUaw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxMeqJNYIX+835w91ILu8TbTCy1Zq/AU763uclDFulCAN6wE40
	arZDQMuobnyivyCtOcPDymKaeXuMTNrBYaiZTI88qBhKR0GH/tDO
X-Gm-Gg: ASbGncu3b4SvKJ+wh7CumDVcR9rYZEaU3NDCkrDTGVNlXh9i6R3+L2hTvs1+/lHf1hD
	Gz/K2IHJMflMYsnlufOi4Z3pgdNbTw+++HjCQwvl2fs1oea/lBeHcbLvTUT9/HLMmQ0p7Cvb/cw
	q37Fd/4OELJijkov85g1zsPcPhXXhvTTUovu8ypAIqCLIMHRPpiAUp62DK4wSJpw5cEQmvlR3n+
	hU3dDXdH6mQRMmM0uw7+/fIUodQ+elfKpeuLkjS37h5PMmhiPF1IWbaTnCOnO/lr7fOnOurOoeR
	5eZ1vHvCtJoNKS1sbO49jP3302D0QQ==
X-Google-Smtp-Source: AGHT+IFh4Ovp51eWX2EBGR23Fk9rEJzOZlN8T1neGBd+h/9DMPfh2mkUF3mwqssSailjqvnaNbRtKw==
X-Received: by 2002:a05:6a20:6a24:b0:1ea:e8a2:57d6 with SMTP id adf61e73a8af0-1ee8cb4ef10mr25052746637.14.1739878302914;
        Tue, 18 Feb 2025 03:31:42 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546835sm9876661b3a.35.2025.02.18.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:31:42 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 mtd-utils 4/4] ubifs-utils: extract_files: Include <linux/limits.h>
Date: Tue, 18 Feb 2025 08:31:23 -0300
Message-Id: <20250218113123.1956575-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218113123.1956575-1-festevam@gmail.com>
References: <20250218113123.1956575-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_033143_501741_1E3E279A 
X-CRM114-Status: GOOD (  13.22  )
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

Include <linux/limits.h> to fix the following build error when building
with musl:

| ../git/ubifs-utils/fsck.ubifs/extract_files.c: In function 'parse_ino_node':
| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: error: 'XATTR_LIST_MAX' undeclared (first use in this function)
|   144 |         if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
|       |                                               ^~~~~~~~~~~~~~
| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_files.o] Error 1

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Include <linux/limits.h>. (Zhihao)

 ubifs-utils/fsck.ubifs/extract_files.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index c83d37749bc0..000ef5d10565 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -10,6 +10,8 @@
 #include <getopt.h>
 #include <sys/stat.h>
 
+#include <linux/limits.h>
+
 #include "linux_err.h"
 #include "bitops.h"
 #include "kmem.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
