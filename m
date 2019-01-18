Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C52BC1B0F7
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 21:06:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AABB120449
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 21:06:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eRJ8Ib/M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kc/iWEoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AABB120449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFsDt9LkKYTfZ5Vr+/tbcNmQXEls0RK6LYL3sqO9ALc=; b=eRJ8Ib/M/HhcZ2
	v3iOQG6NInvAg4MSa5R+ZA98zTHVTKA2dPbFERoeaJVvDtmHWdSBEZ4RhqkX/LgfQudbgnPc8rbjp
	gof7293yUR98Z9YLAOafaFSQ8lqJko7pGszPVZkn6qGmLjz9wQc8NYVYUWAIpQAep/pvd3E5XBrp6
	KR0mc1mDp30eATWUuj/8qwaUuqyJ7CsLwFvY4TeuU1Lti9+0S8ILgciUHHO91iRObUjlU+Se97y9y
	8vFjYilhxhhsgkkpNX2dy4ssKgzuxdMbZWc5OiRExRYy9z4K6eyLbPRcfV/4gvgJSRMHHdtJe/w3g
	b3/CVYL1YuFJcHCWcUUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkbLE-00050b-17; Fri, 18 Jan 2019 21:06:16 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkbLB-000502-6E
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 21:06:14 +0000
Received: by mail-lj1-x241.google.com with SMTP id k15-v6so12757476ljc.8
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2019 13:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7jX5zdy+b8YE7tC69x5iiWFVbJ0EmPYf9FF8/dNUZV0=;
 b=Kc/iWEoUpCt2hd+UpbSktEIiuf2h8BtfaPSAyfUun0NiwpgcgI5BOw3TPTRiZBke9X
 Z0NPRLFqZ+uEsKK4Z/dxO8zt8ZG9RRzPukqrD885R/2nSAHVp+/WspnXztdApOP933Tk
 AIYhxAlu25Ia3FqhhQDn9d6ikOAyYUn9R7akc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7jX5zdy+b8YE7tC69x5iiWFVbJ0EmPYf9FF8/dNUZV0=;
 b=r6nWLsGKoUXC1tNCJvSNPkLpsnH54FtZj/IJ424/JSIBtOEi1FYYxue+sHrcNdsTs1
 e5VMjkvhDc6S/PhKD/tk/kyBXNz1zCpDo2T9LWi3+0Y3NOAFt/SL3ro4nphrJXtDYeeW
 CBNvFyuCVz8N+F0LpYIW5YCY079t7YNMcqJ8wJPbvKrphupnbxXi42YUb0zD0pQPf3zU
 Aq/4wPyepyfx9qNyTBmlqLh8sY/HB8A5x1vj9O9ID/oJtWQos1LWpgf+oJZsCGHHSJl3
 cjD0kTUgzW5uHvyrL+j10fzmCyd51StAxoXFwcojnV6uiBQAHvhkYVrrMjrLiWJHZSYQ
 x2jw==
X-Gm-Message-State: AJcUukdcu3XmNGgs6rcF/xzEtH628a+9EPMNCo3JI1NpBl2zA+GrXwdb
 IxhQom68Vjgr9zIKYmXCxXZHEw==
X-Google-Smtp-Source: ALg8bN7iaVCknBoRiGNhqvbW4ixG+J0Cbrqk/ATCRL+BDTMsumXrAr9bdgBvV1/Pcc2sSSevu/ex+w==
X-Received: by 2002:a2e:4218:: with SMTP id
 p24-v6mr12982091lja.58.1547845570980; 
 Fri, 18 Jan 2019 13:06:10 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se. [213.113.123.174])
 by smtp.gmail.com with ESMTPSA id k68-v6sm923993ljb.35.2019.01.18.13.06.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 13:06:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: rawnand: fsmc: Reset NAND timings on resume()
Date: Fri, 18 Jan 2019 22:06:04 +0100
Message-Id: <20190118210604.8231-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_130613_238208_1E37E4E7 
X-CRM114-Status: GOOD (  13.92  )
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

When we go through a suspend/resume cycle the NAND
timings may have been lost so reset the chip.

This hardware will autonomously enable/disable the
chip selects depending on what memory is accessed and
chip selects are not software controlled, so we
only lass chip select "0" for "all chips".

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index c9149a37f8f0..4050843dd35e 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1164,6 +1164,7 @@ static int fsmc_nand_resume(struct device *dev)
 		clk_prepare_enable(host->clk);
 		if (host->dev_timings)
 			fsmc_nand_setup(host, host->dev_timings);
+		nand_reset(&host->nand, 0);
 	}
 
 	return 0;
-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
