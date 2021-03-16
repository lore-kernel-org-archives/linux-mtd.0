Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90172C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 00:02:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049EB64F69
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 00:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 049EB64F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5TdhrEMLNXHzHlF27R6GeQogE2TPNACFYIQmL4srZN4=; b=Szy8wSc1qUUzgr8UeTng3fsPiN
	t39FQ1ey45mab/3Zg3LrejXGehQlpmCJXKjRyfZQzzxtABnu6OTkbAandyDyQ8R/jH2qjrIVsTZOn
	xecZGF0JQbPPXnPgbK2kUhkuLNE8/U8px3F7al9QaZz/dslS0OyLVf2ClN1lqfEfnoTwaA54YUJkW
	6kGjrNXujSMT7JsI72iCE1+YNOkpUrVs33BILh7LwgSMFZnrT58GQGjhGbavOl69cCMFgKTlDMB9+
	2S9UjTLSZDtHkVP94WorhqfIBtqENdLPDwzielRpIS+zM9pxqzm7XdhBVw80s8PvH4PazQ/J9Ct+q
	HG+W3fCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLx92-00H7Cb-5y; Tue, 16 Mar 2021 00:01:08 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLx8r-00H7C1-Ad
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 00:01:03 +0000
Received: by mail-qk1-x733.google.com with SMTP id g185so33572675qkf.6
 for <linux-mtd@lists.infradead.org>; Mon, 15 Mar 2021 17:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DelZjnkdt546DqstJ260uTiTwjDw2JnmnetGYnkSuKU=;
 b=s77F7oNXaH+SYNtcFk085gbrkdktKzA1YOR3tkJwHgxe3h8ZpDHjUmzLAxZbPtDJWZ
 0mv5kzSBLTucDx7kS86J9EV2Y0AR32iYr61xM0lq9Yu5Czd33D6uEncAcdkb/lI7TYW1
 nLIxg3srEUprxsZyoOnzM0lMEde/cqHAUSbTbQiSdpKXTf6I9o7xUrVwAYDDE5ThxKN5
 4HDfSuCVPC1yie0lPrg4Ze3fSUCbBFkBYipZVuaF7NaE3Nk1YCddvnbtDqHK3fAV2nMC
 do+75GIXYwMzKGJ7pUhbW51PWBeTNu9P+8JdT6Rc99sSjNnPT9td/1FtAPUG6Qbu2DGd
 CSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DelZjnkdt546DqstJ260uTiTwjDw2JnmnetGYnkSuKU=;
 b=LBYrWcZ5z0LAu4CET7gODbNB3zmIdtFCw5YAMm6BOAyy+cGb9Q5V4GEQl6p138vc15
 bKv4Rzi1xPwdaRCDh64rFZWBHOArV1quQ/9+FwkkTwT/q6JaHqtFFo3F3VW7ZAkCCDVI
 nq1AeTyqG/qlnQEuiZGb/Y0k1zhOFLdnmzICGuSHfKjSk9nzBcE70a6AbUqlDVjBB4GI
 b1oYASlXjIwIG7E2thIjAE9mOC4wH9ojy2qd2xuHzRATNISLarYhOk/tZkQ4lMXdTjyo
 aFq4drco9KJPKINwwBGGxKrR/BpIZ9zEPXFc8sr5d5dp1DMsuyw/E70YeaVLlap2ADvo
 pJyw==
X-Gm-Message-State: AOAM530LH2qNd6OTUfvo4RXSv4wubLTDwBB8oqgxYwVo0EaKmAq4XA1w
 SscTlEl6B+hW0sffuUcVC5vyntP4c9CHOQ==
X-Google-Smtp-Source: ABdhPJyjr7SAalnhr2w9ci+FJMsZ3kU8CMahNLwOqoiEtNWEhYm2fLtWOdAz56Y4mg+mZoaESso5Uw==
X-Received: by 2002:a05:620a:2f8:: with SMTP id
 a24mr28274441qko.124.1615852853122; 
 Mon, 15 Mar 2021 17:00:53 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
 by smtp.gmail.com with ESMTPSA id c73sm14446241qkg.6.2021.03.15.17.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 17:00:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] mtd: rawnand: mxc: Remove unneeded of_match_ptr()
Date: Mon, 15 Mar 2021 21:00:42 -0300
Message-Id: <20210316000042.200392-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_000101_619857_9D3DC5AF 
X-CRM114-Status: GOOD (  12.28  )
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

i.MX is a DT-only platform, so of_match_ptr() can be safely
removed.

Remove the unneeded of_match_ptr().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f78302e16b84..f6c96341b896 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1849,7 +1849,7 @@ static int mxcnd_remove(struct platform_device *pdev)
 static struct platform_driver mxcnd_driver = {
 	.driver = {
 		   .name = DRIVER_NAME,
-		   .of_match_table = of_match_ptr(mxcnd_dt_ids),
+		   .of_match_table = mxcnd_dt_ids,
 	},
 	.probe = mxcnd_probe,
 	.remove = mxcnd_remove,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
