Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB6BC28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4eQftub8CJwAvcpzSIEqJckFmWuQc8dNg2cuzS+8Wk=; b=v7kLZ2Du+zjifB
	+6n2JRZR2i4XZOUhE66XZ54XJEEHjBZXvZu+WSglqL2jDzBE2wIliMm3Lc9MPDZ5CgWw6k6pVKyvb
	uENCKHdyFjp6kGPamMhzy7aDSY1GD1b8jC9JHaJ5KJcbKi3SEDRhEE4dmJjumyA4AaIZHAIliORH/
	sdjypWpV3WQWDELapF/NgAvHVB5ZfHYsuNC0QQ5WBTfIw66G5/A4ZhH80IFxyKXvUNeQgB5Oyf+Iz
	f8ZCMDndvzY8v+vmHfIYfxgsB9pZhhZCakkVAyufX21vXZQlZGdPZm7f2hBeTY2zX3InTTwxSzLb+
	I4i1iiuCgafm/e5yZzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfv5-00BKpN-DY; Wed, 26 Jan 2022 10:52:55 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfue-00BKhW-4w
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:52:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E96EE6000E;
 Wed, 26 Jan 2022 10:52:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 13/13] spi: mxic: Add support for pipelined ECC
 operations
Date: Wed, 26 Jan 2022 11:52:23 +0100
Message-Id: <20220126105223.882479-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-14-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'493b08141c0086ddb2126179cca7a8a7936b3582'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_025228_364246_32AF7B4E 
X-CRM114-Status: UNSURE (   8.26  )
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

On Tue, 2022-01-04 at 08:36:31 UTC, Miquel Raynal wrote:
> Some SPI-NAND chips do not have a proper on-die ECC engine providing
> error correction/detection. This is particularly an issue on embedded
> devices with limited resources because all the computations must
> happen in software, unless an external hardware engine is provided.
> 
> These external engines are new and can be of two categories: external
> or pipelined. Macronix is providing both, the former being already
> supported. The second, however, is very SoC implementation dependent
> and must be instantiated by the SPI host controller directly.
> 
> An entire subsystem has been contributed to support these engines which
> makes the insertion into another subsystem such as SPI quite
> straightforward without the need for a lot of specific functions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
