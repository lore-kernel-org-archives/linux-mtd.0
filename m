Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD219C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/R8WpMc8x4ME6x6vwGwsYc+OVkqHiUxX3bv2M1piJY=; b=bbnQCIkIC46zbP
	/cPpNzAb7s9HujwFfZggsircYN+m+yOtZWuDa32rmc+C23DerT7FkvbuG4771QaMBl6p5vaLSMGUe
	AoVRc/eFnIIkBL5/otU1zvN/cLBY72kduIEFTuMlEZabiCSRoCjlml3oK1scqhAcoFGSVF8uBPVIO
	n25gz7esPHSa1WGJWI/ywH7pQy3koA+JscX1Wu8fH/9XfOVJ9pBLxgcigra+4SUpvKF4cl9HezwX2
	um4CSev94BRRL99SjgSmBxrLv/2ADQmBq5JRdWlHP7Tt3Bqa1+bvIlLsFTzaOBFu1NyqqDs3k7zsX
	mFLY37erFFjzSvRzIfOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbIN6-00DuuI-8o; Mon, 04 Apr 2022 08:47:36 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIMl-00Duf8-ID
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:47:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 416E7C0009;
 Mon,  4 Apr 2022 08:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649062034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fg1Ah0caYm3QrONoHGsl/cEw07odqeM6ZNg7OgLAPxA=;
 b=dA4RhdYWv/SyV2FUWmUjdJf1mfWtcNwwg5ecX4vSjZ+hQ7Mazmag3XjWa1+V4d/0kwZ97r
 0sGqUbcmNF/wEMXtfQy0Jhy8SHhwuOasJA4r3r3EwCrIyTfeb2qoOMFdG6JYLNgV6szzhi
 6XOOqWbcJCxP77ONEEuXlC4xrAq5vuA3c6gMf87Shf/3c0nioWLi3g6IQv7HMtdKqgpCiJ
 T/FeJmmNRl+fZ3cMWDxHworWXylXbDHSqX8hwbv7dSlXoOv93NWVSkE7qKpTk9ZuomTxhX
 7pXUS1EaHzRvEu629Sf1euCP53O6mtGn8yn6/LRfOWIsxVz8UaErtm/hkgxrPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 4/5] mtd: spinand: gigadevice: add support for GD5F{2,
 4}GQ5xExxG
Date: Mon,  4 Apr 2022 10:47:12 +0200
Message-Id: <20220404084712.1202351-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220320100001.247905-5-gch981213@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'194ec04b3a9e7fa97d1fbef296410631bc3cf1c8'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014715_791784_6E6C3A3B 
X-CRM114-Status: UNSURE (   5.98  )
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

On Sun, 2022-03-20 at 10:00:00 UTC, Chuanhong Guo wrote:
> Add support for:
>  GD5F2GQ5{U,R}ExxG
>  GD5F4GQ6{U,R}ExxG
> 
> These chips uses 4 dummy bytes for quad io and 2 dummy bytes for dual io.
> Besides that and memory layout, they are identical to their 1G variant.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
