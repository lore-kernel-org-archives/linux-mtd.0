Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF7FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Feb 2022 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c51kJWMTlzjpMkqQOe9foNafjppbGjqYf7fjwFHbaHs=; b=erpTs76vJKbftY
	bdxvmTE8x+khjvcWh8tNn9kHLrTTJ31e9tcBU2nGsASzhsHBOIizat9/BSqVlKVzylCDCPaZN/fun
	ru3UkI6BuNRhI9zys3KHjkJFc/bQ1dXowckBR5ot6tCdGTBb+9b/nURrLUINmzdyjovAgZgsRq9WI
	xMmGT0QWgaUZbkEnrLn40JyhXrFLH/23bOfAYUwPzWHefbiNeO92Yz1eG0PjRtNxB1PyPrVS1XlLV
	Iu/sdzl8+w5CVuRvCOjIG6buuZpIDB+U6v7R7raxjGcBt1a9VBZTOT+S+rHJmC7rFKMF7d605FJDy
	ClRkjn+mCONiWwXud+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHM1s-00D19h-Mr; Tue, 08 Feb 2022 08:39:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHM1p-00D18N-Sg
 for linux-mtd@lists.infradead.org; Tue, 08 Feb 2022 08:39:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02082B81768;
 Tue,  8 Feb 2022 08:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271FCC340ED;
 Tue,  8 Feb 2022 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644309550;
 bh=4jQ04LjZfUbQzPTvU2cT4/8kmd6n6kvE/jSKStVXFjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVYmo7kf1a9CWGEgO70gZ9N6EZp49iQTYs7VBhPvWfFNwHC6Dee2Lp9UOBSmoEwMD
 GISIrFwH3fq0jQ5ZnET0x+Ben/ClgGnZh1/mLYUTZlDXDclJbH3QKo6HwmlJGSIVwJ
 N7rGu0p4EFeR6wzvKXrJLi5JXsGMV0xsAaDBBqDY=
Date: Tue, 8 Feb 2022 09:39:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, stable@vger.kernel.org,
 sfr@canb.auug.org.au, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: protect access to rawnand devices while
 in suspend
Message-ID: <YgIsK+eGr6pqHQhQ@kroah.com>
References: <20220208082507.1837764-1-sean@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220208082507.1837764-1-sean@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_003914_107492_D71EA2B3 
X-CRM114-Status: GOOD (  14.10  )
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

On Tue, Feb 08, 2022 at 09:25:06AM +0100, Sean Nyekjaer wrote:
> Prevent rawnend access while in a suspended state.
> 
> Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
> rawnand layer to return errors rather than waiting in a blocking wait.
> 
> Tested on a iMX6ULL.
> 
> Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Follow-up on discussion in:
> https://lkml.org/lkml/2021/10/4/41
> https://lkml.org/lkml/2021/10/11/435
> https://lkml.org/lkml/2021/10/20/184
> https://lkml.org/lkml/2021/10/25/288
> https://lkml.org/lkml/2021/10/26/55
> https://lkml.org/lkml/2021/11/2/352

Please use lore.kernel.org links, we have no control over lkml.org and
it does not work with our tools at all.

Also:

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
