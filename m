Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A61C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 12:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJM6wR2QeVb1S6qtd1XJxoZEMCTmqfCGt3F43IRd6JY=; b=PHw9juZ9Z1kHhQ
	8dlgp5whQV1iSBBKBCo3pb0APPhIwu+X+W4iq8wi2OF56LcubdC/rMHGnPRXZ5qFUBMqwR7V5u0H/
	DGCMYDeYeYiNyMth//WF2InsMIIQjd2ia1ScsFBVOJsbdEqO8SfUC/5MorDA8VD3k6uR5SrQXGj7F
	DfO0JYElnLa/H5hRrPaSVkJbIX56oFy1N5Fwmd+G1wM+Q87FASvgEu/bXES1WTJ6Jyw2vo4Bz2aMX
	k1bPK9wWTVKACNLtxvtE93LCiNLCmMsiiErMWlYJKvh/V2viPybMolFFWm0k8WWma80hscDAtk/PI
	xFLt0ictrH/iVZ14mSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15OL-00GPO5-Ac; Fri, 02 Dec 2022 12:43:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15O8-00GPJf-HD; Fri, 02 Dec 2022 12:43:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D34E622A8;
	Fri,  2 Dec 2022 12:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBE1C433D6;
	Fri,  2 Dec 2022 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669985011;
	bh=SlPWDsDwwQu2Oj8FLpJROoW39Zgawt2f5E5M5aku0BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jpy1DcdVemi6pmnKy8RCnvkm0is357EOivfdWR/gvZ6euYHvyFpUKK/umSAULfr4C
	 Bhz15gdd9jivBlfjFlpoThRIpXN+W780s8/J08nb+hzyHNPu9TE/MXHUK0MpCrljCC
	 +7HOSP9STmSd9NKyNMD2oTSFOrtipyBHVR23+HLc=
Date: Fri, 2 Dec 2022 13:43:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y4ny7h5Q7pIpo8ZP@kroah.com>
References: <20221202071900.1143950-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202071900.1143950-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_044332_623402_5458D59E 
X-CRM114-Status: GOOD (  15.22  )
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

On Fri, Dec 02, 2022 at 08:19:00AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add a fallback mechanism to handle the case in which #size-cells is set
> to <0>. According to the DT binding the nand controller node should have
> set it to 0 and this is not compatible with the legacy way of
> specifying partitions directly as child nodes of the nand-controller node.
> 
> This fixes a boot failure on colibri-imx7 and potentially other boards.
> 
> Cc: stable@vger.kernel.org
> Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/mtd/parsers/ofpart_core.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
