Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532D8C55ABD
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBA1206D8
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ky3k/RNi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLmdlcfB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBA1206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j2cGASOw00F50LRrT9aDJb9wKzfozWrAyJjOeCBqMw8=; b=Ky3k/RNiERtN3SV8fs1/alLlN
	JxmuIiDJoM/nVS+cKBntGQTs/w79cWIM7kCbAjxE4tcn48d/L4w7jHsc1vcAUdfq9oPkyNPRgRySf
	Mvr0M0tyTRw2ONSUzd/N1eYq00JZK8PFUz7ZzhmgXMfe5PgzL8crST52YJuvgBERZErPcHi0D9uiM
	OKRuEAhAXaCd7ER0uj85UCLwqNlQj3ltEf/9sqHpLN0J+wc2JqdAY/u+gCRZ99hHaQDKk1qqjjnTt
	5B7zcAqs31DLlwzIWGoKzkjSemYK6OJM0gWfhDq/jzJJHMSnHX1D3lIXKI1/1g9AZ4GO+z+Jv+kfq
	jBdHdtM1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBo7-0000oP-5c; Mon, 09 Nov 2020 18:22:23 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBo3-0000n8-Jf
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id 23so9805188wrc.8
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6k1rgmOCefV5rf9QkuupaTuT0YgnMPjbaR9fAX+QknE=;
 b=MLmdlcfBaJHqzeKtW05Qu2AgvRk3QbkPgKqYxdcQn/1A/jiffq7BuMemkFyCQCjI4n
 dh15uXBZl3q6EMSToflbkjhECcXRr8rkVjJZCSfow88lt6hKWFTXApRMRg3rsHcees2I
 A/TM7IsyzUHeTYlz0v/XqmYnRCuIJhjhqvR9GZewB3NVY6MQovF2y6f+SZb+vIYUKb4z
 xNsscJVEDrpBbfj15bdAK0oJD5y8YmPjZLCL6flOu/kzJlOHY3VebswJbKxKdV6yfgEX
 rnct8wFTkeNme6OuqwlX41/U+ZNk4vbTPxg7dDLUtrTJQFvsbN63J7+slDFP9UoSGxkN
 25vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6k1rgmOCefV5rf9QkuupaTuT0YgnMPjbaR9fAX+QknE=;
 b=I0gRSa9JDnR87vdv4yAE6f7+5lcGX+COnDPmEzcdOGUL0uDKCd6PRW+ufy7tJKHZpT
 47fPVjtzLHcYjr7XLrEGewTgkEYvbPQ62R4fX4GBY7Kxk5WefVPbg1MoFcwOT/8KDZz1
 Q7u/JPyLvVUsRAjYUcugipNIWztrzSfDWIDNeuQy2mkKXnhWh/YW/6DBZQi89cBOtP0m
 i5IhVErIBdSsbbG7y6dDtAVJHNh7JlO/uymi7mUYE3MH5K6QaWXkmfoeeVe6j5jYYtn1
 mwqbouB1r6tXV5butl/rxgR6pkhZehaJnVX4wRrI0KJ+XLLFxF1GoYeVx+Iip9QZ3PT/
 Nvdw==
X-Gm-Message-State: AOAM532MWfisZHIOukebO2XJQXvG+SXOyoeI1lPLO+OblZ+RoUHSlnpp
 gdche1TG4lfydpBoscoJyluyoA==
X-Google-Smtp-Source: ABdhPJy+Jhlqvl0oYRlSi+FKgD+3S1rNcl9yehdbWZvPZWzmw4dopz2nHcAkmSAcjCJFmZXKUAewPw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr7528845wrt.66.1604946138536;
 Mon, 09 Nov 2020 10:22:18 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 01/23] mtd: mtdpart: Fix misdocumented function parameter
 'mtd'
Date: Mon,  9 Nov 2020 18:21:44 +0000
Message-Id: <20201109182206.3037326-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132219_735290_276CB71C 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Pitre <nico@fluxnic.net>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Thomas Gleixner <gleixner@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/mtdpart.c:300: warning: Function parameter or member 'mtd' not described in '__mtd_del_partition'
 drivers/mtd/mtdpart.c:300: warning: Excess function parameter 'priv' description in '__mtd_del_partition'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Thomas Gleixner <gleixner@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c3575b686f796..12ca4f19cb14a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -292,7 +292,7 @@ EXPORT_SYMBOL_GPL(mtd_add_partition);
 /**
  * __mtd_del_partition - delete MTD partition
  *
- * @priv: MTD structure to be deleted
+ * @mtd: MTD structure to be deleted
  *
  * This function must be called with the partitions mutex locked.
  */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
