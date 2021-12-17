Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C3FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGyslri0w7bpNr/bicghGyMUChyC2mzQ04PH/A7HrhU=; b=R2ZryMdr5IGcpG
	StOmbX6+A1xZHhuSxkjbYFjqvTizlyBu7/GrCwseEg1qca518WqaBYUUTViHOQaznV+4wUv3xecxB
	ms5LmLm3xto7yX+qj+4je6JQR7R7oq/bjI47yNWFtttv1eKwn93is2CsY2YpcJ84W1Drm4O7RmvwF
	HZl2q52LKiC5dbhIjtVuCnhZM3og1c4Za+Izza5qx13SeQx6sLmFbzGiZhlXPDAPLqtiyZa9iyuWL
	WE39ZQIQdG/pa6aHCe1ixfpdb/Gei+e+ilwAJ2Gc+RjqgrJdX90+674gHKDEaymu0KKDRPmGO/WXt
	oMBunWoGYYWAb8/c/f0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myA98-009PHj-FR; Fri, 17 Dec 2021 10:07:26 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myA94-009PD6-6D
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 10:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639735642; x=1671271642;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X9d6MhpG2tpfvobV17CFhDsN/rl8WE4mQEBS0rQkbno=;
 b=FTF5I5FD1/2xFppaD+N+fj2vbRCRKSe/31vY+3KvUmPJ4tUYDQsysUkj
 ODRwUUvgKhuU3OU2IDwp8E9X0vnmfD1yJOYkYmBIxt4Iih3Loa4vAzwK+
 Sx+Z/A0u3YxerN0tujEksMJA+6ZSZ5kQY3IKv9628KJ38rqcn5tGKJuwJ
 c1DyOtavvCAecLBJz16CFJMimihq2u45z0AErIYrfi+74kNllJh0jyzsa
 MUfSo7+xUBHl8i/LpnR25qjAyeigY3GGoe4suLf5W2JBSxIwOV9bqzxBe
 QOIxvSq11Kl5NFeutqo3Mxbg81vwWPpv8HLyuKDHreQYD796OJV10SgrQ A==;
X-IronPort-AV: E=Sophos;i="5.88,213,1635199200"; d="scan'208";a="21118277"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Dec 2021 11:07:17 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 17 Dec 2021 11:07:17 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 17 Dec 2021 11:07:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639735637; x=1671271637;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X9d6MhpG2tpfvobV17CFhDsN/rl8WE4mQEBS0rQkbno=;
 b=QiC9TfkWZAim4vugM71HNiLynMVtBpWbgxrgbSZK4ptWOcIT+xzBUkC1
 Bl52lrkFfwYjbEJOfbeMYL7qmKSfHE7pQ6bS82MMcHy9hZlzu4chBfB7Y
 qpeZJo2U1iOrA3yFZQ00bTcuRzMYnVNebTvtV/aMFL4+DW2g4fepjLcDL
 S5p70ywiKfzi7cRNPrtiZD4egtv7XssUTjKW5tMdaea/+8A5OkKnuLXeM
 c4pMbAWEuB0Hu4GylJQLhsKb+G34I7rvX08YLTcDn+qlhBeoa8458udAM
 7Qpq8p6JNKYzSBsxM/BBxXW8hV6HImC7kaozqLN0i1/YqGChKLehhQj5y g==;
X-IronPort-AV: E=Sophos;i="5.88,213,1635199200"; d="scan'208";a="21118276"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Dec 2021 11:07:17 +0100
Received: from schifferm-ubuntu (SCHIFFERM-M2.tq-net.de [10.121.201.15])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 5C9C0280065;
 Fri, 17 Dec 2021 11:07:17 +0100 (CET)
Message-ID: <fd52c394b8c5f727b04166ca29e893baa940e2a5.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: micron-st: make
 mt25ql02g/mt25qu02g match more specific, add 4B opcodes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Fri, 17 Dec 2021 11:07:15 +0100
In-Reply-To: <20211216185254.pt3quvb4wkzou6wh@ti.com>
References: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
 <20211216185254.pt3quvb4wkzou6wh@ti.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_020722_600024_17B31467 
X-CRM114-Status: GOOD (  23.22  )
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

On Fri, 2021-12-17 at 00:22 +0530, Pratyush Yadav wrote:
> Hi Matthias,
> 
> On 07/10/21 02:08PM, Matthias Schiffer wrote:
> > Change the mt25ql02g/mt25qu02g entries to include
> > SPI_NOR_4B_OPCODES. In
> > addition, the SPI_NOR_DUAL_READ flag is added to mt25ql02g; this
> > seems
> > to have been an accidental omission, as mt25ql02g and mt25qu02g
> > should
> > support the same features.
> 
> The way flags are specified are changed a bit. See [0]. Please re-
> roll 
> your patch to use the new flag types. If this flash supports SFDP
> you 
> should ideally just need to set the sfdp flag to true and the core 
> should take care of the rest. Test reports with the new changes would
> be 
> much appreciated :-)

Will do. Is there an easy way to check which features the kernel
detected from the SFDP with the new code?


> 
> > In addition, the entries are made more specific by matching on the
> > mt25q
> > extended ID, like it is already done for the smaller n25q
> > derivatives.
> > It is unclear whether n25q derivatives with 2Gbit exist that do not
> > support 4B opcodes (like it is the case for sizes up to 512MBit),
> > so we
> > do not have a match for such variants anymore (as we wouldn't even
> > know
> > how to name such hypothetical models).
> 
> Sounds good to me.
> 
> > The changes were tested with a mt25qu01g, which should support the
> > same
> > features as the mt25ql02g/mt25qu02g.
> > 
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> > >
> > ---
> > 
> 
> [0] 
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=275622&state=%2A&archive=both
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
