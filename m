Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4E5C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 06:59:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE732085B
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 06:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rnBsjzCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE732085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fQPGXiswFS2uD+ur9XeOWonzGEs8gL1CFRJaSuToseg=; b=rnBsjzCIeH7PotVKBMEzUorsw
	duO8x2Ac8S+esag/kdA5vFQzkPzygaLrbKYY+DKQha2wUZRKKoQ9EYCHXtPe+M5JJA99o0vTYUk4X
	41yp+MeGGoD2l5Ml2yY9fqamRT6+yaDlaHix5/Fi6ub3Mj6OE03lbSWOoHq5mhxPyT1EazpjNZ1Gx
	75KtXpNP9Go+aIMxIiynUXccZs9iiB89jvt7sk/vbL1RSRtfK2S2uaDvLVNKCR6KsXPlasCcQZvsY
	TYctrUJ0+dtU7OOqFQdUBZf7D/x3Mz38zJLzJOa/h7YW9CqTE2Evvk1wV3WS4OWY9G7RJ3vOnBj1M
	gomTzW0UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJWpB-0002oJ-8z; Sat, 19 Sep 2020 06:58:21 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJWp9-0002nw-Cl
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 06:58:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9D9B768BEB; Sat, 19 Sep 2020 08:58:16 +0200 (CEST)
Date: Sat, 19 Sep 2020 08:58:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 03/12] drbd: remove RB_CONGESTED_REMOTE
Message-ID: <20200919065816.GA8237@lst.de>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-4-hch@lst.de> <20200917095507.GJ7347@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917095507.GJ7347@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_025819_563159_4DF68C78 
X-CRM114-Status: GOOD (  14.17  )
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
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 11:55:07AM +0200, Jan Kara wrote:
> On Thu 10-09-20 16:48:23, Christoph Hellwig wrote:
> > This case isn't ever used.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> 
> Are you sure it's never used? As far as I'm reading drdb code the contents
> of the disk_conf structure seems to be received through netlink (that code
> is really a macro hell) and so read_balancing attribute passed to
> remote_due_to_read_balancing() can have any value userspace passed to it.

You are right, looking at how disk_conf is used I can't convince myself
that it is indeed not set through netlink and I've thus dropped the
patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
