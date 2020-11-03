Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DAAC2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 09:33:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52E6223BD
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 09:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSFRAMBe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B52E6223BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S8ZX4962Fwl4ggBbbiS2gbVJ5o/WAOrx1+RvJ0r/qXQ=; b=cSFRAMBehtrtKOl7Vm1UfFymI
	pRaYU/k5pOxmLMKcvA3YgXrqgSPB9rFwLTUohe8IIeQ4EgqZebqSmv79PUodiSWpifTvRva9jGNsV
	jMX2cyIDB08V/fEoJgU15tFaMEe7jwpkWwcToSwtZ5ZnIJNW5wzv7awnyuhzs6hPu76saofrq3m5q
	j1xvQaerAPc55HvqaJECbB1mEluuxTKhhywkbiJO0J5Vt+CjzmaC3kjmY0BDY9ig74WzZ2EqKgSR3
	pD8oVzmi6WJBu9i52E7aSzy707oDkTH5Uvw4b/Z7/uc2Ny5eHCr/tR3s+Z6yIKqipmlIkTi1Z6cSL
	klVw3cAkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZsgN-0007qF-HY; Tue, 03 Nov 2020 09:32:51 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZsgK-0007ov-6O
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 09:32:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5F1EC68B05; Tue,  3 Nov 2020 10:32:37 +0100 (CET)
Date: Tue, 3 Nov 2020 10:32:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: James Troup <james.troup@canonical.com>
Subject: Re: [PATCH 06/11] md: implement ->set_read_only to hook into
 BLKROSET processing
Message-ID: <20201103093232.GB17061@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-7-hch@lst.de> <87y2jjpa09.fsf@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2jjpa09.fsf@canonical.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_043248_435523_F5D2A56B 
X-CRM114-Status: GOOD (  10.76  )
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
 Jan Hoeppner <hoeppner@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-s390@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 12:19:34AM +0000, James Troup wrote:
> Christoph Hellwig <hch@lst.de> writes:
> 
> > @@ -7809,6 +7778,36 @@ static int md_compat_ioctl(struct block_device *bdev, fmode_t mode,
> 
> [...]
> 
> > +	 * Transitioning to readauto need only happen for arrays that call
> > +	 * md_write_start and which are not ready for writes yet.
> 
> I realise you're just moving the comment around but perhaps you could
> s/readauto/readonly/ while you're doing so?

readonly doesn't make sense here as we transition away from read-only.
MD seems to have a read-auto mode, although it usually is spelled with
the dash, so I'll switch this comment to use the more common spelling.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
