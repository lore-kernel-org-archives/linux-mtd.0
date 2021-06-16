Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60232C48BE8
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 14:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF326610A1
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 14:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF326610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lkn2bNBP72KrCUpUdaZ0GI/UBMMjOegH3t5VQmQexig=; b=By5hw63cR05mZO
	JxylFrQPC7Vk8KsfXgd0G3Z/ISpVvwoM7LjnLg2pj6onjlxKp04fmzzCK9bHcnADfjJ1yVLfP0ffY
	28QhOAq107idK353kccyfI7I7S9pxqUp6zeEXVeTa92lUEa2OWjtCyI7L7G/vl1HjeTwRqhM46cTW
	JG994csT0IOhn169dvwo4ZkTZCZJfCbFYjoqPxoDnQGzQaLtPM/J2TSk51P2U257UhPC2GTQtyL6M
	tY0lv1iGHSdmZFgg6DgBQisOU8JGOHF3bPl8dSh+w+glNG1Ov0YpLGjWW6Z8omDaVvqftq40LwpID
	NGEixIdQEYVgNurdLdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltWjx-006kpI-12; Wed, 16 Jun 2021 14:42:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltWjr-006koS-2W
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 14:41:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so1885031pjn.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xnm+WYpnOqXtkZdMWzoHLGjqCi4LOFWzGjFsrgoSRP0=;
 b=lrTVnbws/VPuEimwOb3YT0iDmqjnOYczffUh/Kv58vesKqMDTvMYbZJlToeNNPZAhV
 4Xy6XPsxIik88Qh+qEI8tlkRAALocVx3aaCxZj5FXWVdQADSSsTVrzwdmrKGCmfbwngX
 VJ19V7sYPzY2FIe5MofHco2b/0JWT0cVUBZV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xnm+WYpnOqXtkZdMWzoHLGjqCi4LOFWzGjFsrgoSRP0=;
 b=hLo2ei++8eHhNak0oKWa0yfQmTGYABxo5crEeNM484ofgRPHEq0Gol4UNGRdylwuOd
 3F5YSrYMGnA+DgKDAcR+HZhn0Y9o9TIExM7+zzJLqTmhCtjTeoVA7iQIAHO1bvu1sNEQ
 U/Zgdd7fb4slTrTBbIucDfLmqu55I44Bu1kpZ6zFCkc3ZFuaSCdn+/QUP8wO8SQmfLRF
 /Ywu3gT7YsHBtZhxM3NH0bF4XmVjF0+7F5CA6lcpFqaww6EZuZO5t25tVq7SIhq/sQrz
 LdSbcxge2Dtrho0vsGY9gLGdfr6r2OsIonyXnOlxjWzFqvF208rcQNbvhZZCrHMtMrfZ
 1yOw==
X-Gm-Message-State: AOAM533IKroXiLY3T26gsr+AY2mR/ipBVHM7SH+ATeD4Pq4NybaW2yMu
 zmtd8qJkpgGZ4hfguPlMeEuIGw==
X-Google-Smtp-Source: ABdhPJwwUS8UE4ZeWh9OoJ7tApiFkdOVNzxHHc1QvWSodOw2AyXOFizKKx/GS/9aqBotRNv22WlaBQ==
X-Received: by 2002:a17:902:22d:b029:11f:2db4:4c01 with SMTP id
 42-20020a170902022db029011f2db44c01mr19568plc.29.1623854514214; 
 Wed, 16 Jun 2021 07:41:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y6sm2434305pjr.48.2021.06.16.07.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 07:41:53 -0700 (PDT)
Date: Wed, 16 Jun 2021 07:41:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 gmpy.liaowx@gmail.com, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] pstore/blk: Include zone in pstore_device_info
Message-ID: <202106160737.B0B8882B@keescook>
References: <20210615212121.1200820-1-keescook@chromium.org>
 <20210615212121.1200820-4-keescook@chromium.org>
 <20210616040247.GD25873@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616040247.GD25873@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_074155_216464_F9813D6D 
X-CRM114-Status: GOOD (  26.84  )
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

