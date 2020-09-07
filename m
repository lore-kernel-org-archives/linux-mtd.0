Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF087C43461
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:17:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40719206B8
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qsyHrQis";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Pbd+9xsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40719206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KkM/yws01Kfn2558yBhystMj1kLHIxhnG/mo9MmcCRs=; b=qsyHrQis5PqhFjeGItC/H/IHq
	o285kqs7fWYobwYvr+X+n/3z7Kgns9FEvNBBHHYovgy42COzYFvH6JWAE90H0FbMklkKBIZePDxH2
	I16bEmjD2EZ598GiRJVoP1vOylbeFNia6ke6Z4sODQ14qXRA25iAOw4JbnTvxoZW5tF3ppXK1+sB1
	4ls2WIpcwXHoJByifOS6tulnis0NAZuOrC5wqjHuC4xrMG5t2BDJZdzvwUli/R5NszsWe3DsmDpGQ
	HrEqh+/kdyoH0ROoydf+V18R2Sgpb8SAXDhiPi1L8hwLC3oyOt/CZWyOtnXcIInH2aIR1bVHTor3E
	p/Sr7nwpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBO2-0001X1-6j; Mon, 07 Sep 2020 07:16:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBO1-0001Ws-H9
 for linux-mtd@merlin.infradead.org; Mon, 07 Sep 2020 07:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=We0sSC8v6x+i+H5IB1utCVAHV7Fxl84IsWXy46L4uYM=; b=Pbd+9xsTy+ypaF0EJnxn5xkUQI
 Yvh3apado2jso0FhuR30M6SQ4zcmbr72gGJ4DEJVQ0Ul+Hr8xAHblV6jt99emldM+nvwqJ+8NDcic
 Rf+H9ENRjqUsaC42EJVEbjLKwz7t4QsCuAdrbke0d7m9WgZioZBI8sa3asTgdUd/G3f4HHWO00FWe
 8RrfC2kzuN+ST7YxHifWYgkB4K+uMzRMK9NYEjoDZFOAiq0I9rR4xkhD80o9EFME1MVIvS4MKLdPC
 eBsvfA9l9bKSVDkKmqNIlWMafghDJstAf5B8s71F2aIstErhESfdxAjYgpVju5F3FAhRt9oBANIXy
 LP9xlhRw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFBNz-0007Zm-RE; Mon, 07 Sep 2020 07:16:19 +0000
Date: Mon, 7 Sep 2020 08:16:19 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Bean Huo <huobean@gmail.com>
Subject: Re: [PATCH RFC] mm: Let readahead submit larger batches of pages in
 case of ra->ra_pages == 0
Message-ID: <20200907071619.GA28569@infradead.org>
References: <20200904144807.31810-1-huobean@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904144807.31810-1-huobean@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 04:48:07PM +0200, Bean Huo wrote:
> From: Bean Huo <beanhuo@micron.com>
> 
> Current generic_file_buffered_read() will break up the larger batches of pages
> and read data in single page length in case of ra->ra_pages == 0. This patch is
> to allow it to pass the batches of pages down to the device if the supported
> maximum IO size >= the requested size.

At least ubifs and mtd seem to force ra_pages = 0 to disable read-ahead
entirely, so this seems intentional.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
