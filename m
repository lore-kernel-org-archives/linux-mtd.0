Return-Path: <SRS0=6UFQ=ER=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F90BC388F9
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:21:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90B62205CA
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vxr0Wce0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90B62205CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l79QKsKZDIVNBAMQQr69lPBj7nTJwBVuW8ud+lVIKkE=; b=vxr0Wce0uoTWET2BL165WVtoU
	iHEfwKpZPq3nRydPiQgLMP/ruCYJf2nNZo+MRhbLWa8nisPmMh6ijLB4ZMpLKU39qxE7ZDLzQxoFm
	PMRyqA+vpZsdkaV4iDJDR8jFuAS5Nu7Oef9IY0xD6YVJdn+gSNHh6LMTYdv7AagZKVV/RDRb4QKsg
	3W5lYH6wQ2ZuKIjrcjJuV4oiMkFJ2XrbgUzbZi92UxirGbys6RGD3mIMR2XT63igucAJdh6e8kp2S
	UdvLXJfgXXW/JpqiT5cUmHbycNAOiNRxH8CECGX1sYzxSOGGwxSVbpZlmite7S0QeMhsQP/oQbh9M
	Jgqk5DaZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcsrU-00045N-FK; Wed, 11 Nov 2020 16:20:44 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcsrS-00043f-Nz
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2020 16:20:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 829EF6736F; Wed, 11 Nov 2020 17:20:35 +0100 (CET)
Date: Wed, 11 Nov 2020 17:20:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: block ioctl cleanups v2
Message-ID: <20201111162035.GA23772@lst.de>
References: <20201103100018.683694-1-hch@lst.de>
 <20201111075802.GB23010@lst.de>
 <92a7c6e5-fe8b-e291-0dce-ecd727262a2e@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92a7c6e5-fe8b-e291-0dce-ecd727262a2e@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_112042_939254_EBADE906 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 09:13:05AM -0700, Jens Axboe wrote:
> On 11/11/20 12:58 AM, Christoph Hellwig wrote:
> > Jens, can you take a look and possibly pick this series up?
> 
> Looks good to me - but what is the final resolution on the BLKROSET
> propagation?

Do it properly including a hard read only flag.  Martin has an old
patch that I'm going to forward port.  For now I think we need to
adjust dasd to match the behavior of all drivers, so that we can fix
the common code to behave more like dasd in the next step.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
