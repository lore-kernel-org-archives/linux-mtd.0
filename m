Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D955C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F97206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 09:25:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OChUtsgC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F97206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XdFWHO8Ny+OQTW18d704Aas3Oms84/COYNJ97WyPaMI=; b=OChUtsgCsyKJ31dKW1o43GZyt
	O6JANJoXYFPbLAR9SMda6aY36CcAVMv971IBkUPxKohmiGhNnueukTA1VWLHEAF6hb94SJWhgCsGy
	7JGLaqXfG2TtEYX64YqdPSPbJ9sIv6ADcvRLmCW/0WRXqkkizTwM8MFAK1+W85cOUc7NfxVHLVXUD
	jSZuGbBU3UVZaqLKcspVnv827yyPpU+wCwBy7UKNJcNxwTIM8OoiI5pPs9YQQ+bRQP3QFEZ+2kjsX
	ET1QxVlHjmCFpZkDsSv7Bk+Vd/aUlxzJvQC3tz9YAvlfQzyY9bsxGhBjpN7laDNZ74Hoo9GgcXZeU
	S4o51UwzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqAT-0000iM-MZ; Thu, 17 Sep 2020 09:25:29 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqAQ-0000hP-I6
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:25:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA2C7AC12;
 Thu, 17 Sep 2020 09:25:58 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id BC6F61E12E1; Thu, 17 Sep 2020 11:25:24 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:25:24 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/12] bdi: replace BDI_CAP_STABLE_WRITES with a queue
 and a sb flag
Message-ID: <20200917092524.GC7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
 <20200910144833.742260-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-11-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_052526_779744_9E1A10FA 
X-CRM114-Status: GOOD (  17.36  )
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
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu 10-09-20 16:48:30, Christoph Hellwig wrote:
> The BDI_CAP_STABLE_WRITES is one of the few bits of information in the
> backing_dev_info shared between the block drivers and the writeback code.
> To help untangling the dependency replace it with a queue flag and a
> superblock flag derived from it.  This also helps with the case of e.g.
> a file system requiring stable writes due to its own checksumming, but
> not forcing it on other users of the block device like the swap code.
> 
> One downside is that we can't support the stable_pages_required bdi
> attribute in sysfs anymore.  It is replaced with a queue attribute, that
> can also be made writable for easier testing.
  ^^^^^^^^^^^^^^^^
  is also made

For a while I was confused thinking that the new attribute is not writeable
but when I checked the code I saw that it is.

Not supporting stable_pages_required attribute is not nice but probably it
isn't widely used. Maybe the deprecation message can even mention to use
the queue attribute? Otherwise the patch looks good to me so feel free to
add:

Reviewed-by: Jan Kara <jack@suse.cz>


								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
