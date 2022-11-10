Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A0C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 01:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i37ruPVPGrH7iQXQbalpLwLpWQuscL5YwYp9n1L/F0E=; b=raRa7iU+3l0uU5
	avZTSyCr4ZYfQDT1iE7ZqoepkB9wSC90fiv6fhciF5hymotT67ziKmfLo/3xZIkMHno3sphD19ZPp
	KqNjXPzDS92D52hSZL046vBiLt7OYLsziHFCPoADueJwd22QjrF+tUKlOfnE+4zXATeG9vy13vLaw
	eBA+RogbVSCensbjCzgQ13AvP5eoFY3FLEl/670wYHgVj1gTRFb8xHacW/StQ9qNR01i4Ou8JtNCI
	W7fE0o7X65T0LIfS3B31YaENEbOhAegB7Q1WorIQZZE7PxngJZGD/J7lbmhpxm5hONWgAFVdh7Eqw
	LPikvGJkXwuMVuDj7ONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswmC-001jhr-P1; Thu, 10 Nov 2022 01:54:44 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oswlv-001jam-Rh
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 01:54:29 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1oswlW-0002Yx-Jg; Thu, 10 Nov 2022 02:54:02 +0100
Date: Thu, 10 Nov 2022 01:52:43 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 2/5] block: add partition parser for U-Boot uImage.FIT
Message-ID: <Y2xZa9z3HHtddG3t@makrotopia.org>
References: <Y2rgNEQlxKgiIDdk@makrotopia.org>
 <Y2uyBYyQOC4O5iep@casper.infradead.org>
 <Y2u62z4DQVENz69L@makrotopia.org>
 <Y2vhfdhvw0PADeIF@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2vhfdhvw0PADeIF@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_175427_901571_7F393CF9 
X-CRM114-Status: GOOD (  28.57  )
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

On Wed, Nov 09, 2022 at 05:21:01PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 09, 2022 at 02:36:11PM +0000, Daniel Golle wrote:
> > On Wed, Nov 09, 2022 at 01:58:29PM +0000, Matthew Wilcox wrote:
> > > ... actually, why can't you call read_part_sector() and avoid all of
> > > this?
> > 
> > I've tried that before and the problem is that read_part_sector()
> > returns a pointer to one sector (typically 512 bytes) of data.
> > And this pointer should not be accesses beyond sector boundaries,
> > right? You'd have to call read_part_sector() again for the next
> > sector.
> > 
> > The FIT structure, however, usually exceeds the size of one sector,
> > and having a continous memory area covering the structure as a whole
> > is crucial for libfdt to do its job.
> > 
> > I could, of course, use read_part_sector() to copy all sectors
> > covering the FIT structure into a buffer, but that seemed strange
> > given that read_part_sector() actually used read_mapping_page()
> > (and now uses read_mapping_folio()) internally and then returns a
> > pointer to the offset within the page/folio. So why not read it in one
> > piece in first place instead of having it first split up to sectors
> > by read_part_sector() just to then having to reassemble it into a
> > continous buffer again.
> 
> Are you guaranteed that it's "sufficiently" aligned on storage so
> that it fits entirely within a single page?  If not, you'll have
> to copy it, vmap it, or fix libfdt to handle a segmented buffer.

Yes, for the uImage.FIT to be usable for the partition parser it has
to be page-aligned.

There is a check which makes sure that this is the case:
> +	/* uImage.FIT should be aligned to page boundaries */
> +	if (fit_start_sector % (1 << (PAGE_SHIFT - SECTOR_SHIFT)))
> +		return 0;

In case of mtdblock or ubiblock devices, the image always starts at
offset 0, so this is never a problem.
In case of the image being stored in a GPT partition, one has to make
sure that the start sector of the partition is page aligned, otherwise
the above check will fail and the partition parser will bail out.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
