Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752BAC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oigCWrVkMQlFQyWJ0j1V9oCfYmNZSDroEJtDxvjWy/4=; b=E97pM+lT9Sx8/E
	jar+jw+TFnWJCUJ0I52kbeBbgN8X0DHn8X8RXji8PviflPWuYzLZujYzIQ9Hn17eDxY+JbvW5IY+0
	RU0kCosMUjBHFh2Y5b8Efjg27UeBUGzREreyRLBTgo7ItpQRNItkvS8tBGL9rgrOIYtlXCJ8AOW5d
	rHBlQp/ePXD6RVH38YPmxVnIJAk/UWHoHq2DJyOSrk9ZBn2aqseYQRaZlvEGzHUxdP8VtsIr16GbJ
	e75l4PBto8vslaKMBJIhvQNmGsk9OzZSTU8q3COAQrY3eaZ/lUGxitVCNhf7DxBq6iQ3MM1syMJoj
	RtaGN/YhFHkEWRzTbBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VLo-00AspR-01;
	Tue, 23 May 2023 16:59:08 +0000
Received: from mail-qv1-f48.google.com ([209.85.219.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VLl-00Asop-0W
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 16:59:06 +0000
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-61cd6191a62so32019366d6.3
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 09:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684861143; x=1687453143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwRGjqJkSXRPJHHzQwuRJHCwrUdQwcyQ9byVzjawyEc=;
        b=dHLGe6WbRmjtLBc2ZsRVEyQ7PQL5EMdaFcjs7fprEFVxqC1ULW9auWU+s/vxUV5pGJ
         EtWVSpbJrzRv9HvB/TRi1uhJfbtYem7mBLKzQ7kEbdFh1ESX3/foGvo4wqjnGZpOKrhC
         xylbdc+L1PB/4FS1mqWcBN6EzFK2uoEYbClUUlCg4RUQxGzAbyLIqI870HkbK42QDuOb
         aBayhrbBwLZKigC/m1wlC+xOFDitOqY5mhug8oMcvXVumdKiBVEneabGWrpgW7lyzz/1
         msmWfnzWXcUsUslkrhfZdBwVEHQ+eARQ9gQannjiI+HjuJRQf5i4FqxXXei46CIPGYwm
         jx4Q==
X-Gm-Message-State: AC+VfDzal+QSg5QhiREQhxe/2mePr+seFFo8mP1ewqUUOvBV8t3DDBpF
	EgEcElErtyQfOVZ2TlQls1w2
X-Google-Smtp-Source: ACHHUZ7KDQ2Jp5KWH/08+Nowc+ZerVbKYaqFsCmja4tNY6veUp3xnJBwfILDlwQLmRkuu4hWo14WpA==
X-Received: by 2002:ad4:5742:0:b0:621:64c7:235f with SMTP id q2-20020ad45742000000b0062164c7235fmr24446598qvx.27.1684861143301;
        Tue, 23 May 2023 09:59:03 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id x19-20020ae9f813000000b00759333a57adsm2666246qkh.11.2023.05.23.09.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:59:02 -0700 (PDT)
Date: Tue, 23 May 2023 12:59:01 -0400
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
Subject: Re: [PATCH 20/24] dm: only call early_lookup_bdev from early boot
 context
Message-ID: <ZGzw1c60WJBTNclC@redhat.com>
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-21-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523074535.249802-21-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_095905_203237_37A51152 
X-CRM114-Status: GOOD (  29.18  )
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

> early_lookup_bdev is supposed to only be called from the early boot
> code, but dm_get_device calls it as a general fallback when lookup_bdev
> fails, which is problematic because early_lookup_bdev bypasses all normal
> path based permission checking, and might cause problems with certain
> container environments renaming devices.
> 
> Switch to only call early_lookup_bdev when dm is built-in and the system
> state in not running yet.  This means it is still available when tables
> are constructed by dm-init.c from the kernel command line, but not
> otherwise.
> 
> Note that this strictly speaking changes the kernel ABI as the PARTUUID=
> and PARTLABEL= style syntax is now not available during a running
> systems.  They never were intended for that, but this breaks things
> we'll have to figure out a way to make them available again.  But if
> avoidable in any way I'd rather avoid that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/dm-table.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index e997f4322a9967..c230241a76b374 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -326,8 +326,11 @@ static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
>  /*
>   * Add a device to the list, or just increment the usage count if
>   * it's already present.
> + *
> + * Note: the __ref annotation is because this function can call the __init
> + * marked early_lookup_bdev when called during early boot code from dm-init.c.
>   */
> -int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
> +int __ref dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
>  		  struct dm_dev **result)
>  {
>  	int r;
> @@ -346,8 +349,10 @@ int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
>  			return -EOVERFLOW;
>  	} else {
>  		r = lookup_bdev(path, &dev);
> -		if (r)
> +#ifndef MODULE
> +		if (r && system_state < SYSTEM_RUNNING)
>  			r = early_lookup_bdev(path, &dev);
> +#endif
>  		if (r)
>  			return -ENODEV;
>  	}
> -- 
> 2.39.2
> 

I think/hope this will be fine:

Reviewed-by: Mike Snitzer <snitzer@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
