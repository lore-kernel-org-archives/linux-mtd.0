Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE9DC2D0E4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 14:54:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90BF20658
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 14:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xh/0xOsj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D90BF20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H6/ZYszWq+U3Q+9BgvZHTkYTi6LfT5Q5XPKKEbNsqFo=; b=xh/0xOsjyJzHOYObgd+KPCLZA
	JxcZXGUwnwCHMkbKaVHXy2grV+5fnDShLNacTO5/cl57xirj3KT+OZPPJQ3LpORTvFkVsiVK+y7LO
	9zfNoanT2vHTeOuFKp1FxQq64Rn/KAMSKQIJUXE1V9wDRHncerpqFOvCoblYfhumUWV5ZEoEM9H6L
	eBMH7x6pru014veWNbWdSRWNvO3f2fz1FebBRdTqudNK0ixLHRnYVyzxaMs2T8ZDPFB6UyZ81bihe
	XC8+21YXFEpRs2bRSuccOqx+hOqoDRzvRAYGi0qem+SR7IcIS6VvkQ6UppNxUQjLslsO/NQYIZDvH
	ZvZySLUMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khDDl-0002ko-Ba; Mon, 23 Nov 2020 14:53:37 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khDDi-0002ji-Iu
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 14:53:35 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id D9E696736F; Mon, 23 Nov 2020 15:53:31 +0100 (CET)
Date: Mon, 23 Nov 2020 15:53:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: simplify pstore-blk
Message-ID: <20201123145331.GA778@lst.de>
References: <20201016132047.3068029-1-hch@lst.de>
 <202010161553.F2BA6CF@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202010161553.F2BA6CF@keescook>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_095334_735501_203E6126 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: Tony Luck <tony.luck@intel.com>, Anton Vorontsov <anton@enomsg.org>,
 linux-kernel@vger.kernel.org, WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 03:54:25PM -0700, Kees Cook wrote:
> On Fri, Oct 16, 2020 at 03:20:38PM +0200, Christoph Hellwig wrote:
> > this series cleans up and massively simplifies the pstore-blk code,
> > please take a look.
> 
> Cool! Thanks for doing this work. I have a few things I'd like to see
> done differently, and while I'm not a huge fan of the general reduction
> in utility, I can live with it as long as it doesn't make other things
> worse. :) I'll get this reviewed with specific feedback soon, but I'm
> about to be EOW. ;)

Any progress on this in the last five weeks?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
