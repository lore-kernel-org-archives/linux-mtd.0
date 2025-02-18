Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC39EC021AA
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 00:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbRJmfUhwn0GWZU8lOW7k3TbbeE8LQGXSn5bSrZ9HBE=; b=dNFa3w5t6kcgHr
	FZQzxeSg9AvPc0/klB4lNOU1DHlCX2a2YZTNr6Ik3qgjCCOtPXIOR7sljK2FCu683FlocBmuHqGMj
	SZ9JlV3zU1ay/xpEGRH5L0EEyOvVicfxgpu6foEwpbEcWuQre5AV4YHtNqzl6O2SZgNq/G3xNJ2+d
	eWybyB1gDIO1ZZxjZMenKzUB3ElW7sb59brRlFpnDHC1N1W3Bwnmb4TZ+706f5RcfhqqZ/Owywakf
	CC3/VFmNoDIDQYNLIEZGr/Wr9T9x6D9hfcTj2MkIxvmDm7IN47mrCEhab0m5sGgUPq1Hook8ObWs3
	MyPS9Fm6QdWuu81lIARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH3-00000006JRw-2dJC;
	Tue, 18 Feb 2025 00:15:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH1-00000006JQe-08oG
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 00:15:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-221206dbd7eso29732955ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2025 16:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739837738; x=1740442538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgcMCk2BNg/ooyH/6CMvLazCbVHJTirwiX133NxjJ7c=;
        b=gGSDakKwwTot2lFruWJU4qtGbUyxjpZMMTeZzbNdGKkHLKUrIizxS/sH7hsQx8wlFS
         2+t03MnmV42pViEHaEA9cdAVgJisPMUbH9sfuPCPyGzGX+lgrT3sGwkeNPMKDO5dfUkN
         ppkxnLQasET37AyL8WAQmuI3LO91821cou+SzyGGLDQosDdD6g1gCw2HsMZ3AgwdewSG
         g21RX82IZ/6mH8FoaUfF1Pi9qRzt36/glzmpVvCZ7qBvwMsprOthYaKO7hcw04a5M4My
         dJaF0ucu7abQcfSRGTd5/YMCwu/sudN9EjbQZDmJxzhXHCNXSLF2erKZ1BdTRfXaXfVE
         EKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739837738; x=1740442538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgcMCk2BNg/ooyH/6CMvLazCbVHJTirwiX133NxjJ7c=;
        b=pPr8ttHHrlA0Znk/GUutdBI3pPDcuAr0gmzVz0JebP6BY79KHTAPX5DrXBEmYQJ8qq
         Nj8TGjSFIxC0AwIV6bPPJlGzVN32qk2ZizBdAJRDDGLt750TpQZMQGJUY1R2XgJNSB+u
         HdhG4AfSsKl2IdcK/IjzUCvCWnep6Zds6Yl6kyWe/qzjCdHQFPNFHT/MPUL1lYoh3OwF
         oA9v3XElvguceqEXtbFyjnXEmQizgwFgqt7T304JwnFlbih/gxKfcKqa5FgSjkgvqmFR
         3SXqQ74UNXJXls1nYXiC89+Z3WwRUJMjZZ+j6PFFToH0yJS1xFqiNkTvZM9LqUTP354V
         7AJw==
X-Forwarded-Encrypted: i=1; AJvYcCVzNnVIn+4es2StCFdxJhoNssCa1LRh9nSypq/M447clT5MB6B9H1ba3bszzijT9QnGaAAREpnmgrs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoYkis40J3SMIDYwghdJwicn38ZQ2iiK8Wcdd5AEN6VVZKWLJn
	lq+bzx+VD9+puKFgmChHokcGSnZm4vfnjFRgcbm/IH6KsHe87zxK
X-Gm-Gg: ASbGnctXgbEL5TMfFTvG8xZnNy2dd4i2qBm1xErDzWOPO75NcFmIbxwajXwptU8wrie
	mbeCASgxK8Lsc0bMCw+5hYxXXdAqtKH/Vkh9BvolbUqh13BsMTOw/Su0MmVknweugU539sxYD5Y
	RDji2QJQcGThE9nJdTcrhXVTgo1JADeES/1Jp9pJwr2sr6IQ3ld/kmXjSHLDlFlHBasWfeBIARo
	JocdgdoQvYkIkH1kuquFSixI9HT2vXMEudTiKYSHbGzeIF8k5FaOjx8m9QRvSU4z+NTf3tYB31K
	N65sr/odbOih0JPYQpGuyzu/OYRWRA==
X-Google-Smtp-Source: AGHT+IFUZRTNM6zq8SFdX6zMOY6cl8HQ+zHyaz274bn4m+F6gmoVU8/Uc+N1VEiuc1OiH0yGJXGqoA==
X-Received: by 2002:a05:6a21:4591:b0:1ee:c695:e2c2 with SMTP id adf61e73a8af0-1eec695e44dmr1618389637.12.1739837738147;
        Mon, 17 Feb 2025 16:15:38 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327eb20b98sm2554519b3a.147.2025.02.17.16.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 16:15:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH mtd-utils 3/5] ubifs-utils: journal: Include <sys/stat.h>
Date: Mon, 17 Feb 2025 21:15:10 -0300
Message-Id: <20250218001512.1862030-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218001512.1862030-1-festevam@gmail.com>
References: <20250218001512.1862030-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_161539_070580_6AFE4427 
X-CRM114-Status: GOOD (  12.86  )
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

Include the <sys/stat.h> header file to fix the following error
when building with musl:

| ../git/ubifs-utils/libubifs/journal.c: In function 'ubifs_get_dent_type':
| ../git/ubifs-utils/libubifs/journal.c:414:24: error: 'S_IFMT' undeclared (first use in this function)
|   414 |         switch (mode & S_IFMT) {
|       |                        ^~~~~~
| ../git/ubifs-utils/libubifs/journal.c:414:24: note: each undeclared identifier is reported only once for each function it appears in
| ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undeclared (first use in this function)
|   415 |         case S_IFREG:

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ubifs-utils/libubifs/journal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journal.c
index e78ea14f3e69..45d82fd54bdb 100644
--- a/ubifs-utils/libubifs/journal.c
+++ b/ubifs-utils/libubifs/journal.c
@@ -46,6 +46,7 @@
  * all the nodes.
  */
 
+#include <sys/stat.h>
 #include "bitops.h"
 #include "kmem.h"
 #include "ubifs.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
