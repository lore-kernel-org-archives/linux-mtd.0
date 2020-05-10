Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55CDC38A2A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 21:50:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7046F20801
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 21:50:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sL1ZBSef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7046F20801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0bqKIM+4Ea8NbO5H2HIz3u+w6KymhasiQkifIdwJDs=; b=sL1ZBSefgbBmZC
	sSh5htnjR/1r2K14aI2k3CGxslMCQ4Sp1MzY2dgRJDwI5uPzmE258krL3Sxs7dtNkezYCzxWVZB9J
	G1ApS8zgyMOfP+86cBgCxM04w/KmBMcb2AHosYh6flGMVVzNqjCYR+bJIXP+KtW1Hjw8XLZc9tNyA
	QVm4gPylS6RKIQrHHzm2Gu4aTxElrVBzJ8lEtOFyCaBYJ0Nw40w31EKu6kNEdBgVZHeCu4dNOpJwQ
	RL9grtmCbPBZVnTl//az62K+qUdfZtRHpr9YpCqbnln8PeH0MNmaHs5m3Maa9TaQqU+oP50SWHygI
	ctLAalKp1rpfIJMWlAAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXtpc-0000op-LR; Sun, 10 May 2020 21:49:56 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXtpa-0000oR-2X
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 21:49:55 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1636E240006;
 Sun, 10 May 2020 21:49:51 +0000 (UTC)
Date: Sun, 10 May 2020 23:49:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 07/19] mtd: rawnand: cafe: Factor out the controller
 initialization logic
Message-ID: <20200510234951.0af919d6@xps13>
In-Reply-To: <20200505101353.1776394-8-boris.brezillon@collabora.com>
References: <20200505101353.1776394-1-boris.brezillon@collabora.com>
 <20200505101353.1776394-8-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_144954_244504_204BFD69 
X-CRM114-Status: UNSURE (   7.24  )
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
Cc: Lubomir Rintel <lkundrak@v3.sk>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Tue,  5 May
2020 12:13:41 +0200:

> The same code is present in the probe and resume path. Let's create
> an init helper to factor that out.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
> Changes in v2:
> * Add R-b/T-b
> * Add a blank line before return statement
> ---


Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