On Wed, Jun 16, 2021 at 06:02:47AM +0200, Christoph Hellwig wrote:
> > +#define verify_size(name, alignsize, enabled) {				\
> > +		long _##name_;						\
> > +		if (enabled)						\
> > +			_##name_ = check_size(name, alignsize);		\
> > +		else							\
> > +			_##name_ = 0;					\
> > +		/* synchronize visible module parameters to result. */	\
> > +		name = _##name_ / 1024;					\
> > +		dev->zone.name = _##name_;				\
> > +	}
> 
> The formatting here looks weird between the two-tab indent and the
> opening brace on the macro definition line.

I can adjust that, sure.

> 
> > -	if (!dev || !dev->total_size || !dev->read || !dev->write) {
> > +	if (!dev || !dev->zone.total_size || !dev->zone.read || !dev->zone.write) {
> >  		if (!dev)
> > -			pr_err("NULL device info\n");
> > +			pr_err("NULL pstore_device_info\n");
> >  		else {
> > -			if (!dev->total_size)
> > +			if (!dev->zone.total_size)
> >  				pr_err("zero sized device\n");
> > -			if (!dev->read)
> > +			if (!dev->zone.read)
> >  				pr_err("no read handler for device\n");
> > -			if (!dev->write)
> > +			if (!dev->zone.write)
> >  				pr_err("no write handler for device\n");
> >  		}
> 
> This still looks odd to me.  Why not the somewhat more verbose but
> much more obvious:
> 
> 	if (!dev) {
> 		pr_err("NULL pstore_device_info\n");
> 		return -EINVAL;
> 	}
> 	if (!dev->zone.total_size) {
> 		pr_err("zero sized device\n");
> 		return -EINVAL;
> 	}
> 	...

Will do.

> > -	dev.total_size = i_size_read(I_BDEV(psblk_file->f_mapping->host)->bd_inode);
> > +	dev->zone.total_size = i_size_read(I_BDEV(psblk_file->f_mapping->host)->bd_inode);
> 
> This is starting to be unreadable long.  A local variable for the inode
> might be nice, as that can also be used in the ISBLK check above.

Fair enough; will change.

> > +	if (!pstore_device_info && best_effort && blkdev[0]) {
> > +		struct pstore_device_info *best_effort_dev;
> > +
> > +		best_effort_dev = kzalloc(sizeof(*best_effort_dev), GFP_KERNEL);
> > +		if (!best_effort) {
> > +			ret = -ENOMEM;
> > +			goto unlock;
> > +		}
> > +		best_effort_dev->zone.read = psblk_generic_blk_read;
> > +		best_effort_dev->zone.write = psblk_generic_blk_write;
> > +
> > +		ret = __register_pstore_blk(best_effort_dev,
> > +					    early_boot_devpath(blkdev));
> > +		if (ret)
> > +			kfree(best_effort_dev);
> > +		else
> > +			pr_info("attached %s (%zu) (no dedicated panic_write!)\n",
> > +				blkdev, best_effort_dev->zone.total_size);
> 
> Maybe split this into a little helper?
> 
> > +	/* Unregister and free the best_effort device. */
> > +	if (psblk_file) {
> > +		struct pstore_device_info *dev = pstore_device_info;
> > +
> > +		__unregister_pstore_device(dev);
> > +		kfree(dev);
> > +		fput(psblk_file);
> > +		psblk_file = NULL;
> >  	}
> 
> Same.

I guess? I don't feel strongly one way or another.

> 
> > +	/* If we've been asked to unload, unregister any registered device. */
> > +	if (pstore_device_info)
> > +		__unregister_pstore_device(pstore_device_info);
> 
> Won't this double unregister pstore_device_info?

No, __unregister_pstore_device() will NULL pstore_device_info.

> 
> >  struct pstore_device_info {
> > -	unsigned long total_size;
> >  	unsigned int flags;
> > -	pstore_zone_read_op read;
> > -	pstore_zone_write_op write;
> > -	pstore_zone_erase_op erase;
> > -	pstore_zone_write_op panic_write;
> > +	struct pstore_zone_info zone;
> >  };
> 
> Given that flags is only used inside of __register_pstore_device
> why not kill this struct and just pass it explicitly?

Because of the mess pstore's internal APIs used to be. :) It's likely
other things will get added here in the future, and I don't want to
have to repeat the kind of argument passing games that used to exist in
this code.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
