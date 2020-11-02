Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35655C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC915223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TrBf5RTQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y5VvOFmQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC915223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j2cGASOw00F50LRrT9aDJb9wKzfozWrAyJjOeCBqMw8=; b=TrBf5RTQHs0ZQ9nFl+K0fAACm
	0hbhcib+A4ms4Q4C2mHztcXJLDDqP4Ha9MZCdzG5Dv/p7NUbXYPCk7Nc6fdilmRkRwgA+dU1y4edI
	FOW6EaWoJ9+VB4jHkn1DPk5mzoOnATpwpp/PYcLnlZaTXCUnZxWs22eXPeq2TL/T8HArK1dRMCebZ
	Ka+3irx6x0Fjn1YHOL14GlUpfgEEH2Uo+5eiqmw6VuK4TGwdBMiE73GE+tF8Nf2spShJUZ+5/ubqS
	hn9QNLvIkV0xl71l87ztJzMLNE+DPRv8KHThekuQBjyyDR2ZMZeSJd/Jnkz89PqKyO+WuCOXj+1Ru
	lW1a4cyEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYPg-0001ri-1H; Mon, 02 Nov 2020 11:54:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPc-0001py-7e
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:13 +0000
Received: by mail-wr1-x443.google.com with SMTP id n15so14287404wrq.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6k1rgmOCefV5rf9QkuupaTuT0YgnMPjbaR9fAX+QknE=;
 b=y5VvOFmQmI4ALNtwbtkNl4OGbZcjhf8zgU1CuhmF1lgt6xx89bPvfTiqcAe8fMJX/T
 hqcZuHTNa+0cRhYjgxrIQCiIqwvAFqAThlxlioPAyOdwbn8tsP3t7lgxKk1iWPQLPEz3
 Cr5B8ucqnYxWmXg3bw6gecQ4pGSWq27PMipZXIIPkfSH4iA/alWSqsAZlbJsSzORBZ1D
 No7fCGcChc++FGtT/8AexKRMZMNn8B8VnPGvrvdUXqGFAcqzKgSAaDfuYsEx242K03Cr
 9Rk6DsLUGgCDT4FDFz0qzbcLorZFlPseAr0NClD5fvchTFmbN82Md61/2XznR8FJ1r6x
 DBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6k1rgmOCefV5rf9QkuupaTuT0YgnMPjbaR9fAX+QknE=;
 b=CZ6a65cz1ic/Ld3ifLtV+6rfaSkgUC7KdL0Sc3qVIjMAcnoZ7CxeapNlVqGEFJDcEs
 RascHgATOdJw2yV+EFjTEfUI4jw3wSFD/rP85eixcig2DYhMs+xS8nuXoL3VIEBdgrq+
 126Uv4e0NoAYu1oMEx1zNsEc0cD05RzdqocNVgrRC/0QuhpqWrxFXsWLlOuJaVdEKHWo
 CPmF4OJgwl5dUFZaHT9aScdsD+NtOWU/3dcK96H9ip8uP2NjYMOP9G/e2UyViYbkf7+r
 pOXhPuKQhyZzY9Y0Wx3AH0SctQ18ffQmwyTscy1am54pUs0hnCM1HmesmFXVwHPoK0Ot
 9hWQ==
X-Gm-Message-State: AOAM531m+mKp7ou4+6FhyjBK7kcziV+/xdk12uwwXtptQqPrZKzKYfq+
 tCZpGPjD6wde+/SPyJUsPu9CsQ==
X-Google-Smtp-Source: ABdhPJxYCcOe+hVFLFBm6oD3leh3m/w+OrE9Xtc/KQhUYWCDk7x/Hd797HUddLM/pFy7+HmxPgI4Pw==
X-Received: by 2002:adf:804b:: with SMTP id 69mr19674908wrk.274.1604318051232; 
 Mon, 02 Nov 2020 03:54:11 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 01/23] mtd: mtdpart: Fix misdocumented function parameter 'mtd'
Date: Mon,  2 Nov 2020 11:53:44 +0000
Message-Id: <20201102115406.1074327-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065412_633106_8B8F0606 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: Nicolas Pitre <nico@fluxnic.net>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
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
