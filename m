Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B3EC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JW5lEC3qvz13p/7JDn1XWFd3NolBspAyDOI7jxSX/lk=; b=WENXUFIdOlQMjv
	fXeNTtmOyPkD2+4/UwsIVPhHR8chAERd4m5obMFlQGjZGBsKs25BT8AQhlr5QyMP1r9WTp9/kUGzB
	SSPF8Y00+BgDyri8KNOtqU+GZ6bXUQ0fWbdo4DgkMY88dI/ZlsV0pTEy+JqbANiEewmvQ3nyUghZ/
	Pq+5AKKyLToEbhD1myTLVu+SPHDOITkhFjYiHSUDcfl7I1vuDvwkc+jArPL+HyALlY+BuRH73UtrZ
	aOI7PJoxCq64CtbhtiicHkOjgKVLCFYEBtXAAlAHPAAp/E2uBBjozI8EQO2R7qYfvMQ9Ui6VXadzj
	iAVJreRGjIVkK8hHsBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osmC2-00EAbZ-0w; Wed, 09 Nov 2022 14:36:42 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osmBy-00EAa3-JQ
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 14:36:39 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1osmBa-0008KM-BE; Wed, 09 Nov 2022 15:36:14 +0100
Date: Wed, 9 Nov 2022 14:36:11 +0000
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
Message-ID: <Y2u62z4DQVENz69L@makrotopia.org>
References: <Y2rgNEQlxKgiIDdk@makrotopia.org>
 <Y2uyBYyQOC4O5iep@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2uyBYyQOC4O5iep@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_063638_647122_1608B20A 
X-CRM114-Status: GOOD (  21.99  )
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

On Wed, Nov 09, 2022 at 01:58:29PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 08, 2022 at 11:03:16PM +0000, Daniel Golle wrote:
> > +	/* map first page */
> > +	page = read_mapping_page(
> > +		mapping, fit_start_sector >> (PAGE_SHIFT - SECTOR_SHIFT), NULL);
> > +
> > +	if (IS_ERR(page))
> > +		return -EFAULT;
> > +
> > +	if (PageError(page))
> > +		return -EFAULT;
> 
> Why are you checking for PageError?  You won't ever get a page with an
> error back from read_mapping_page().  And you have the real error in
> 'page', so why return -EFAUlT, which would indicate a problem copying
> from the user.  Also, this is a great place to use the new folio APIs
> instead of the old page APIs.  So:
> 
> 	folio = read_mapping_folio(mapping,
> 			fit_start_sector >> PAGE_SECTORS_SHIFT, NULL);
> 	if (IS_ERR(folio))
> 		return PTR_ERR(folio);
> 
> > +	init_fit = page_address(page);
> 
> 	init_fit = folio_address(folio) +
> 			offset_in_folio(folio, fit_start_sector * SECTOR_SIZE);
> 
> > +	if (!init_fit) {
> > +		put_page(page);
> > +		return -EFAULT;
> > +	}
> 
> page_address() or folio_address() can't ever return NULL, you should
> just drop this nonsense check.

Thank you for the pointers, I will implement your suggestions and post
v5 after the upcoming weekend.

> 
> ... actually, why can't you call read_part_sector() and avoid all of
> this?

I've tried that before and the problem is that read_part_sector()
returns a pointer to one sector (typically 512 bytes) of data.
And this pointer should not be accesses beyond sector boundaries,
right? You'd have to call read_part_sector() again for the next
sector.

The FIT structure, however, usually exceeds the size of one sector,
and having a continous memory area covering the structure as a whole
is crucial for libfdt to do its job.

I could, of course, use read_part_sector() to copy all sectors
covering the FIT structure into a buffer, but that seemed strange
given that read_part_sector() actually used read_mapping_page()
(and now uses read_mapping_folio()) internally and then returns a
pointer to the offset within the page/folio. So why not read it in one
piece in first place instead of having it first split up to sectors
by read_part_sector() just to then having to reassemble it into a
continous buffer again.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
