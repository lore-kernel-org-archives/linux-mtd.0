Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B67EC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8EC0208C7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m4VZmmsc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIJqWuun"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8EC0208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qkYE1Tk9hAOiJP1UnW5g7zE9R+5aItbEdl+ZdhI2/XI=; b=m4VZmmscFnWws0WTBZMup+7re
	RUVq4yFBI+ogoD5ekm5dlCupQAiJGvYp5qHZd/phdtGFtD8PsrZbFYVtbrvMbw3F3kmCnpM1sbALN
	m/8K4Jpx3bjIZTISsJeY7uuO4gkrxazANkvK215K1ezJwUJguRYPHceHntywReXdrulJvVtwmGeyC
	+1R29N2uPBNc5e+RPHVdSsdFDIQzcGkLhUlriWD0HFjJYI0F4vmVDEqEfr81EgPqYvGeaYTyMEC46
	WOgNVoIy1qVl443UoHRz0UN2za9gMijP8xD1hU2ZTT6SonOXwxx7LKQqmd0mnLILkaeCvEvsGcTMb
	PeblwuwQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Se-000436-LJ; Fri, 06 Nov 2020 21:39:56 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9QG-0002hd-1P
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id k18so2621443wmj.5
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2abslax4xTZx4NcG965UPlBWLqxdXR2VSBh/TqhIys=;
 b=gIJqWuunPNOfDIFyO4uN9GnnqnFhpSWormMo1MbZZ4YUm684CRnXVVQt8r/MdXa7Xi
 IB35shvh5tfNlmlZOFtSppdMmrhkvS0lGRr4gKBUlXdY2goKLftXZNeNVvKP1+Ezw1Yx
 Qd0BCrhobs7VNkpRRRdTzMLDEKMzOC87O34JwG2mcdjhNxrlr8NVDwLt1gJFU5D75LuA
 qyryLpZ7R/jliLQo2p8Sftdl1lmmed+DlUdTUJHWzFx0YxIV98isN1G1Ia+B0DS6lhzQ
 HUaduOlivmQktAcns7VZIBaZJEIDX6EiRGmlL5GMYBPOdWx4kG3+ztsKRmGzUlYu60Sw
 CHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2abslax4xTZx4NcG965UPlBWLqxdXR2VSBh/TqhIys=;
 b=OLSiI3g3VdFw9Aydg8Sstd7aa1H0bL/JCmjo0cJwET+/DX0zmqaO932FGlmuNLoUVd
 xxDCzyYUpUBN6s6TIgIUvhw47xF1m2WYeGHM75VqLfYPRkZWtEdBblhtngy2rzAVTDLI
 Y8lkejftcGCKjzC0HZUetFDj6GZn6iY32kNT445rKsKRbE0do45xbVGu8Q6AlIOgHZih
 9UsTV9cyCMnWxuhFh9yTMCcYObv5gUkH2gaqk+T+ZYWXG6Awz8AjUlwXh/LGajn9KRyG
 /gtFxiewTCIYVRM1yj9tAsqwxLXaU1OAbTNWomfSfrZ2NfTcUO06ei2EleuzEBHdEyvd
 ovbw==
X-Gm-Message-State: AOAM533ZdsiMhUKs1oAPUszXnL8/K1iJlwwVyE5UGyMT2LnuKIAcxTeO
 Ee+fdRcv9CebX/Blm+IrYs5Hvg==
X-Google-Smtp-Source: ABdhPJwAlwMoxAsuA8YuxFAr4KHnUer28QzUz53pEnK1bLDZ7fl61sKitns5pbZhZEbzXMKzUB8TIQ==
X-Received: by 2002:a7b:c08e:: with SMTP id r14mr1606399wmh.165.1604698647102; 
 Fri, 06 Nov 2020 13:37:27 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 21/23] mtd: nand: raw: arasan-nand-controller: Document
 'anfc_op's 'buf' member
Date: Fri,  6 Nov 2020 21:36:53 +0000
Message-Id: <20201106213655.1838861-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163728_205403_DB25B38A 
X-CRM114-Status: GOOD (  13.43  )
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
 linux-kernel@vger.kernel.org, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Choudary Kalluri <punnaia@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/arasan-nand-controller.c:133: warning: Function parameter or member 'buf' not described in 'anfc_op'

Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Choudary Kalluri <punnaia@xilinx.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index fbb4ea751be8e..549aac00228eb 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -118,6 +118,7 @@
  * @rdy_timeout_ms: Timeout for waits on Ready/Busy pin
  * @len: Data transfer length
  * @read: Data transfer direction from the controller point of view
+ * @buf: Data buffer
  */
 struct anfc_op {
 	u32 pkt_reg;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
