Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3C4C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBvPgdyJfCrQePlzuREFDQ9omfWhSPWpzB+7HrSDwZM=; b=ljCT4NM7vEnlVE
	EHF03AahnKTsA7qdS3jPUxg2slyRVfscxmvI49aL3TN8ohgVQc0251pB1ZiM6lL/l7758mgWuqWT4
	bRKaRCGII9clcJEp69Rl9SS5fm/IlZgBILoPU0C3tLHsIPCgW3f7b/ksqG0V+zAXcNzFRbNlB0VCc
	v0MnI2XV3QSYZhp2l8THAAYolvTJyb6GM4/ttGmR39DwB3DznX+bFugwgcfcD397D7a5E6m5N5H4p
	IOZ7/+1ujQ/S3wTIabUW5CJn3vP1zYQ2k4tUIZ3QJnCjmCNSQWgkgCRh/5M/+axjHqGgwkVbQS9dN
	HZvPJfEWFb1VOHvTcTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osol6-00FUfs-8n; Wed, 09 Nov 2022 17:21:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osol4-00FUfN-UF
	for linux-mtd@bombadil.infradead.org; Wed, 09 Nov 2022 17:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U8E7Jm8e1876qUqey5/8BiJLc1XaDBvWcjC7yx9ROzg=; b=gmH5h/mQ6qEquszdoCqVrpILhD
	iK+Kn9JHkuehJ2b1rL/vezAXYWk0g3pgHr7Iy/bU1gc3he4FIVq3yXOY55t5UfEjBxHetnvUf7TEN
	sA7IMRXPsK/N42x13tITnCCN/virflVFzUjbq/NWOF+5NR7/TJJCqt76qufO0ugPmwCpdfJJivc5a
	osQkbkyKeXSgy0E4O0x9ZfTPlAFK/2N170Qq7YhrJqYEP+1KaiC2loLtcK8AdIBu3jn/6awOQon6Z
	jv7RxpJFjzlqVSJ4ty0ykIzFEYXt2wMLx5Hh5VwgxdpsOcaf/3h9HS4qDfKuj4uHxAEnu4qohzwjs
	2sB3e4pQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osol3-00BLdJ-H0; Wed, 09 Nov 2022 17:21:01 +0000
Date: Wed, 9 Nov 2022 17:21:01 +0000
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
Message-ID: <Y2vhfdhvw0PADeIF@casper.infradead.org>
References: <Y2rgNEQlxKgiIDdk@makrotopia.org>
 <Y2uyBYyQOC4O5iep@casper.infradead.org>
 <Y2u62z4DQVENz69L@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2u62z4DQVENz69L@makrotopia.org>
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

On Wed, Nov 09, 2022 at 02:36:11PM +0000, Daniel Golle wrote:
> On Wed, Nov 09, 2022 at 01:58:29PM +0000, Matthew Wilcox wrote:
> > ... actually, why can't you call read_part_sector() and avoid all of
> > this?
> 
> I've tried that before and the problem is that read_part_sector()
> returns a pointer to one sector (typically 512 bytes) of data.
> And this pointer should not be accesses beyond sector boundaries,
> right? You'd have to call read_part_sector() again for the next
> sector.
> 
> The FIT structure, however, usually exceeds the size of one sector,
> and having a continous memory area covering the structure as a whole
> is crucial for libfdt to do its job.
> 
> I could, of course, use read_part_sector() to copy all sectors
> covering the FIT structure into a buffer, but that seemed strange
> given that read_part_sector() actually used read_mapping_page()
> (and now uses read_mapping_folio()) internally and then returns a
> pointer to the offset within the page/folio. So why not read it in one
> piece in first place instead of having it first split up to sectors
> by read_part_sector() just to then having to reassemble it into a
> continous buffer again.

Are you guaranteed that it's "sufficiently" aligned on storage so
that it fits entirely within a single page?  If not, you'll have
to copy it, vmap it, or fix libfdt to handle a segmented buffer.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
