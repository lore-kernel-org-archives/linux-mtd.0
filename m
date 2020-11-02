Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBEBC388F2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:13:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA17D223B0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SDV2XISg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jRWAWmmv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dy+sfv06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA17D223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WghfdeDhC4j8A9jqfoXtbDE88+u3P645dCUawF+NjuM=; b=SDV2XISgQeKn8LppNA2WBADBS
	4l1lRcZk3MGkGe+8U1rpec2ZiFmkeormzqsc8kRhZj161i29CwEkgN56nfQPEambpMzHEIcnE6c8x
	Vj7H3elxD9aZ1rxLjtO8LDBZyHVkdFnqTM7nNmhyYtCi+vgWil26YEW9yLsmjDVS/0aEtDEU1XmVX
	D57xpTRDuABqAWEhkyqTM5m38oA+TTJCocBRaT8xnWPSUWQJHF/L6YkUJG6bzv18A7N7IW6/+zA/4
	FrisBvJsp2t1CWj+W4NDW87dv4FZUHB12ct7aeaoGFL4uI6GHT87UN4FprZYEzIeH2E38pCU5uS31
	KP7ScENjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYh1-00040U-8r; Mon, 02 Nov 2020 12:12:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgr-0003p2-J8
 for linux-mtd@merlin.infradead.org; Mon, 02 Nov 2020 12:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=BETgmjiznwAwz+PFWQvItK4BeS3oYpLH+kOS2zV1poE=; b=jRWAWmmv5Udz4hnx+nrv9d7d8I
 WSA/OL5YhwhuKeqifUT+AnIF4yaQrmsGvli64XTdxItdtneURO3/TBPCrAD66MTW43Nkh8sX9X1m7
 /BeTQUDzV6H955ZV8EWCrRVFLnzdjaTNcps00QdL+yslUofp2144Lr1dWyYoxJd251xxTX7qPnW04
 yIE153jrj+5Ln6pLoM0BLaFaKWyesf0sb1vMi3Q84TpqJFt+2DUnKsptKhAkxreUfQvgLYoqxqocF
 kRUOY1u8mhADyyEdWLuR9LmhRx2ImtCMkxD5Cn1jN2aICqK4EVHjhRnopgmF71o6hQvbAYIK0ie1Y
 eCmdFjeQ==;
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYQ0-0004tN-PB
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id c16so9218304wmd.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BETgmjiznwAwz+PFWQvItK4BeS3oYpLH+kOS2zV1poE=;
 b=dy+sfv06lRH6J0sMDT27XkTFTjVijNlzrQA7FASt1DkRNJh1vprWQntQ1V2bSsYJ3d
 13LNHrfF9wL6Ix+/Z8puRbiEcb61k0dc1DgXVVDPIKuzuhrOxQCNWe/4ayDZzaXZ/rvM
 R/8M19ji90My3vTue9toWMlpuHJ39hSGhjEmRcv8nL9DUG7tjHUFi9bhUld61HKRTCwb
 5i/3Lr1lr1usXG5t4MmXJ6c20yPAsN6ynGiCqvTbZQb/lCRlHhsUKwNE5+w8TM0VuFcs
 81Pf2HuOoi8mNGABlT0v/dDU6uyD6ScMM6ys3OBzZSosdm/ZV6fA9FsZzlqql9m9NqHg
 unng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BETgmjiznwAwz+PFWQvItK4BeS3oYpLH+kOS2zV1poE=;
 b=YLSIPnsyetoKD97cXDkzhITdAtZsVV4dU8cYem1kQyqmvZtoGTAqL5YfR3ge1UZ+gG
 YriF93e8ZO7DD93iG23PdbrZQXgcwnGJSJ41n2+MHHNOh98L5drGrmTilc/vDaapgp2D
 /zRsE9+az6AHGdZxSfiJunLZW6JeZlQkyCy6urE/98HCtvNHZ4AGRakxfsSMjBShOuzt
 dnQNjx/DuP7uLPXuZOGl6k9sJ0RHdRl4HKavqMVDffB7M9N4Hxgiu5Onaa4wcFmdAGJY
 XAY68DGDCVR8lKIhwC4ilaPyJ5mnv6GdbHz/OBKw6T5VTt/8dCriH3NmH96SsPUXnZWx
 nCAw==
X-Gm-Message-State: AOAM530jkRMx7jR8DHSMDchx35eSJujfiUdSFcXKepRBkagI0p0EYIDf
 u5k653taC+VIdHgIKJuLEpHdv8qOq8acRw==
X-Google-Smtp-Source: ABdhPJzinJikxNHvWusiDJvnHuO42K6ns2O0Y/t5ocEKoR3VX0IAc2b/iRqhp50PJT6H7Dh0PQXn8g==
X-Received: by 2002:a1c:9695:: with SMTP id
 y143mr16382548wmd.146.1604318073681; 
 Mon, 02 Nov 2020 03:54:33 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 16/23] mtd: nand: raw: cafe_nand: Remove superfluous param doc
 and add another
Date: Mon,  2 Nov 2020 11:53:59 +0000
Message-Id: <20201102115406.1074327-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115437_660548_5D7307A1 
X-CRM114-Status: GOOD (  15.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/cafe_nand.c:372: warning: Function parameter or member 'page' not described in 'cafe_nand_read_page'
 drivers/mtd/nand/raw/cafe_nand.c:372: warning: Excess function parameter 'mtd' description in 'cafe_nand_read_page'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/cafe_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 2b94f385a1a88..d0e8ffd55c224 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -359,10 +359,10 @@ static int cafe_nand_read_oob(struct nand_chip *chip, int page)
 }
 /**
  * cafe_nand_read_page_syndrome - [REPLACEABLE] hardware ecc syndrome based page read
- * @mtd:	mtd info structure
  * @chip:	nand chip info structure
  * @buf:	buffer to store read data
  * @oob_required:	caller expects OOB data read to chip->oob_poi
+ * @page:	page number to read
  *
  * The hw generator calculates the error syndrome automatically. Therefore
  * we need a special oob layout and handling.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
