Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951D5C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B09D246B8
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBh+m0Aw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgWlpJRt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B09D246B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJXX6BpLckPv7T3dPcAMzIc4MlFYYxN8MtLccvSyM+0=; b=DBh+m0Awalo0kxm72eWUXnGtE6
	XZQTQOY5FOpd6vZNxor9YRpgQ1pzmj281cRdIbiUesbEN8x0m51KBtOkS2BDSaPZewXp5qK8a+klA
	OpU/aUqd2NSGA5loHL5cZ6qtry2O9q8TuPTlmv/sJIomvPAOH62o80zN9wcvd0qPx+vQVRaG6TgGm
	GrCoJwUEbB5c6WJTmt/I3Y0jNixlnSNcp+LoD8KoR0rw1Mr1SqN60JO7TmSYJoGiFPdv9ttLtZw4I
	wNi4E1nxhGsm6dA6dKDsHTQnlKE+3W+2qHTirok/5/ynPWplRQm5fmdJnpgiNyMn/zO9GZOSBZ+tr
	lbhVkVkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfe8f-0005qE-S1; Thu, 19 Nov 2020 07:13:53 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfe8Y-0005o9-2J
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 07:13:46 +0000
Received: by mail-pg1-x543.google.com with SMTP id 34so3390151pgp.10
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2020 23:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aapWpWlyJG4BRZvNWpxnSiKXabtbA1WEoNDKMnXBWMg=;
 b=qgWlpJRtvQvY++Dn2/UpaiG/tLsPm+RlkTuBkKurklKGiW6comp6026pG/rrJE5H9s
 Jvk8jJuWq4Rmp7o3owcGR826LFXlnudvx23sSDp7tOXziagznab4Xu/yqFRqW91nuLpg
 oddCSmZB+jJQZcvwEZy+kadZpuFNxNRVyHJOXrjEsjC3XSrDx5kYfxTW9YHmyjS9YH5o
 sgRWaev0MOcbaeZrDF5y0KNkiRpi/kko7dycJ4xxtMSLRG1WgLOpHPXTmUa8T0Lwj487
 Z2bzhg0NQVo1PhiaH/PrUtoyRFbTUM47fiwe92cnxelpWzoWVcdqwTR5ci+L8dRHwkQR
 Ixgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aapWpWlyJG4BRZvNWpxnSiKXabtbA1WEoNDKMnXBWMg=;
 b=Pk7mMeK2aMIjjRjjScn6x07gjCIdwa4gqfNpVDn75+aPO2tFnpAvcHNJ4cEfYfDzxh
 zDxxcSzJk7yw9FHvceei9IbOiYG0Uu8QcFYVk6a0q0nXKakf61vUTEV7s+f6Tlk4O9B5
 8pHMN+T6t1N17S11Eb4iONvqLDrPc3qf+ljaoBhmoeFv5a0Iu8o54gM5Zep7gU27wL1E
 w62J7jvZXw438wEej1U8IPAz77DbX/Ot2Xqs0YRxVoxxkEzKgEKJNiC4/6skMYNyosYU
 BGDTOI4geev9IX9iJrKi3DgAA6x4o4EfGwGte+Cnz6DsANfbU/QBREeJZQoO5rgdjPrS
 wIag==
X-Gm-Message-State: AOAM533nmtCaO93AY5kyHvDydF0ffp3mTKc+SP4xMjnFoucPfzRFJQJ4
 IHhr+x8xfFxLrpYMa/G0khru
X-Google-Smtp-Source: ABdhPJwcInvozb/zTCyAg8emYQVQFmIX2bAwu06mXAwj/87oGn8Q4Nm3DbiDeHZzBrzSc5OLOLtxVA==
X-Received: by 2002:a62:8608:0:b029:18b:a8e:ee9 with SMTP id
 x8-20020a6286080000b029018b0a8e0ee9mr8008802pfd.65.1605770021344; 
 Wed, 18 Nov 2020 23:13:41 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id 12sm5491577pjt.25.2020.11.18.23.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 23:13:40 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v3 4/4] mtd: parsers: afs: Fix freeing the part name memory in
 failure
Date: Thu, 19 Nov 2020 12:43:08 +0530
Message-Id: <20201119071308.9292-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_021346_180596_0FC15EFB 
X-CRM114-Status: GOOD (  14.30  )
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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
