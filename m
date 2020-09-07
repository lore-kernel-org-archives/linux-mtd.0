Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEADC433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:24:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE2620732
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A2fT2n67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE2620732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3zVoy5Ph6gI1R+s8mE+NpzSquz0wYk2j1499ccWSDxM=; b=A2fT2n67rR4wNNaG78wEbBzRp
	yPbzC85/lOq1Hb4EEmhgTT01qA0fMuqftqiLM0oeKuwYjKqVCbNBgrAZiTd7Bn4dGuAGEHhJUFW1c
	Z3takcVNYQzxfw1ydh3tsF1oGFvgUav2/S8DOWBwoTk4iI+ZxD91j+j5sQxqogykMYA0DsOIxF+Bq
	vmwYDk1QwwETThMNDOxyoycsuj/AQTRyb9vmLxqW5/tWDkwSheyaIEJQTAymJ2ycjZKS8vsKWG+f9
	IHlJ2f1A3bBC1dEdwjzRntY/kbCRxpqFp0/1RWZ1Wp0FjpHiJdFfWaZj4HMrjIk660R2dzCfM6gig
	RE4Ika93A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBUo-000307-SV; Mon, 07 Sep 2020 07:23:22 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBUX-0002qc-85
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:23:07 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5C53510000A;
 Mon,  7 Sep 2020 07:23:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, miquel.raynal@bootlin.com,
 boris.brezillon@collabora.com
Subject: Re: [PATCH v5 2/6] mtd: rawnand: atmel: Drop redundant
 nand_read_page_op()
Date: Mon,  7 Sep 2020 09:22:59 +0200
Message-Id: <20200907072259.4078-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200720131356.1579073-3-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 09f4b18a9b0d0316371391d6c887287a911d9a6e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_032305_426258_BDDE8153 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: alexandre.belloni@bootlin.com, linux-mtd@lists.infradead.org,
 ludovic.desroches@microchip.com, nicolas.ferre@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-20 at 13:13:52 UTC, Tudor Ambarus wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The legacy page read path in atmel_hsmc_nand_pmecc_read_pg() issues
> a nand_read_page_op() that's already issued by
> atmel_nand_pmecc_read_pg(). Let's get rid of the unneeded one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
