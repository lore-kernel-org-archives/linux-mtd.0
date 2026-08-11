Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E4BC5AD7B
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GGlXDbPjXAVRG+P0SEaSf7m+bOlsi/29Mr3fUccFY0=; b=yTdJjCMN4sR5rH
	0i96Wn7WmKK9fqIi0FydtRHVH2MyaauA6K9WEob7+z5eApQClouSfl3k7cS8STCTYlXSHb24nQjcM
	g/QMrTZ85pn1TMZFpoZolz9plAUuGeEUT1lbESG2G3P0EoueV8sYMEvLRs+0CFwOhVtjjw8oKuNcn
	E7vIWoK2z6zU7tv7pg7eJwHtLTrFODixZEV33c8K7eDSv/IRy7QGGNgYXh7yiR5XDk6zprPtJ1NFZ
	Bvevxuqexzzp2Qop0DJljUIfTWc0t3Tzqd38ejthiGJdw+xtCU4QBt2UFHlVKfG74HwM2yzsrBbEd
	xqV3i0UdqIAarNwQjIpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1P-0000000DQJd-1CIO;
	Tue, 11 Aug 2026 06:31:35 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1L-0000000DQHK-3L49
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:31:33 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 74857116;
	Tue, 11 Aug 2026 08:31:18 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 11 Aug 2026 08:31:18 +0200
Message-Id: <DKLWJGG9XFFT.26IGJEZPPYFGX@kernel.org>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Add support for MX25L12833F and
 MX25L12845G
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alvinzhou@mxic.com.tw>, "Cheng Ming Lin" <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260605084837.1875896-1-linchengming884@gmail.com>
 <20260605084837.1875896-2-linchengming884@gmail.com>
In-Reply-To: <20260605084837.1875896-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_233131_983556_3DB15C6D 
X-CRM114-Status: UNSURE (   9.56  )
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

On Fri Jun 5, 2026 at 10:48 AM CEST, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> Add support for Macronix MX25L12833F and MX25L12845G SPI NOR flashes.
> These parts share the same JEDEC ID (0xc2, 0x20, 0x18) as the legacy
> MX25L12805D.
>
> The newer flashes support SFDP and 1-4-4 Page Program in 3-byte address
> mode, but this 4PP capability is not defined in their SFDP tables.
> Conversely, the legacy MX25L12805D lacks SFDP support entirely and does
> not support 4PP.
>
> To safely enable 4PP for the newer flashes without breaking the legacy
> part, introduce a post_sfdp fixup. Since the legacy MX25L12805D does
> not support SFDP, it falls back to static parameters and will never
> execute the post_sfdp hook. The newer flashes will successfully parse
> the SFDP, trigger the hook, and safely append the SNOR_HWCAPS_PP_1_4_4
> capability.
>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Nice!

Reviewed-by: Michael Walle <mwalle@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
