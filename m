Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C983C38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:07:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFA520720
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:07:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pr4FYESQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GXE6bm+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFA520720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUOeAPl/KrmnMBJwXSnqLMl6v25ZE7nuTLyv349fbs4=; b=Pr4FYESQdgKYqG
	4XkGp81/2zaifN2gfl4b52Ei9s5JCEkchLP3GK54p9MeeVNSfhscl5uLxa1alJNcPNvnOpbwQDmKd
	yTteSIyrE490AcyyoXAcsjFweMxhK0gjh7T5Xmi6JIAzsyfBAGqn+QsDLPpQ/z67+FRsFFVNVbxW4
	OkGU1SGuWfrrnuaUs10hru504vosL85feYeidUXvycK5gGF2bQKvuJ/4z+KZiYM2RHKrvMNJLP6xy
	LDgHLYC49JHbZAForjpNZjdcF9O/DPs4gFpJI28QJ119N/uhT3lRB6dc7bWJSYGkVaMzcLvulCFgP
	E3Qfja0mJLuSVE3oQLnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwAM-0003ny-3b; Fri, 08 May 2020 06:07:22 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwAJ-0003nW-Au
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 06:07:21 +0000
Received: by mail-pg1-x543.google.com with SMTP id b8so379023pgi.11
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2020 23:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YVeRZZUHFH3YFPDWCfBx69wZVfQpp/EEA0nPL773ZGE=;
 b=GXE6bm+/eihbO9FZYZXzo33Q8p58K1PLmCmbx2lnDEo9heJ/5wAFgtMibiLz6h1vpu
 4T+jy2i+uzoxFA9Cl8FgGS9eLkFU7xccdPORN9aqQVlcqtrQbvmlBdw0C/H4GtGx1xp5
 ljPagTm2rOZoZONqjaS14h5GGGYY/M0XUp5lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YVeRZZUHFH3YFPDWCfBx69wZVfQpp/EEA0nPL773ZGE=;
 b=Dft1rNr50cHRcEbxDpjyTtMGq17Jb43k+ElpJ5nYkUyLxyZAOW+Mz/fZSec8czDNq1
 oo9+VZhMpqLUyI4Q2XRfpbjKdF43o7AJG0RPdNi+WJiYx3oX518/ma1C1CEk0jIl2PoN
 cyagFEKIL+LpyT34legw8s+W0AXn9FI0y80y4OUN1rUdCKsT0VeB3xVFf0YIcrj6JVP5
 /phYdpkodiqPV8iR5U6ESgTDmbeS3teuHMwdoChSIc8lvOmnB4/feJ+V4OqHguIkfVgV
 fW53SKNvCRVUG7y4CrjN97XNP+X7o4FODdShBmzM4jeD6SBjKEkev2w00Lb7YTlLzeIN
 cQNA==
X-Gm-Message-State: AGi0PuYUXXvZDVNPpmp4T6SpfmifLVfAANR5AUVUxxFdQrSusJ9h8PVm
 gTvEfIXJjNbOz6D4gtfIzZ1mtQ==
X-Google-Smtp-Source: APiQypL6/ve1p+CULUBjLX95ozq6LKlzyLNOdsl6iqGHnULRpNmN3haFOkySOgtz84GqfZP6rf89qg==
X-Received: by 2002:a62:a106:: with SMTP id b6mr1119513pff.23.1588918038521;
 Thu, 07 May 2020 23:07:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k6sm1456658pju.44.2020.05.07.23.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:07:17 -0700 (PDT)
Date: Thu, 7 May 2020 23:07:16 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v3 02/11] pstore/blk: new support logger for block devices
Message-ID: <202005072301.57F73B61CC@keescook>
References: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1585126506-18635-3-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585126506-18635-3-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_230719_397751_0A67C8AF 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2020 at 04:54:57PM +0800, WeiXiong Liao wrote:
> pstore/blk is similar to pstore/ram, but dump log to block device
> rather than persistent ram.
> [...]
> +int psblk_register_blkdev(unsigned int major, psblk_panic_write_op panic_write)
> +{
> +	struct block_device *bdev;
> +	struct psblk_device dev = {0};
> +	struct bdev_info *binfo;
> +	int ret = -ENODEV;
> +	void *holder = blkdev;
> +
> +	binfo = psblk_get_bdev_info();
> +	if (IS_ERR(binfo))
> +		return PTR_ERR(binfo);
> +
> +	/* only allow driver matching the @blkdev */
> +	if (!binfo->devt || MAJOR(binfo->devt) != major) {
> +		pr_debug("invalid major %u (expect %u)\n",
> +				major, MAJOR(binfo->devt));
> +		return -ENODEV;
> +	}
> +
> +	/* hold bdev exclusively */
> +	bdev = psblk_get_bdev(holder);
> +	if (IS_ERR(bdev)) {
> +		pr_err("failed to open '%s'!\n", blkdev);
> +		return PTR_ERR(bdev);
> +	}
> +
> +	/* psblk_bdev must be assigned before register to pstore/blk */
> +	psblk_bdev = bdev;
> +	blkdev_panic_write = panic_write;
> +
> +	dev.total_size = psblk_bdev_size(bdev);
> +	dev.panic_write = panic_write ? psblk_blk_panic_write : NULL;
> +	dev.read = psblk_generic_blk_read;
> +	dev.write = psblk_generic_blk_write;
> +
> +	ret = psblk_register_do(&dev);
> +	if (ret)
> +		goto err_put_bdev;
> +
> +	pr_info("using '%s'\n", blkdev);
> +	return 0;
> +
> +err_put_bdev:
> +	psblk_bdev = NULL;
> +	blkdev_panic_write = NULL;
> +	psblk_put_bdev(bdev, holder);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(psblk_register_blkdev);

I've gotten this series refactored on top of current pstore, and I've
been making various bikeshed changes to names, etc, and as I went to go
start testing, I realized that nothing actually uses
psblk_register_blkdev().

It seems like it should be possible to just start using this on any
block device of the user's choosing. I assume the idea is to allow for
drivers to register panic_write handlers, but even without that, it'd be
nice to just be able to test this with something like /dev/loop0.

What's your thinking on how this would happen? It seems like if
pstore/blk uses pstore/zone, and mtdpstore uses pstore/blk, there should
be a blkoops that uses pstore/blk too? I guess I need to learn a bit
more about how block device probing works so pstore/blk can notice
devices as they're brought online, etc.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
