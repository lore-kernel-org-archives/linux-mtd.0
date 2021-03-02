Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD626C433E6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:56:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DB4B600EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DB4B600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lqb4dZvnFkkZt9kryIqEwhkG+Gyu+ibb6+xr/zkN6Xc=; b=JUaAoLTteghmnyuUQAKgHWlhg
	RMcoFuCPsdKYg87XzDvyO4t6uyAsjz+WL8oPqrfMkIJkz94CTJUVYEEPxSIokMnEHd3n9mnnZTDh0
	eK8jsKsVyGX+bttzb22OqLTR1owyTX5sxqyDQ5qOEVSR7uxn0LCqtbwDMdxoV2NA69DxvhWhSI9OH
	P9XFfs9f58B2Z3s31kEjQYYDf83pUuxicc8Uhy9bWOCF8oVfdMGd5QHtKbqYzVYRNa3IelCHDeeNm
	nhjXmm5dUd+dHAmUVHtK6zggGDFTSQptQiIluQr/TJvr/GMyMvtxkYWRfZTkiwDPWLQXtj9t6DRKA
	mYFkBbnhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXa6-006JND-7b; Wed, 03 Mar 2021 19:54:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT4T-005IP6-PA
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rnng7bhKuc3TeuXKi6iQ4qw3M7ACUEVc9FrCgeJ4Gk0=; b=gTHs0ScQlgVabeHJcTwrMWCZSS
 2nRMbAiXuob0l7+BnwhEms9QrHP+zcd3rrNUpSAzAWMlJozAafIx4tmR3TgJtV6cMRhDlkJQANIoG
 YIFJO58Z6CtN3KrCvqVXGqIBhFFjrJA9zBQIDfjpC6iB+okvP+m6eqoisuLGDdwdxy4hXnSv9ue/z
 O3abmqacNYJ1U9HwtFEFmNKmDJGocV4hUJDko7RlhwN2v6NfnY904eSrgb2/B0ihR/9phGLekr6DD
 G6dasH9KHR4YEvhCbn6VOoFU1UMqNf9rS9HqwRmOvhND0P80TX8D+s5wTvqHICyFWCcGwgBhSSvnv
 b4q/I2fA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xw-00HSHL-Du
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:47 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1673B1C0003;
 Tue,  2 Mar 2021 16:33:18 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz
Subject: Re: [PATCH v3 8/9] mtd: nand: ecc-bch: Use the public nsteps field
Date: Tue,  2 Mar 2021 17:33:18 +0100
Message-Id: <20210302163318.23777-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-9-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d7756af273389db84c65e2af8de8f4052a9158af
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163347_039847_DA437543 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2021-01-27 at 20:30:19 UTC, Miquel Raynal wrote:
> The software BCH ECC engine stores the nsteps variable in its own
> private structure while it is also exported as a public ECC field.
> 
> Let's get rid of the redundant private one and let's use the
> nand_ecc_context structure when possible.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
