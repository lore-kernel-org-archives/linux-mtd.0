Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7574EC64E7C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:50:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD612466D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="McuaBG/N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GrQmJSal"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD612466D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1VDfGgtEilHiPEXsZ9/7Hj9bvorPA+ooErhipMZexA=; b=McuaBG/NN9vBhgGye7ROQwKhS7
	0bZCVdaeIeqR7jj4vfYBCbOas8zzE7hhvboIVThw/Q44tTcJhfe6LGiwcrcDk9UawDTv1XYCa1+Xe
	3yTfFqLxbPErcBdWiLzs3lBw0oa8FGqgtZhhapl4ByzupWN1Ls1WozQrcxIwsIgQLlDJJ2+voSuZt
	8RVT/iVWElXv0F9LFpJw+RN0x8BV6Ru6j5QyIXaAHQKQW+5KRKn5J3wVHA+LthYPzSXDnkaY7CYKl
	lpfyTAh3OMzkUjEaDRm9X7rzXqBqiv7Fl9NRMRlqIbGcU/rmw7CfUt0Kxh7J3OmWIMwKdGRAe/q+y
	3Y6AdxKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf56b-0007FR-H1; Tue, 17 Nov 2020 17:49:25 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf56P-0007AR-G6
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:49:14 +0000
Received: by mail-pg1-x541.google.com with SMTP id i13so16521943pgm.9
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 09:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
 b=GrQmJSaliPTve3DL04A9GAepxzDBPQmaJDXflI0uIc24Ceqru5Te8SBteMXYibBiWV
 YXtyBkZcp4alV78euGq8ZrdXrY/s1xTOqwOzjdB/goMB33KUlG5kJWFx/V0Hqrk3JZEp
 zw7ndp6YX9rmihiKPQuebdAS2Wg2Jl1+n+zNJJHekxbJkjfpKusp/zA2T2t21GcxUBBV
 sZr+xgHWq6+/6X33ZHMmafEYZVgWboH6fcuIKZcdfC7uKZ/Gc2XP02Uwep7dMXIQHRUe
 AZFf9CI2yybVt/jWzI+IT2jw9m6POx/FLGVpicrbqCfBClD5HoQVjXuKaz0ESjdzURvc
 ZuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EAf9d4gGWEUWE1b+AMgq6WQ0FcZNv1uCLoEh96U6HDQ=;
 b=iMpzKneyHvPzq6ZdLrhlrHIIsC+RR2L8l9eJLwCmg1iY4u/dF514VfgrwkSJJEG2HO
 QhECu54nZ5PPfBhUsWFIXO3NiewhzOEE0DF/u45MFj2ZMo+lGuJKir6MHLliNKF6l70a
 pyDArRCuxml0tywUPQMk3fwBMXx7RN6fzYMfT5RUSBYdoOOhmubunNKxbgu/DuRhw7U1
 B7JDOqHEbhF+/sr0X1pghCAuAr3E0hJ/3KcvKfqkx8NdS1GQejS8fQYIwFcfE1O8taHv
 nkMIM0qjvYtodDk26h0btRv/eY24/mFV4Vx0V9YxS/dO03wt9RIyfeevhhqufJ2gAo1l
 7rpQ==
X-Gm-Message-State: AOAM532zjyLduDFP7zBUItBK6QT8NxS1ElacmGaGhf9EiD2QDDGvSVtv
 eS7WmpjgbUsuvZqblETy67kspmPXh+7j
X-Google-Smtp-Source: ABdhPJwxqq2K6RhfPEieDLWKql41cofe+24CsQYp9jpMXliRovzgKa7QgkEGeFPlq1NqV99mGfsR1w==
X-Received: by 2002:a65:55ce:: with SMTP id k14mr4432790pgs.65.1605635350991; 
 Tue, 17 Nov 2020 09:49:10 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id
 192sm22222810pfz.200.2020.11.17.09.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:49:10 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v2 4/4] mtd: parsers: afs: Fix freeing the part name memory in
 failure
Date: Tue, 17 Nov 2020 23:18:45 +0530
Message-Id: <20201117174845.28684-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_124913_583261_3D7FA8B0 
X-CRM114-Status: GOOD (  14.35  )
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
