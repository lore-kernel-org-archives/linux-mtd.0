Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE20BC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1HbOinxaqh2lBlnfZujY6O3DCvx7MXRn9Nx8J1pP7A=; b=3wm4QBqtltqYNZ
	o/FEphcpP8PS00znEWbx2RDujvC5kdyItwmWJSDVFby/65/he7OUyKVA5OhVtoakTQJVHw8KuX8E0
	Jg+rNn7YVveZhibzXw/c14/hmbI4+X/zxesWopQommVT7CSXYn8G8FoZcG+MDJ0Hz6DOycYzzGGo2
	OeY62Z7fHwQq0FrZz1zKQO/8sgX0IES3dSn9NdA5be+ppvbM8p/89uYKUxDl09qhxd4EWosT5ndmR
	Uf92j7M7yiEUKz0QLmIbjrNnmlvgXTkbgLyTar/DZDDHngl+gGQVAyTlbANYbYAkaCia3chUEfT+I
	NOj56z5JQSHQ2JlmNL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskr5-00DdvX-0e; Wed, 09 Nov 2022 13:10:59 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oskr1-00DdqI-4L
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 13:10:56 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oskqh-000828-0n; Wed, 09 Nov 2022 14:10:35 +0100
Date: Wed, 9 Nov 2022 13:10:31 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
Message-ID: <Y2umx75DC8+XDlgd@makrotopia.org>
References: <Y2rgbfpYfpbLKHaf@makrotopia.org>
 <20221109134526.158047e1@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109134526.158047e1@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_051055_179040_29D809B5 
X-CRM114-Status: GOOD (  29.99  )
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

Hi Miquel,

On Wed, Nov 09, 2022 at 01:45:26PM +0100, Miquel Raynal wrote:
> Hi Daniel,
> =

> daniel@makrotopia.org wrote on Tue, 8 Nov 2022 23:04:13 +0000:
> =

> > Add Kconfig boolean CONFIG_MTD_BLOCK_PARTITIONS and enable block
> > partition parsers on non-NAND mtdblock devices in case it is selected.
> > =

> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/Kconfig       | 11 +++++++++++
> >  drivers/mtd/mtd_blkdevs.c |  4 +++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index 796a2eccbef0..12874dec1569 100644
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> > @@ -69,6 +69,17 @@ config MTD_BLOCK_RO
> >  	  You do not need this option for use with the DiskOnChip devices. For
> >  	  those, enable NFTL support (CONFIG_NFTL) instead.
> >  =

> > +config MTD_BLOCK_PARTITIONS
> > +	bool "Scan for partitions on MTD block devices"
> > +	depends on MTD_BLOCK || MTD_BLOCK_RO
> > +	default y if FIT_PARTITION
> > +	help
> > +	  Scan MTD block devices for partitions (ie. MBR, GPT, uImage.FIT, ..=
.).
> > +	  (NAND devices are omitted, ubiblock should be used instead when)
> > +
> > +	  Unless your MTD partitions contain sub-partitions mapped using a
> > +	  partition table, say no.
> =

> Actually I know I've acked this patch in the past but I am now
> wondering again if this is the right way so I would like to discuss
> this again. I don't feel making partitions on top of blk devices like
> that is the right solution. Why not using the advanced partition
> parsers that we now have in MTD to create these subpartitions and then
> have blocks emulated on top of them?

Simply because then we would need the same parser implemented one time
as block/partitions/fit.c (for devices booting from SATA or eMMC, for
example) and then another time as drivers/mtd/parsers/parse_fit.c (for
devices using raw NOR flash) and for UBI there isn't even any
infrastructure allowing the dynamic splitting of UBI volumes (hence we
would need to invent a new splitting/partitioning mechanism on top of
UBI just for that).

Using the block partition parser as common ground for all three storage
types typically found in embedded devices seemed like the best idea, as
in that way I only had to implement the uImage.FIT parser once.


> =

> > +
> >  comment "Note that in some cases UBI block is preferred. See MTD_UBI_B=
LOCK."
> >  	depends on MTD_BLOCK || MTD_BLOCK_RO
> >  =

> > diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> > index 60b222799871..e6f2e0888246 100644
> > --- a/drivers/mtd/mtd_blkdevs.c
> > +++ b/drivers/mtd/mtd_blkdevs.c
> > @@ -359,7 +359,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *n=
ew)
> >  	} else {
> >  		snprintf(gd->disk_name, sizeof(gd->disk_name),
> >  			 "%s%d", tr->name, new->devnum);
> > -		gd->flags |=3D GENHD_FL_NO_PART;
> > +
> > +		if (!IS_ENABLED(CONFIG_MTD_BLOCK_PARTITIONS) || mtd_type_is_nand(new=
->mtd))
> > +			gd->flags |=3D GENHD_FL_NO_PART;
> >  	}
> >  =

> >  	set_capacity(gd, ((u64)new->size * tr->blksize) >> 9);
> =

> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
