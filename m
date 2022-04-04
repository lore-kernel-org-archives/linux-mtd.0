Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37221C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAbgpri+Z90HzvaVj8F7SQTCEbM+2wpWCZVBkYxpbf8=; b=vbEnOyJ6C7kknx
	ZBqEiRyqh83aiR4AR+eWcNNW8eZQ8vQ94YrmdrhpW7VZI/Kr01PufLVyTZfDmu9unHTPMgHl3D/zu
	BP1gVvlUzX5ZB2cJD2I+mttAu5SoEuLZBnSP14uwWT8OAjuEyCXvOYdF+TbykxLrmN5kR9o27el+d
	OVIbl5akmKJocJ+FT0shNM6D4ReqUm9NVYrUOdBq2pIK90+N0LI70Egz2c3eQ33A/5ZLHS7YcVu4f
	W26z3O0SP14DI8v8Ykiq7E7tiry4R+JSvuEGEwS4Ya357vzOGT0MWI9N39ciHZPh/yMokaQc4NIRy
	gp4pvc05LFi07UFwX3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbIMq-00Dujq-7j; Mon, 04 Apr 2022 08:47:20 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIMk-00DucJ-GL
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:47:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FF51C000B;
 Mon,  4 Apr 2022 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649062030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYj0xUbR/390/lWkvin+TtsUFeDx/rVngOIwhFcGEg4=;
 b=UasxRTe509xU/K1YhL3DoCA7n6MSOjOI+4FkVLF/VrLLyNZ7VRZHMl/s1oSzm2LSwwCMmM
 uPFqVnYH4jDMGh/rTQLZjljXYDc2nljmbR1HlKPpGkhd9Y2H/bIkoeUK0pOxvcV+xVLqN9
 2HSe4gQrCW4v1XevCkzIOpQoxoDEmJgYgT6FYDke80GDjvlO8hL6SnS71xoNvMMFmDa6WA
 3wwFZx6gk7ebSpfbAWrHsI5nIVc2Amp4Uz/55vLdejIRhkMuTntLrJwB4uBCg2d04vK03K
 XRdQvU8JSN6TuCCyuTf1JTeJsmt1WViu06QTo9tvW3a0F+ent829GrZ3mqO+xw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 5/5] mtd: spinand: gigadevice: add support for
 GD5FxGM7xExxG
Date: Mon,  4 Apr 2022 10:47:07 +0200
Message-Id: <20220404084707.1202272-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220320100001.247905-6-gch981213@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'54647cd003c08b714474a5b599a147ec6a160486'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014714_743999_68D8DEEC 
X-CRM114-Status: UNSURE (   8.30  )
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

On Sun, 2022-03-20 at 10:00:01 UTC, Chuanhong Guo wrote:
> Add support for:
>  GD5F{1,2}GM7{U,R}ExxG
>  GD5F4GM8{U,R}ExxG
> 
> These are new 27nm counterparts for the GD5FxGQ4 chips from GigaDevice
> with 8b/512b on-die ECC capability.
> These chips (and currently supported GD5FxGQ5 chips) have QIO DTR
> instruction for reading page cache. It isn't added in this patch because
> I don't have a DTR spi controller for testing.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
