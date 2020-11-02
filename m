Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906D1C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29C32223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eaqnsinr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCPDuMln"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29C32223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bR1wJjauYS4ustOyEJLRrz4fv19BXaOvoMxPfrmUUpA=; b=EaqnsinrBf7OOK/LZTddFYSIW
	TtEQKkT1AktvduruhP2oLKzQm0ogwLfb8FGrlekrlZ/zUT76dZ+36s7sdjMQ9b4EVRxb/UV3CMujZ
	Hg/shlmyIkVPqnCP4q2uS2VxQav79dw81Pz4yglGedqY+QUj8h9ZYMl03fg18O1o5tSaxH8rIRofs
	33NHrIj6n8bewQ5emjnyvwZzUzbQDPphtGd0MKFpb+7m0rdoQKDFVLCMThNtpsSMBzKzP1GeWxqLU
	ZIGFlQH1GJYZ6QTsNx6QZRECA2BBg8Bni/T9mFdpVmTmtmwtbcx8cz5yJdbmlf5q95xXI0UYyaleB
	w5hehDNDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYPx-0001zc-4F; Mon, 02 Nov 2020 11:54:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPj-0001sp-HJ
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id h62so4390752wme.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxY4nsmyRi/nUX3VIHaOzQz5RbwhMjYbYFGyjUQHoHg=;
 b=JCPDuMlnKywnaHCyiFzg8iFhOYqvCd9b1hcgx7kc3+HIlApSIeeTFycUjUor7DSF7k
 eUG04bfHRpuy/7JATrM5WvxmfuSIGeosPpUfsMfAhq/2ixxFcnN8xqoqXTmQRSXQ98QP
 7Ewj2hKytb/TtMIUClOmW/gdVscSc6uM5avkYexLiZk1vO+zrHk/JuI4NBOL+V/ynD6r
 fx6time6q7cDuhXFFyuDOOWskPTRoKW+HTVhw8KeZRYdVytgFGKJ7RT76qgqg/jIxz6h
 UY3U5D/pGF1wAFal+E/r08gZMz0OxwT6WRFziw868b8039yWaWOkyx7JutH1LIyYUrCJ
 0ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxY4nsmyRi/nUX3VIHaOzQz5RbwhMjYbYFGyjUQHoHg=;
 b=n1Rm0hg/VhzQg2G+EhvmeLVcB8s0twtrheBLlCgpNf02IYd2jT6I1aYuIQRSqaU51M
 PGcx7jo5crcLfQTw22Bge42bJ2Q8MKKD0GFfBElkF0Qeq9/tmvhVektvvPugI4k5TL5H
 TkSE/p0bC9Ie0vluJVlZ+9mc5ykIQfKJTw5QKuU0HFgLmTprFKZ/PtBMYN0fVubrKVIN
 qLiNFsnd8G8Br8W9sTBnPcNcfweXKfjOF0zU4vem/o3oolPSBlK7ob3ekWJl9KFqYgs1
 gbpb5jXMOpMs5hhvKumIeT5Xg2A80jNSA7HQSU2u/0rWlG+epHcrfZTlsW8vKwDT/dOW
 DdRA==
X-Gm-Message-State: AOAM530NefMoVj5FTFcYukIsyyPNGcjd1QMyXQH0I3Uarg1IoD8pLtWo
 LpdZvfu+Z3Wghguk7wctbCdI/A==
X-Google-Smtp-Source: ABdhPJwzgnEGAIiEE8RyNVpM9wHkkyb53IHSIEb5ieMRbI8BZwjKdlvZUyAObOT/4HgF9E5yesqStQ==
X-Received: by 2002:a1c:bd0b:: with SMTP id n11mr17472032wmf.111.1604318058701; 
 Mon, 02 Nov 2020 03:54:18 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 04/23] mtd: devices: docg3: Fix kernel-doc 'bad line' and
 'excessive doc' issues
Date: Mon,  2 Nov 2020 11:53:47 +0000
Message-Id: <20201102115406.1074327-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065420_636305_E59632F0 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/devices/docg3.c:819: warning: bad line:
 drivers/mtd/devices/docg3.c:1799: warning: Excess function parameter 'base' description in 'doc_probe_device'

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/docg3.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a030792115bc2..5b0ae5ddad745 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -816,7 +816,7 @@ static void doc_read_page_finish(struct docg3 *docg3)
 
 /**
  * calc_block_sector - Calculate blocks, pages and ofs.
-
+ *
  * @from: offset in flash
  * @block0: first plane block index calculated
  * @block1: second plane block index calculated
@@ -1783,10 +1783,9 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 
 /**
  * doc_probe_device - Check if a device is available
- * @base: the io space where the device is probed
+ * @cascade: the cascade of chips this devices will belong to
  * @floor: the floor of the probed device
  * @dev: the device
- * @cascade: the cascade of chips this devices will belong to
  *
  * Checks whether a device at the specified IO range, and floor is available.
  *
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
