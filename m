Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07042C19F2D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpcX3Be6BXT3OPEeaoBTASwaMZX/fEPtoCBAXOQsNVE=; b=E5NXOPHagP7Boi
	Q8tMaWWo2hPMb4QOTk0Otd8zmrfSRRCLHkDkkCgKVcsTZ0/fs/c7g29ZThLZSxdVpyycOefdq3j35
	oGwwjEPTjf2FzfQklnG+k1nzChpsYykdl2T9D+vtAjsJKn81XwiqSDhjJxJgf41qBMGb60Ukv9dR9
	ivccr5LER9dkHciqMU++aIrNAQeiQh4uv9+EDIlJL+CO0d0DGoGPdTkkD20q51Hj6IbUm0K856yMV
	TYEvDGmNcFY3afnFQR68AiCYMWaV6v/EXec1M0bD+8DoTtMCxRRVq6QkCP7WnL3YTzuoYg5GS6sJN
	s1H2c2EIaui3VekaTdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLKHh-002f5P-S1; Tue, 09 Aug 2022 08:08:17 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLKHe-002f3D-0D
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 08:08:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7D89868AA6; Tue,  9 Aug 2022 10:08:09 +0200 (CEST)
Date: Tue, 9 Aug 2022 10:08:09 +0200
From: ChristophHellwig <hch@lst.de>
To: Liwei Song <liwei.song@windriver.com>
Cc: MiquelRaynal <miquel.raynal@bootlin.com>,
	RichardWeinberger <richard@nod.at>,
	VigneshRaghavendra <vigneshr@ti.com>, ChristophHellwig <hch@lst.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd_blkdevs: add mtd_table_mutex lock back to
 blktrans_{open, release} to avoid race condition
Message-ID: <20220809080809.GB14727@lst.de>
References: <20220809075753.21950-1-liwei.song@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220809075753.21950-1-liwei.song@windriver.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_010814_227700_54B9EB3D 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, Aug 09, 2022 at 03:57:53PM +0800, Liwei Song wrote:
> without lock mtd_table_mutex in blktrans_{open, release}, there will
> be a race condition when access devices /dev/mtd1 and /dev/mtdblock1
> at the same time with a high frequency open and close test:
> 
> kernel BUG at drivers/mtd/mtdcore.c:1221!
> lr : blktrans_release+0xb0/0x120

This does not seem on a current mainline kernel and seems to be
a somewhat incomplete backtrace.  Can you send the full dmesg of
a latest mainline run and maybe share the reproducer?

> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index b8ae1ec14e17..147e4a11dfe4 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -188,6 +188,8 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
>  
>  	kref_get(&dev->ref);
>  
> +	if (!mutex_trylock(&mtd_table_mutex))
> +		return ret;

No, that's not really the solution.

Turning the kref_get above into a kref_get_unless_zero might be better
path to look into.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
