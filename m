Return-Path: <SRS0=6UFQ=ER=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34A0C388F9
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 08:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F47206B5
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 08:04:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMgTSTRA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39F47206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wd+QQ57pEgytF981pm9Ebp7IlGZbkNicqN8py57ytC8=; b=tMgTSTRAAxlrkBgypIzjdKeEp
	5DvBtKffPkuUFVZ2AiYYxvM2XU830KNZplZ7ewspGpCF2FmLfd/Mc0bXQBjw7kWUSC/6vYXjxhOYU
	eNurxQaVUpvMk/zttHfur5Yo6rpjfu8SbYQW2mjEzZSdbdwV+H9nCf9b2oKJrcH24hrTYhNQmcv7k
	Nrf8vXFztJJ/kJym7wBcxPKVdX/hSZa3aP9obK0q1yTxzPkTfPPBuhlxwP1wFMDHnTSjBF5z5Eu/7
	/3VqIIvknFqbMOmFVwAqV7WnMKGPacpINSurOZLwZPLS57g4zVd+A23tLW1BdcCwsx8Jsjz2EzfZ9
	SiOQOor4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcl6U-0000yL-GJ; Wed, 11 Nov 2020 08:03:42 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcl6P-0000xS-Le
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2020 08:03:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E204A6736F; Wed, 11 Nov 2020 09:03:34 +0100 (CET)
Date: Wed, 11 Nov 2020 09:03:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH, RFC 11/10] block: propagate BLKROSET to all partitions
Message-ID: <20201111080334.GA23062@lst.de>
References: <20201106140817.GA23557@lst.de>
 <yq1imacecwz.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq1imacecwz.fsf@ca-mkp.ca.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_030337_889110_06D4C5B2 
X-CRM114-Status: GOOD (  13.11  )
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

On Tue, Nov 10, 2020 at 11:38:22PM -0500, Martin K. Petersen wrote:
> 
> Christoph,
> 
> > When setting the whole device read-only (or clearing the read-only
> > state), also update the policy for all partitions.  The s390 dasd
> > driver has awlways been doing this and it makes a lot of sense.
> 
> For your amusement, here's my attempt at addressing this from a while
> back. Can't remember exactly why this stranded, I even wrote blktests
> for it...

I added you to the Cc list because I had a vague memory that you were
looking into this area a while ago.

I actually think your patch that goes further is the right thing to do,
and I was going to look into something similar for a problem with
hardware read-only namespaces in NVMe.  I think I'll take your patch
as a starting point and will work from there.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
