Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571F5C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=an4JP71KpWHhm91WgQpxV9oLebgTT3ItmrcoEVRhAzM=; b=KneNaHYsDDIasq
	NrAsZfjuH8/9yL4LO/kNbR633Xm7SLxugnD+/Ib1ClLFvg1YYgITOGMLfmz+w7WtQCdnPsQbbbD/s
	UreLr6xNDLKn5+lY7gD60r9q9dCvdeB4WXl37lvCtaIL0AcB7sZxaIMsMtb17quni2vWdtDlDEmhd
	1nzLVG+4C/z1gFEy3wdBONfIyns0MZCQzi8LFOvmAWh7ETrNTmktDpHbze9YUM5akBGxkvsRBGHuU
	UwOmfrkLf8zaLrXZkIZDgucTrwWX+kLA2Gb/+fg6ZZlxRFoR6E4iQPPOXjvcBZL2vI1lWLiaacSgC
	cH8plctLHuG7Vsnis4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nya8f-0082zM-SP; Tue, 07 Jun 2022 14:24:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nya81-0082bB-QF
	for linux-mtd@bombadil.infradead.org; Tue, 07 Jun 2022 14:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TMQU2bbtV5kjI1Y7uBOgpmsi6MujvLdf4se1f0ultbQ=; b=T3tONSSZEZI3TnW91MAPGKwqdn
	ynmJAoI6mOfrbbq8Jqf2czJGvi9Q0ukvLmmikcGSI8ZqHSwvRkTwLUTylDBqG6RaX8/3fM9Nvve4c
	VqFvCNQX2J5+bZcWx69Xcxl0FnIF/+ozKW4FHlSZHfTn6FEQTfoWOYo1nVdtg5lJcedIUJr0ygYNv
	BxeGZpOaFU4iqywNAUPFsAq2KhxI0Hbg9OXTdHy26nItEezSSsuIGEVlhH9A3QRH3TI9Fv56fknf8
	0pc9AkwczXake1fj6Qt6cCxOadkgaG3Xkumb8mMGujy60/hhxbEX20y0v48fX/CV/o6oaLLnenmYd
	w0xneMdA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nya7z-00BhZy-2Z; Tue, 07 Jun 2022 14:24:15 +0000
Date: Tue, 7 Jun 2022 15:24:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 15/20] balloon: Convert to migrate_folio
Message-ID: <Yp9fj/Si2qyb61Y3@casper.infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-16-willy@infradead.org>
 <e4d017a4-556d-bb5f-9830-a8843591bc8d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4d017a4-556d-bb5f-9830-a8843591bc8d@redhat.com>
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

On Tue, Jun 07, 2022 at 09:36:21AM +0200, David Hildenbrand wrote:
> On 06.06.22 22:40, Matthew Wilcox (Oracle) wrote:
> >  const struct address_space_operations balloon_aops = {
> > -	.migratepage = balloon_page_migrate,
> > +	.migrate_folio = balloon_migrate_folio,
> >  	.isolate_page = balloon_page_isolate,
> >  	.putback_page = balloon_page_putback,
> >  };
> 
> I assume you're working on conversion of the other callbacks as well,
> because otherwise, this ends up looking a bit inconsistent and confusing :)

My intention was to finish converting aops for the next merge window.

However, it seems to me that we goofed back in 2016 by merging
commit bda807d44454.  isolate_page() and putback_page() should
never have been part of address_space_operations.

I'm about to embark on creating a new migrate_operations struct
for drivers to use that contains only isolate/putback/migrate.
No filesystem uses isolate/putback, so those can just be deleted.
Both migrate_operations & address_space_operations will contain a
migrate callback.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
