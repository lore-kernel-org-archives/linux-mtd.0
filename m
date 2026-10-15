Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239ABCC6B3A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVRKAthxXyRMzpwskW1ib0TsH5AQB6MJ2Cr9GS5EGLI=; b=IGlwz3VLKA+UaB
	QmauCF9GhY+EEVj302WKK0US2QpqWopTk01CYcACEjHEp9YWrJMBZPk/iXFV3Egfca9oEKIn0wG2D
	jG/yyTICKaHfJaK/h71h67tftC+Lp/0gQlOJocut04rjLmyFgnqprlAqTrF8whCF1twFY8kwxEx6n
	J5hxiD6ai0Ol/G1SSNxkMU8ieaIZXRbqbpuX05TsjHXdq4VAhp5+v5fr1Ps1YhT8xUhgxIj/AN5zn
	lTo6UGXcbZNYJA29Zirp9fUbkQex5TSp/OwlcmFiFZ0gIslOo3kHxyztXUxPtXIQgP6ZdKFUlTfDm
	qnikBUz6shp+WkJ4nJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFyE-0000000H2aF-36hj;
	Thu, 15 Oct 2026 07:33:46 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFyD-0000000H2ZT-0Rc0
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 07:33:46 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cd632f7a4a1so412438a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792049624; x=1792654424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ndo7bU5CbSJbisXie43oCLONWXZJBYZR9Gu8b5iBiZg=;
        b=GoovWLdh6hmVuYZVXrOKihwNS8xlkTOpZglQTB7WxU20dx0d3GrHNTQv0TDZ2Haqm2
         eMGKdDYE2Yw/tMy4++/HrGr5Tm5OmrCAtsvqcXb51NMfKOY4CxTAmdZlWOJdoGlHtBW0
         xEVeViOV/L1GVWgldupCbIIiJ12qDjBgJNpVgYdVC2elmvXzlt05dDFJXcSMn7n8su5P
         OjwsaAF7O61aQW6cOa5TOtLmt27ZK0HJOCpbH78ZPVKIL/sLhW2JRzB4V2E0UZgTA21g
         PdukiE3aN+lBeQ2E++shzUXqhu8fkMMnDYA6+ngBLf2s/HRf8vGspoMBgyjq0n9DnbSm
         9JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049624; x=1792654424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ndo7bU5CbSJbisXie43oCLONWXZJBYZR9Gu8b5iBiZg=;
        b=P5QnEI27o3QFDitJ65Zhwn7M5yoAwUIPEN0q6O1ZVNCqmP6hWA3mskHC7UFmNT+bwz
         6QFqLmo6RpfpWtEM1O4zHye72qy+xvULS37hVL0wjsCLpjZUUNG+BAdY3h1OTeLfiuuu
         QZS2IDJvMUtcQ/y7VQ1bhOL2HlSuhrDqlnMK2opqTngN/sUYtp3v/gb5Z2J5Ojh5qqnb
         qTeLyagudD7mpSMh/DCfSXzcPUqAzfyw1K3yw1xNaYIR3YtV1d8KY/JOVldzAOohI+NE
         uUF3mN+0HZnQcfD39KsdWb6EK1TeOxWFMYfdwNqVtVvn8tCOnUBPpncExUnFCYOufJ/4
         wfpQ==
X-Gm-Message-State: AFq9FYIA2JoFOMuu7dBFdgL2pj70CIxFqktwrrZJ6mMCym0C1HKq99ze
	xvcdq2s3l5KOb3vI4I5DatFSo/w1FYsCXnFMqMBioTBIj7Y9qBnTyl8pmWkhrFkYNOUmvA==
X-Gm-Gg: AYBFou1Av4+6a30cU3y0rj6VfW73I+WFZfGN7wOAhGx6m5JsKSSZ3n4gU+yWpTvj3S4
	Gel1SJusAsP5H5SgmVnofzLWS/4OGQ3n7uDt2emjf3vYhIlFKGOLEx+IIQO8HlyzpEvVDvqQVj6
	fRfcRuyPZyI09p2LXEqnCGOCGM5Ob2dWOFWpegQoe4/sHY96LV0mNksvefRyeILVUAeN93yhtko
	B9obm/5ayjCJACH6cKo8MvIqS0TzNuKNMjz6e5PQ3v3r2zGTId6oyKEhpXzJP/uAH6IRbQK4GEt
	K2ww8tQLv/6k9YG9nE5wQfcV6Xyctlp1QnchtoeZdbsujaQT44M8KRJ6T+TIC5CJ9FDebKpFVdA
	EQh9PRlykl/Q0dsP8Y+Hy3a/4fqIo99eAQLgXRssMJNuXgYQCP44Z8pmjvcPlRfYCU9PiELYH2Q
	QJmhMqgA8m5mlncCp6jTmBUHi7w3qgsIEMDpeRaHRkPLHR6jyVhR6E4UnDl4Vv4oNenKIW8g1pb
	NYo5Uq6l5lpPWhu
X-Received: by 2002:a17:90b:3c92:b0:3ac:aa8d:19e0 with SMTP id 98e67ed59e1d1-3acaa8d2140mr133692a91.9.1792049623970;
        Thu, 15 Oct 2026 00:33:43 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm3066274a91.10.2026.10.15.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:33:43 -0700 (PDT)
From: Yelin Fei <yelinfei66@gmail.com>
X-Google-Original-From: Yelin Fei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: ubi: use GFP_NOIO for lock tree entry allocation
Date: Thu, 15 Oct 2026 15:33:21 +0800
Message-Id: <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1792046946.git.yelinfei@ruijie.com.cn>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_003345_147319_C08651F3 
X-CRM114-Status: GOOD (  13.55  )
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

From: Ye Linfei <yelinfei@ruijie.com.cn>

The per-LEB lock tree entry can be allocated while UBI is executing on
behalf of a synchronous block-layer consumer (ubiblock), where issuing
further block I/O from direct reclaim would deadlock; see the
preceding commit "mtd: ubi: block: forbid direct reclaim I/O during
synchronous read" for the full analysis.

Make the allocation self-contained: GFP_NOIO restricts direct reclaim
to dropping clean page cache and shrinking slabs, page (swap) reclaim
is left to kswapd, and the worst case is -ENOMEM, which callers
already propagate as an ordinary recoverable I/O error.

memalloc_noio_save()/memalloc_noio_restore() in ubiblock_read()
already enforce this for the whole read scope; keeping the allocation
here self-contained as well means the safety property does not depend
on every future caller remembering to set up that scope.

Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
---
 drivers/mtd/ubi/eba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index f0c549e62c55..8fe68e7fff58 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -247,7 +247,7 @@ static struct ubi_ltree_entry *ltree_add_entry(struct ubi_device *ubi,
 {
 	struct ubi_ltree_entry *le, *le1, *le_free;
 
-	le = kmalloc_obj(struct ubi_ltree_entry, GFP_NOFS);
+	le = kmalloc_obj(struct ubi_ltree_entry, GFP_NOIO); /* see ubiblock_read() */
 	if (!le)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
