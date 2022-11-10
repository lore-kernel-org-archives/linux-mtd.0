Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D3EC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yX74jJQDUnUB3dksdY0mx8J+jpxLWx7HkbHR09PIAYQ=; b=x7RGfOnhlUlrAM
	S6DeeNtJuaPM8qwwGPlclLSQs2UH5y0Thzrg+Ur+UgcSXR3/pXXkLmt6MO2SzGIDkMLdGuT8hpCQ4
	5PkGpyeSOaMvTop36D4bXqf6mqSW20gno0wKWihYdTxXb7zNhKRT2M9XxuEn+uRIGvDl+hMNFnk7v
	1Ei1Zdvwo0RdomqtG0SWWoxSvxS/ZcRd4KJwLVoLj5BRqy8amOv/M8CDdDzuYauWRkRT1k9+X7Wjw
	O8R8ScoOpMCPxN89emazsBQzPew30582g6IxYgv5pQN3KXBW1XN7hpUeARGV2yQnGQVjwudyNVYKB
	vWxVLm594Chpu6mu6K7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot95X-006a8Z-8k; Thu, 10 Nov 2022 15:03:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot95W-006Zzl-7P
	for linux-mtd@bombadil.infradead.org; Thu, 10 Nov 2022 15:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dyByMJ1FnM8pS9wy50nx7QIU4ShnY0C2LEYs5nLdq7s=; b=BZ59WACHJvZgfqFRB11gUk1yT1
	brXqYTm1gv1aZxTv8tk2GAw2D+qpM99gV17oc69z0YTx6XC3caEX7i0sW7hIJXiCULSh5GMSgPDMe
	Ayqde6NPh7Cm5mazI4Gkmtd/s6UIg8p4x00orrdTwetPvHsBWREXjl0weKX53b3pDBMWeskm4idE7
	+IMqt/j9BV4KeytyL2eH4DoqZgEs5lDw5BKe8dlgSG8lfOlfOvRGnm/ecdmuCZ913y68IGrk3zBpO
	OzCgbyl+7DRlX2T8WzHF0abvztYBzhOcVcZh87PWfTLSuuLeZBDFqthO2I8LtrbuR7kbBp0TsopOl
	8zIn8MzA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot953-00C9kk-GP; Thu, 10 Nov 2022 15:03:01 +0000
Date: Thu, 10 Nov 2022 15:03:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 2/5] block: add partition parser for U-Boot uImage.FIT
Message-ID: <Y20SpcPNbdhcM9ps@casper.infradead.org>
References: <Y2rgNEQlxKgiIDdk@makrotopia.org>
 <Y2uyBYyQOC4O5iep@casper.infradead.org>
 <Y2u62z4DQVENz69L@makrotopia.org>
 <Y2vhfdhvw0PADeIF@casper.infradead.org>
 <Y2xZa9z3HHtddG3t@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2xZa9z3HHtddG3t@makrotopia.org>
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

On Thu, Nov 10, 2022 at 01:52:43AM +0000, Daniel Golle wrote:
> On Wed, Nov 09, 2022 at 05:21:01PM +0000, Matthew Wilcox wrote:
> > On Wed, Nov 09, 2022 at 02:36:11PM +0000, Daniel Golle wrote:
> > > On Wed, Nov 09, 2022 at 01:58:29PM +0000, Matthew Wilcox wrote:
> > > > ... actually, why can't you call read_part_sector() and avoid all of
> > > > this?
> > > 
> > > I've tried that before and the problem is that read_part_sector()
> > > returns a pointer to one sector (typically 512 bytes) of data.
> > > And this pointer should not be accesses beyond sector boundaries,
> > > right? You'd have to call read_part_sector() again for the next
> > > sector.
> > > 
> > > The FIT structure, however, usually exceeds the size of one sector,
> > > and having a continous memory area covering the structure as a whole
> > > is crucial for libfdt to do its job.
> > > 
> > > I could, of course, use read_part_sector() to copy all sectors
> > > covering the FIT structure into a buffer, but that seemed strange
> > > given that read_part_sector() actually used read_mapping_page()
> > > (and now uses read_mapping_folio()) internally and then returns a
> > > pointer to the offset within the page/folio. So why not read it in one
> > > piece in first place instead of having it first split up to sectors
> > > by read_part_sector() just to then having to reassemble it into a
> > > continous buffer again.
> > 
> > Are you guaranteed that it's "sufficiently" aligned on storage so
> > that it fits entirely within a single page?  If not, you'll have
> > to copy it, vmap it, or fix libfdt to handle a segmented buffer.
> 
> Yes, for the uImage.FIT to be usable for the partition parser it has
> to be page-aligned.
> 
> There is a check which makes sure that this is the case:
> > +	/* uImage.FIT should be aligned to page boundaries */
> > +	if (fit_start_sector % (1 << (PAGE_SHIFT - SECTOR_SHIFT)))
> > +		return 0;
> 
> In case of mtdblock or ubiblock devices, the image always starts at
> offset 0, so this is never a problem.
> In case of the image being stored in a GPT partition, one has to make
> sure that the start sector of the partition is page aligned, otherwise
> the above check will fail and the partition parser will bail out.

OK.  Then I think open coding it is the right idea, just with all
the cruft removed ;-)  I looked at extracting parts of
read_part_sector() into read_part_page(), but it ended up being
a two line function that wasn't terribly useful.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
