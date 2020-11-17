Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3650C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:41:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E5A206B6
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="loMcymDk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roejm7Op"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E5A206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1VDfGgtEilHiPEXsZ9/7Hj9bvorPA+ooErhipMZexA=; b=loMcymDkt1OJyWGHvBpB5oapvX
	9TqeNu4/WSJs3AP1zrmVCZwpmSIEnEF+uRTp9GW6rG/BG2DF3x+/7XvpwjJyiPMyo5BsLVDpjSNx6
	1iI3VBwo2Ux8dWzPPChuHquPEuvSNXb0bGSi4sPJBEz3BmbsNkJbvsFEjiuwmv+3knQjKQMKHCwWC
	qyPH3KQM/Haa5hboPCTBUrAa2LPUbXqIwtvegHVaZA9SewZXTmUKEAQNvTcGJz8dxNhXC7dxXA9LW
	zT05kl0cS+MRibh778vwrvcXZgmCqp2Z9k1xY3HfM13Wzp6XHjRUGvOa2OqT6ngffkRQhdr3exL2+
	kZSw+kLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf4xN-00051S-ML; Tue, 17 Nov 2020 17:39:53 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4xL-0004yo-5N
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:39:52 +0000
Received: by mail-pj1-x1044.google.com with SMTP id mn12so687737pjb.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
 b=roejm7Op9Zg7DIDxR2z85W2idQGhDnJWcLxRVK9/FJgE4xP73woVLLM3cWiZlNukme
 7+xYxPb12cPLd+Nwpof5LdVtyYyAhs6qQ7FHzo4sK3gHh0Xx2Wtv8G9zgI36HcQnBFQm
 wKGkcZAMWGvS2Hqr7Gu0t5WgVOHwqNbmEGgziVOhQGPyvC011MB/JsNYjgpt3LFLUGPo
 Acd4A10Ljb3knE8r1khe/l2wZxdZajD+HcPx7IjGqAReaUTDHa3ri/fAE6xuo7CA/MpO
 zYoRNRYMQ9DHMlSXNT+ckd/V5j9z/Nizr4H4DFkCaRPLwCRDeUxnQxd13waGTyExsCLg
 ECdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
 b=dL6ooku9Vt8I1FVQZSrB7lbL0fa3Ilu5JpuyieX6PAzWZFmvNBlSka16OAN89DprxO
 yXKF0yPoBMTUScRxg461/3MFyey/hUjP18u6UgUbF/wfo58Y1J10hN9vlOThdcDPZcr9
 OHC50OPaqjDDF8uzg9lzVT13oTGdJOWaUd08VGZn4QOY1JAHES8LJJoke3CSnMh4HXkz
 pfhDNViOrgNKldegxNbkOWe3ghTAAebcw4QWJhSldTTNr0k4/pTJ0zsAXYUojkK/U7ox
 lNHBW35OiIASsHhPeKJeNm+IKVtCCXdHIw0pbLkNfB5xUkjpVi0g8muDBFsdWPvohGTe
 wh4g==
X-Gm-Message-State: AOAM532plBU4gTViAe/ZxaOa0EhetfvRq4/0L2yPTdE2v9YSJwi4XtdU
 3TK/r4x3pEsaR3IER1dEUkkc
X-Google-Smtp-Source: ABdhPJwB2H0ru1rDI9vN4pDM/1VqZieHatMHr5QNK9SyRs7wdkDFRvOEa/dKnxkDSTZFI1x7nSplCA==
X-Received: by 2002:a17:90b:a54:: with SMTP id
 gw20mr198504pjb.178.1605634785524; 
 Tue, 17 Nov 2020 09:39:45 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id a21sm1751330pjq.37.2020.11.17.09.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:39:44 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 4/4] mtd: parsers: afs: Fix freeing the part name memory in
 failure
Date: Tue, 17 Nov 2020 23:09:09 +0530
Message-Id: <20201117173909.23585-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
References: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_123951_229516_9CE02CAD 
X-CRM114-Status: GOOD (  14.15  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the case of failure while parsing the partitions, the iterator should
be pre decremented by one before starting to free the memory allocated
by kstrdup(). Because in the failure case, kstrdup() will not succeed
and thus no memory will be allocated for the current iteration.

Cc: Linus Walleij <linus.walleij@linaro.org>
Fixes: 1fca1f6abb38 ("mtd: afs: simplify partition parsing")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
