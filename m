Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C1EBFD38
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYnaLp+vMFg0Mmd/1Jz9KSgEumI9t4H9RI09XBEHDEM=; b=kBVFzgwIybqtSM
	VrnTui2PofI/Imnrbwn9vcdNhHFS4Rm2f/y70ZrSuC0aeziXFAsyaq3qJDoSxT3yQrIlxvd3DZiBA
	EMkaneMBDKcp7kHhzZvGUC3AFZZVbEzj9nyqnAePirDgVaQi5vBh5FxsmhgiX39FCz8lZaU+RrrHc
	Lwa9rOifhJ9WnRuMk2cVp4vaxy89Tk1xZpeWf+Q/QR9+lEMLODfHDQn+ouVNrhFtKBsWY5d+qpYIT
	3XE8vkByaFyTG1jzbqyd2rm8boQGgX2TO8Orefs8w9qZ3LB0W2iWU2VLqhlNg9GUGgT9ty4AdB8zc
	dCkMGxeoBb71EQKoLTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEyj-0000000FWzr-0cYh;
	Mon, 13 Apr 2026 10:57:17 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEyg-0000000FWvK-32RG
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 10:57:15 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wCEyX-000000000Oa-07Fv;
	Mon, 13 Apr 2026 10:57:05 +0000
Date: Mon, 13 Apr 2026 11:57:02 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: bbt: clamp GENMASK high bit to word boundary
Message-ID: <adzL_tlZTntTVPD-@makrotopia.org>
References: <2a62dc1a58f2f8467d95444fa4b37a0af27aeb45.1775951973.git.daniel@makrotopia.org>
 <871pgjnusl.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871pgjnusl.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_035714_802118_E244C266 
X-CRM114-Status: GOOD (  20.16  )
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

On Mon, Apr 13, 2026 at 10:12:10AM +0200, Miquel Raynal wrote:
> Hi Daniel,
> 
> On 12/04/2026 at 01:05:23 +01, Daniel Golle <daniel@makrotopia.org> wrote:
> 
> > When a BBT entry straddles an unsigned long boundary, the GENMASK in
> > nanddev_bbt_set_block_status() can potentially overflow because
> > offs + bits_per_block - 1 can theoretically exceed BITS_PER_LONG - 1.
> > Clamp the high bit so only bits within the current word are masked.
> > The cross-word portion is already handled by the pos[1] block below.
> >
> > Discovered by UBSAN: shift-out-of-bounds in
> > drivers/mtd/nand/bbt.c:116:13
> > shift exponent 18446744073709551614 is too large for 64-bit type
> > 'long unsigned int'
> 
> How likely is that? It doesn't matter how many bits you use per blocks
> (today is 2), it would require a NAND chip that covers an entire country
> to reach that number of blocks. If an attacker plays with that value,
> does it really matter? Apart from writing out of bounds -which is
> physically impossible, we are not talking about virtual memory here- and
> get an error later on, I do not see a good reason for this.
> 
> Honestly, I find the final result much less readable than before for no
> obvious added value IMO. But maybe I am looking at this the wrong way?

It's just the only UBSAN warning I get to see on a recent kernel and my
primary goal here was to make the warning go away. Adding an assertion
to ensure 'offs' is clamped to will likely also make the warning go
away.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
