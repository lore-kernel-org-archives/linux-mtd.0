Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C5BC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vttz00oH3f3wvVqrq/dxRxkYI3sfG/6uP21j8K1ki4=; b=yKnjz4pzCMQGDa
	1bKq+pogLD0YwrdONZ8tADwmJ74w22+sXYgD0Pn5HR5lBX8cu8cnodTDag4NZvaZZdQ+KM7AM+oG6
	2c8/1Z1hq7AXysWeCJIlRs0+pQK8t/eqQDYSaVWdBqKGAr5/l3gBDT0Ph6hHTooUF2LNt+znwj3RM
	V93G/vQVsNGSX1LSMtwVUWU3eEcbpYM4k5/kQu+IIsCkqqmvyIoVfGAg33iR7wOLz+OMAYRn9Xprb
	AqZXQ385sCmjc737Ni+o1n8k8/GP3wYBdwqGDuLZ+r+guGshfbdRUy0IR53hj9Qsoa5yb5YCGa6qt
	weZoUrZdHmiWDg6KMpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13E4-00FQ9S-48; Fri, 02 Dec 2022 10:25:00 +0000
Received: from smtp-out-08.comm2000.it ([212.97.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13Ds-00FQ5I-QR; Fri, 02 Dec 2022 10:24:50 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id 1C91D426A44;
	Fri,  2 Dec 2022 11:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1669976685;
	bh=8mV1uDAsqGTcFlpWfAUtgES7Hcz7KKv0WrqMDW2T7qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b36p1ywq4DgK//mM/hLiBj8zUn9DFVkoB7fUDAV1aO7kU5sJsSg8eF3LWFGKSxXdO
	 mh18+lf9V9kpq8kwUlqoMGIG/x1K9bNCydfwZ0N8+YNyEnwBbwwiu5KwsKHklrYg3l
	 VJ0ibSh2AOrYORI3fxVmjmfUMfMF1wIZLWKLCv8fkSwJFGFnYu2nDshEyGxbMTWyVk
	 mEpmDR6w6tUcErne+JhKTMRTlYEb5k1rmqVn44T49xVzbzNFwHfARx1wmhNQg8LSxV
	 XpvPW3EMnSbiCH4oQtbny41LOcfN/ZwqyRp4vZFQFuYa1u2h2SBu1lqcsJAqKiX/Zq
	 xodsBO++S8lcw==
Date: Fri, 2 Dec 2022 11:24:29 +0100
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
Message-ID: <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_022449_043997_21CD1265 
X-CRM114-Status: GOOD (  31.05  )
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

On Fri, Dec 02, 2022 at 11:12:43AM +0100, Francesco Dolcini wrote:
> Hello Miquel,
> 
> On Fri, Dec 02, 2022 at 10:14:18AM +0100, Miquel Raynal wrote:
> > francesco@dolcini.it wrote on Fri,  2 Dec 2022 08:19:00 +0100:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > Add a fallback mechanism to handle the case in which #size-cells is set
> > > to <0>. According to the DT binding the nand controller node should have
> > > set it to 0 and this is not compatible with the legacy way of
> > > specifying partitions directly as child nodes of the nand-controller node.
> > 
> > I understand the problem, I understand the fix, but I have to say, I
> > strongly dislike it :) Touching an mtd core driver to fix a single
> > broken use case like that is... problematic, for the least.
> I just noticed it 2 days after this patch was backported to a stable
> kernel, I am just the first one to notice, we are not talking about a single
> use case.
> 
> > I am sorry but if a 6.0 kernel breaks because:
> Not only kernel 6.0 is currently broken. This patch is going to be
> backported to any stable kernel given the fixes tag it has.
> 
> > If you really want to workaround U-Boot, either you revert that patch
> > or you just fix the DT description instead. The parent/child/partitions
> > scheme has been enforced for maybe 5 years now and for a good reason: a
> > NAND controller with partitions does not make _any_ sense. There are
> > plenty of examples out there, imx7-colibri.dtsi has received many
> > updates since its introduction (for the best), so why not this one?
> 
> I can and I will update imx7-colibri.dtsi (patch coming), but is this
> good enough given the kind of boot failure regression this introduce? We
> are going to have old u-boot around that will not work with it, and the

Just another piece of information, support for the partitions node in
U-Boot was added in version v2022.04 [1], we are not talking about ancient
old legacy stuff.

If I add the partitions node as a child of my nand controller, as I was
planning to do and I wrote 10 lines above, I will create a new flavor of
non-booting system with U-Boot older than v2022.04 :-/

U-Boot older than v2022.04 will update the nand controller node never
the less, the partition node will still be there and Linux will use it,
but it will be empty since nobody populate it.

Francesco

[1] commit 36fee2f7621e ("common: fdt_support: add support for "partitions" subnode to fdt_fixup_mtdparts()")

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
