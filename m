Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B06C433E3
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:19:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9F7206F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOGWkZwn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9F7206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6VcamSZSiBw7J7Nh4pyE3SvhpDLH9BmwCdJTA6sBgYw=; b=XOGWkZwnE1cSAM3j+upKb4C7B
	hpNvO5bjsekKXFBlD8WP4pcXs6wXJpk6AdD0TkLT1k+L+YT4WSf5UorC0FQRyIcfu8rw7ONWB5iE5
	b06MqYT0xTlW+KsX5Xt3fZbaFRkANUJYtI/s9jYqjoJMJjapQsSGfynyGop1O1MSx+EYoRX4XXS4B
	auAfiZr5XzMFYUYmMF/w6HmMxYerNMPTFPLrunoJRW+GWe5lQ/N3iWr290DR1+ykv9RN0hHAoig0M
	zJwA85r93KDvJMKIeYPDQ5fa3Iq7dss0evQMB+F8qX7ha1dDO1NBvMm78B28OMeDNFEhB7ZQYUcrx
	sMIC8sIGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy917-0005WG-6B; Wed, 22 Jul 2020 07:18:17 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy915-0005Vi-F6
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 07:18:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D2936736F; Wed, 22 Jul 2020 09:18:11 +0200 (CEST)
Date: Wed, 22 Jul 2020 09:18:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Subject: Re: [PATCH 06/14] block: lift setting the readahead size into the
 block layer
Message-ID: <20200722071809.GA25816@lst.de>
References: <20200722062552.212200-1-hch@lst.de>
 <20200722062552.212200-7-hch@lst.de>
 <SN4PR0401MB3598470B14C754768A2D8F389B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4PR0401MB3598470B14C754768A2D8F389B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_031815_641673_690F7059 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2020 at 07:13:54AM +0000, Johannes Thumshirn wrote:
> On 22/07/2020 08:27, Christoph Hellwig wrote:
> > +	q->backing_dev_info->ra_pages =
> > +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
> 
> Dumb question, wouldn't a '>> PAGE_SHIFT' be better instead of a potentially 
> costly division?
> 
> Or aren't we caring at all as it's a) not in the fast-path and b) compilers 
> can optimize it to a shift?

That's my thinking.  If anyone has a strong preference I can change
it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
