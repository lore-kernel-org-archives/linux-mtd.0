Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949A2C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Lrg3KC3ps1x+IGsMmrtENp5EaxCHtgZ2aC4tDqQ8SJg=; b=yZZ7R7Tvp13mpxYDSnWXJ/9eEY
	d3zc4+pesocnMV75VBjyHDZH3ayRdM7F5vkwKMdH4o03MurDxNlBAe5ODrzAYa7SIfvQT03LRKOop
	0XeznqUTR52sq8TfR1HOjYLLrmLvuO3uekE9eLYAIiQ76PUvAq9Mnf8HY00sMBvGnm798aalYbH18
	JOkmJpbMIGR1uD5Y1kkRXhEWMGgULhLli3tyHA5K8NJcs+z6oWJFqMpPGenbjEOdRp9D38WcgrYwz
	npQuyn24ruj/QcDaYBd++Yz0mhbrke1Nc+Znf1CKUgMg4e6kUTyGLJDWwv6BdcQs0ukoQ9ZElO7Tw
	ObrJ01rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZd3V-00H7uo-PO; Wed, 30 Mar 2022 18:28:29 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZd3S-00H7ta-Mx
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 18:28:27 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 h8-20020a25e208000000b00628c0565607so16145729ybe.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Mar 2022 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=69G4sVrTM6Oebk85axmgqm6tVz3OwOvgPCpKMqCiPco=;
 b=KAkhCBn3gEwaVnHCrhjznheQGY1GcCBdnWrxtjIFYBR2rk4OJFJ31gVI8tVCx6sj8u
 qH85S3m5RZXFjlMJBVo/mTONjglm5wXv+jTcfufhRlcZqejW8H7XgGLqfVP7AjC7n0eM
 7HP9ssmEL+278QYUiKC/5WDRmyP8ixj8xgNdY32mOx/HXCVXCuVV9Pph2dXMjjR241g7
 88UR6Tcb5NmhsduVZ3TtT9jvmrKJ8ZDTdhVTVRCgo9WleoyQZenniBdvfpVvf5VKcQQo
 r3TTQuLFB3NO9NQ0VcFYFrU0Mu4m9p5k/wtYCBS20lw+TSK2QCq174JUxbx4rg6qxAxC
 gR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=69G4sVrTM6Oebk85axmgqm6tVz3OwOvgPCpKMqCiPco=;
 b=CzbhpmU73ROaKW4T+RW7LnLwEDHkapFsNxNK2FfPR7KltbpbhsjAVKhd79Pk/lQabc
 VS5wK9Q/7WckylxqJ9Ok54Ix5Y+15PTBmTG+U8eZxtpooNnKwdJm0XePeHIscmof7TI6
 oaLAjSAaF3isC4P9JE8m06bFodj3HCqEQx/LRuPPm1hc7qShBMCqXIuGqSllp/Kjqmi2
 0MdhI59x0ySJPvpD9Irxn1ePkguodoCPAwltW/dGBDY+PezWMqGLZGCVGIHp2w16dsqc
 fGMQkBpPciiunlEh1ZrKUeLdoVdXduQOyxn2M3COedA3z2/htk29D3dprst9Xb8ylHT+
 aiqw==
X-Gm-Message-State: AOAM5315DUjbk8+z5A6uFsf3ANGBSdVQ9ub0erS1CUlNevVoutSCILak
 Hq38DFC50LpOvYvyLgnvGNPYVZWurObU
X-Google-Smtp-Source: ABdhPJypHixg49BP/nRHIZXftzFoLrN29bvmk/CgxMF7bcwNtHjoOkCy1TnNXK6tDuqfVn+gOXleajOvms2h
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:1db:3f32:3ad1:f38])
 (user=jmeurin job=sendgmr) by 2002:a81:af4c:0:b0:2e5:b051:6353 with SMTP id
 x12-20020a81af4c000000b002e5b0516353mr1068237ywj.518.1648664904545; Wed, 30
 Mar 2022 11:28:24 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:28:13 -0700
In-Reply-To: <20220207163409.19c3bc4c@xps13>
Message-Id: <20220330182816.1177341-1-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH] Fix the size of the header read buffer.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_112826_776692_2DE74E1F 
X-CRM114-Status: GOOD (  11.39  )
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

The read buffer size depends on the MTDOOPS_HEADER_SIZE.

Tested: Changed the header size, it doesn't panic, header is still
read/written correctly.

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 227df24387df..09a26747f490 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -223,7 +223,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	int ret, page, maxpos = 0;
-	u32 count[2], maxcount = 0xffffffff;
+	u32 count[MTDOOPS_HEADER_SIZE/sizeof(u32)], maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-- 
2.35.0.rc2.247.g8bbb082509-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
