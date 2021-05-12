Return-Path: <SRS0=fEar=KH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D5DC433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 May 2021 06:43:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B9E61465
	for <linux-mtd@archiver.kernel.org>; Wed, 12 May 2021 06:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B9E61465
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=loS5C9gVL9g1qI+lFmDP7BHAffLsAtLTJ7ArWy1cwCk=; b=C/+W+/myx51YfdlW3LUYULm2j
	u22OfUE3RgSpPNXgk3ukRjy375Z7O38anB9Ex363NIOcpmC9PDIK5OJ9W/CpXYJBRLHhUpDKyQ8pi
	l24q8zsGZWTAZyWZ/t1uyaU774ElrCE1Ewt3EbD3trfjteWGHlgneNoolj/T8N4Sp1Rvx3TT4c9PA
	OR2uNQpGbUv+pr/06iB+v8xXRJjfFBguzFljQ9uC1mLHqPG4sCu94wMNXY7zHrbKB4Fs4yeLXi6+W
	5pQbzC2pWktINOEsIboPLNT0Ka96hshjC9VEnJdLcjh5nEk4/nNjyAI09SZ9GUdGmIsQ1lNErNbRr
	Rqmj8ZfQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgiZu-002B0I-UK; Wed, 12 May 2021 06:42:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgiZt-002B02-55
 for linux-mtd@desiato.infradead.org; Wed, 12 May 2021 06:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7m5YjR1b3ZpXg5BmaLCSO6iYyxPa1dkks4CudEuLFGk=; b=LOd6hvGXDf86Vs7jiQoILXBbKK
 Z31bETkH5fgGW6zvOxiMeiNzT7py/LEpQjrtp+/rjmYGz0r2FX89Lz9wUDkF7LLJ5wvA4kXnz7fMX
 c0GiAuG3OljwLiUQZ9wEU5/g9gPmWRQcnkK6OUFnybHB945qQlPabi2JqON/r5UoaVaYGiuaReBHb
 7tBSGG654/pkT3dQe55hbRf1YMCy9+xFhdvTLBc60b7ilq9ShvhfLAcAewwv66w+r3T5gjYvGHfv5
 dYXn9slfM/5aXla48mTue5oRDmC82sgPvoc+5uQs/m5S+n5yv17fDQtuOzZMV6tAHiLwJsUEbpnsS
 pLF18uSA==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgiZq-00A9et-Kl
 for linux-mtd@lists.infradead.org; Wed, 12 May 2021 06:42:39 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4149C67373; Wed, 12 May 2021 08:42:35 +0200 (CEST)
Date: Wed, 12 May 2021 08:42:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christoph Hellwig <hch@lst.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Jan Kara <jack@suse.cz>,
 Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v4] mtd: super: don't rely on mtdblock device minor
Message-ID: <20210512064235.GA19086@lst.de>
References: <20210510121837.14274d4f@xps13> <YG9qzC/SaD7SNWVm@makrotopia.org>
 <YHRj5MUb5MGdPQqw@makrotopia.org> <YJmx3Ru/5oyq6Y1a@makrotopia.org>
 <20210511054955.GA6542@lst.de> <YJo42y+lP9peFlkd@makrotopia.org>
 <20210511164248.GA18867@lst.de> <YJrmU6Cw42CZdzAr@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJrmU6Cw42CZdzAr@makrotopia.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_234238_855485_563BEC71 
X-CRM114-Status: GOOD (  21.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 11, 2021 at 09:17:23PM +0100, Daniel Golle wrote:
> IDE with it's 10 majors and a huge load of legacy code involved doesn't
> seem to be the prime example... I generally find *_MAJOR being
> hard-coded via pre-compiler macros and actually quite a lot of code
> seems to make assumptions about the backing driver based on the device
> major number used.

Nothing with many majors.  There are valid (but obscure) use cases
where a (new or niche) drivers wants to impersonate an old one.  And
the infrastructure allows for that.  So guessing from a major number
to a format of private data is absolutely dangerous in the long run
even if it works for trivial setups.

> Anyway, as the same shortcomming (assuming MTD_BLOCK_MAJOR is only used
> by mtdblock driver) also affects the existing code and I'm not aware
> of any other way to check the backing driver, I guess dropping that
> legacy hack is indeed the only good option left.
> 
> MTD folks: please advise if you agree that this would be the way
> forward to clean up things for part_bits != 1 to work.

So why do we even depend on the block device code for the legacy
name lookup?  Can't we just remove lookup_bdev entirely and just parse
the /dev/mtdblock name here directly without any sort of detour?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
