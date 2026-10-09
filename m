Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E0CA6015
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2026 06:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxH3pwi79vhh1pY+hPnggLm/I8/ruIG1aWrDxrEH+ZU=; b=kXpxhg3d1P1SsM
	RvwELNPfQvMMQgvG81wPDrOKzGjjcgdiURPJtCXxWQJRAJC18z2fvkPN+P2L0Ofxbmf9w8ubPkrpl
	OZjgNeBYVcFhwaqx+s0e3hp9c1JpucQ8FtoLSnonJkQ+oxpPFtx8w45tOW25EABdsccc/9GDl1nKU
	t2ubrfsCCiKUiwziAb8Y9Yd60Sl4md9MNecC10RGhzFrzMCco5CanwNSrdtqmwmoU5oLDSCNVvYai
	8Rqyll2RjcQVT2JaCRcugWPjuMdV3M+ZmhjD470+2KVdSPKLbGssan3ctGzrWq519HypH3qY8073Z
	148uvtvWhZ8aW5UC4t5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3og-00000005b2X-42aP;
	Fri, 09 Oct 2026 06:10:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3of-00000005b18-2e9i
	for linux-mtd@lists.infradead.org;
	Fri, 09 Oct 2026 06:10:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 176F460DBA;
	Fri,  9 Oct 2026 06:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E2D1F000FF;
	Fri,  9 Oct 2026 06:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526248;
	bh=iSvppU/VIwgUjLgHLY+2yfkmaTPGx2jQBRc2qY3PfdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Th2wQWgLkUIUbUa9P7OdQoa+4jOz/4lruJgGs8eKOTUwAeX7Q9+hbqCzQSvLztDDJ
	 958bwpn1zjnZQl3RZiLRve68iqMIuohYfMaCj+N9XHF4KT/jGrCi/3A8PH8MWAzHaB
	 0Y7ljKhBHznW/ueF+DDrvJe+lJ1Fi/vlh+4/937ypk0egOiy9yWWuhSXW7F+f3bjKa
	 mTLyQ8yzTOJ5Xw7xUmH73s35FgaspvHsmD/hucDSrVVrv2EoUBv6QcPZmVcPsMLQRN
	 FdrOkdL8/K7MnrsR7/nEaoXiOPrGpzI02QO8+QswkCBovCYp7eFx3enG3qKTg2GBVW
	 rfXgho+3vjqFg==
Date: Fri, 9 Oct 2026 08:10:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] mtd: rawnand: tegra: fix OF node leak in
 tegra_nand_chips_init()
Message-ID: <20261009-zippy-prompt-ringtail-e8fc6c@quoll>
References: <20261008182442.2770036-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261008182442.2770036-1-vulab@iscas.ac.cn>
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


On Fri, 09 Oct 2026 02:24:42 +0800, Haotian Zhang wrote:
> tegra_nand_chips_init() takes an extra reference on the child NAND node
> with of_get_next_child() and passes it to nand_set_flash_node(), which
> only stores the pointer in mtd->dev.of_node. None of the return paths,
> including the successful one, drop that reference, so the device node is
> leaked. The get/put pair performed by the MTD core in add_mtd_device()
> and mtd_release() is balanced and cannot compensate for it.
> 
> Release the reference with of_node_put() right after the node has been
> stored, and route the earlier error paths through an err_put_node label
> so that they release it as well.
> 
> Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
