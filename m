Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CEDFD7075
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r266R+4uhcFWaDOrj2H0VartEyetAROYuA2tUgBB+oo=; b=aL8bZMy96nM9RZ
	0RpUiIAJ9BMPXRkKrbBOZSWXszpzDwT5FmGaxfCv3Lo7/Lr+t0IzCsPJBzLkMl6uP457UaMhySUux
	EwCiSYjCx65MV9UoXUj4dB4xJp7YsF1wOM606jnijxfILaqDoBz8eEjIL7hw5fIqCMA/uSMB2PN5l
	2sl683g1VWdYkZypXjgv531vWCupYHYCkJNod+ek3OsfYt5VwTZl6ovWlC6cDsnHUr3pmhaSIpUuS
	Et+tVnE/ZryLIXomQIImRBAW7lzwqdw/hq/3RJgtZalBWTo89s0cDVaJArOEEWrlcn0xYWwgZRaA/
	3iw9JVeCzwXKhpNaczcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rwt-000000063pb-1I9c;
	Tue, 17 Mar 2026 10:46:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rwq-000000063ou-3MtG
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:46:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E20140602;
	Tue, 17 Mar 2026 10:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F7AC4CEF7;
	Tue, 17 Mar 2026 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773744412;
	bh=Uq8MOsnX0vw7D4qbSgZdaxA6XqwrVgwPJh9ks+Xt/cI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H/jI2btwUq8W1+hZPjnbcvKoeVdWKPCKc9uj4hsW0CcFBA16QXQVeArhr1/zack8N
	 FwSY5nLK4sCvZnLODsdRNJLIL2OlLB5B8p5w6ik0lERuDTudCdH5dBSBPimVdahPLL
	 czTx35kKhvllwjdUBenMxq+l5/ktDPzdCo8nKohrd5mQ8goi2/k6lDp+HCj86okmoJ
	 o4WEZBwKJaPLa8a/dELx4jFSvPxwqw80X6hOuRd0wmXxulEHq+XYiZuPWelqVut5Ou
	 bV1Cu/pAbOXPyeWn8WeDyok21sL4GH/9gYaiKEX0NiaQLQHw7gTFJ/TxQ5SUFVCW9l
	 YUG6rRLgxtUcw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
In-Reply-To: <20260317102115.321807-1-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Tue, 17 Mar 2026 11:21:15 +0100")
References: <20260317102115.321807-1-miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 10:46:49 +0000
Message-ID: <2vxzjyvad97q.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_034652_863514_9D36C166 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, Mar 17 2026, Miquel Raynal wrote:

> This helper really is just a little helper for internal purposes, and is
> I/O operation oriented, despite its name. It has already been misused
> in commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support"), so
> rename it to clarify its purpose: it is only useful for reads and page
> programs.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

This one is tricky. It won't compile without "mtd: spi-nor: Fix RDCR
controller capability core check". So to take it through spi-nor/next, I
would need to rebase the branch on the -rc in which the RDCR patch [0]
lands.

And while I don't think it is necessary, the history will be a bit
cleaner if mtd/next is also based on that -rc. No strong preferences
about that though.

Does this sound good to you or is there a better way of handling this?

[0] https://lore.kernel.org/linux-mtd/20260317101842.319656-1-miquel.raynal@bootlin.com/T/#u

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
