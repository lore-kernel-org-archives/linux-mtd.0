Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9E1C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:13:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC51C207B7
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC51C207B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v1SavrlOVRrF9Yl/3+44To7cZlMjrpdrp4UyO2SRF7M=; b=pewlChqJxcuShIQOvyD70uv37
	RupOKiHyx23XWn0CQxpY0PcqZ2fHc4IXeRt0rvOkEbahJBk7EQU6RV5I3SgzxOL2pEUUsNqqB3mNf
	Ltq4wFiVRXrx3ZLyMn3glj0o7HwgWHQ6tShORISXC//zcFwzV5fGxOH3tRU6raXqM33Ru4jlvCW2m
	iO9QCWoI0e2VAEIQZICck75682RdOaEEheX2hi1SDgeqhA9XvjKbdfcrtqAW59U84/kTEub1zhmzJ
	0R8Z7jQa0BBjrvlJ6CEcErhCaNsk4Vs1w2iRNktSNNHuhSEdsjny6AQ9JJlRKHtRzFvc4lM0fpwDa
	WJctVpC5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwHE1-0002Qs-I2; Mon, 04 Jan 2021 04:12:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwHDy-0002Pk-H3
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 04:12:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id q4so13818767plr.7
 for <linux-mtd@lists.infradead.org>; Sun, 03 Jan 2021 20:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wneBaSsM0xu86yHRW+fmULQ20sTukJwsm41Qy3J+Umg=;
 b=kUog3bVTIvYUWWUzjYQiRQyzxAlie5iBaP/m/YoCMjhOoCsT5F3U3JzXz4OfLihcw1
 1Jfz8lCNkbUcL5zpmLYT36af6+u9c30idejRXIJnXxpoWV1itGu7GtGC+EeNuWsl9txK
 vsWQKMoxfakSo0jp85msmiCUaKTYvpvbXOcCcnjofk2XnHJxOk6ncEMs+sVEt3LhN4Ck
 SnN2gH1CzJhgK7MG4/RjaLccO4G+1/BNgtpUW7IeHVEYx1EIGFM8BeL+Hs2HSngLT2Ng
 si/ivAd11a85yLlElbr6ZR4yQSLZ8SrYFtGdOjBTClmTc4GfgJt7S2xED02PsfxuT/SR
 tkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wneBaSsM0xu86yHRW+fmULQ20sTukJwsm41Qy3J+Umg=;
 b=IN+mc4cofl/rmkS6noaxxkuUeUu7Ruc5WAj5dbtqnz7VY32jY5Xs1MP2nBWc1xDgyJ
 tqNxWohaXsTJIShhCrm8RO8fbr0F1o/02INc4gYMHplkavGQlttpB9KHhD+neWDe4ryK
 klo7/IY3w3I5oHpyzm63y/9GxiZnu3FgOSOaokrE/gNa7m19uurh4Y/f5xNvCFjtZVYB
 jlUCv0QlVeB4WWmaF1NH7zwCZMO+c6aYswK5jXG+jhoIgqhePNMWvwudo7bYlPj1IFDI
 y66g6hB/mB4A4elWbPCagu3TOAmx16v3XzrGJv27n22L6mVKyzHVGrg0M6AQcIS0bls2
 R2FQ==
X-Gm-Message-State: AOAM531XHr2oTUXuRsd0V3HHtQ3lbKABoEoD859bzMmauRDnt1UcFLYz
 e8Wsp7D7v7DcfSd01Cl8pdSP
X-Google-Smtp-Source: ABdhPJwp6G0zMQLd1gP3mxWQZWOQI5+R61JLxuOhu+0q+EumPWeHC8XjNAYRaBZ+3gNLo4XqYkOh7w==
X-Received: by 2002:a17:902:8d97:b029:dc:313:ee70 with SMTP id
 v23-20020a1709028d97b02900dc0313ee70mr70807129plo.82.1609733523386; 
 Sun, 03 Jan 2021 20:12:03 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
 by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 20:12:02 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v4 4/4] mtd: parsers: afs: Fix freeing the part name memory in
 failure
Date: Mon,  4 Jan 2021 09:41:37 +0530
Message-Id: <20210104041137.113075-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
References: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_231206_613354_5B04EBDA 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the case of failure while parsing the partitions, the iterator should
be pre decremented by one before starting to free the memory allocated
by kstrdup(). Because in the failure case, kstrdup() will not succeed
and thus no memory will be allocated for the current iteration.

Fixes: 1fca1f6abb38 ("mtd: afs: simplify partition parsing")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index 980e332bdac4..26116694c821 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -370,10 +370,8 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	return i;
 
 out_free_parts:
-	while (i >= 0) {
+	while (--i >= 0)
 		kfree(parts[i].name);
-		i--;
-	}
 	kfree(parts);
 	*pparts = NULL;
 	return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
