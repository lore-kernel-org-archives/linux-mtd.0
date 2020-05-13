Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382A3C2D0FC
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 13:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0465205ED
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 13:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EEDuFURU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0465205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xb4FHhxjb09RJnxeypE/5k9mYNY7vZSp99vj68+5ALs=; b=EEDuFURUsFX016
	+VqYZ1vRx00bT0nLgcbIrUd9tdDRucNFTwUWIIO8XKgODU4rm7VCNmRSIJiS72MKmZzGwb3RlNgs+
	u0RuUjHU/5kNVDARx9ifUZA/fOUilbN3PlGiJJmufZj4wyPfGctLZRqhTleAB0Hz/hfZVbnIpskkE
	35+oq/MxglFcc12AvmUFVJIip3fwaoxMWqbXPvqPTmsAl95zWs1DAdedyixhCKB6Lpd42SwZSduQS
	/ZTcKyIi7PRorQn5pWc3tOUL4fejqXQj8FYkqlMAeN7jbDcEXi90A9Ee2v/tJJsqIVyDTVNanW95c
	m+rDC6NyfBRStrObdqDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYrGk-0005NQ-Lp; Wed, 13 May 2020 13:17:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYrGa-0005F5-Hd; Wed, 13 May 2020 13:17:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5062D2A28D0;
 Wed, 13 May 2020 14:17:41 +0100 (BST)
Date: Wed, 13 May 2020 15:17:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 0/3] mtd: rawnand: Get rid of the cmx270 driver
Message-ID: <20200513151737.757513cf@collabora.com>
In-Reply-To: <87lflwngey.fsf@belgarion.home>
References: <20200429223134.789322-1-boris.brezillon@collabora.com>
 <20200508121041.64f91276@xps13> <87lflwngey.fsf@belgarion.home>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_061744_715644_F1298880 
X-CRM114-Status: GOOD (  20.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Robert,

On Wed, 13 May 2020 14:55:01 +0200
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Miquel Raynal <miquel.raynal@bootlin.com> writes:
> 
> > Hi Robert,  
> 
> Mi Miquel,
> 
> >> I hope someone still has a board to test that.  
> No, unfortunately I don't have this board, nor do I know of anyone having
> one. It's the second time I see patches on cmx270, and the question to whether
> we shoud keep this board in kernel is still in my mind ... given that cm-x300 is
> fully supported and testable, and no one I know has a cm-x2700 ...

What's the point of keeping support for a board no one has or no one
cares about? I know I don't have my word in this decision, but I would
strongly recommend getting rid of it, especially when I see such
crappy/unmaintained code lurking around in the drivers/ tree.

> 
> Now for your series, I have 2 comments :
>  - dsb() : can you explain the rationale of each of the 3 instances I saw
>  please.

I didn't add any dsb(), just copied what was done before.

>  - the +2 IOMEM offset
>    I don't like it at all. I don't mind the offset, I disklike the use of
>    readb() or readw() where before there was a readl().. Same thing for writeb()
>    against writel().
> 
>    The bus semantics are not the same, the alignment is not the same as well
>    (and PXA is very old and doesn't cope well with alignment), and without a
>    proper board to test, I would be very wary to have that change.

Well, given the core uses {read,write}{b,w}() [1] to read/write data
and this driver doesn't provide its own
->{read_byte,write_buf,read_buf}() implementation, I'd expect things to
work just fine if we use byte/word accessors for the rest. This being
said, I'm fine switching back to 32bit accessors if that's a hard
requirement.

Thanks,

Boris

[1]https://elixir.bootlin.com/linux/v5.7-rc5/source/drivers/mtd/nand/raw/nand_legacy.c#L28

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
