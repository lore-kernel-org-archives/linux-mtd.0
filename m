Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0331AC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:37:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD2B206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mifp12l2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD2B206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBQbkCboAXRR8VB3p2UYGDabnma9M9IN3HRt55hBbfk=; b=Mifp12l2s3otSG
	qwW8z1OLgm+SSyQJlqeG0SSiDXcuPtvi6veh4eYt24AoZkHw2tJwOGHQwuf3Z7zqaKdyspAa/tSl7
	7I5fIaUYWGETRkb6hnrhuI0r1E6A0U54Lb84n8djfGeKfTnlVBZ7uSvkqXfO1DxtukkgJo04Ikr3c
	36QMX4Gfv/ViDBEqtyqdqZhYiHp3r3tAG/0utASC9mnpfSOhPLAhTugQyWXXreYnJZ02JL6SrZCPv
	sCgZ0DwU/kFDI1Aun+rrcmtW0bD7eMFl9z9Dne4cfofQ8VpXoa1EkoG5xF57asKQ81OEp0ZmMdaIp
	KYK9y+kXaHVJIC+41cLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTgLs-00080h-2n; Wed, 29 Apr 2020 06:37:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTgLp-0007zN-G3
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 06:37:47 +0000
X-Originating-IP: 86.210.146.109
Received: from windsurf.home (lfbn-tou-1-915-109.w86-210.abo.wanadoo.fr
 [86.210.146.109])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A976EFF80C;
 Wed, 29 Apr 2020 06:37:36 +0000 (UTC)
Date: Wed, 29 Apr 2020 08:37:35 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 00/17] mtd: rawnand: cafe: Convert to exec_op() (and more)
Message-ID: <20200429083735.55a80097@windsurf.home>
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_233745_670077_D7964504 
X-CRM114-Status: GOOD (  13.45  )
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
 Richard Weinberger <richard@nod.at>, Lubomir Rintel <lkundrak@v3.sk>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

+Lubomir Rintel in Cc.

On Mon, 27 Apr 2020 10:20:10 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> A bit of context to explain the motivation behind those conversions
> I've been sending for the last couple of weeks. The raw NAND subsystem
> carries a lot of history which makes any rework not only painful, but
> also subject to regressions which we only detect when someone dares to
> update its kernel on one of those ancient HW. While carrying drivers
> for old HW is not a problem per se, carrying ancient and unmaintained
> drivers that are not converted to new APIs is a maintenance burden,
> hence this massive conversion attempt I'm conducting here.
> 
> So here it is, a series converting the CAFE NAND controller driver to
> exec_op(), plus a bunch of minor improvements done along the way.
> I hope I'll find someone to test those changes, but if there's no one
> still owning OLPC HW or no interest in keeping it supported in recent
> kernel versions, we should definitely consider removing the driver
> instead.

Lubomir Rintel (in Cc) has very recently added defconfigs to Buildroot
to support the two OLPC platforms (the Intel based one and the Marvell
MMP based one). I suppose this means he has access to the hardware, so
hopefully he should be able to test these NAND driver changes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
