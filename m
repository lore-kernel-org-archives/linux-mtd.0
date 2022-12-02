Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11BEC4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 17:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzdwaY2QO6DGOgaPmYK6DfywDdeh7xZOU1J7I/IcNxk=; b=A1MZgfQgoV9j4Y
	xyWxiWlqFZWB48J/qgTvJGUX+liVfsmnfeHujmU/0eew4z3t7vZWFmR6eg3CBsi3DXqZjfouc02IX
	5vWytlxxUGjLvUh2M84tvvY83r2IJhaXrlKJhizHLq2ruZUPauRg7gbtAsOLgC2McfZNw6wstk21y
	mO3ZTtTgz1fWMnZvqiBxqECSjlwecpOWS0WbCrTHwJ+pJz2qO1lvyQ7AnhJMILLOUF1Isu34hJIdF
	ks9taR0wwUw/ISHDVHrNcmLZPuJR9Q+N7EbJktViN1whDscTFqqVvmSSXdD3Qi0qrYrmgkT65etqz
	c8go42Vnjwyn6Xr9kVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19iR-000K68-QN; Fri, 02 Dec 2022 17:20:47 +0000
Received: from smtp-out-07.comm2000.it ([212.97.32.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19iG-000K2X-UU; Fri, 02 Dec 2022 17:20:38 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-07.comm2000.it (Postfix) with ESMTPSA id C3F513C31E4;
	Fri,  2 Dec 2022 18:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670001627;
	bh=cH5MF3icabPo56tRMEaFmIjjcbufvHO2gDgZKmAPA40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WOXGC40yBg1RGHn0TkZukuO+oObGCeWvEZufmL/y1R9MkQVnSELBUvHi1GOkN1TTJ
	 WHsnAnAPrHuGtnn73gg8267nxdrTl63oOX96rZgYp6VHy7ZF18fvorhleZO1anDONp
	 vCcocUxN53If5kyWtS+pma3Jxu4Vn3QjEXdlXXuvimBwlmYpvZb3FaZiN6/6fG6oXS
	 nNjWbASVZ5Zb1f+MvO0I7EEt8ndd/LxYvO1m+OiHwa/dwJdlyPo006b+OW2Wgzr13Y
	 Ge93k29r56VwX4VjKDVibsB75025uvbOjwk6HxsHPi16w2VZikBoamXgaQNWpafMBo
	 ZEzwwX106228w==
Date: Fri, 2 Dec 2022 18:20:02 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, Francesco Dolcini <francesco@dolcini.it>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Message-ID: <Y4ozwovVIVhQHHkn@francesco-nb.int.toradex.com>
References: <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
 <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
 <20221202164904.08d750df@xps-13>
 <0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
 <20221202174255.2c1cb2ff@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202174255.2c1cb2ff@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_092037_135349_245FAB1A 
X-CRM114-Status: GOOD (  12.84  )
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

On Fri, Dec 02, 2022 at 05:42:55PM +0100, Miquel Raynal wrote:
> Please also do it with the NAND chip described. If, when the NAND chip
> is described U-Boot tries to create partitions in the controller node,
> then the situation is even worse than I thought. But I believe

It's like that for U-Boot older than v2022.04 ... and IMO we cannot
ignore it.

Said that from the code U-Boot looks into a `partition{}` node only as a
direct child of the nand-controller, if there is a nand-chip in between
the nand-controller{} and the partitions{} it will just ignore it.

I could try to see what it is doing exactly, but I would need a little
bit more time, I just tried changing the DTS as wrote I got a non
bootable system.

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
