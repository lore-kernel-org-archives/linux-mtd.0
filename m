Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55939C55178
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D033F208C7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mbKuJEfG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvGUz9vF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D033F208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xMq+x52hv0S47USEc6kSR00N4utMwKTqtcqsBq7W4RA=; b=mbKuJEfGzLOkkFYGdvv0XHq7B
	FWIxKU33OBIOGBfvSXaOzWFoVhO2ycyLs513XIdtzU54L+MJWHUojAYNZR2L1MbeT77j/RkhUb1ok
	/+GP28XBk/IXE24FaDUx38GmcIbcm3eEL+23ov52YGcrE/aq4b2BMgDGvitBVxMrbweO3BKvhMwcW
	E71W2YJQd9fIJF4OUPcrfb4bUwju+rjwK7/vyq0N16kchC6VvWJJm1uAT2Oi2HYcqE9/WTNKDHmcM
	Eeptm2+Uxu6ziRG8ybW7wyDesr8TbAg4zIfX4b8vtxedcJO0nASV4huIb1zQxtSxbrOS1DfZRTb1H
	t3h+/LYjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9RA-0003Ax-B2; Fri, 06 Nov 2020 21:38:24 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q4-0002cM-Nb
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id p19so1763249wmg.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=93EjZ3Q1Gw8Ho51hZkZvcyMJpfj7h+RPmd54ZDyuP+E=;
 b=cvGUz9vFmdq9m3LcG6h2WXDm9NcajWq52twh6MVrvfJxfk83JKWtunTtBbGxznuGRw
 RYi+l/Oe7C4iUOShplsZz0ND8kpwu67qnNZz1Lbbl6HE0EOFU9tMkIh93D1/HYP56Av0
 673edbjckqfRywYQuHoPBvsOHVPWlKjR1REJeTOMHyE6WN+0vqKe6tvUTmIHHICRU08K
 8hXS+5La2R08G1bEnlZ0++Ml9gfjVjNgKUBMC16TWaRpkgFmVhzKLW9iIATEpLBtfg77
 Ht+AOn6dGvcQFtbUBd6jqgyafA2nSSFWhtuW2GSLPOp1BjDFFOC7mYruDcKB3cz2bzlI
 p9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=93EjZ3Q1Gw8Ho51hZkZvcyMJpfj7h+RPmd54ZDyuP+E=;
 b=fCuG8DOb4cvAJYQGn9LQgHqPh2VzYGLMXmh8+uP14LNAIaTBtCEFUkaMZdsz3NfwZi
 ZySsHKYqLRt2NLRXNhqzVRB+ihvLuiKhAu63UW+YIUrstvfJzifwUOefj420xFnmDBCv
 BQ1Dyhz9xIFVu4/iuT2qWEHrO9bF/uocdabcK/rFNaZep4i2J8rHHA5ONRGnCMyoBPCc
 ixUObGaepqMVJJpxtkKT1Nq+FN9AUZh7yOCbSbgBrKcWbcKfK2htx0h51C2HO6rnaVev
 xlTbe5OiK4ItnrUXujA4d7FQGj2lWlckfYGrYruIN2OHB5kB/jlP5lFPKK7WmOKbVH91
 VQqA==
X-Gm-Message-State: AOAM532DgDycovys/FaEqZeldVpyedu70a3sWeDav3iGgrmdbXS4j0Rp
 saMdeYEqz1uUGZSInwCqWHXJ/A==
X-Google-Smtp-Source: ABdhPJzPk8Sy5RnOJ5+GcYE/M213NgScyYk8H3UlXOO5RgpME2G4BnxgdBGAg2AfyOr6Z4ZV7gH3DQ==
X-Received: by 2002:a1c:ed15:: with SMTP id l21mr1703834wmh.26.1604698635749; 
 Fri, 06 Nov 2020 13:37:15 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 12/23] mtd: ubi: wl: Fix a couple of kernel-doc issues
Date: Fri,  6 Nov 2020 21:36:44 +0000
Message-Id: <20201106213655.1838861-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163716_845148_C873C449 
X-CRM114-Status: GOOD (  16.18  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/wl.c:584: warning: Function parameter or member 'nested' not described in 'schedule_erase'
 drivers/mtd/ubi/wl.c:1075: warning: Excess function parameter 'shutdown' description in '__erase_worker'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/wl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7847de75a74ca..8455f1d47f3c9 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -575,6 +575,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
  * @vol_id: the volume ID that last used this PEB
  * @lnum: the last used logical eraseblock number for the PEB
  * @torture: if the physical eraseblock has to be tortured
+ * @nested: denotes whether the work_sem is already held in read mode
  *
  * This function returns zero in case of success and a %-ENOMEM in case of
  * failure.
@@ -1063,8 +1064,6 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
  * __erase_worker - physical eraseblock erase worker function.
  * @ubi: UBI device description object
  * @wl_wrk: the work object
- * @shutdown: non-zero if the worker has to free memory and exit
- * because the WL sub-system is shutting down
  *
  * This function erases a physical eraseblock and perform torture testing if
  * needed. It also takes care about marking the physical eraseblock bad if
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
