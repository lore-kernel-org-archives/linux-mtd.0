Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CD6C26640
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 17:32:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FFA020880
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 17:32:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LM38kqcN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+GbEyYE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FFA020880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUTEcVxbm8vhHJ0zV4JhDLWTdsczQIZUrty03wPQ0Eo=; b=LM38kqcNYG9txa
	6e9WcvhtzdqUDt2Z1QpwmO8yNvV2eLia/KcNxl3BOUNcba/eLWkvZ/xFTau756zaS7xW07qBr/VEs
	wZJn5j1ygrOa/aCHMihPh+M0UBeXg5ZV58Qej/TGg87J4LuJhzlbCCsW5f3caUCeqQ+NUg8COTk/n
	EGnkEtyAflu0qSmCxKwtEjrbn2LiAvPADzG9vJfRjEsxZQI2dGFqDyZGIz91mW86I6LR5kV1EaMdR
	YeUm9LZ77p/Kjc7y1ii5QSgze8U/DiKdOgp48NEdjn8SJZXC5aN3cTHjar/CTuUf6qM6iOESvZ1Aj
	LpG5CKXpjXzLU1Hn+Kzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glGxB-00069k-3u; Sun, 20 Jan 2019 17:32:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glGx8-00069N-G0
 for linux-mtd@lists.infradead.org; Sun, 20 Jan 2019 17:32:11 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA5172085A;
 Sun, 20 Jan 2019 17:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548005529;
 bh=+AdZNOVwTBhXWTabMzMLVyPQ2tK9fDH6AVty9yJ5OBo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h+GbEyYE+4MS7ht/pGIPJHykCU0jZNIWOYoyUBjDelLzPhCMn6iAXso1MfmNSdaeO
 g0aSq1VoeJ+wAvExdU7egcx38n7W9fcZQvjGdr5sdpbrF2QfZoDqrxhzlxc0THQq0D
 +pb9DwhlzWpCPUBZCR3vPXwL4H3N4aImMQf5rfIE=
Date: Sun, 20 Jan 2019 18:31:56 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190120183156.1bd98914@bbrezillon>
In-Reply-To: <20190118233943.5f003eef@bbrezillon>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118233943.5f003eef@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_093210_554480_40324A29 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 23:39:43 +0100
Boris Brezillon <bbrezillon@kernel.org> wrote:


> > Otherwise,
> > +	 * then we check page0. And if page0 is programmed, and page13
> > +	 * is not programmed, then we start to check from page11, page9,
> > +	 * page7, page5, page3 respectively since the pages of PEB are
> > +	 * programmed sequentially.  
> 
> Looks overly complex for only a small gain. Did you try writing X (X
> being 14 in this case) pages all the time? If you did, how does it
> compare to this version (perf-wise). I suspect that reading pages
> before potentially overwriting them will actually take more time than
> blindly overwriting 14 pages with 0x00.

I looked at various datasheets and PROG time is indeed much bigger than
READ time, so the benefit of reading before writing is mainly dependent
on the page transfer time on the bus, which is highly dependent on the
controller and the page size. Maybe it's not such a bad idea to try to
figure out which pages have been written before overwriting them (but
in some cases it might be worse than directly overwriting the 16
first pages).

In any case, I think it'd be good to keep track of which pages have been
programmed at runtime. Assuming you only want to track the 16 first
pages, all you'll need is an u16 (bitmap) per block. When any of the 16
first pages of a block is written you set the corresponding bit, when
the block is erased you clear the u16 entry. This way, you only have to
figure out which blocks are partially written once after a cold boot.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
