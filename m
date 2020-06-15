Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7FCC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 09:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2930220663
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 09:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dzf+dWBj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2930220663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEiEBolH0wQ92gHStyEYKJ8W6lqkICFTtUwOLCFCRD0=; b=dzf+dWBja3L+od
	q7cfjwA9LCCoiEsYOHB8DGM0uniIHZ72E82B1pJDRjI1mIivuY8qEmOwaoHehQN9YGP7hKeYHhPjl
	gXUBlfSkEm1P9KQgE7A+gzK1XJnBGMN5fLPoqZYhvE8imfODRmaxZej8mw7aXgxcjJeQUTOKd+bPp
	jJLqOeIyavlXe0toN4vydbzNmH0J576IRNTkmJpogbiKaj0qJHqhITNa+sEnkFFLiRGieYJmq7Uij
	CQbpi8cA7OZGk/rg660bFSstNStqLA2hOFlM77NZUQvbyLnbIuh6vRO1JgV6pU4JFjKz9JRPsXH55
	wKEXc2IhHxQL4ANXpyBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkkz1-0005zx-56; Mon, 15 Jun 2020 09:00:47 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkkyJ-00033q-13
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 09:00:05 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E44591C0011;
 Mon, 15 Jun 2020 08:59:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, peter.ujfalusi@ti.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 1/2] mtd: rawnand: qcom: avoid write to unavailable
 register
Date: Mon, 15 Jun 2020 10:59:57 +0200
Message-Id: <20200615085957.22454-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1591948696-16015-2-git-send-email-sivaprak@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d8b6e4b4414e4c72e0d7a9964ef79bd9cd5ae046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_020003_255936_51189872 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-12 at 07:58:15 UTC, Sivaprakash Murugesan wrote:
> SFLASHC_BURST_CFG is only available on older ipq nand platforms, this
> register has been removed when the NAND controller is moved as part of qpic
> controller.
> 
> Avoid writing this register on devices which are based on qpic NAND
> controller.
> 
> Fixes: dce84760 (mtd: nand: qcom: Support for IPQ8074 QPIC NAND controller)
> Cc: stable@vger.kernel.org
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
