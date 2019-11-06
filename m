Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAC2C5DF63
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 14:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C08720663
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 14:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZT1/Xhfh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MB1WGmx7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C08720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11jLcy4nSNZUgLVtruEbqOEYy5N7fmNpE11QLLjGDWQ=; b=ZT1/Xhfhqvp9K8
	yWC8uIVOZBBB+BarcwfrMmQUI+N0EgEM3I4Zwp3Fu1GX1M/bvur4FY4H6hNfHhB5mGH1+WteHdRuC
	u7eW9oh5HjLxll9q7rje2CKISRJP2dSbDdyionAskKCbkayXrWdZaykh3h8nYQQ+pu/B1JnA6GSeK
	sSsTqgdifm4Pjgt4QsLNQ7TnqOJdHx3sFjNXZq3CwNDNIKd/dg/RiWgWkzliZdYHDIiZsX03vntOX
	Z3W6Oubva9l8E0uLvUl87D5xrHyVlOgtzRsgMMStKk1qmE0CcicXmFTXkph2UlnNzw+FrkyIK0xWf
	hgPqiKXtHh4AhW5vZnPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSLzC-0004lK-Ie; Wed, 06 Nov 2019 14:08:38 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSLz8-0004kA-7B; Wed, 06 Nov 2019 14:08:36 +0000
Received: by mail-pg1-x542.google.com with SMTP id f19so8117618pgk.11;
 Wed, 06 Nov 2019 06:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xh0YLDess6L96nvkYhuVlivBqcsNSJ5iJO7vqQb2cA8=;
 b=MB1WGmx7LCN3svj1Z32NEMJi+359bYzJH064LJ6eHLnQ5EGZz73rdHSTAmS8xQ/f7k
 hHXH0vlm9SGNPrsvszHnY5l9DNVOqCNOCYD/2BmSijIBSDEsPvO1kwDOOzCflCUtE+C3
 5uWCFCDsGeJ+btYZbhuxZEZGz66MRbWP9PD463v41i9Y1Oi+XQ1otayKg60K6uZh5Gnc
 4DnZXRz5ohRbcR80EUKrbJhjL/yZPXX9+guRIg4XibxuO27z0vcOTmVyl6Kr/4HGMSSS
 /Wpq0gI97R1uFldSR/4Pmm/H3wRa0HUKiXPV/wUp+1WqruYcT72pfSlLfi8NUFXF9/2d
 +GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xh0YLDess6L96nvkYhuVlivBqcsNSJ5iJO7vqQb2cA8=;
 b=JvP/FVKWXWl/Y+rw17tPoFnHDcMRAf042VcVaQZ65xARPVU0BAcgzSOwtRVQT+i3x6
 H/LIdY1/CZGalJadbZ+CFLbTXzCFte/+Q/1sa7WGOk2+LG2cnK7T5x/YXMZhSxtCyim8
 +BicqfAfNeqii8xfEIQ5K+caZuvVmJ7cxAjQPkRHfHqcLecUtRwcSsJQzZw+kCQ8No0r
 G5RpZnASyWTxKtg5GpXmk7SeBTR2SxIb+12DmIUsXDs66OKBaXsnIgEfcBFMlM7AxJy2
 ag6sOyUDNxhvGLO7zuOkswqnFjUdLwPLpMm1dpzBaTS2EJrioUKgghqU8PjOm+z7R06j
 W9Pg==
X-Gm-Message-State: APjAAAX3Woc9UF8PnDCiSN/Xe9mwShKx6AxHPXahWM1qWs3O9YBDT0xA
 hyzMvPxuth4DvnFKx9zGcXI7za+Y
X-Google-Smtp-Source: APXvYqygIEZIViXKClHYSYmolDRBmW+9kj6CnM/P3+aITpIuH+/hhzB9v23qpqr0AtWRs2EX6QzoUw==
X-Received: by 2002:a17:90a:9201:: with SMTP id
 m1mr4135941pjo.74.1573049311958; 
 Wed, 06 Nov 2019 06:08:31 -0800 (PST)
Received: from localhost.localdomain ([2001:19f0:7001:2668:5400:1ff:fe62:2bbd])
 by smtp.gmail.com with ESMTPSA id a16sm4707345pfc.56.2019.11.06.06.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 06:08:26 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: mtk-quadspi: add support for memory-mapped flash
 reading
Date: Wed,  6 Nov 2019 22:07:46 +0800
Message-Id: <20191106140748.13100-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_060834_286934_FB6FD3C5 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Chuanhong Guo <gch981213@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchset adds support for optional memory-mapped flash reading.

BTW: This controller is a ridiculous one which only supports very limited
spi-nor instructions. I can't rework the driver into a spi-mem one because
MTK didn't provide register description in their datasheet and even if they
do provide the documentation, the resulted driver will still be ridiculous
because it'll need to check every supported instructions in support_op and
do execution in one-by-one case in exec_op.

Chuanhong Guo (2):
  mtd: mtk-quadspi: add support for memory-mapped flash reading
  dt-bindings: mtd: mtk-quadspi: update bindings for mmap flash read

 .../devicetree/bindings/mtd/mtk-quadspi.txt   | 21 ++++++++++++++++++-
 drivers/mtd/spi-nor/mtk-quadspi.c             | 11 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
