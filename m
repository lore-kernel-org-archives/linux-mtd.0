Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07A6C55178
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E8692087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2/cUahjW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AvQYLR03"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E8692087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j2cGASOw00F50LRrT9aDJb9wKzfozWrAyJjOeCBqMw8=; b=2/cUahjW4y57LVQE44hd+tAOq
	6EY2sbWZ31w+ykj0Fz94+2SlR5FxmT8vnX7HCk2eSUagrrH4wiqulDhXcI5mq7jVM00e7Socb+7QW
	2/J40J0zLdlh7zK2q3Bw2IvuMGN7O/GvlNvv93/2i/kxbBPn6JTKYNsNHl+1LxmzR7B/nzHnt01rS
	/roUcKthcLxz2YKjp9zKiQJx0xQTYJ/CQOF1rxb16Qqu9wtBFzyMLTWGpdOFyjBOWv8hHgCa240/L
	Bxn/LXi4pTyH+8dFehsruTsQQMQA4zEVOxenoqIYQswnTfTMQ9DNZpS4WtLT/oIKIgNLftlSzyu7u
	0i6Mjed0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Pw-0002YN-4a; Fri, 06 Nov 2020 21:37:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Pq-0002Vm-2a
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:06 +0000
Received: by mail-wm1-x341.google.com with SMTP id p22so2814894wmg.3
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6k1rgmOCefV5rf9QkuupaTuT0YgnMPjbaR9fAX+QknE=;
 b=AvQYLR03xbicnhIfWhXEPPViOHs61cAWDcBBAqxMIf4hhzRHHR1/rYaxTzWUcYQ41l
 jBKu18wordjr8dVoLYX0J0VdnqWCmrXmE0Xxrr5bxuVMV4Li3B6SmzTdS6QnK760I+iC
 r0w56fOvAfzLGwxhPA5akV/jLc0Dor1wwDU+IGgFo8G6vvUHtbf6CmQfUcIwedXCrsrr
 ZVdAgDCcBPe+e+zYqr68HGyPRUgJecO462ljdpDLnm5aFTHMJZpgG6GnBb8KONOTt9g2
 uixz6/8oSZb/9BA8H+UJuX6uzTM8PDk/IV+6Mu592JQN09pGrylflCQvp49U8sseQ+V1
 yRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6k1rgmOCefV5rf9QkuupaTuT0YgnMPjbaR9fAX+QknE=;
 b=uFSq4y0zy2itK0iuBqtqlfpLjojN71bE/U1x9U5IYnlmFFcQg8BS21NKr1GrS49mud
 X2cBd/p2xoXLRCfCR4IBW73Xq+3XoJDxDNC+LScRTiuIJ11VTnTFpSLgbgK0vMQa8v0z
 jjTqgYL/+gHg+01mU59Uuyg9p8cbI0IBlX9aBWkCYKSwBcZHR8+dSvBlmhu5SApAcP4w
 m1pvXf+WE5viYKSY+qtE0in9j9zKMLFqpj6b9hueX3Ti+IxuH2D7D9Ext99P4V+56X1W
 0Y0O7Xn1ucE7qKxHrvWuT/X8nCebvfg1yjGZ7aj/4OTNmcaM8/rR4j/TG9M7yyc+TZjQ
 HG1g==
X-Gm-Message-State: AOAM531INsFxZiHXC9YanF+vGtu2o7sgDzQcKZg1CQaLf+79VQ8ydkWi
 iUn8QlnNPmHoEGC0uRpxY6Xgqg==
X-Google-Smtp-Source: ABdhPJw7xOxgjhcgn6FMqkKjYsYsVmh6Zz4R7JPa8fQGkd5zlGpQDeGaqfi++qYp1PxK9RHRq9rQ+Q==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr1686324wmc.32.1604698620981; 
 Fri, 06 Nov 2020 13:37:00 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 01/23] mtd: mtdpart: Fix misdocumented function parameter
 'mtd'
Date: Fri,  6 Nov 2020 21:36:33 +0000
Message-Id: <20201106213655.1838861-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163702_164394_A02FD4AA 
X-CRM114-Status: GOOD (  16.25  )
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
