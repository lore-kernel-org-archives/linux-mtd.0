Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A454C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 00:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asBhpsKAtNfaEQNpOyXUKIA53eCm2h4n03OjX351ksQ=; b=xGRrW0EztE5IIl
	7J2VDOXe2aGJtAg7hBAkKniuAR/km93pq3IPgKY+xQE0qO3gnOZD/BOgvvWG/kH9j3/hE8NXzAmxS
	pSlyLO7KyBzuJ8H47Kvsh9DvUyqFXEpf2HaTHYxsNvTfZO18j3vqcewG7mmTq1s9rruXkhDjgxBjh
	iCb0gla8I/gHbopsXHXnta4tZOsXKcCst4jOT61ijZe5wLisDNiSzG1CWrlmlMRuTSLd8T+bxEAyb
	+P5ZUIWicfppd80Vaq2GGdVgOgZz14G4Vf3z2I1ji1NDLe/qnJ2CTPGbtNvEk0j5qCJCskJtEUrNP
	jbtlduzaWkoLsB8mx2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyNIb-003v6Z-Ak; Tue, 07 Jun 2022 00:42:21 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyNIY-003v55-8E
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 00:42:19 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1nyNIM-0000rx-Ke; Tue, 07 Jun 2022 02:42:06 +0200
Date: Tue, 7 Jun 2022 01:42:01 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v3 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
Message-ID: <Yp6e2XXJ7SlkdX+B@makrotopia.org>
References: <Yn1ibyUeXZttNX2a@makrotopia.org>
 <20220603154804.2705bcb6@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603154804.2705bcb6@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_174218_333562_79AD517C 
X-CRM114-Status: GOOD (  26.56  )
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

On Fri, Jun 03, 2022 at 03:48:04PM +0200, Miquel Raynal wrote:
> Hi Daniel,
> =

> daniel@makrotopia.org wrote on Thu, 12 May 2022 20:39:27 +0100:
> =

> > Add Kconfig boolean CONFIG_MTD_BLOCK_PARTITIONS and enable block
> > partition parsers on non-NAND mtdblock devices in case it is selected.
> > =

> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  drivers/mtd/Kconfig       | 11 +++++++++++
> >  drivers/mtd/mtd_blkdevs.c |  4 +++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > =

> > diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> > index 796a2eccbef0b8..12874dec15692a 100644
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
> > +
> >  comment "Note that in some cases UBI block is preferred. See MTD_UBI_B=
LOCK."
> >  	depends on MTD_BLOCK || MTD_BLOCK_RO
> >  =

> > diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> > index f7317211146550..c67ce2e6fbeb0a 100644
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
> =

> I really wonder if we need this in mtdblock ? Isn't ubiblock enough?

One of the ideas behind this series is to be able to use the exact same
image (which includes a rootfs filesystem sub-image) on devices with
different boot storage options instead of having to write kernel and
root filesystems separately in a storage-type specific manner.

So the very same uImage.FIT on devices with block-based storage can be
written into a GPT partition (see 3/5), on devices with NAND flash
where UBI is used into a UBI volume (see 5/5) and on devices with NOR
flash into an MTD partition (this patch).

> =

> Anyhow,
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thank you for the review!


> =

> I'll let Richard ack the ubiblock patch.
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
