Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D09C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 17:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73B9610A2
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 17:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C73B9610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUqk6aVZ2My65pvyLj7NuP5ZOQJMFe0Da1HN0eJlB1E=; b=32ziNnpa2M0pPF
	M+ZNomsI6TR0naOq84tBTTZsZ8cfB3VefON/t9dIo0DMrne8+GkyvXmNnhU6o2OGpXRRqSDXHDMlP
	EclQ8MeI6djr0P8EcJN27VLdKZ+ffnIQq9zk77Z7ywSRnzTkWDVf6OQQTDn+Pz2Bs/yzNcBlC/MAA
	M0vpLzZeH2efjmmmQlO+KkY6urS2S5SsahExOPlYm3NYI5FI8kAjMnGVKPtpltcNdSsdFBci5AxCD
	6C4gx7y0U0WOCKWEiVMKcn/jnLV3gV5FfgrjSpIHfexJ/CWN8HII5UOvxV4ixJi4oUiGl1X5CJwf0
	hy3FLWORrrZaUV/XLYuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpbP-002dxR-Nk; Mon, 13 Sep 2021 17:18:43 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mPpCk-002WmJ-2M; Mon, 13 Sep 2021 16:53:14 +0000
Date: Mon, 13 Sep 2021 09:53:14 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, axboe@kernel.dk,
 gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
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
Subject: Re: [PATCH 7/9] s390/block/dcssblk: add error handling support for
 add_disk()
Message-ID: <YT+B+vCUcpZEq8hM@bombadil.infradead.org>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-8-mcgrof@kernel.org>
 <YTIscKy+jg5L/TMh@osiris> <YTLP8mYBX37R++9E@bombadil.infradead.org>
 <20210906134346.19c14246@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906134346.19c14246@thinkpad>
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

On Mon, Sep 06, 2021 at 01:43:46PM +0200, Gerald Schaefer wrote:
> On Fri, 3 Sep 2021 18:46:26 -0700
> Luis Chamberlain <mcgrof@kernel.org> wrote:
> 
> > On Fri, Sep 03, 2021 at 04:08:48PM +0200, Heiko Carstens wrote:
> > > On Thu, Sep 02, 2021 at 10:41:03AM -0700, Luis Chamberlain wrote:
> > > > We never checked for errors on add_disk() as this function
> > > > returned void. Now that this is fixed, use the shiny new
> > > > error handling.
> > > > 
> > > > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > > > ---
> > > >  drivers/s390/block/dcssblk.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> > > > index 5be3d1c39a78..b0fd5009a12e 100644
> > > > --- a/drivers/s390/block/dcssblk.c
> > > > +++ b/drivers/s390/block/dcssblk.c
> > > > @@ -696,7 +696,9 @@ dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char
> > > >  	}
> > > >  
> > > >  	get_device(&dev_info->dev);
> > > > -	device_add_disk(&dev_info->dev, dev_info->gd, NULL);
> > > > +	rc = device_add_disk(&dev_info->dev, dev_info->gd, NULL);
> > > > +	if (rc)
> > > > +		goto put_dev;
> > > 
> > > This looks not correct to me. We seem to have now in case of an error:
> > > 
> > > - reference count imbalance (= memory leak)
> > > - dax cleanup is missing
> > 
> > Care to provide an alternative?
> 
> See patch below:

Thanks! Will you queue this up on your end or do would you
prefer for me to roll this into my tree and eventually resend
with the rest?

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
