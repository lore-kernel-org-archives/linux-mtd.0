Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4370FC47094
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 19:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF5B611BD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 19:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF5B611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PrETW1YBue+VqNWsWBiObIDAZY1DwjLI8/tpVy7T9QY=; b=aVyGeA8taZNEnq
	HZ/z2KwfZXNJK7k+zCQxIbFHGtXna3O/FGHWrhaziak/jZlrRels5Wh0x0aYixFN03FqbboIhcxAk
	gajmyEHZ49ocGC/MdJ/KpihOmZ2af5ZDrqbMzR50WdInke97Es3Ua8GWerNYH0idaQqZ7fDxGge6k
	nvy7HlnbkxGqj+GVX9a+/czCf2aJ0aVDLQP7XmUZEay8h5djed+LNXQvFGKigzYhdZyklJ+PAyB44
	W7Gl2Ow45bjp/1eBh/jmAEvQAX/MFO3UAHZVMCnj5w/a5nOa3Tv+Oi2YG9VmhTeVrtIolvTPI17wy
	LoKvqPhOlsPCAYBBkpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqL5F-005BxM-ON; Mon, 07 Jun 2021 19:38:49 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqL5D-005BwW-Gz
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 19:38:49 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so12615288pjz.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Jun 2021 12:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yuwW7mrMHLyFj1IPMINuhhkcEWX3mno1x4n7QfPqTmQ=;
 b=NtGNQYWISuTtMiZDF0BdY9h16yPfOezWPhgvmGzUqo6w0YwZWfhOHdzDWKiDlS2RQB
 d8qE3fDuOziglbhBF9wN6BrBxDYxDz0scf7ryFmFUs9tI9cI7T8Ngpjdwb1IxOgVTHqm
 AMGRjmGB/XRiamKuPpe+srromtO4Temy/tq9iTYrGaqZoU7pBhyX/gWY9+MZhtgD2QW1
 nnHNX2S0U6vbj4NANqiO4yxyvxojyxsy41I54lO8n0OJQJs9M7NR0s+bWu6vtEP20OMz
 7yEfKLsiiD0W+FBMcEf9cX2sz51wzoIxLu1YdBH8AsXHX+U9dwEG9VZz1QamYJ5hczJc
 XvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yuwW7mrMHLyFj1IPMINuhhkcEWX3mno1x4n7QfPqTmQ=;
 b=Sw9kdZC8eb+UppS8zT2ZISvRWZJlLS1lwQEXBIMPmQfH2xGIkl99Cqh9oSI9yWTGRz
 9JsFBtjshTKP3b4/mx+kbPWpINOtkBiYyJgqMGXQxcPSyoQwGqzLi6XE6CzG3V/jypaZ
 qEOeLt4Sucm5cqneIzvrZFDxnfHCJi93Hh0KU9d/Bl5wD6/yRU4TD4Ct8IEFcNuxZ7/Q
 p0naW3vQpK9ZzJjNep2YxOgBhN0dWd/imq0WoEd8SEWTRs8/Pd1t36Kuuyifr4nztFkr
 d6ZIoWzG9yvQSnrX+yP3oQGOcIkTru8Q1w5zQI61CriboJI1nqx0I1yafIMa1MdVpmsJ
 HsuQ==
X-Gm-Message-State: AOAM532k4/YboiVP8ZqC/KPYHiJ+rnXbaxe5ZssOSOPMopeLEni5YcsC
 fFo9Ru9O5PnFfZGfx5mp0wk=
X-Google-Smtp-Source: ABdhPJwLuyE2XW3Ft5QdLpx6P5/OR0T+JQApU6qwp1muXbXdRvaV0w6g9cJmXtaJRl+V2+zjHnNf9Q==
X-Received: by 2002:a17:90b:1188:: with SMTP id
 gk8mr21585439pjb.138.1623094665943; 
 Mon, 07 Jun 2021 12:37:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9005:8001:a09b:9c7c:331d:38fe])
 by smtp.gmail.com with ESMTPSA id p36sm9471490pgm.74.2021.06.07.12.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 12:37:44 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Souptick Joarder <jrdr.linux@gmail.com>, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] mtd: rawnand: marvell: Minor documentation correction
Date: Tue,  8 Jun 2021 01:07:36 +0530
Message-Id: <20210607193736.4654-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_123847_578082_E1B63962 
X-CRM114-Status: GOOD (  10.95  )
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

Kernel test robot throws below warning ->
drivers/mtd/nand/raw/marvell_nand.c:454: warning: This comment starts
with '/**', but isn't a kernel-doc comment. Refer
Documentation/doc-guide/kernel-doc.rst

Minor documentation correction.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
v2:
	Address review comment.

 drivers/mtd/nand/raw/marvell_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 79da6b02e209..f4efdb59467d 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -451,7 +451,7 @@ struct marvell_nfc_timings {
 };
 
 /**
- * Derives a duration in numbers of clock cycles.
+ * TO_CYCLES() - Derives a duration in numbers of clock cycles.
  *
  * @ps: Duration in pico-seconds
  * @period_ns:  Clock period in nano-seconds
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
