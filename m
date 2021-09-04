Return-Path: <SRS0=M7lc=N2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F050C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Sep 2021 01:45:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B0CD60F91
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Sep 2021 01:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B0CD60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB40ZBniY+//GZDtIZs/tMiNtoCApLiuw0NKOFlJYWo=; b=GNaSz+XbEdiLtV
	gSZfE9JsrbagH6nGvfyhmcAyGPsTV5AIScaL7yUSBtb8tlmVhCr43V2zVpkNvda1ht6e4/fzP8qZG
	8u3V1tXkSwkjfDxz59zmdknhlefOIsIc1UavjlZ1b5rx+QZOXncTJHDb1YCX7eKdFFXAZ/Wq3IbF/
	hE2uxegfUq9JbvU1A/aHYndW2fjX8rAeJY5bAvncF6qgh6QIL/01WyM3xjJRriYiJN3gQaGWBTV2E
	BIg9LjZ7ZcBzqVrrP3AdqFHN4Cv6UjEP91C7gEcHNlR1NqbLxlnVJG3037B9pHaSvPn6c7bkOOmZK
	kTWwaW+QyXi+vWpEMM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMKjs-00DMAg-OM; Sat, 04 Sep 2021 01:45:00 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mMKjm-00DMAS-PL; Sat, 04 Sep 2021 01:44:54 +0000
Date: Fri, 3 Sep 2021 18:44:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: axboe@kernel.dk, gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] s390/block/xpram: add error handling support for
 add_disk()
Message-ID: <YTLPlmWMhL4+03UH@bombadil.infradead.org>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-10-mcgrof@kernel.org>
 <YTIr1w/qPvgioUfL@osiris>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTIr1w/qPvgioUfL@osiris>
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

On Fri, Sep 03, 2021 at 04:06:15PM +0200, Heiko Carstens wrote:
> On Thu, Sep 02, 2021 at 10:41:05AM -0700, Luis Chamberlain wrote:
> > We never checked for errors on add_disk() as this function
> > returned void. Now that this is fixed, use the shiny new
> > error handling.
> > 
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  drivers/s390/block/xpram.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/s390/block/xpram.c b/drivers/s390/block/xpram.c
> > index ce98fab4d43c..ed3904b6a9c8 100644
> > --- a/drivers/s390/block/xpram.c
> > +++ b/drivers/s390/block/xpram.c
> > @@ -371,7 +371,9 @@ static int __init xpram_setup_blkdev(void)
> >  		disk->private_data = &xpram_devices[i];
> >  		sprintf(disk->disk_name, "slram%d", i);
> >  		set_capacity(disk, xpram_sizes[i] << 1);
> > -		add_disk(disk);
> > +		rc = add_disk(disk);
> > +		if (rc)
> > +			goto out;
> 
> Hmm, this is a more or less dead device driver, and I'm wondering if
> we shouldn't remove it instead. But anyway, your patch is not correct:
> 
> - del_gendisk for all registered disks has to be called
> - unregister_blkdev(XPRAM_MAJOR, XPRAM_NAME) is missing as well
> 
> That would be more or or less xpram_exit with parameter.
> 
> You can send a new patch or I can provide a proper one, whatever you
> prefer.

You are more familiar with the code so it would be great if you can send
a patch replacement and I will drop mine. I have quite a bit of other
conversions to deal with.

 Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
