Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131A8C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 09:39:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59ABA61925
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 09:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59ABA61925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D8YTuZqYcor9OX7LbpkWK8DdZ+XCatwulCWxOThjBvY=; b=I+gUVFz8cXva9813JJkxRemTp
	w2Wtj3RKDThwdiXdTG8sKH+wAumU2r1S+uojJ6RqsC/yXJQYh+0PpQ4NbAlQ7aeOAu8AtkZHm6gHN
	O2dMX/JOIoBJYFJQz9NVwjnue5OdmaxTQnZepYW9QMNtrGQCA/VTfxqzgP0FKQjY68wOruRAdPaVP
	Vred10qmrjozHc9dhiL2GMOfXG/ysXuOQCScxteljGs9sa6/56sfRilSidYqc0r3wM204YfxuTAWB
	igV/Vto5mZnuTjrGzehcJhabu0kDtLQUG+McrKFz0L9N55RaO7NyngdoQr8AoME8QeAEQJMvhq+Vl
	E+qfF4Y7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgOqE-00Gj4g-5z; Tue, 11 May 2021 09:38:14 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgEGy-00FoYN-8E
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 22:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=QNER/dI5CJPoSuHArvZrqCJRg2LCl8ZFLkIZc746S38=; b=e8PiGoOiE/L50TA1ttg3mXkMKg
 Z+wXH3Prc8f3a0ZtjgApDso/ahmY8pK5tNu5VD48Tt/3/Q4vV7BTXkgwePFTeTgu6Ue6wCB0f02YG
 7ICbzKBGnbScd1N/fUtbO1VuKGccNc4E0cpiDNlgBKzx5z09HQZlVLiiww4RegpgvYPsic6rnxTVo
 RjQQf1CSD/QPlcQxughQz/TvfgyLFvToPtZb+ty2oe/B4izPsct1MzoflPOvHhAkkaxiT8C1nfC4F
 iD1DdqyYyNblIN/8W9pVMh5lF6M99vVfnjVCtr+/OCJEn5lQNpHXJkjD8zHcOczxYVgHvceH+iI7c
 pw35S78Q==;
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgEGt-0099eb-TE
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 22:21:05 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lgEGl-0001G7-Aa; Tue, 11 May 2021 00:20:57 +0200
Date: Mon, 10 May 2021 23:20:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3] mtd: super: don't rely on mtdblock device minor
Message-ID: <YJmxwExpcUxb4+VK@makrotopia.org>
References: <YG9qzC/SaD7SNWVm@makrotopia.org> <YHRj5MUb5MGdPQqw@makrotopia.org>
 <20210510121837.14274d4f@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510121837.14274d4f@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_152103_969684_284AD53A 
X-CRM114-Status: GOOD (  24.71  )
/bin/ln: failed to access
 'reaver_cache/texts/20210510_152103_969684_284AD53A': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_152103_969684_284AD53A 
X-CRM114-Status: GOOD (  21.53  )
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

On Mon, May 10, 2021 at 12:18:37PM +0200, Miquel Raynal wrote:
> Hi Daniel,
> =

> Daniel Golle <daniel@makrotopia.org> wrote on Mon, 12 Apr 2021 16:14:44
> +0100:
> =

> > For blktrans devices with partitions (ie. part_bits !=3D 0) the
> > assumption that the minor number of the mtdblock device matches
> > the mtdnum doesn't hold true.
> > Properly resolve mtd device from blktrans layer instead.
> =

> Unfortunately I cannot apply your patch anymore, would you mind
> rebasing it on top of v5.13-rc1?

I will send a rebased and improved version.

Thank you!


> =

> Thanks,
> Miqu=E8l
> =

> > =

> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v3: fix typo in patch description
> > v2: remove BUG() calls as requested by Miquel Raynal
> > =

> >  drivers/mtd/mtdsuper.c | 31 ++++++++++++++++++++++++-------
> >  1 file changed, 24 insertions(+), 7 deletions(-)
> > =

> > diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
> > index c3e2098372f2e..d3af80a7ce86e 100644
> > --- a/drivers/mtd/mtdsuper.c
> > +++ b/drivers/mtd/mtdsuper.c
> > @@ -9,6 +9,7 @@
> >   */
> >  =

> >  #include <linux/mtd/super.h>
> > +#include <linux/mtd/blktrans.h>
> >  #include <linux/namei.h>
> >  #include <linux/export.h>
> >  #include <linux/ctype.h>
> > @@ -121,7 +122,8 @@ int get_tree_mtd(struct fs_context *fc,
> >  {
> >  #ifdef CONFIG_BLOCK
> >  	struct block_device *bdev;
> > -	int ret, major;
> > +	struct mtd_blktrans_dev *blktrans_dev;
> > +	int ret, major, part_bits;
> >  #endif
> >  	int mtdnr;
> >  =

> > @@ -169,21 +171,36 @@ int get_tree_mtd(struct fs_context *fc,
> >  	/* try the old way - the hack where we allowed users to mount
> >  	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
> >  	 */
> > -	bdev =3D lookup_bdev(fc->source);
> > +	bdev =3D blkdev_get_by_path(fc->source, FMODE_READ, NULL);
> >  	if (IS_ERR(bdev)) {
> >  		ret =3D PTR_ERR(bdev);
> >  		errorf(fc, "MTD: Couldn't look up '%s': %d", fc->source, ret);
> >  		return ret;
> >  	}
> > -	pr_debug("MTDSB: lookup_bdev() returned 0\n");
> > +	pr_debug("MTDSB: blkdev_get_by_path() returned 0\n");
> >  =

> >  	major =3D MAJOR(bdev->bd_dev);
> > -	mtdnr =3D MINOR(bdev->bd_dev);
> > -	bdput(bdev);
> >  =

> > -	if (major =3D=3D MTD_BLOCK_MAJOR)
> > -		return mtd_get_sb_by_nr(fc, mtdnr, fill_super);
> > +	if (major =3D=3D MTD_BLOCK_MAJOR) {
> > +		if (!bdev->bd_disk) {
> > +			blkdev_put(bdev, FMODE_READ);
> > +			return -EINVAL;
> > +		}
> > +
> > +		blktrans_dev =3D (struct mtd_blktrans_dev *)(bdev->bd_disk->private_=
data);
> > +		if (!blktrans_dev || !blktrans_dev->tr) {
> > +			blkdev_put(bdev, FMODE_READ);
> > +			return -EINVAL;
> > +		}
> > +		mtdnr =3D blktrans_dev->devnum;
> > +		part_bits =3D blktrans_dev->tr->part_bits;
> > +		blkdev_put(bdev, FMODE_READ);
> > +		if (MINOR(bdev->bd_dev) !=3D (mtdnr << part_bits))
> > +			return -EINVAL;
> >  =

> > +		return mtd_get_sb_by_nr(fc, mtdnr, fill_super);
> > +	}
> > +	blkdev_put(bdev, FMODE_READ);
> >  #endif /* CONFIG_BLOCK */
> >  =

> >  	if (!(fc->sb_flags & SB_SILENT))
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
