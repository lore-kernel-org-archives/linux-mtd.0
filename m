Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30941C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 08:05:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F15F1613D0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 08:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F15F1613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NokBjmMIWqtkFRrVVihbAR0YUL4sEoFfVcyk5vybxbg=; b=J5TTlyeSAbmMal
	PUd8z7p1UETxA6sqrKCxkpRi44d9vDSGYzqHD520IqH+K6bkb83syYMQOpFOBLgAJ3prXAoSDFwmx
	kaZz/+Y3h9zAxHnRjULBV+yVL2MEJ/XhFaKDL80p5SjhwTHxsOo0hNPsqrgzlBss6zyKetsaQajOX
	RUo3j515XCpkJLbzyLnWoZNGKqWzFzoq0bKXtnA9fRBjq5AynWCVlupNqWAL5qLm2hi4ZiEiBkByt
	+J4l8cyVuh9f21yj4/oVILNcvYgiK4D060edMbcxDzfZvnatuQnmXQK0cRbFSHXWEnWLm4r1EFelY
	K5fFpy8eY/nGwPRYSDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVUaA-00AJej-RT; Wed, 29 Sep 2021 08:04:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVUa5-00AJdx-Lp
 for linux-mtd@lists.infradead.org; Wed, 29 Sep 2021 08:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632902683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E3crSTrUNdR0NaQQrRsu6FRgIiQrkJ+OMm9iOREuUAY=;
 b=U3CtFcooS/kbuc2x2RckKnH7hXjLZSnxx4PKdlsErxHAC9jtqaVceR+S+49uCaZZpUkk+N
 vHHp5rJjlR3Nkdy5SpDdn2U9BAl2Q6BqjPx/t5Pte0JlPOXdnuc7TFArgr2WaqpXLevZxp
 eYEP64DW+6LhzCGb4liYqZY4J1KmxQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-OMvHV8brMSiPaBwniWU4tw-1; Wed, 29 Sep 2021 04:04:39 -0400
X-MC-Unique: OMvHV8brMSiPaBwniWU4tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5080D5074D;
 Wed, 29 Sep 2021 08:04:37 +0000 (UTC)
Received: from T590 (ovpn-8-18.pek2.redhat.com [10.72.8.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4DE71007606;
 Wed, 29 Sep 2021 08:04:30 +0000 (UTC)
Date: Wed, 29 Sep 2021 16:04:25 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: remove ->rq_disk
Message-ID: <YVQeCdF/kT46pkC5@T590>
References: <20210928052211.112801-1-hch@lst.de> <YVMnk/8HIR/yhWYr@T590>
 <20210929070733.GA31869@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210929070733.GA31869@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_010445_816833_4F600EA7 
X-CRM114-Status: GOOD (  19.70  )
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

On Wed, Sep 29, 2021 at 09:07:33AM +0200, Christoph Hellwig wrote:
> On Tue, Sep 28, 2021 at 10:32:51PM +0800, Ming Lei wrote:
> > Hello Christoph,
> > 
> > On Tue, Sep 28, 2021 at 07:22:06AM +0200, Christoph Hellwig wrote:
> > > Hi Jens,
> > > 
> > > this series removes the rq_disk field in struct request, which isn't
> > > needed now that we can get the disk from the request_queue.
> > 
> > Can we hold on this series until q->disk becomes really reliable[1][2]?
> 
> It's not like q->disk isn't reliable.  It is that we don't kill all bios

q->disk will be cleaned in gendisk's release handler, which may happen before
or after blk_cleanup_queue().

> when tearing down the gendisk, which is an old problem that got worse.

It is fine to not kill all bios when tearing down gendisk if BDI isn't
retrieved from q->disk->bdi since gendisk has same lifetime with bdev.

So what is the old problem?

> That being said I'm resending this again.

No, either your patch or mine can't fix the issue, and I will comment on
your resending.


Thanks, 
Ming


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
