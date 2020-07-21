Return-Path: <SRS0=j43f=BA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4500DC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 05:02:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A39120792
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 05:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LDL0ZMg7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A39120792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I50P3bcciDOrW8uCPbTsOO+6zJLMAOvVpf1RFNmkPJQ=; b=LDL0ZMg74aH60ArFXjQKvXdts
	fCTO9XIq9sJQGaQOCoPxTGR/EC110kx21v++Qiz/IxdeE8KtrnxVkjtEYnaaE1gNOxR1GPvG5Ld6h
	vTVYLNdxb57nl5HtlxnciD38Jsz1bvlOwO/NfYDq9MMjlJLANKG2/o4G80JrY2KrvcSbhper1vzHB
	GbeeKu9letbTRBc3VmEZYYtYgUumOsG6Szhu/M7kRPZVfim8qcjE9CsjxhN6+1gwgfb81e0qawK97
	67ism1NeXZXGgsJaWXhUKfNz4B6mI1xRGeu46KwVnncVRFUw7wGngYgVrL1+xOvcuCTBBZ2cLXXhs
	v08Jf7NjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxkOb-0001mf-Ly; Tue, 21 Jul 2020 05:00:53 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxkOZ-0001mG-I3
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2020 05:00:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 42A716736F; Tue, 21 Jul 2020 07:00:48 +0200 (CEST)
Date: Tue, 21 Jul 2020 07:00:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 04/14] bdi: initialize ->ra_pages in bdi_init
Message-ID: <20200721050047.GA9707@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
 <20200720075148.172156-5-hch@lst.de>
 <CAFLxGvxNHGEOrj6nKTtDeiU+Rx4xv_6asjSQYcFWXhk5m=1cBA@mail.gmail.com>
 <20200720120734.GA29061@lst.de>
 <2827a5dbd94bc5c2c1706a6074d9a9a32a590feb.camel@gmail.com>
 <CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvyxtYnJ5UdD18uNA97zQaDB8-Wv8MHQn2g9GYD74v7cTg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_010051_714458_70BBCB49 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Song Liu <song@kernel.org>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 device-mapper development <dm-devel@redhat.com>, linux-mtd@lists.infradead.org,
 linux-mm@kvack.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 cgroups mailinglist <cgroups@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 11:27:57PM +0200, Richard Weinberger wrote:
> On Mon, Jul 20, 2020 at 2:37 PM Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > On Mon, 2020-07-20 at 14:07 +0200, Christoph Hellwig wrote:
> > > What about jffs2 and blk2mtd raw block devices?
> 
> I don't worry much about blk2mtd.
> 
> > If my memory serves me correctly JFFS2 did not mind readahead.
> 
> This covers my knowledge too.
> I fear enabling readahead on JFFS2 will cause performance issues, this
> filesystem
> is mostly used on small and slow NOR devices.

I'm going to wait for Hans for feedback on vboxsf, but in doubt I'll
ust add a prep patch or fold for this one to explicit set ra_pages to 0
with a comment then.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
