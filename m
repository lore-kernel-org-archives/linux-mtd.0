Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF83C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C55D60F02
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C55D60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdfQZn01y0XWErqjCFZOqhYH1AHo4JKlymNZGbaYmA4=; b=aUQdhn7GKgj+Bb
	2jYFYXT+q6uyktDJf+tal3IUbSzmf7f5tn3bCdh3x7aNamWZRaYf1bidNxR9ZkNqkMtbYQ9wyzD9Z
	p5ILHfX9ZLWtdnNM87wJe3buFn5/8DCNdV6fxW8luCxF1P8WaXn20cxt3rALLLW57iiFqSuRsiJo2
	HxbZ+4GfagdCwHoU77A0YK5WgjPW5M1AKqRzVPeYme66w1yOZW0ZFXNfAssSswRlik8Bty9o4Tz6a
	7iymOuxnJblnYnv2AJi7RDqEQbzYafm7hR8VVGRBFKXiNx844KT3t4ZiWvuqvlbeLNb7YjYFccb1Y
	TBCGTjIurGX1SKeHr8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXRA-007Wxp-5a; Thu, 21 Oct 2021 12:44:48 +0000
Received: from [2001:4bb8:180:8777:dd70:8011:36d9:4c23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXR8-007WxN-3g; Thu, 21 Oct 2021 12:44:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jan Kara <jack@suse.cz>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: simplify bdi unregistation
Date: Thu, 21 Oct 2021 14:44:36 +0200
Message-Id: <20211021124441.668816-1-hch@lst.de>
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

Hi Andrew,

this series simplifies the BDI code to get tid of the magic
auto-unregister feature that hid a recent block layer refcounting
bug.

Diffstat:
 drivers/mtd/mtdcore.c |    1 +
 fs/super.c            |    3 +++
 include/linux/fs.h    |    1 +
 mm/backing-dev.c      |   17 +++++++----------
 4 files changed, 12 insertions(+), 10 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
