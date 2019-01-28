Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FF4C282CD
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4515C21738
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 13:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dmKZm106";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FweaNnuX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4515C21738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tZoptBwU3SUIc1NXJwZhcyvMhB0i9dR+gEmt8Emd3h4=; b=dmKZm106udhISc
	w7RzPfQBlkNLpLvXdG8aDiHYYfs93QHzTsG/eva0khXWau2bldyjEFxQyoDuRBCT33sMvk4zCVCz0
	GYXtr6+DGACxyZdfiw1b/VObZjAvP/go+7zLs95t1I110m24frL0AGRuCybsg+CcC2Ida8D9R9wS6
	NTduM+6xv25MAs63EhDEcE1VIb786d3FciqPaivU+zXnisdvKu8eMSAFE311yrSuu5IrCGvKTukpj
	7VXPtFuPXTKEGxnQ3GVA+geIL0+2Jx+f6nk9h3WXRUyQ6zQGzdeUlEJxsB0R/0jgCm6DEI75PbsXA
	TqqH+Ps34Q5wQlmvWnLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7NT-0008Pd-7t; Mon, 28 Jan 2019 13:55:07 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7NM-0007lX-Sa
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 13:55:04 +0000
Received: by mail-lf1-x144.google.com with SMTP id l10so11868396lfh.9
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2019 05:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nx6BIgGh6gFp4r9L8V46UpEnqC79VehFFxJn4HnWerg=;
 b=FweaNnuXJ0Lpf3iWMOZh/rtcJbJ47ANxVNntf0X/3gIn6fwHKRifmCcHp6gp+JaD9t
 0v5/eGgMenaUAh0ewIOjMKZ/Kws8yyJ6ydyLPfdbW2RH+klCo8GuVh7YvWkIZbhOLg/E
 Vvz+szaOUry1OcFU0/I3YcJchLQWR+L6Lonxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nx6BIgGh6gFp4r9L8V46UpEnqC79VehFFxJn4HnWerg=;
 b=jRg+R+U+jAE6k3knKG3xePdtwlDLFjCOns1tQ7wB5pCUwG0dN41BkY1YARdAIyJ/R1
 qHzaGaVmA4DdkZCxKRbCFgQvgiTJpwdGL1m3nzTXQ7+wzUIxGGX8YK5FgZyvYN02rgwg
 MA2sH7gtOaB6lOkjXZRUebrgPkAUJgvtJcB5y0vNNKJti37u0YxeJ9Hbf454braqnsoi
 ors6n9IfPN6hulu5A1CVzTyOF7vt1ixvhCOiaUwMl9bLGw9duOi3MtSEj4uJ5K8wGuPn
 VjhLzbbuTgb/e5OpHXMsPP/k0B0eQj/R39n+UmeSz6Fz4ymu6WdmtT2qOFzldraQsNd9
 shmQ==
X-Gm-Message-State: AJcUukesE0Q9RpmgVtxJcHI3meVcK5pPFIbv1kE6U3gql6gTFcQd3scL
 wsA/EUxu5KkRhR9FjOxoW44o8+cSIrI=
X-Google-Smtp-Source: ALg8bN7Y2nY3tXMd3r+/Fo0U7O/l/6wAy24bhPXR3AZanw+KudOvxJvBYHcy3kUb4Dm6CCtWUzFH9A==
X-Received: by 2002:a19:d5:: with SMTP id 204mr17781496lfa.116.1548683697395; 
 Mon, 28 Jan 2019 05:54:57 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id a2-v6sm3050503lji.13.2019.01.28.05.54.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 05:54:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] mtd: afs: Support AFSv2 parsing
Date: Mon, 28 Jan 2019 14:54:43 +0100
Message-Id: <20190128135449.15555-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_055500_929973_2309BF87 
X-CRM114-Status: GOOD (  13.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The later versions of the ARM reference designs use
AFSv2 with a new type of firmware header than in the
v1 version found in earlier versions.

Extend the AFS partition parser to suppoer AFSv2.

This is based on the earlier patch set moving the
parser down to the parsers folder and adding device
tree probing, so it should be applied only after
that series.

Linus Walleij (6):
  mtd: afs: simplify partition parsing
  mtd: afs: simplify partition detection
  mtd: factor out v1 partition parsing
  mtd: afs: factor footer parsing into the v1 part parsing
  mtd: afs: factor the IIS read into partition parser
  mtd: afs: add v2 partition parsing

 drivers/mtd/parsers/afs.c | 369 ++++++++++++++++++++++++++------------
 1 file changed, 253 insertions(+), 116 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
