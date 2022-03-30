Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A94C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d4loQU6In7gWEOTRxhM/QxZPr0670P7lpTOdy2WESKA=; b=1sDJy+TSkz4z23UErHOomWkG7s
	z1cz43ovO8yb4qWOYZX7GY+FbIkN2aoKxcyzgdSbO7hwVwvczVVFZNTVkzL/9u33KAfjrKBxYfqUm
	ezYLmmDxz0AUlh45mrhza5nB0JjZLJizX2/KGydMRXbB1RC6xou1+uZjLsUQOdHCeCJLYrxvazgzh
	qg9rWTHc48TMZ3T3F5e5U14UIltbAEOilt+pzlPCAGYsMG8d6mv2HrOIUB4Ja5LMC08WwGVRCMXO/
	sroPpkBqL7sRrCHy5sLmunfJ5sGTrW2YD0Nb+Vu5BYrytD7wcDWenL931CpKO1ESVpbcY3NOO9FbN
	t0fJdI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZd3o-00H80K-TD; Wed, 30 Mar 2022 18:28:48 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZd3a-00H7vu-BD
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 18:28:35 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 h8-20020a25e208000000b00628c0565607so16145977ybe.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Mar 2022 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Ca47COXmBSszi4QxX+ReqmieWG7XNF5pnVRBaC+7k/E=;
 b=dY6w8gATGTxU0oNaihHTArpigSBMGSDZdhWG+2MS0O+jEhyjlDO3/ysyQit/uDsBYz
 wg+yTX02eZSaSK+vxrIdsm1UVZs7xxdNqogAqn7Mq9I2of4rjdRvpctH8PYpzmuu1yEg
 0JcFeel+gkQG1Ijjh9OqF1gfHXu3qK+jnZ8SLKwFs5V9v1mjHapyq/CEGIOoamMomdWt
 lotHjr0Aobw2mgmuWrTRJ/+hkrU1r0MxcyjUwre+HXdREOg8gnvzca5mz/f22zyVSOEz
 4N1yZU961ExZRDDToX1pqFxqAHlpejEs15E353IIPvZX+5mMqDra+qnwfrnDHh9UvObg
 r1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Ca47COXmBSszi4QxX+ReqmieWG7XNF5pnVRBaC+7k/E=;
 b=xF0QrDgoMlXyaEe2/5fom/0Vt+Ez2B6zeQkoKzE33m+I67RqYwaPaSAPX/brlRcRno
 OfY6bbkSq7HP8hFjbkBxNdCb+eUppaDfAheyOM30i7af25F0o50JarYVB6iLfLzTs56a
 g8UMr4XOFh1+AbLFmaWQU2S8v8n6LJnLzqzkXFjsLp5Lez2VJSt6dU26eh5+iNZEozS/
 qHAveC6t5T1Zr64c9i/4qpTKaQwYbsyBLgN33460Ba45ypOnNiWUong77L1hD7t+PUcu
 of5DpdRYlxGsErVhozTofwUWPPysxkiNdbh/9D1I5V8DUsmA2mzCsBSIylHFbIrqg360
 RX4w==
X-Gm-Message-State: AOAM5339e2WfMZ4o8jOLbTzfOxEihqHHvWK1F1vq30YTLvEzEIfRxn1q
 OUu5y8OXJTAGmEC5/8vFd28/Ao1r9yxK
X-Google-Smtp-Source: ABdhPJzP6uTDXLRNjGFtbGrlIV7fZWAmSbGYegCnOyFjySA8kz89Txm0ba1/6Dn2TklOHEuqSdQ5smAQh8bM
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:1db:3f32:3ad1:f38])
 (user=jmeurin job=sendgmr) by 2002:a81:4e4a:0:b0:2e5:aa2b:4ab0 with SMTP id
 c71-20020a814e4a000000b002e5aa2b4ab0mr1105409ywb.258.1648664913021; Wed, 30
 Mar 2022 11:28:33 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:28:15 -0700
In-Reply-To: <20220330182816.1177341-1-jmeurin@google.com>
Message-Id: <20220330182816.1177341-3-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
 <20220330182816.1177341-1-jmeurin@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH v2 1/2] mtd: mtdoops: Fix the size of the header read buffer.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_112834_411537_E832F599 
X-CRM114-Status: GOOD (  11.67  )
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
2.35.1.1094.g7c7d902a7c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
