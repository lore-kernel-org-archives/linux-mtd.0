Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9A7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmX+6LSI97DpzHw6Sy9xvhkF8/ovU3cTAxo/NbCrTXM=; b=Dvuj+MQFlg1FJ7
	VghpuY3vUiBYieCppsOyQmYDr33AxeF2Ja0vVJu+xrOUdGVT7ebu7HT/H4vBUsV2XLc7rBGi+WWhv
	/Jt9WqbyGpfAm2QZSxi8jNKSGzZCvae8T7zrujkNcPIe460yIXfUwVALihnczZDzeAl2N1e86bR5Q
	icwmKg9AhP+uKZZsLXnlCU43Xie5NnlKsHF56JVC7iyrZ2vrun8vpf1TFgkYzEqyDXpg5sZaFZtgY
	EeJhxuR3xiGPIWDXvjLxCyTAwGpycruW0B4HB6pNe8wwV7p910PwLLbLDGEEmhiSQroDwB6tH4K03
	mHBhGoImeRPJeOq1Qw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njNXl-00FDlf-Rv; Tue, 26 Apr 2022 15:56:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njNXh-00FDiX-Pb
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 15:56:01 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1njNXX-0005kf-Tn; Tue, 26 Apr 2022 17:55:48 +0200
Date: Tue, 26 Apr 2022 16:55:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 4/5] mtd_blkdevs: scan partitions on mtdblock if
 FIT_PARTITION is set
Message-ID: <YmgWAXieuXTlz1bk@makrotopia.org>
References: <Yma3ck/hygQ0badz@makrotopia.org> <20220426093710.6ec48b5e@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426093710.6ec48b5e@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_085557_882627_49088C49 
X-CRM114-Status: GOOD (  18.96  )
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

On Tue, Apr 26, 2022 at 09:37:10AM +0200, Miquel Raynal wrote:
> Hi Daniel,
> =

> daniel@makrotopia.org wrote on Mon, 25 Apr 2022 16:00:02 +0100:
> =

> > Enable partition parsers on plain mtdblock devices in case of
> > CONFIG_FIT_PARTITION being selected.
> > =

> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  drivers/mtd/mtd_blkdevs.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > =

> > diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> > index f7317211146550..e9759c4182f8d5 100644
> > --- a/drivers/mtd/mtd_blkdevs.c
> > +++ b/drivers/mtd/mtd_blkdevs.c
> > @@ -359,7 +359,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *n=
ew)
> >  	} else {
> >  		snprintf(gd->disk_name, sizeof(gd->disk_name),
> >  			 "%s%d", tr->name, new->devnum);
> > +#ifndef CONFIG_FIT_PARTITION
> =

> Can we use a regular 'if' here?

I'll introduce additional Kconfig options to enable scanning for
(sub-)partitions on MTD block and UBI block devices as Christoph Hellwig
correctly critizied that re-using this unrelated Kconfig option is
misleading.

I'll also use
if (IS_ENABLED(...))
instead of
#ifdef ...
for better coverage testing.

Now going to wait a few more days for more comments and then re-send.

Thank you for the review!

> =

> >  		gd->flags |=3D GENHD_FL_NO_PART;
> > +#endif
> >  	}
> >  =

> >  	set_capacity(gd, ((u64)new->size * tr->blksize) >> 9);
> =

> Thanks,
> Miqu=E8l
> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
