Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8A6C55178
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64CE22087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQ4U8PPV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nffO+72F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64CE22087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WghfdeDhC4j8A9jqfoXtbDE88+u3P645dCUawF+NjuM=; b=mQ4U8PPVN52u5IU5VV7EKpdNn
	LdZ2k5Tq/oobw1wKx7eHkcTFCUmZRYDWUp6fmiSBTDiBrnlFUZ/zUQMVBJ/OqxzUUUhynbNeIfpsQ
	R7RRN9SgSrmDnN8CTFYlG9eZd1OPBvXUmXSLJ7vUlHMBln6Zhs/9MEpXi6bw9TqH0K8gaOl8oObHS
	M+0k3uqnvpgny2Ukp+zNwMCZVtrPJmHusBvyY2koiL0mcpLQbXkTKm5NTAQWFqphr0NPyaoHS2hhF
	+nRRo/53ftSlc2Up1usJhSx0i5I5snn5uLj9L+I4MUH6egwtHJjXSwpAkLDdk/m6jwraLZHY2RBjm
	M7jigp1Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Rz-0003eP-8T; Fri, 06 Nov 2020 21:39:15 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q9-0002et-JS
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id c17so2754100wrc.11
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BETgmjiznwAwz+PFWQvItK4BeS3oYpLH+kOS2zV1poE=;
 b=nffO+72FegtWIuRQmVOjyQ3YSiqmz16iu6IDBvNnyWD51uId9oSzigR7mWrDp28h2q
 b1ci3TdGgL2M4lLtpOTLekGXKiYt+60aXo5YqXNe1XYYTOAqVyGyz8CVToiqiFTweNaX
 FsN52+nl19OXuJmO/u/zcARgVagxc8IQIZtN2jG6H79hpAPYvuHc077940+7qYcgvwOW
 NN/OIydgWJjGB8SKr5n8OvLQ/k4OInYT0d6kbBXMowEzwX3L3aNCr002eFVOXKvmKub9
 AJ2hR/oU9E6TombBZ0VhBI8XbaTrDRJrKKLUJc9o96j7xfweHYxc1mgHGVcWJSYXf0+T
 rfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BETgmjiznwAwz+PFWQvItK4BeS3oYpLH+kOS2zV1poE=;
 b=StYGoN6iC2xvfuvHbCdRWP0ZOGQZ9lSxhc2e/23JX1D21ksEAgvbgY/5I5XP14+UoX
 8XCtqFEIhTe4recIBCPWfsoxuL6V3bGJp7tfUpXTGwa4tjBKrPCt1SDpExwh6Fq/A81o
 KR38dNHPxJOKH83H+t18euAf7cYpoFvqoOKatlv/DfBAXk63HIG/AWgOPyPJWmgask1i
 Z004KxbzqBkf5oihsy2WqrYrEBB2rojg+zqMfEEcBIPCsdnyyD1xbkCjh5f4n3QKUyYz
 fYxa2tDZ185GNz8wODvNr28d/85zTmMeDJN0Cm3UQrszCgfOvBvLZfDWY84JMXXz210f
 OKvw==
X-Gm-Message-State: AOAM532lLX+nWeNtG3zZLGhw/66t8ZTefbUg3e5tzgs1MrNjD2AopA2+
 fU2mD9rh25vK4EUHQgGwSggeHc9YcXiy4Z1a
X-Google-Smtp-Source: ABdhPJyVEKkwXeg3F+JfX7J/ase1Dpn0AEKSB+i4LnGqyQzbUXXYNF3TUjX8D8K/i5s9EEgPuw1cXg==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr3250741wrp.276.1604698640687; 
 Fri, 06 Nov 2020 13:37:20 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 16/23] mtd: nand: raw: cafe_nand: Remove superfluous param
 doc and add another
Date: Fri,  6 Nov 2020 21:36:48 +0000
Message-Id: <20201106213655.1838861-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163721_779986_B2432E6A 
X-CRM114-Status: GOOD (  16.87  )
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
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
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
