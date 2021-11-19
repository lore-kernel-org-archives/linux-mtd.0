Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A84C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:45:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57346113D
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C57346113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FnxM0JYTAc10Vt7ICtbVIL9yxdbfiLb1EGDrUKJgqY=; b=ThdI253JPl7GfX
	/Z/BMPyE5Z7OkknhBYfM+D4aLkaqDm6CSO4LytMNQcvbxz0tHeBPJtoWgbDBJVBo+FYdcZuZqXmfo
	PCSvd8HYvay6b0Zy9eZs4oWNVdhqkhPyXTYw7CV9RkrOBz4Lv7kCnlrGMimG04IPtpt3+YtjRSNhn
	FfX5ko9dGOQH3knRZIyKUo2o52+ZZOxG+P+8iQcc/XzsqWQw/Dz4iISgYI3i3rPtWSj7zqCAPR5im
	R6ocJVd8ULJC+oyz5krGGFQVM+q9dwUFGkZgfGhwPWZvBLeaHWhd2HppNOLoBpCWG0/ViH2d8Wp4R
	bmr2pm9cvy15c36I2nSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8s6-00BKdq-Cg; Fri, 19 Nov 2021 18:44:26 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8mS-00BJHI-Kr
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:38:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6FBCEFF809;
 Fri, 19 Nov 2021 18:38:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 4/4] mtd: rawnand: fsmc: Fix timing computation
Date: Fri, 19 Nov 2021 19:38:33 +0100
Message-Id: <20211119183833.1402635-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211119150316.43080-5-herve.codina@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bed96b1b5b2c03bc61e0ac0f679c0de36a6f717f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103836_854641_0A0D751D 
X-CRM114-Status: GOOD (  13.82  )
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

On Fri, 2021-11-19 at 15:03:16 UTC, Herve Codina wrote:
> Under certain circumstances, the timing settings calculated by
> the FSMC NAND controller driver were inaccurate.
> These settings led to incorrect data reads or fallback to
> timing mode 0 depending on the NAND chip used.
> 
> The timing computation did not take into account the following
> constraint given in SPEAr3xx reference manual:
>   twait >= tCEA - (tset * TCLK) + TOUTDEL + TINDEL
> 
> Enhance the timings calculation by taking into account this
> additional constraint.
> 
> This change has no impact on slow timing modes such as mode 0.
> Indeed, on mode 0, computed values are the same with and
> without the patch.
> 
> NANDs which previously stayed in mode 0 because of fallback to
> mode 0 can now work at higher speeds and NANDs which were not
> working at all because of the corrupted data work at high
> speeds without troubles.
> 
> Overall improvement on a Micron/MT29F1G08 (flash_speed tool):
>                         mode0       mode3
> eraseblock write speed  3220 KiB/s  4511 KiB/s
> eraseblock read speed   4491 KiB/s  7529 KiB/s
> 
> Fixes: d9fb079571833 ("mtd: nand: fsmc: add support for SDR timings")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
