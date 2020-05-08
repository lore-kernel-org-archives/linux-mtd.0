Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57370C47257
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 10:14:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2875A20A8B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 10:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oEboKIMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2875A20A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJmTNH4GIB81MlNxo1kHBpZSMEhoW7OtETCEr4A+Kc0=; b=oEboKIMxdap/95
	M54ZgW7GuLV4LoZgIcxDqedJn4ygLV8jkerkgoQDPIk678qjEnFyU+w8iEgWAoJ9wPIsWAe2+UFcj
	7MzdXv7gUnJgrsUNOZSROWeKxpXFCZaP1iCvQGBnjCKGUYLwdjkWxqvc6acx9DEMSwxm//UHoCAOw
	wRGT+MfwQ8et8alki3walFXJ1oWVQ4iS80EEaooZ8Lcahpgeg/s3LIj1No+tZqcLRc4nGCrGy6ylP
	tbGYCeEeMHhwI7/VZQ9D/Vg/SiaayqK+f+vHShmfTbaKGZc7jD6aVkm8sNTp/dn5OiNsGUljAOfZW
	yzFK+X8nHDDqF2NCqHdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX014-0000y5-5U; Fri, 08 May 2020 10:14:02 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX010-0000w8-8q; Fri, 08 May 2020 10:13:59 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0476524000E;
 Fri,  8 May 2020 10:13:53 +0000 (UTC)
Date: Fri, 8 May 2020 12:13:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/4] mtd: rawnand: cs553x: Declare controllers instead
 of NAND chips
Message-ID: <20200508121352.2e26a8eb@xps13>
In-Reply-To: <20200501090650.1138200-2-boris.brezillon@collabora.com>
References: <20200501090650.1138200-1-boris.brezillon@collabora.com>
 <20200501090650.1138200-2-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_031358_442554_A4EA7C5E 
X-CRM114-Status: UNSURE (   5.91  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-geode@lists.infradead.org,
 linux-mtd@lists.infradead.org, Andres Salomon <dilinger@queued.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Fri,  1 May
2020 11:06:47 +0200:

> The CS553x companion chip embeds 4 NAND controllers. Declare them as
> NAND controllers instead of NAND chips. That's done in preparation
> of the transition to exec_op().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
