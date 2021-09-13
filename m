Return-Path: <SRS0=bI2a=OD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD5DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 17:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F7D61056
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Sep 2021 17:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19F7D61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFF9Jws63bM5AVITHF6gASGo/rCWk2GcyxU97cDKXJc=; b=SAE3sjAt6XgBAg
	u5o82Bb6ZKr89UndD73KitQCHbHO9tI4Iw4CUCKaupeSS4mj6VBxVDCm12DAtk92AlqXMTbvdrW5t
	GZMcsfYsH/A7KNnRFLD/A50m7JSPWJTpD/qkNtJOK+rkqR5VLbxuG17t9UzOt5vXV5lrPN8wYckmH
	7X7W61jaNUeL69fvLaJ/CJf0eH0cfTvjPk3Mr4unZPg0Eq+vnHxcxuELtp7g4jBIRbVoPE511YsHq
	o/64O6tuFNeLPcxHeEbojH2afvvihXz5BQu4oc481bxCOvpLIhmhihbq/KX7lUdH5alypoxrdQL0b
	JuUOc+Myt6gqWA0b/V1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpWD-002cRo-G3; Mon, 13 Sep 2021 17:13:21 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mPpBC-002WDJ-53; Mon, 13 Sep 2021 16:51:38 +0000
Date: Mon, 13 Sep 2021 09:51:38 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jan =?iso-8859-1?Q?H=F6ppner?= <hoeppner@linux.ibm.com>
Cc: axboe@kernel.dk, gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, oberpar@linux.ibm.com, tj@kernel.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] s390/block/dasd_genhd: add error handling support
 for add_disk()
Message-ID: <YT+Bmvv3yXbuBddi@bombadil.infradead.org>
References: <20210902174105.2418771-1-mcgrof@kernel.org>
 <20210902174105.2418771-7-mcgrof@kernel.org>
 <d6140e40-a472-e732-9893-99e1839b717e@linux.ibm.com>
 <f24da7d5-0b67-fa24-862f-0b27a2ab502c@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f24da7d5-0b67-fa24-862f-0b27a2ab502c@linux.ibm.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 13, 2021 at 02:19:38PM +0200, Jan H=F6ppner wrote:
> On 13/09/2021 10:17, Jan H=F6ppner wrote:
> > On 02/09/2021 19:41, Luis Chamberlain wrote:
> >> We never checked for errors on add_disk() as this function
> >> returned void. Now that this is fixed, use the shiny new
> >> error handling.
> >>
> >> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> >> ---
> >>  drivers/s390/block/dasd_genhd.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/s390/block/dasd_genhd.c b/drivers/s390/block/dasd=
_genhd.c
> >> index fa966e0db6ca..ba07022283bc 100644
> >> --- a/drivers/s390/block/dasd_genhd.c
> >> +++ b/drivers/s390/block/dasd_genhd.c
> >> @@ -33,7 +33,7 @@ int dasd_gendisk_alloc(struct dasd_block *block)
> >>  {
> >>  	struct gendisk *gdp;
> >>  	struct dasd_device *base;
> >> -	int len;
> >> +	int len, rc;
> >>  =

> >>  	/* Make sure the minor for this device exists. */
> >>  	base =3D block->base;
> >> @@ -79,7 +79,11 @@ int dasd_gendisk_alloc(struct dasd_block *block)
> >>  	dasd_add_link_to_gendisk(gdp, base);
> >>  	block->gdp =3D gdp;
> >>  	set_capacity(block->gdp, 0);
> >> -	device_add_disk(&base->cdev->dev, block->gdp, NULL);
> >> +
> >> +	rc =3D device_add_disk(&base->cdev->dev, block->gdp, NULL);
> >> +	if (rc)
> >> +		return rc;
> >> +
> > =

> > I think, just like with some of the other changes, there is some
> > cleanup required before returning. I'll prepare a patch and
> > come back to you.
> > =

> =

> It's actually just one call that is required. The patch should
> look like this:
> =

> diff --git a/drivers/s390/block/dasd_genhd.c b/drivers/s390/block/dasd_ge=
nhd.c
> index fa966e0db6ca..80673dbfb1f9 100644
> --- a/drivers/s390/block/dasd_genhd.c
> +++ b/drivers/s390/block/dasd_genhd.c
> @@ -33,7 +33,7 @@ int dasd_gendisk_alloc(struct dasd_block *block)
>  {
>         struct gendisk *gdp;
>         struct dasd_device *base;
> -       int len;
> +       int len, rc;
>  =

>         /* Make sure the minor for this device exists. */
>         base =3D block->base;
> @@ -79,7 +79,13 @@ int dasd_gendisk_alloc(struct dasd_block *block)
>         dasd_add_link_to_gendisk(gdp, base);
>         block->gdp =3D gdp;
>         set_capacity(block->gdp, 0);
> -       device_add_disk(&base->cdev->dev, block->gdp, NULL);
> +
> +       rc =3D device_add_disk(&base->cdev->dev, block->gdp, NULL);
> +       if (rc) {
> +               dasd_gendisk_free(block);
> +               return rc;
> +       }
> +

Thanks!

Would you like to to fold this fix into my patch and resend eventually?
Or will you send a replacement?

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
