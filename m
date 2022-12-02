Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F25C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR7ZQyBbnSRxb1K6A95W918vUbJ39/IXtyQvtA8cnJU=; b=ZzeqRyvsudydof
	UImiugRxNk+AzVcIATbcAgf1MiyE6DvOum2ajcnKaNrC8bfceHDfBV5CICPk2CmzPeOeHzN0RUSQ7
	KASqtYqt+XP5J8b/jBR30INAoMjoltuGvqdudLF+w0IVeK2ww2Nhv/eg9f/zE/w+IcmvqIa5jfj3v
	SLbWBPY6D1Fvry6v2Esn1H27kj1uiJ6tPK3/zJXxn/+rRF3vWfRnRd5BSjwRw2N3rWVT8u51jqOjZ
	OU0lK6ezTWus0qBtt1vEIYL/QhEFmKuqi07BDPXJI3bYaRahBZpsOLBKPkuIWnUsXNF0Fpq5mg4z6
	QjtF+BsQb6SrmhEGdwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p132p-00FLUc-Ob; Fri, 02 Dec 2022 10:13:23 +0000
Received: from smtp-out-05.comm2000.it ([212.97.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p132f-00FLRJ-Bl; Fri, 02 Dec 2022 10:13:14 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-05.comm2000.it (Postfix) with ESMTPSA id 8965482630A;
	Fri,  2 Dec 2022 11:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1669975984;
	bh=EhXjLytaNloC3jO1CJxW82NXsFq0S8qD5JKyjHxWInE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hd0Ck2QDAmK4PlJ0kTMREObFocUpZZJ82Uv8R3IttXT8QzAVkT8Dl77W+TyA+KlBM
	 LTzWsTyyOk8IqQ5Ty0ohGwdqt89z6+p91dIYeAUHl4EpYTiqCc5cnGNl/kuFGBOBMT
	 IpjTGSJXPhJeQNNjTUE1tWEfSpkpBqMVISDOy/geQ0kkml++igPFEaz5iIoodtk6Sc
	 Pf5DzGq+zMENYBiodvZyE4E4M1ReiuyAM+Qopo+0CR0GDJjfmR8LDoPSVQqRiuIACH
	 2j5YaRKGO3x92iXsY/KGIDwBfuGhDf6TRw3gTS7z8HLRTFCOEnQ3QUBU6x3IQuWQnu
	 b1/VXmEtMqB+w==
Date: Fri, 2 Dec 2022 11:12:43 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202101418.6b4b3711@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_021313_587489_2C6EB4B8 
X-CRM114-Status: GOOD (  24.46  )
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

Hello Miquel,

On Fri, Dec 02, 2022 at 10:14:18AM +0100, Miquel Raynal wrote:
> francesco@dolcini.it wrote on Fri,  2 Dec 2022 08:19:00 +0100:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add a fallback mechanism to handle the case in which #size-cells is set
> > to <0>. According to the DT binding the nand controller node should have
> > set it to 0 and this is not compatible with the legacy way of
> > specifying partitions directly as child nodes of the nand-controller node.
> 
> I understand the problem, I understand the fix, but I have to say, I
> strongly dislike it :) Touching an mtd core driver to fix a single
> broken use case like that is... problematic, for the least.
I just noticed it 2 days after this patch was backported to a stable
kernel, I am just the first one to notice, we are not talking about a single
use case.

> I am sorry but if a 6.0 kernel breaks because:
Not only kernel 6.0 is currently broken. This patch is going to be
backported to any stable kernel given the fixes tag it has.

> If you really want to workaround U-Boot, either you revert that patch
> or you just fix the DT description instead. The parent/child/partitions
> scheme has been enforced for maybe 5 years now and for a good reason: a
> NAND controller with partitions does not make _any_ sense. There are
> plenty of examples out there, imx7-colibri.dtsi has received many
> updates since its introduction (for the best), so why not this one?

I can and I will update imx7-colibri.dtsi (patch coming), but is this
good enough given the kind of boot failure regression this introduce? We
are going to have old u-boot around that will not work with it, and the
reality is that there are tons of reasons why people do update the linux
kernel and dts everyday, but never ever update the bootloader.

We cannot tell
  "All users of the XXX kernel series must upgrade."
and at the same time introduce a regression that break the boot and
ignore it.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
