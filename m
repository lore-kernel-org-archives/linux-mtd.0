Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6C0D68BDA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 22:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oED1MnUot1nK8rsCd9LNN6fRz3CmPVDskUPMqxpNVgI=; b=rjyMNPNSPDAbBb
	EbNTUEzf0W1Ut4wJI6YgjaBnrUN8/JXRy4bdVViaZTzracvWN8GWg9BvsgzxBaKEnIZ2WayMIonSb
	e8k6E2Aeb/jkmP2mm+j3p0x+dD6HckDycxln75718v2HhQssgsTpLUp9ZYL++bidgsdoS+IYn0SCW
	IHcUuoFAa255DtyppiNlB8KO7Bhk1uiWLSyJ6Z4SLisn75faMj10Ko2HwnPQoicJbO/fr+/vztUo2
	QGd/fcUJYQEy+6/dEgJBlisegJurX1eIIh0lxPzKM5rFZUKufpMTl1n7x/1ZgtkAiGqe6urL2YPkX
	1TThLT3JFPu5dt+kvOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4lj-00000004PST-41Bn;
	Fri, 15 Nov 2024 22:26:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4lh-00000004PRZ-22Ob
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 22:26:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43158625112so1145655e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2024 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1731709579; x=1732314379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8Xp5DchzBLMx2DW4umYiCSRYu9AVer3xBbdskCBDnE=;
        b=IlxsLyvenlkIAH+1AGVDb0QWX6HqKS2gzjit3FdUgO65ZJuz1MfOfmLMGZmGs1L1Pf
         5fa4qEpyTIgIroH4UN4ZEEDwfNGs2wtPK0jxYrwY1AOEJvt+wl7XTSnFJRvCjHFjP7gU
         6YSvTJQkEi8tkk6kCIIx5ekr70pd1nLy5I2A7ebmxx16+g6ax5vyo355EKfSEC+Hypum
         Dmku6YKdgNlxASLNSXsyFkX4IJbr8MMVW4pIqg94rWSgpJS2SmOSrktYEaaqM3xlFXLm
         l6VADukJPGnkFsjGbjZC1gpA/4fSyb38lEFpzx++51d+XuN9d8YPcIbre/uJG4aRmsyZ
         wTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731709579; x=1732314379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8Xp5DchzBLMx2DW4umYiCSRYu9AVer3xBbdskCBDnE=;
        b=oLPBV1LicrSjtnTAume7z3tmi/AlDX1gU8CGylufplC5Ra7ZeKkTjIyBO8CNhaHPhz
         qG8HmRfRmTzw9RCK+VynqnBxrPnEAm8Y/d8jl/XPJjMcAwfBGcH53eZ2wgnZ9UVAV1IU
         yJ7Le55E8WSZFNYtLr3e7vCgOstATzKLlaRHJxYjqkiPHl5aw+CHQDO5zK+suGy4P2GX
         kn3zVFlCXpiT6z1+vetiRkhRGMgbcwQbJA7c0eLVF1YjgcZAE/74pjm+YDfdRdi9P2AM
         LmR4jFl5gqv41jM2s/aBLCKYd70uKyU0Z3n7FAOPLbQ0bPDmqoH2grb0d4ldTcsawHtR
         eEnQ==
X-Gm-Message-State: AOJu0Yw+ZVt508xHNsSAjAoR6t2fwEtQ+mz+m8Ds37E/PUY/kn3QhA8L
	WOSE+aKk2A0VfGD75rYJZ3JdG7gMqqQifM8aUbvsB1TddT+rV3oItZ8OPnP4I8KFAEKAdxJ9RqW
	7
X-Google-Smtp-Source: AGHT+IHeJP49UiLk1+A21zLZ9ga84quFsvsfDwLTyueK66j1t98EbwAOHupzp6aQwxL0DRmf+jG8zw==
X-Received: by 2002:a05:600c:1ca2:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-432df7876d4mr35648385e9.25.1731709579711;
        Fri, 15 Nov 2024 14:26:19 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1b94:c354:f504:96f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821d0ea3e2sm5115774f8f.109.2024.11.15.14.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 14:26:19 -0800 (PST)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-mtd@lists.infradead.org
Cc: Antonio Quartulli <antonio@mandelbit.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: fix uninitialized variable usage
Date: Fri, 15 Nov 2024 23:26:34 +0100
Message-ID: <20241115222634.32259-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_142621_526391_AAE8B58B 
X-CRM114-Status: GOOD (  12.64  )
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

In ubifs_jnl_write_inode(), when an inode cannot be deleted
due to too many xattrs, err is passed to ubifs_ro_mode()
uninitialized, thus leading to bogus error reporting.

Fix this case by passing -EPERM, which is the same value that
ubifs_jnl_write_inode() is going to return to the caller.

This fixes 1 UNINIT issue reported by Coverity
Report: CID 1601860: Uninitialized scalar variable (UNINIT)

Cc: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-kernel@vger.kernel.org (open list)
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 fs/ubifs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 8e98be642371..5eedf511880c 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -983,7 +983,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 
 	if (kill_xattrs && ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
 		ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
-		ubifs_ro_mode(c, err);
+		ubifs_ro_mode(c, -EPERM);
 		return -EPERM;
 	}
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
