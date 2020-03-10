Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCEAC10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:44:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A89422522
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMf2M/M/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A89422522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkI+4qZiGpyQ+/TzA7WbRzrpD9p5bqzsFc69lM47FOM=; b=oMf2M/M/mT/7E7
	dXr3BHVT7zCEL3JJTfmC9ymhdgPT+bt0jGhIwtJdHq8tPeYDr1wX9neiWbw3J5ZuBeuUfW+c6OQIG
	g+FvI479+EBGsR+pVvS9vtsO2zQZMExu87V4ih2Wskae8m3tS1tpJLSwZqRGN5lrDAbWm6rN5V6fe
	9e8xWYu1IZrvK1riDB658p8HXUv6+rQD+bNMlfTYrBkfVCey5VWcCOioZQWSifyHWU9OmfWLXMbaH
	8f+3HZJswCjvcL0zOZHtS6rhS1FYyqX2h+7rLfTfkcT47bHHoiosz+Eb1AR7kinJ2IL5Wpw+iT2I3
	Yl1055b0aGrpKX3nWvRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjs1-0002Pz-A5; Tue, 10 Mar 2020 18:44:49 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjgu-00062y-OZ; Tue, 10 Mar 2020 18:33:22 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0BA9F240003;
 Tue, 10 Mar 2020 18:33:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [RFC PATCH 03/14] ARM: OMAP1: ams-delta: Provide board specific
 partition info
Date: Tue, 10 Mar 2020 19:33:17 +0100
Message-Id: <20200310183317.19713-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212003929.6682-4-jmkrzyszt@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 38c30b3c96a572926346b7c5221fb3953bfb0d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_113320_956648_A9DF1750 
X-CRM114-Status: UNSURE (   5.50  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-02-12 at 00:39:18 UTC, Janusz Krzysztofik wrote:
> Now as the Amstrad Delta NAND driver supports fetching information on
> MTD partitions from device platform data, add partition info to the
> NAND device configuration.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Acked-by: Tony Lindgren <tony@atomide.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
