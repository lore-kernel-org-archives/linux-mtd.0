Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2110C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F4F61B5E
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88F4F61B5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9hRFUrBWIVD9heCcs7ytOXjyNX/BtFgBJiKm/T6X/Y=; b=Fc8pWCZznkI9T3
	nM8CZNHtdOUd5M1u5wl14Q3rmw5Ws9+kqND283iTnYlhfk/47J3IpuWXx/+qb5gJNiPPiJR4pWU8D
	PbsBYrqjoLY+W43wV85adW2dasAA+6x+6IkZ17eZN4GiytmNSml//dn1JqHB411viloogY4P2Gjxv
	SExhB0TIP27bBXbJgZjq+Pb+2fphB7YlNdRbyH0GYQHIRD4imvpC8ClmIhlpfldxid42peEzCvnAy
	FimUfwTEY4t6t1iVzjg0Z0AxT7AZWKbWilI2ZvIUqSly4/47oTU9NzQabTB1RW4MQnej+Dw1RTE6z
	avZuWeGlWGt+w4LKbHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8kz-00BIoX-HS; Fri, 19 Nov 2021 18:37:05 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8jO-00BIEP-T7
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:35:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id BF8ED240007;
 Fri, 19 Nov 2021 18:35:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] mtd: remove unused header file
 <linux/mtd/latch-addr-flash.h>
Date: Fri, 19 Nov 2021 19:35:24 +0100
Message-Id: <20211119183524.1329988-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211102220203.940290-7-corbet@lwn.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5dad0418f38d7440663812afe214ba5f01807b58'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103527_105311_890A997D 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2021-11-02 at 22:02:00 UTC, Jonathan Corbet wrote:
> Commit d24dbd7541ff ("mtd: maps: Get rid of the latch-addr-flash driver")
> removed the last user of <linux/mtd/latch-addr-flash.h> but left the header
> file behind.  Nothing uses this file, delete it now.
> 
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
