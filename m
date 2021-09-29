Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C819C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 07:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E924B6137A
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 07:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E924B6137A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yw43XLwEUfMin9TTFvSNL5iz+RK4K/jjJMZbn1jVxu8=; b=c5O4eeFOnfkgZw
	oNKQNY4y9gsfrobFKpW6HCpFq8sFAqaHhJTykWQZBfcm8GquDKFQFHlwXOt5+8XWEO3YY90sAM2Cu
	ibQEPGdv+M2fKW1gDGAgcmhh6MqY0CaM/d4PbRZOmX6AV1Q6vooXmt/s8pyf9M07FlVLmL73fCRpf
	wxJ51KOrNXjTctdFwLkK9VZtk63WVt+hmExfIzMZI4QomSgBW36OX02IOYVoJ186IlleRYXR20JQa
	PEXDXDXwmfbe+ReO/+Elv758hE8KawUAfpK2CspzR13vnviOmsDnhmSn1BD3Ywtn6NJGqhtihUW1Z
	VvmGTCqwzLps/OFOzmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVTgu-00ADq8-PY; Wed, 29 Sep 2021 07:07:44 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVTgr-00ADoz-NU
 for linux-mtd@lists.infradead.org; Wed, 29 Sep 2021 07:07:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 474126736F; Wed, 29 Sep 2021 09:07:34 +0200 (CEST)
Date: Wed, 29 Sep 2021 09:07:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: remove ->rq_disk
Message-ID: <20210929070733.GA31869@lst.de>
References: <20210928052211.112801-1-hch@lst.de> <YVMnk/8HIR/yhWYr@T590>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YVMnk/8HIR/yhWYr@T590>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_000741_958320_2B1A4009 
X-CRM114-Status: GOOD (  18.66  )
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

On Tue, Sep 28, 2021 at 10:32:51PM +0800, Ming Lei wrote:
> Hello Christoph,
> 
> On Tue, Sep 28, 2021 at 07:22:06AM +0200, Christoph Hellwig wrote:
> > Hi Jens,
> > 
> > this series removes the rq_disk field in struct request, which isn't
> > needed now that we can get the disk from the request_queue.
> 
> Can we hold on this series until q->disk becomes really reliable[1][2]?

It's not like q->disk isn't reliable.  It is that we don't kill all bios
when tearing down the gendisk, which is an old problem that got worse.

That being said I'm resending this again.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
