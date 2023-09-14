Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E4CA553E
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 13:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW8eqsYgJtoFmuFuIO1OIteeDxY7EndHSJWrCayV/ME=; b=zhMOv2kQ+1fTE3vOFTBF6Moohx
	XNunAgVK5sIPtHcu5Fw4j9YprZpP3nE1Z9sDQOL4g5+1fRFhKDmt5Zshg+HK6bb/2ospkEMr6ErjU
	BAc77s1qGWOPuL7x2J7oAknBP1KwgtEerNswzKtOkMF2ZyFSk0ChIVMqixfgyrMTFz6FQeI3NnQ/8
	XCbqtqwut6MgcOAl64MmOJxowUFEWWLQgzFFVdpDIf/c7Zz31DqDAU62bEJJisqfvCRCkemyQTfqa
	ldL0TN5syCmO3iNTj2PrldSRNG5RMpdWDVgAFwxxNSCAZpTb96UbvcdE/knxPFJD5RYFpOQI75K6n
	ZaGeAR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmSs-008S4f-1A;
	Thu, 14 Sep 2023 13:33:02 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmSp-008S45-0h
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 13:33:00 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E58C4F84;
	Thu, 14 Sep 2023 15:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1694698375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RF2qkedgoAlrSVTvXCvJ0qPTwTx2s0DX5GrzCTtx8WI=;
	b=zgAxl6P2QDz7zGS3O3jkVwPwIzzSXp66sxgcS+3uylYavsl37ODExKGZzprRQt8cIctr6+
	awTY8lp76lc0UZTeFsUhYySJFCmS3Ow7bM0xzEFX53OR86olfCFOXycgAp7J8NF8J+MxU8
	1UqyJHq47hrjprk5nlruhRlMe2v8eSaXd6mzK/SSxd6flS8D/Y1fINJdHr1IIDrVPviaZ+
	2kkULEYQszv6rWONcnZYHROwOsRj3+I0x0lOJPiVpi3M/WC77C9mLiz11L2yjmcO/aICVK
	KpLzDsiRbEaA9HrC+fEsPC6DHPG+UWUSnZnX+KML7eu/t7nGkPse9+0BkY8Jsw==
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 15:32:54 +0200
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>, linux-spi
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
In-Reply-To: <9bf6cf6f104145080d38c8658000c24b@walle.cc>
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
 <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
 <20230914105937.4af00bf2@xps-13>
 <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
 <20230914111200.6e6832ca@xps-13>
 <CAMuHMdVryt5bTk8HeFMS3NU-4EpQdU3Tf6LiGmGQQ5bVD-Emsg@mail.gmail.com>
 <OS0PR01MB5922B4BF11D1954DFBE2976F86F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUA23VxkK-8CebyqiF=Oe81QZgpEmWmMrMGVd_+BXfsLA@mail.gmail.com>
 <737c6865703b8e294601d86a911691da@walle.cc>
 <OS0PR01MB5922A4F16DE8923373AA5DD886F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <41a960b2a039ab88cb8a6ed6ed21e067@walle.cc>
 <OS0PR01MB5922AED5B1490E251669F45186F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <9bf6cf6f104145080d38c8658000c24b@walle.cc>
Message-ID: <030c666c5284bcbd20f6d09caa8f077f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063259_428905_315D385A 
X-CRM114-Status: UNSURE (   9.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


>> For eg: here Adesto flash requires HI-Z for IO3 pin and Micron flash
>> requires setting "1" for IO3 pin for 4-bit mode to work.
> 
> That is odd. You'd need to ask Micron, but I assume it is because
> IO3 is shared with hold# and reset#. And there is a note "For pin
> configurations that share the DQ3 pin with RESET#, the RESET#
> functionality is disabled in QIO-SPI mode". So I guess the reason
> why they asking for a '1' is because they don't want to reset the
> flash. I'm pretty sure, we don't really support this in linux, so
> you'd probably want to disable that feature, i.e. see Table 7,
> bit 4. You could also come around this by enabling a pull-up on
> that line (assuming the SPI controller 'drives' HiZ during command
> phase).

Oh and I forgot. You probably can do some kind of fixup (where you
set this bit) for this flash in drivers/mtd/spi-nor/micron.c.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
