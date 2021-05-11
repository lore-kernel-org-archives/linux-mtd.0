Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E10EC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:59:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8D261448
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8D261448
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kIEzwKmoh4gvWNf1PkI+cDgbcBGwvtX3e9VuBvNLC7c=; b=jLSXMhKZcS+E/jdMMl/PgjlaO
	aJkkqeWu4JFpmxkX96PdI/1HhNpaox1kda0R8QzuNDwXPVlNtHUjr/wtnP/zYEggu0lTDZg81f0SV
	9bHZNIW1gFLhxguwp4fuDpjZOzOsOIF6n/kSl3c57i+ImeD0Y7PX4bYBCUo48XQe9COslUDHjhBAR
	iSDM7zJ18+Zkuuqmi0+cnggn3jsZIIE6d94eDiF6+/7f5Cbt/26TZuBNuaXSDBSEkMGdZ8P3ZtdpB
	FutYotYR6PpWW3A0LVjOBZ0LqZac996yU8ZUirgRXkkUT9DlW2o3zxz0APlcNW8pQMojm0jhBihPI
	0xKOuqmHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgR20-00HG0V-0N; Tue, 11 May 2021 11:58:32 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgNGs-00GYHb-Se
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 07:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5s+UmRMVAm00GZBYKXOhBogliyhTL9wRc6BIE16Ioko=; b=fqvFrsAD2x2tL8cvJ2BpNHJwQE
 6pbWx/SxqFxxxBVO8cdSOhKYVzq2qGAg1iaBcNnYLwPTDR5AKCpeco/zOaH5U7Zub/gQw25JSdsmy
 RudOPKW81//IpW2IJF4d10w3bCSNK/w/XgAaxAjBXtf3KiuZ0Qh+/2kQdsPeRryN6SmN+hXNb3iVG
 s5zXrkFMIvHCQsLM3z4DA/Ysb52vFa6R42e3W9pmigFEdR4ksWNGPGK+7bgJ/9UFBU7s4ZMcRo7nv
 WAm6wmzkGuActl+aniRQ6zBxD4yfMSv05QuhvCr4Fd3+YN9C3SBM789khReo3JWdqCaZgu84Lf6zY
 rHp6A0qg==;
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgNGp-009NR6-Up
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 07:57:37 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lgNGj-0004aV-1v; Tue, 11 May 2021 09:57:29 +0200
Date: Tue, 11 May 2021 08:57:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Jan Kara <jack@suse.cz>,
 Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v4] mtd: super: don't rely on mtdblock device minor
Message-ID: <YJo42y+lP9peFlkd@makrotopia.org>
References: <20210510121837.14274d4f@xps13> <YG9qzC/SaD7SNWVm@makrotopia.org>
 <YHRj5MUb5MGdPQqw@makrotopia.org> <YJmx3Ru/5oyq6Y1a@makrotopia.org>
 <20210511054955.GA6542@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511054955.GA6542@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_005736_017940_EA61F339 
X-CRM114-Status: GOOD (  19.92  )
/bin/ln: failed to access
 'reaver_cache/texts/20210511_005736_017940_EA61F339': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_005736_017940_EA61F339 
X-CRM114-Status: GOOD (  16.56  )
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

Hi Christoph,

thank you for the review!

On Tue, May 11, 2021 at 07:49:55AM +0200, Christoph Hellwig wrote:
> On Mon, May 10, 2021 at 11:21:17PM +0100, Daniel Golle wrote:
> > For blktrans devices with partitions (ie. part_bits != 0) the
> > assumption that the minor number of the mtdblock device matches
> > the mtdnum doesn't hold true.
> > Properly resolve mtd device from blktrans layer instead.
> 
> Why are you changing the legacy lookup method that is clearly deprecated
> in favor of the mdt* syntax?

Because it breaks if part_bits != 1 and despite being legacy, it should
not break (it would open the wrong MTD device).

> 
> > +
> > +	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
> > +		if (!bdev->bd_disk)
> > +			goto error_mtdblock;
> 
> bdev->bd_disk can't be NULL.

Better safe than sorry, I thought, especially as this is not a hot
path. But good, I'll remove the extra check.

> 
> >  
> > +		blktrans_dev = (struct mtd_blktrans_dev *)(bdev->bd_disk->private_data);
> 
> Overly long line due to the not actually required cast.
> 
> But more importantly you can't just look at the private data of a random
> block device that you just opened.  There is absolutely no guarantee that
> it actually points to a specific private data.

I do check the major number above to be MTD_BLOCK_MAJOR, and in that
case I assume that my expectations towards private structure will hold
true. If not, please enlighten me.
The previous assumption of the device MINOR number being equal to the
MTD number obviously also only holds true for mtdblock devices (if at
all).


Cheers


Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
