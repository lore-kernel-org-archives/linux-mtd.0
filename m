Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46242C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 07:02:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED86620866
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 07:02:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iIUsnKc0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED86620866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AxYuqKuAWRYJtoUIZarpuLjBnLXCIpwCOo6Pd4aMqhA=; b=iIUsnKc0v5HXJZ+Qv9lI7w6r1
	68dgSbAl4ENf3yPg9NwCk84ajkMwSMzh8UJZn7il5z+74I3c9QvNYuKeQp3wus7SjK+OdY0z8feB3
	A2E1Pw8DXmmtAkm3vE0ejMBdvfUQ9zoSzZDHMmMSqV6+3QDQYxpzO6EIlT7oPyW5l9w1tqMYnbGyV
	lSMK2tlPAGM1QuEUK1RKXBn9BCjig953vSQO6wK8Ugz5dUiNnfdaAvMNDtaVSB9y/PCs+UNYpmtAe
	Sfd/KiNU9tNpG9RnvnMqZqfiaF7utDGJAueH/aAFObGAzNq1n1p9txar8pnfVI0TS9Fa3ZpGmLBCT
	dnEfx/GSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJWs6-00031T-Sj; Sat, 19 Sep 2020 07:01:22 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJWs4-00030p-Cv
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 07:01:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6D18468BEB; Sat, 19 Sep 2020 09:01:17 +0200 (CEST)
Date: Sat, 19 Sep 2020 09:01:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 04/12] bdi: initialize ->ra_pages and ->io_pages in
 bdi_init
Message-ID: <20200919070117.GB8237@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-5-hch@lst.de> <20200917100459.GK7347@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917100459.GK7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_030120_568108_E2F393D0 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 12:04:59PM +0200, Jan Kara wrote:
> On Thu 10-09-20 16:48:24, Christoph Hellwig wrote:
> > Set up a readahead size by default, as very few users have a good
> > reason to change it.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> > Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]
> 
> Looks good but what about coda, ecryptfs, and orangefs? Currenly they have
> readahead disabled and this patch would seem to enable it?

When going through this I pinged all maintainers and asked if anyone
had a reason to actually disable the readahead, and only vbox and
the mtd/ubifs maintainers came up with a reason.

> 
> > diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> > index 8e8b00627bb2d8..2dac3be6127127 100644
> > --- a/mm/backing-dev.c
> > +++ b/mm/backing-dev.c
> > @@ -746,6 +746,8 @@ struct backing_dev_info *bdi_alloc(int node_id)
> >  		kfree(bdi);
> >  		return NULL;
> >  	}
> > +	bdi->ra_pages = VM_READAHEAD_PAGES;
> > +	bdi->io_pages = VM_READAHEAD_PAGES;
> 
> Won't this be more logical in bdi_init() than in bdi_alloc()?

bdi_init is also used for noop_backing_dev_info, which should not
have readahead enabled.  In fact the only caller except for
bdi_alloc is the initialization of noop_backing_dev_info.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
