Return-Path: <SRS0=DRVm=PC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8161FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B40D60F36
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B40D60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C3I7/a1Qk4W5onelErNEeO9CvmAdtSiiHrJ+2jTFOts=; b=NGf93V25g9XJ+N
	A/Ry4aNeI7vTODbLhFQfi1S7HUzpIt706raBXd7v4Iy46n3b5pLLeQ+Dr8/W0+JIt6NGLA0n41pQ1
	z9FKsRAUQJcRNWEFc/nX02h5uN9I9jFQfq19Q8K5JRtolw/z2ShFFWGCiqPGolvxNu6pPh2zctgt9
	deGg4ZrTULjhh0KxKzBftenWsbOcPaXQPmrnrVOQ8CUkGPqMpBh05HfKtMoBDU1wD8kM8cM/VLeQ0
	0AbMEOCiDrRGXj48W5dl9uBmmL4s4+UqWKtXYQQTHl4lpSJicU+8k337puwu0hB5huvn5plnXHe0H
	ZG41rUf58VDtbpUBWepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb25g-003VXz-BO; Thu, 14 Oct 2021 14:52:16 +0000
Received: from [2001:4bb8:199:73c5:b1be:a02d:b459:cc1a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb25c-003VW1-IU; Thu, 14 Oct 2021 14:52:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
Subject: RFC: decouple block2mtd from block layer internals
Date: Thu, 14 Oct 2021 16:52:05 +0200
Message-Id: <20211014145206.1488967-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

Hi all,

while looking for abuses of ->bd_inode, block2mtd scored high on the list.
This completely UNTESTED patch tries to move it off that and use the proper
file abstraction instead.  Are there any current users of this code that
could give it a spin?



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
