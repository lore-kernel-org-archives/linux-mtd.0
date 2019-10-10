Return-Path: <SRS0=RcjP=YD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE0DC10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 13:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91BD02067B
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 13:31:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oSfAHvn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91BD02067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAH7jRN5N0gfRNr/oNa/7RqfvQ1e7vc9s1yvAcVboP8=; b=oSfAHvn+lY0XUZ
	p7AuzCix8fAdRtzk1exDT3NsYUWvRoorJoYjpSYJBDcRI2R/ruWM0gqVWAbQl/q3/1NdgZieU4ONa
	/IIOYaE7igraz9RqDhG3oZRFkSDVNPtyWYbf3sRaWhSbjbAoi9cPrAlySgpoKvHh9oNISDFU9Hhya
	BRt5eChFyg/GEW5cEEPC0vFsOAsLJzQvFkj9Sns5Y+2PhIdp2gmHMRLtalkMvWEHqZGGcchIZ7fOR
	w8OeWN7tIRgnmxxrhLnZw9HYDiCVHb9p17UemaQ9Y6tmCI2Kxt/fFtfWNmZts9FA5GpWXFqbi1Hv1
	8xIIKj4fMX0qAAD34Frw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIYXf-00080u-6J; Thu, 10 Oct 2019 13:31:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIYXc-00080S-Tg
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2019 13:31:42 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B004B29098D;
 Thu, 10 Oct 2019 14:31:38 +0100 (BST)
Date: Thu, 10 Oct 2019 15:31:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH v2] mtd: maps: l440gx: Avoid printing address to dmesg
Message-ID: <20191010153135.2b363c27@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191010084019.5190-1-huangfq.daxian@gmail.com>
References: <20191010084019.5190-1-huangfq.daxian@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_063141_089941_3B4ABD40 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 10 Oct 2019 16:40:19 +0800
Fuqian Huang <huangfq.daxian@gmail.com> wrote:

> Avoid printing the address of l440gx_map.virt every time l440gx init.
> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/mtd/maps/l440gx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/maps/l440gx.c b/drivers/mtd/maps/l440gx.c
> index 876f12f40018..ebe37edc8e88 100644
> --- a/drivers/mtd/maps/l440gx.c
> +++ b/drivers/mtd/maps/l440gx.c
> @@ -86,7 +86,7 @@ static int __init init_l440gx(void)
>  		return -ENOMEM;
>  	}
>  	simple_map_init(&l440gx_map);
> -	printk(KERN_NOTICE "window_addr = 0x%08lx\n", (unsigned long)l440gx_map.virt);
> +	printk(KERN_DEBUG "window_addr = 0x%08lx\n", (unsigned long)l440gx_map.virt);

pr_debug() please, and use %p instead of this %lx with a cast.

>  
>  	/* Setup the pm iobase resource
>  	 * This code should move into some kind of generic bridge


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
