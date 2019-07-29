Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7474C7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 15:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A137206E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 15:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOe8H3l9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A137206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFR7gqA7IG8EIStjSLYns97X4Cl87pWiZn07mtkGN4s=; b=NOe8H3l9yJhyRu
	jnilCMaiDj8/iI5QckmXC05b0M76sTgC97LLnwUAW8G5ha/pREKwDkkkd+nR4EX666tBmoO4TEmIy
	qeLvZIyRZS9IFOmqJkw0A2UB1KptLZmPQqlqnz0Dvvrgsmq+jdo2eeX58jMGjZrjGhmV1mmED1M5e
	t7nM2kHQxwQaRTGXkjFHxQQUrUJbGG9RKH8XPaBgGO4DpTETz7R0wJhefJTnMl/0lOFn7vZlR8gpp
	NH2ZntxQoEOBXf1s89fzlil3OH0JYEeG6t01x4r6zfP5B7OaLWw74qYRPtdHo9ZsqVMQtPt/Oserk
	dM8MYJOk/gfmLVadn6ZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs7aH-00055q-OY; Mon, 29 Jul 2019 15:29:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs7aD-000554-Ao
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 15:29:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 65B8826D9C2;
 Mon, 29 Jul 2019 16:29:02 +0100 (BST)
Date: Mon, 29 Jul 2019 17:28:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [RFC v1 0/3] *spi-mem: adding setup and callback function
Message-ID: <20190729172859.4374a2ad@collabora.com>
In-Reply-To: <20190729142504.188336-1-tmaimon77@gmail.com>
References: <20190729142504.188336-1-tmaimon77@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_082905_499683_A812FEF0 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: yogeshnarayan.gaur@nxp.com, vigneshr@ti.com, bbrezillon@kernel.org,
 richard@nod.at, tudor.ambarus@microchip.com, linux-spi@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, frieder.schrempf@exceet.de, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tomer,

On Mon, 29 Jul 2019 17:25:01 +0300
Tomer Maimon <tmaimon77@gmail.com> wrote:

> Lately we have working on Flash interface unit (FIU) SPI driver that 
> using spi-mem interface, Our FIU HW module support direct Flash Rd//Wr.
> 
> In our SOC (32 bit dual core ARM) we have 3 FIU's that using memory mapping as follow:
> 
> FIU0 - have 2 chip select and each one have 128MB memory mapping (total 256MB memory mapping)
> FIU1 - have 4 chip select and each one have 128MB memory mapping (total 512MB memory mapping)
> FIU2 - have 4 chip select and each one have 16MB memory mapping (total 32MB memory mapping)
> 
> Totally 800MB memory mapping.
> 
> When the FIU driver probe it don't know the size of each Flash that 
> connected to the FIU, so the entire memory mapping is allocated for each FIU 
> according the FIU device tree memory map parameters.

Do you need those mappings to be active to support simple reg accesses?

> It means, if we enable all three FIU's the drivers will try to allocate totally 800MB.
> 
> In 32bit system it is problematic because the kernel have only 1GB 
> of memory allocation so the vmalloc cannot take 800MB.
> 
> When implementing the FIU driver in the mtd/spi-nor we allocating memory address only 
> for detected Flash with exact size (usually we are not using 128MB Flash), and in that case usually we allocating much less memory.
> 
> To solve this issue we needed to overcome two things:
> 
> 1.	Get argument from the upper layer (spi-mem layer) 
> 2.	Calling the get argument function after SPI_NOR_SCAN function. (the MTD Flash size filled in  SPI_NOR_SCAN function)

That's clearly breaking the layering we've tried to restore with the
spi-nor/spi-mem split, and I don't see why this is needed since we now
have a way to create direct mappings dynamically (with the dirmap API).
Have you tried implementing the dirmap hooks in your driver?

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
