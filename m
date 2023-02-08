Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF3C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pr+E2xxuIV7p8rq9lL5sdTaGKWy2cJ/BXkEcL+BJXUs=; b=qLeVIsrIY4oqYN
	z8P91z/2C/omF/ia1rWB3Ab21wk6+c6zMsSbkXdQA77fCPBq79gtJbaouOaSIg6c3GA8J2hL4+7y+
	dPekeDo/DM3uBY/0ePtMrgegJc7Pwl8VLRs/Tg5IdV4CFDuYMG7pNhppNbiqnO4bwdVwMZb1CgGdD
	MZ1eqS3timWfjXT30xJIpjCnTRYOI3Uk5xgNeqTMQ+OBa4vyXdhhcBcvEvgjDg8ReEOSEGYB4OT/2
	oW7uPybq9KZmaPJVfx0NKHy/Qxl8PxYVP7qVDK5gvCbP1hyzr9E2u/SQlyDgVjBW3p/qmdhcagIjP
	aUn9Yv2TT9xsmqa077qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmmb-00G9AC-3f; Wed, 08 Feb 2023 15:54:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPmmC-00G8vN-1M
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 15:54:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5EFE0B81E4B;
	Wed,  8 Feb 2023 15:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913AFC433D2;
	Wed,  8 Feb 2023 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675871665;
	bh=djqq+bhRYhiOz/s1OAO+4lN6tcxxoESNjtRKsHsAnBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1zIZ74iNLmmeoyf/v29bsO7D3YCZfiDFUuDbOB0AWFpWZ3/GvEFvV6kwy2lXKUf+E
	 WShW2h8i2V9pYQMWwum/y/L9YaFNmqfI9M3O/lB4SetSuDS3NmVC4Oy5GMAOQ9OZwz
	 NIEq48hJMFsY3fmBscD3gK6n45QUL4XQipsAPSNs=
Date: Wed, 8 Feb 2023 16:54:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Message-ID: <Y+PFreHoRVB+5J+1@kroah.com>
References: <20230208145301.2169646-1-gregkh@linuxfoundation.org>
 <68d10a9b27a0a3894a290b28c1a22085@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68d10a9b27a0a3894a290b28c1a22085@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_075428_258071_5232322A 
X-CRM114-Status: GOOD (  11.67  )
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

On Wed, Feb 08, 2023 at 04:28:45PM +0100, Michael Walle wrote:
> > +static void __exit spi_nor_module_exit(void)
> > +{
> > +	spi_nor_debugfs_shutdown();
> > +	spi_mem_driver_unregister(&spi_nor_driver);
> 
> Hm, does the order matter here? I didn't test it, but this will
> lead to:
> 
> rootdir = debugfs_create_dir("spi-nor", NULL);
> nor->debugfs_root = debugfs_create_dir("spi0", rootdir);
> debugfs_remove(rootdir);
> debugfs_remove(nor->debugfs_root);
> 
> If that's ok, then this looks good.

It's ok as the last call to debugfs_remove() will just fail as that
dentry is long gone.  Not the nicest, so I'll reverse them and send out
a v4 now.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
