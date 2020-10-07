Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0968C4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 18:43:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1D92173E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 18:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FY+S3RfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F1D92173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2cXqdpSuXsff8sRqpTFDrZkreRHEXnXfYcfE6zg4BgM=; b=FY+S3RfSBOUyBO2UKoC2Pl9S1
	HPUL4aJ006OlrnvAJPbdCWvjR524GOmRKI3PWUkZhJ0rVUOYFASi5adzBPHsoc9XbJPQuzJkLSNyU
	6SGmFRFZibdwOGv8M4adlKwWB8RwMYLo4kTAlQ2fpR6EzQXGcpyO6za1u8tk4TJVQeMPQvtZrB5wR
	6Upx0EYbnQsa+q25+AAmb+vnJySMJY5rezT5T3fDwjoHwKCvctzgrrb+11GuT77pqxeyV1w6ZaL5i
	FU10D/H2ue9DCbrQiCHJGxN+weayXJygJg/anr95eXzpI6omf061tZp78zBtgTCaXX0j3Z2axHA1R
	MkoxsUgVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQEP6-00073t-50; Wed, 07 Oct 2020 18:43:08 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQEP3-00072v-0y
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 18:43:06 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0B5C168B05; Wed,  7 Oct 2020 20:42:59 +0200 (CEST)
Date: Wed, 7 Oct 2020 20:42:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: use case for register_pstore_blk?
Message-ID: <20201007184258.GA6157@lst.de>
References: <20201006155220.GA11668@lst.de> <202010070007.8FF59EC42@keescook>
 <20201007075537.GA12531@lst.de> <20201007083715.GA15695@lst.de>
 <202010071130.7EA00291@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202010071130.7EA00291@keescook>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_144305_690760_50D6595A 
X-CRM114-Status: GOOD (  23.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 WeiXiong Liao <gmpy.liaowx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The problem with the block code is that it is completely broken.
It uses on-stack structures where it can't, it pokes into internals
of the block device read/write path for absolutely not reason, and
it uses name_to_dev_t which must not be used in new code.

Or in other words: it is a complete piece of crap full of layering
violations that should never have been merged in that form.

It also does not happen to share code with the mtd case.

On Wed, Oct 07, 2020 at 11:40:36AM -0700, Kees Cook wrote:
> On Wed, Oct 07, 2020 at 10:37:15AM +0200, Christoph Hellwig wrote:
> > Looking at this more:  in addition to the block code being totally
> > broken, there is really no point in mtdpstore even using this code.
> > It does nothing but minimal parameter validation to just pass it
> > on to the pstore zone interface.  IMHO writing the mtd code directly
> > to the zone interface makes a whole lot more sense even if we grow
> > a non-broken block backend at some point.  Something like this:
> 
> I really don't like this, sorry. I'm using the pstore/blk bits myself
> already, and I don't want that removed. Additionally I really don't want
> the structures open-coded in the MTD driver. The whole point was to
> encapsulate it. I've spent a lot of time clawing pstore back from the
> brink of open-coded argument and member explosion. :)
> 
> I'm fine to drop the exported register_pstore_blk() API until someone
> actually uses it, but I want to keep pstore/blk itself and the existing
> separation between pstore backing devices and pstore storage logic so
> that configuration happens at the storage level, not the backing device
> level. My intent, for example, is to migrate ramoops to pstore/zone,
> etc, and remove all the ramoops-specific configuration which is common
> to pstore/zone.
> 
> -- 
> Kees Cook
---end quoted text---

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
