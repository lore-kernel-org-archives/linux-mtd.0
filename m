Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3610CC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:02:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B062071A
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iGNqIZVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80B062071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/PFX2vEPPnB6pKPkIAay/BQwKnaSeAJu47aHMUHyoDk=; b=iGNqIZVvgpHzHaZvGg3jePetV
	JcTweWCQhgOJJ7QxT2IMRYCLSMhz5zQGb3A0gUSUze8sCBAAsIY1TerAvuv8tz2qQvAoXjCRHwWzB
	iSnRkJblt+s2SXEY/H7aGUmcImednJD0jnJnD/xmbyuJU+nqFHX23mWyM8mKE9SAMg4MA1zNNgeyU
	tCsoagXhKILJPOMuwCmSxg6F4kZTeIgVzLHZkgtBiw+IknL9YgKHsKeybdZujPj06smJnB2cVbC9P
	SJ1U/MnjkOwQfEUzdoAnuhqIEcbCoPeiUDqmxAIRqCCQQIRZYC+En93ibY38eF4vfsvtiRFNCCu2t
	8009AOwiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb2Ja-0001RC-St; Fri, 06 Nov 2020 14:02:06 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb2JY-0001Qr-Sp
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 14:02:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id C704868B02; Fri,  6 Nov 2020 15:02:01 +0100 (CET)
Date: Fri, 6 Nov 2020 15:02:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefan Haberland <sth@linux.ibm.com>
Subject: Re: [PATCH 06/10] dasd: implement ->set_read_only to hook into
 BLKROSET processing
Message-ID: <20201106140201.GA23087@lst.de>
References: <20201103100018.683694-1-hch@lst.de>
 <20201103100018.683694-7-hch@lst.de>
 <20201105205634.GA78869@imap.linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105205634.GA78869@imap.linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_090205_057111_A6495B89 
X-CRM114-Status: GOOD (  19.43  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Ilya Dryomov <idryomov@gmail.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 05, 2020 at 09:56:47PM +0100, Stefan Haberland wrote:
> > +	/* do not manipulate hardware state for partitions */
> >  	if (bdev_is_partition(bdev))
> > -		// ro setting is not allowed for partitions
> > -		return -EINVAL;
> > -	if (get_user(intval, (int __user *)argp))
> > -		return -EFAULT;
> > +		return 0;
> > +
> >  	base = dasd_device_from_gendisk(bdev->bd_disk);
> >  	if (!base)
> >  		return -ENODEV;
> > -	if (!intval && test_bit(DASD_FLAG_DEVICE_RO, &base->flags)) {
> > -		dasd_put_device(base);
> > -		return -EROFS;
> > -	}
> > -	set_disk_ro(bdev->bd_disk, intval);
> 
> 
> While testing this patch I just noticed that when I set a device readonly this is
> not going to be passed on to the partitions on this device any longer.
> 
> This is caused by the removed call to set_disk_ro().
> 
> Is this intentional or was this removed by accident?

It was unintentionally intentional :)

The generic code used already by almost all drivers in mainline only
calls set_device_ro from blkdev_roset, that is it only sets the main
device read-only.  dasd was the outlier here, and I didn't notice it
actually called set_disk_ro instead of set_device_ro.   That being
said I think setting all the partitions read-only as well when the
full device is set read-only makes perfect sense.  I'm just a little
worried it could cause regressions.  Let me prepare a follow on patch
on top of the series that switches to that behavior.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
