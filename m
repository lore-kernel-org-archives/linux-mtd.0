Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39915C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:51:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF55164ED4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 18:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF55164ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5KkYlsBGuERsrA0RhJvnSbZ8p9k3q3bthUutp1ObkX0=; b=Ci9APxCl5uD4W84PtVIjz/bv6
	yl0kZWhQQZBCmU0/t9PVwzg5Z/W9D0Dh71jwL/IQrSQDTiS4tCOxLzpLVqZXwWplCDUHp5tGbFfL5
	x8BvT5yrmrqqtqDjHi/1s02FaxrYKnEIA5WaXzppr8F9Gf0mVuS3Z4b4ylpJW/rjTD11IPEKWd638
	PFrSIzA8KB3BQ9Pbobj/oM95virTLXqHhw39oSk/duGHal+o6r0R398fAjw89F/sK4bchw4+MHAAi
	6rJimr1S3cAnKrHYm2nSDHebKsqfjxW3xY2V8E0cCBfc1thojwXIC+JGviFJrYtUYwKr8F0JgMciZ
	l8ZGwfzrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWa4-0065pi-Uc; Wed, 03 Mar 2021 18:50:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT1c-005HQu-K9
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RKklac8oAr0tNw3WOisxinuES0shcDEnV8U3w4LMs+E=; b=hzYKolP5SiyPInYChPegrXHrvV
 zruHg9aoAqC00jVPc2P0eT/AUpiVp9/rntTu7aGKcfv9M+N484RpPkWgHYBDrVTvIwlh0r9qX0sZL
 kmPZ9ZxU/lzD/3s14wqK5xeFakgr930o4MhfABt/Bd1zujsc3HUOr9WWyqrz8gXGafS6WWfYOB9Qk
 uZd/t/5SuS9aq0fjbB+xalkn+8d7v+8h3C1Ha2Fkkab+eCnScNjTKsT//I5sy5IdpA8BQ+NDQMSOy
 iVZZbidCTt7mefp3f5oCOws+mkwt5cf7pHZC03xyfFF5LG81+V1iwLpN/K7iNIr0tI/r9/hAum5uT
 6Nn4QSzQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bP-00HW9K-TN
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:39 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E52811BF20A;
 Tue,  2 Mar 2021 17:14:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dejin Zheng <zhengdejin5@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, nixiaoming@huawei.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mtd/next 8/8] mtd: rfd_ftl: Use module_mtd_blktrans to
 register driver
Date: Tue,  2 Mar 2021 18:14:09 +0100
Message-Id: <20210302171409.1275-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213164600.409061-9-zhengdejin5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f3587578f49c11c478a7ea90d59839a97d855896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171439_128846_18365224 
X-CRM114-Status: UNSURE (   4.36  )
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

On Sat, 2021-02-13 at 16:46:00 UTC, Dejin Zheng wrote:
> Removing some boilerplate by using module_mtd_blktrans instead of calling
> register and unregister in the otherwise empty init/exit functions.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
