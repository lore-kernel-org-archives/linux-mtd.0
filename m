Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC79CC4346E
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 18:19:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B4920888
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 18:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iAVEi1VF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B4920888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bkv0SEQSKkxP0IbIlm5HJ9GN03VNf6Rk+QyjL34dFYQ=; b=iAVEi1VFuCfNIarF0qrfy40OZ
	A2MOcVDCwxxDCT2TF7x+iZlCyXY6wu7CPZ2qvzf/Xxh8KaysdIsRBYojxEWJSYUN4/PU2ZM/F+KIA
	N4pIxzigsirM0THrsh0jB07hMjzWA++atQAL25XXdeoWeEuxRCOSmJZHJC1/n8g6+uY07KE68XUz1
	K5G0A7JgfdIhqsrdcPsj3e4IJongVnkXxrF/aPU0l9qbPzq3UqVRwrgwHcpOrKcsgaOQuqML7GlJH
	yQM/uHoOJDh3cmie3r4ZcH8wUUx92ERMeR8cAdnti6NdRc9MRMGnh2aSnK/QlqCfmbtyqnHw3LYu6
	qw4Twwtew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKQOk-000099-A6; Mon, 21 Sep 2020 18:18:46 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKQOh-00007p-Ps
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 18:18:44 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 259D968B02; Mon, 21 Sep 2020 20:18:42 +0200 (CEST)
Date: Mon, 21 Sep 2020 20:18:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Subject: Re: [PATCH 03/13] bcache: inherit the optimal I/O size
Message-ID: <20200921181841.GB2067@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
 <20200921080734.452759-4-hch@lst.de>
 <b547a1b6-ab03-0520-012d-86d112c83d92@suse.de>
 <20200921140010.GA14672@lst.de>
 <5bcc52dc-ca8f-bbdd-69ef-4b6312e7994a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bcc52dc-ca8f-bbdd-69ef-4b6312e7994a@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_141843_965709_1A5DEFFA 
X-CRM114-Status: GOOD (  14.74  )
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
 Hans de Goede <hdegoede@redhat.com>, Justin Sanders <justin@coraid.com>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 11:09:48PM +0800, Coly Li wrote:
> I feel this is something should be fixed. Indeed I overlooked it until
> you point out the issue now.
> 
> The optimal request size and read ahead pages hint are necessary, but
> current initialization is simple. A better way might be dynamically
> setting them depends on the cache mode and some special configuration.
> 
> By your inspiration, I want to ACK your original patch although it
> doesn't work fine for all condition. Then we may know these two settings
> (ra_pages and queue_io_opt) should be improved for more situations. At
> lease for most part of the situations they provide proper hints.
> 
> How do you think of the above idea ?

Sounds like a plan.  I'd reall like to get this series in to get
some soaking before the end of the merge window, but we should still
have plenty of time for localized bcache updates.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
