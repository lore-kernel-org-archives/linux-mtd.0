Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ABFC48BE6
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 04:03:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A5C610A1
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 04:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A5C610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1pdSv62RN1C8Fu6PcA6SsjwXCWwepJ24OGBABvg7Fo=; b=4ITo82i1wyqvLf
	vdet3cYjd6Q/OncXk72T4rtLfEeT4Zf0pExCG77p9qtsuvUkVab648JIy4MXyd0q8AQIqCX4NeSYQ
	JqSG32MFWOahabIUlpF/YCJBN5oxWyXREPjj5kAq3Bgm9jpEDW13Qf9O6zfChcnEdj8UvlMBVOuMI
	4iUgDnBVVVWHAEi99s3nD1X+TqiwYDioq2d/2voXcqU6/dhTht3D63CkIAAT8rqrSsJmb0hRQ4Uqm
	fzc/pYsSmUojAly7HpfqIbk6RlJJYVQVn+Uw8lNqbb/Na1rRfTQbltc0VntEm0jdI/Eg/5pqjEImy
	JH7W2lTMgVmFCS66VXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltMlR-004gwg-7L; Wed, 16 Jun 2021 04:02:53 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltMlO-004gwI-RI
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 04:02:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A23E468AFE; Wed, 16 Jun 2021 06:02:47 +0200 (CEST)
Date: Wed, 16 Jun 2021 06:02:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
 Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] pstore/blk: Include zone in pstore_device_info
Message-ID: <20210616040247.GD25873@lst.de>
References: <20210615212121.1200820-1-keescook@chromium.org>
 <20210615212121.1200820-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615212121.1200820-4-keescook@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_210251_226925_5DC50246 
X-CRM114-Status: GOOD (  20.60  )
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

> +#define verify_size(name, alignsize, enabled) {				\
> +		long _##name_;						\
> +		if (enabled)						\
> +			_##name_ = check_size(name, alignsize);		\
> +		else							\
> +			_##name_ = 0;					\
> +		/* synchronize visible module parameters to result. */	\
> +		name = _##name_ / 1024;					\
> +		dev->zone.name = _##name_;				\
> +	}

The formatting here looks weird between the two-tab indent and the
opening brace on the macro definition line.

> -	if (!dev || !dev->total_size || !dev->read || !dev->write) {
> +	if (!dev || !dev->zone.total_size || !dev->zone.read || !dev->zone.write) {
>  		if (!dev)
> -			pr_err("NULL device info\n");
> +			pr_err("NULL pstore_device_info\n");
>  		else {
> -			if (!dev->total_size)
> +			if (!dev->zone.total_size)
>  				pr_err("zero sized device\n");
> -			if (!dev->read)
> +			if (!dev->zone.read)
>  				pr_err("no read handler for device\n");
> -			if (!dev->write)
> +			if (!dev->zone.write)
>  				pr_err("no write handler for device\n");
>  		}

This still looks odd to me.  Why not the somewhat more verbose but
much more obvious:

	if (!dev) {
		pr_err("NULL pstore_device_info\n");
		return -EINVAL;
	}
	if (!dev->zone.total_size) {
		pr_err("zero sized device\n");
		return -EINVAL;
	}
	...
		

> -	dev.total_size = i_size_read(I_BDEV(psblk_file->f_mapping->host)->bd_inode);
> +	dev->zone.total_size = i_size_read(I_BDEV(psblk_file->f_mapping->host)->bd_inode);

This is starting to be unreadable long.  A local variable for the inode
might be nice, as that can also be used in the ISBLK check above.

> +	if (!pstore_device_info && best_effort && blkdev[0]) {
> +		struct pstore_device_info *best_effort_dev;
> +
> +		best_effort_dev = kzalloc(sizeof(*best_effort_dev), GFP_KERNEL);
> +		if (!best_effort) {
> +			ret = -ENOMEM;
> +			goto unlock;
> +		}
> +		best_effort_dev->zone.read = psblk_generic_blk_read;
> +		best_effort_dev->zone.write = psblk_generic_blk_write;
> +
> +		ret = __register_pstore_blk(best_effort_dev,
> +					    early_boot_devpath(blkdev));
> +		if (ret)
> +			kfree(best_effort_dev);
> +		else
> +			pr_info("attached %s (%zu) (no dedicated panic_write!)\n",
> +				blkdev, best_effort_dev->zone.total_size);

Maybe split this into a little helper?

> +	/* Unregister and free the best_effort device. */
> +	if (psblk_file) {
> +		struct pstore_device_info *dev = pstore_device_info;
> +
> +		__unregister_pstore_device(dev);
> +		kfree(dev);
> +		fput(psblk_file);
> +		psblk_file = NULL;
>  	}

Same.

> +	/* If we've been asked to unload, unregister any registered device. */
> +	if (pstore_device_info)
> +		__unregister_pstore_device(pstore_device_info);

Won't this double unregister pstore_device_info?

>  struct pstore_device_info {
> -	unsigned long total_size;
>  	unsigned int flags;
> -	pstore_zone_read_op read;
> -	pstore_zone_write_op write;
> -	pstore_zone_erase_op erase;
> -	pstore_zone_write_op panic_write;
> +	struct pstore_zone_info zone;
>  };

Given that flags is only used inside of __register_pstore_device
why not kill this struct and just pass it explicitly?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
