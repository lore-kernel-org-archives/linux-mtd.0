Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9517C43219
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858BC20679
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSYT5MKg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRXUec85"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858BC20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tmG31woJQUtkKX1sEUq8bkTP3oryr3zTBlPOTNyDCY4=; b=dSYT5MKgAlJKDY
	hUQ++cR0Sg7c0EWKjrS3DZeyxKMuClExF6AjNmfBcPvqXugxR+NwcjjEE9351mCdXBTt/Id1CU9II
	dkFF0wBT61dMO8uwBGwcNlTV2jvtnrhNaAXtdhgtFxtsf+CObr/xq3+B88d3Gf2D/Rkqdlcr89t6H
	IAkD6dD8OEIMjzgz7qzMVHTEJz3SEyBqImWSEiY67yldx686mlSq9VgLXGVZiIaqZ/3SkK99f/T3v
	fyLt4af7hXkz8qq6TgganT7qxeVGZqUw4dAhndT483n2w0eTkDJ/Ilb8ZJ+fJnpSvN+lsRylIc/ef
	cl752bvuv+3Y173HPVKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3vo-0003Oy-DM; Fri, 26 Apr 2019 16:42:36 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3vl-0003O9-FN
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 16:42:34 +0000
Received: by mail-lj1-x242.google.com with SMTP id k8so3499183lja.8
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIYxhFesKlaJKvCRd5GEV8ylksbPoPuDhuxnZyXe+lM=;
 b=lRXUec85QpnTxn4JvXTirbpk3YDLK9pwaQeCnDS4NARagx9m39Zx/hVvr3S2Lmgp/h
 KKOemYgeryLlHNOraH4Ji3Y3ZcIQRR08w4OanwX9C5jhUDewsmch0BNtTX9JTAmvDbyv
 8kGh4NZ6SPHmlE8fUHdc/PmgpaaPSd/4wrDcA+NcET545xPSBK4zoKnRcd5PLCVxb7+2
 Ritnt/Vp+r5wYoz0ZpAqMlesRRnNjpR2jy64HZrFCxk2fkyFWPTj8ets5eJ393V5twJ2
 j07rmJX9gDKEjxlsDCEbMEKTlAOiw4wv4flUmbbp+2ORaTtdApFjPrCFsfVfqJ+sss1M
 SNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIYxhFesKlaJKvCRd5GEV8ylksbPoPuDhuxnZyXe+lM=;
 b=ilbnpniokCOiB9bes0fraXQHYQt6ueFqA8kkTGWfI8yoN5nS+qOkiNHon8quCMSNf8
 JQI6aljuYWaeV5YzIw/F+rATOEk9jsePxywejrTE9gyZb5Ei3ztc3NisN+GPyLWycaRR
 ZmlQoROY/UnUe/cC5QSYMVy0g0W0lKdACZmITa70NmoKQjHRw9bbymsEB0Nh4CPsBDBT
 9S/aPuB01346GJU+b2GaEXmmuBeRS0hZT2BigbSsfPu2BfSRIBISvfl3lNQrBAwhnl93
 2JY0xskkN9dSDwibTM+Yu+rWr5bU2VJgTHE+tXSnd7ixgD3plmBkqpgxmdWfeQojfAn2
 774Q==
X-Gm-Message-State: APjAAAV9bEKJCpG0lgCKGzoq+/lWUdKSQ6hsNpvVs4RmGZCFOCRY/7MH
 aR3944dlQUwhjuS0Ger0dCc=
X-Google-Smtp-Source: APXvYqwnNJiHlf02rN+ACkV4g64q2KKcXUgBUke5zUTcY9Yefu5Am1AfvEZno46Ulb+ciDdly7da6w==
X-Received: by 2002:a2e:978c:: with SMTP id y12mr12706542lji.70.1556296951171; 
 Fri, 26 Apr 2019 09:42:31 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a315:5445:5300:2492:ad61:69f1:23cc])
 by smtp.googlemail.com with ESMTPSA id q11sm5637807lfc.51.2019.04.26.09.42.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 09:42:30 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To: kyungmin.park@samsung.com
Subject: [PATCH 0/5] mtd: onenand/samsung: Add device tree support
Date: Fri, 26 Apr 2019 18:42:19 +0200
Message-Id: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_094233_542911_0D91530D 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchset adds device tree support to Samsung OneNAND driver.
It was tested on Samsung Galaxy S and Samsung Galaxy S Fascinate 4G,
an Samsung S5PV210 based mobile phones.

Tomasz Figa (5):
  mtd: onenand/samsung: Unify resource order for controller variants
  mtd: onenand/samsung: Make sure that bus clock is enabled
  mtd: onenand/samsung: Add device tree support
  dt-binding: mtd: onenand/samsung: Add device tree support
  mtd: onenand/samsung: Set name field of mtd_info struct

 .../bindings/mtd/samsung-onenand.txt          | 46 +++++++++
 drivers/mtd/nand/onenand/samsung.c            | 94 +++++++++++++------
 2 files changed, 113 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onenand.txt

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
