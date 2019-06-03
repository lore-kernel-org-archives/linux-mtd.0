Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B3FC04AB6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:05:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE8A24A87
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F8P1/WoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AE8A24A87
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw8BkyFY6BhXY0+87ErVU2WCL1tOyL/7nWxdwoYCi3I=; b=F8P1/WoXlbEjva
	HU2cZfhG78mr3wM3Qb7preXoxuuXVBcR0wYN/ClqC79jCRZfNrOTiv+wKVnYS1+HrRGEFXn5xwpZa
	U2kycd5OWPAeKkk86NbJUteWaeZ77zgXnxXdpRBXV06g1S7ay36cOB46wGwyn7m7ZjgAiUcOAOsRe
	le3pN9TeS0T+DpavIvp+kZWv5/ysyjIftct0fZWeNXA25tOL4LCgDNrM6cpzpy6t0uyM3BlChAjs0
	jCUdyOk+oBzXF64nrz37eSb0rWDO68qn1UEn9pKar2FQVRrIwx9GqftmrbuJUDR3GGZNa20FUfesP
	vkjLkyTVSF6vZY5D17cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXhyP-0003F9-SG; Mon, 03 Jun 2019 08:05:41 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXhxa-0000wS-Pf; Mon, 03 Jun 2019 08:05:28 +0000
X-Originating-IP: 90.88.144.139
Received: from localhost.localdomain
 (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D7F63FF81A;
 Mon,  3 Jun 2019 08:04:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v3 2/4] mtd: rawnand: mtk: Improve data sampling timing
 for read cycle
Date: Mon,  3 Jun 2019 10:04:46 +0200
Message-Id: <20190603080446.28858-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190507102541.34341-3-xiaolei.li@mediatek.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 30d9247b69fce5fbeaec67c3401cfa9a848a7d33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_010451_780763_D37A0DA0 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-05-07 at 10:25:39 UTC, Xiaolei Li wrote:
> Currently, we expand RE# low level time by choosing the max value
> between RE# pulse width and RE# access time, and sample data at the
> rising edge of RE#.
> 
> Then, if RE# access time is bigger than RE# pulse width, the real
> read cycle time may be more than NAND SPEC required. This makes
> read performance be worse than that expected.
> 
> This patch improves data sampling timing by calculating RE# low level
> time according to RE# pulse width. If RE# access time is bigger than
> RE# pulse width, then delay sampling data timing.
> 
> The result of contrast test base on MT2712 evaluat board is as follow.
> 
> nand: Micron MT29F16G08ADBCAH4
> nand: 2048 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224
> NFI 2x clock rate: 124800000 HZ.
> 
> Read speed without this patch:
> mtd_speedtest: page read speed is 14012 KiB/s
> mtd_speedtest: 2 page read speed is 14860 KiB/s
> 
> Read speed with this patch:
> mtd_speedtest: page read speed is 18724 KiB/s
> mtd_speedtest: 2 page read speed is 18713 KiB/s
> 
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
