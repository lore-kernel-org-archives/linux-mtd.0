Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16218C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:14:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3BB2067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:14:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQScx0gM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3BB2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QkEVQdNBGwkiaqmhSAHxemWLUp/qWOetA9e8LoBJxM=; b=lQScx0gMfykZbt
	aAZeZBnWG0j5BcZ96Hd7uB+Vr4zjARxaatunm0YUSBnlk0cVWXzO1BER35JRN22lloee7w9upw3Nj
	cVUtLAM1Npcg1+5L+gejXNcVbGks06DW2KXZyBn9f/dqMLQ9AxNeUZEuJBeRwpEoYnpYBHtaKKil4
	jCmi6gAykdtIUEh/IV1AG52T5sc4FbUNf7pivHXu9oftORPoYztGRby1JQ9vZRsBN10SSYomjtRqm
	moOWoZupyRsC20aOYHdq0A091DCPmHCgoEWR1ysEOT4DTy6+s7O9meM4Dm22Jd9p+2TN9BNsD2Hfs
	JwUFTeDkmvHBM0FrfBYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdGU-0006r6-28; Thu, 09 Jan 2020 19:14:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdGQ-0006qS-4m
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:14:39 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C32EF240003;
 Thu,  9 Jan 2020 19:14:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor.Ambarus@microchip.com, john.garry@huawei.com, vigneshr@ti.com,
 richard@nod.at, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2] mtd: spi-nor: Fix the writing of the Status Register
 on micron flashes
Date: Thu,  9 Jan 2020 20:14:23 +0100
Message-Id: <20200109191423.10589-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203144948.15137-1-tudor.ambarus@microchip.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 82de6a6fb67e16a30ec2f586b1f6976c2d7b4b62
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_111438_318375_536ED5E5 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-12-03 at 14:50:01 UTC,  wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Micron flashes do not support 16 bit writes on the Status Register.
> According to micron datasheets, when using the Write Status Register
> (01h) command, the chip select should be driven LOW and held LOW until
> the eighth bit of the last data byte has been latched in, after which
> it must be driven HIGH. If CS is not driven HIGH, the command is not
> executed, flag status register error bits are not set, and the write enable
> latch remains set to 1. This fixes the lock operations on micron flashes.
> 
> Reported-by: John Garry <john.garry@huawei.com>
> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Tested-by: John Garry <john.garry@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
