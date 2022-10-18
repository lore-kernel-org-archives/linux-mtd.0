Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339D8C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 08:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgoL0/qIuqvFTTqoPiBucdgzdRNhsqjJmpNBNnE8x8Q=; b=KoccfHAikqbb7e
	8p0X9YlHkPzcE7QwElWUlzx983egleeVzqsyK7+8jBQN7039al8mlIVxOFSizMNBpeUIwHIer9LwP
	9Qom+IQlKvGuM2RJBogn7TVlQsxYZIWWISfinh7LHhuXX/IwEA4dxViA5gipN8mlS1ndwlTif16oC
	zfLloCOAecJmGiKxjp69FMi2+VcQUcjTuWBwcIww2a9Yoxz70CPz5aE+b8TEDd+1kbQVxZx3/eBMW
	VBjfRClZvdz12dfAnQySD+2A0xvFq3KL/meRoBAitCr8JY2m3Qz8xFgNFdO8ESf0enakL/tKSujcv
	FQot9a8uJ9L5tubYKuLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhn0-004LzQ-NX; Tue, 18 Oct 2022 08:17:30 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhmx-004LxT-Gc
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 08:17:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 74B61E000B;
	Tue, 18 Oct 2022 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666081044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5V9f9BXXjHeOCNMLW0/zzA/e14aB2qPxUuhItLAz1h8=;
	b=Cx4cTIay0vM9R50ZjgXNJzr2Z0egqV2h1iqgqHSsaudrMkhYf+LafjP5HilFYztxtZBC8r
	ByfmKCGeztn0Hb5ntIqknxElRcRavriKBGI+6s7n1rTMamProQu/g23wRyWIbA08ZU7F04
	MDRacUcYLQKD6ea/o0W7zQeVgwHeUw/n9JGqzfDQjJj9fJRDemPCKXqHcJ7tmObMFh8PNZ
	d36NhbYkHZ1UvlNBmPno/quHK2SvnfjKlUM5e7wiNx0GSpeMUPYx6/wxDjDNfzfEOd3/K+
	46k0MZxwsjPEqhpCqswqBCjCihI4GLXK6mYzXfoF8J78jyGX+igBywayN8KMUg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <michael@walle.cc>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Hongyu Ning <hongyu.ning@intel.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Date: Tue, 18 Oct 2022 10:17:19 +0200
Message-Id: <20221018081719.314385-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'69d04ca999499bccb6ca849fa2bfc5e6448f7233'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_011727_727134_D140162F 
X-CRM114-Status: UNSURE (   8.28  )
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

On Fri, 2022-09-23 at 09:34:41 UTC, Mika Westerberg wrote:
> The Intel SPI-NOR controller does not support the 4-byte address opcode
> so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
> chip probe fail like this:
> 
>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> 
> Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
> Return error code from set_4byte_addr_mode()") it worked just fine.
> 
> Fix this by ignoring -ENOTSUPP in spi_nor_init().
> 
> Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
> Cc: stable@vger.kernel.org
> Reported-by: Hongyu Ning <hongyu.ning@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
