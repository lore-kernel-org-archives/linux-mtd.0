Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF14C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Etn1RfCSQ7KkplKDcSSqZcol42gq6NC2EfViXUg7xk=; b=1CXvud3AMiTxJ9
	u8ps1cyE3EGHOhBfbIB+an9HGsthh9e1WIq3M5rJe46oKZoDeQuHa+aifjxi02rYrwdMoPbO0mK9+
	bNXBUE0inEgP/pD1vwt/qQCGW3a41AzPsVRuhFbGFm+xKv6kRYXfdsPQhJiuJ19dTRwBTUqj/+4D/
	cB+QtxyDdh0E5EQoijJ5OpjZb0rr5p1K9Ac80YIN5st/gkzREghZ//j1tDnG407HToMtvXEc0I/nJ
	8iR54xGVmhODIIS9tdhIN7hwB62eQm9oUP4WlXa3wI3tCeQBb2Z8oRjS6Lt05zifj5oImDyrL6jKg
	dHxDhP6PPv2j9XUyO2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VCO-00Ar2m-1Y;
	Tue, 23 May 2023 16:49:24 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VCM-00Ar1Y-1I
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 16:49:23 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-75b01b0c712so7721985a.3
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 09:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860557; x=1687452557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3EMNNGlTZuYQJrvyvOENR+PpdBzLBVxLhbFOjcQtI8=;
        b=GkX+X7O5bLmpldiUNXFhgBVWoSOYxaSgFIqRSjME8yFoktwDj48NheCD6z3nXsGrls
         WWOLUWEbyV7AEsyPcH8k6U5+aiMRX07alZVOvT9TVTZQDWEVA40Y0EpuOneH5ClOGhdk
         J+dpf0WX6gtQ/z2X6p85Cwh56Sa2qLutL0rxcUDikN1TKMqukbBCmqfGEaD2/ZpNBTtq
         M6vXe6jrmY2sWUatip/hW3UtG0uJJsa5QPEwpjdgNiOaqQG/A39aiwisTbXsJIYTX+I9
         5LqGJjW3CL5jGCdrwSsG6AGcF/8cqVoDJoTE2+vUlD0zVF0tolU00yEssCbnQ81CI3k9
         2tVQ==
X-Gm-Message-State: AC+VfDz2r511cVbiKzLN9K8sUnS4EkU1OE0BpFuKMpm3G0aoC/hp6Qwt
	sZm32M/mnYOw8V6EKdwXLPzY
X-Google-Smtp-Source: ACHHUZ60MTd8uQA0xp9MNOc+NSCIw6YiYWa5gikMW79ezh2QPyW9HHZu/QE2R1r4T9c4z9ffo1j2pw==
X-Received: by 2002:a37:458b:0:b0:75b:23a0:de95 with SMTP id s133-20020a37458b000000b0075b23a0de95mr4318585qka.19.1684860557503;
        Tue, 23 May 2023 09:49:17 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id m5-20020ae9e005000000b007578b6d060bsm2619050qkk.126.2023.05.23.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:49:17 -0700 (PDT)
Date: Tue, 23 May 2023 12:49:16 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 19/24] dm: remove dm_get_dev_t
Message-ID: <ZGzujNVLaQD2npwH@redhat.com>
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-20-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523074535.249802-20-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_094922_441221_174D5B29 
X-CRM114-Status: GOOD (  24.19  )
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

On Tue, May 23 2023 at  3:45P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Open code dm_get_dev_t in the only remaining caller, and propagate the
> exact error code from lookup_bdev and early_lookup_bdev.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/dm-table.c         | 20 ++++----------------
>  include/linux/device-mapper.h |  2 --
>  2 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 05aa16da43b0d5..e997f4322a9967 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -323,20 +323,6 @@ static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
>  	return 0;
>  }
>  
> -/*
> - * Convert the path to a device
> - */
> -dev_t dm_get_dev_t(const char *path)
> -{
> -	dev_t dev;
> -
> -	if (lookup_bdev(path, &dev) &&
> -	    early_lookup_bdev(path, &dev))
> -		return 0;
> -	return dev;
> -}
> -EXPORT_SYMBOL_GPL(dm_get_dev_t);
> -
>  /*
>   * Add a device to the list, or just increment the usage count if
>   * it's already present.
> @@ -359,8 +345,10 @@ int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
>  		if (MAJOR(dev) != major || MINOR(dev) != minor)
>  			return -EOVERFLOW;
>  	} else {
> -		dev = dm_get_dev_t(path);
> -		if (!dev)
> +		r = lookup_bdev(path, &dev);
> +		if (r)
> +			r = early_lookup_bdev(path, &dev);
> +		if (r)
>  			return -ENODEV;
>  	}
>  	if (dev == disk_devt(t->md->disk))

OK, but you aren't actually propagating the exact error code.  Did
you intend to change the return from -ENODEV to r?

Mike

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
