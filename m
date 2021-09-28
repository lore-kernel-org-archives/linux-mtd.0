Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3C3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:33:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C76A60E05
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C76A60E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6uOffYNQNd9ngi9QggxjF/k/jxQSujQVUn68yp62mc=; b=El1tLhlCWi8POs
	+CuX3msERs1w/XnIANrD5OBhlcKOpuMXph6FTOd8RKuTMDZWbHJOxlJqBb3ckfVk4n+i5ucIK7HhY
	e429ThNYC4z6Bb1pYJlEsKtua72Lg90NeyXDGPTydgFI6T/CrPXDXhNO16Bq5D/F5c6HUydRBkf2c
	e2Z/zMHF0m9IihomBY/ejdZogiLO/iJEMRdsO2nuWcSthtUUAGmXag94d22MzgxEh0pMn5zh+j5Gl
	tdsFS+MbdRgikqE6KsknhgtK0ik0WlIM0498QZX50cpl2LbhBZBAgCDoSuq9S/veQKQaT4kNyVKz5
	rQ4rsRnwVKIbWmK+5+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVEAf-007c1f-3r; Tue, 28 Sep 2021 14:33:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVEAc-007c0R-Ci
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 14:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632839599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9uo/D5smoekZBXjsk5/VejATsNYCyWIWjL6ZaEUjIsM=;
 b=H4ugBJiAXSCRHTBRmdrORmdAMbtgwTnWPtHEizCy7zAVCsF8/2GekscoapkyI1DZeXj7AV
 3sTyCK1gzLr5lkwH6z3D2RGd23R1K9SEetU6F566npPFMilEKbPjApowbwH+ul0fJMupk0
 aQhNHdNOTjIWPOV4MGKfr0Jc5FqvD10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-7t-VHZ6KP3SyimeTwHt_UQ-1; Tue, 28 Sep 2021 10:33:04 -0400
X-MC-Unique: 7t-VHZ6KP3SyimeTwHt_UQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74DA28E4AA5;
 Tue, 28 Sep 2021 14:33:02 +0000 (UTC)
Received: from T590 (ovpn-8-23.pek2.redhat.com [10.72.8.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9494518EF2;
 Tue, 28 Sep 2021 14:32:57 +0000 (UTC)
Date: Tue, 28 Sep 2021 22:32:51 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: remove ->rq_disk
Message-ID: <YVMnk/8HIR/yhWYr@T590>
References: <20210928052211.112801-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928052211.112801-1-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_073322_545571_8756FE25 
X-CRM114-Status: GOOD (  13.65  )
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

Hello Christoph,

On Tue, Sep 28, 2021 at 07:22:06AM +0200, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series removes the rq_disk field in struct request, which isn't
> needed now that we can get the disk from the request_queue.

Can we hold on this series until q->disk becomes really reliable[1][2]?

[1] https://lore.kernel.org/linux-block/20210922172222.2453343-1-hch@lst.de/T/#t
[2] https://lore.kernel.org/linux-block/YUQOBKa67R9pEunr@T590.Home/#r


Thanks,
Ming


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
