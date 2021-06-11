Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3D4C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F0961364
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F0961364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPjVnXEkYvm0ZW1FaKyDJD/r7mcs4U3HPAg2XMSD1w0=; b=pE/WHgoao0CeXa
	q+qsZSrjna6e4vIZrak9+9pf4UTwMpiXFvMgX3H6Ubvw4BCBX0M8lpoV/yheljRN2OrWqrvSmahjS
	QtjTFQDpa23BeXWbL8Qf1TH0OTdGb4FvthkXH098rzXZVTpnAHfl+NYxyVJZU9m6AJIf5CVzLCvAH
	7cmjAt8e4qkAd2e5pePSnStRkszcOruAKSNgdQ5XrwvRoCqGRN9HxSzG0JUGPM0I9f+clQFZADfsU
	/1v+AvzL98dSfflJ/jcxWK7+VlGyqjF/mZTmCrQ1tn4MvU2Ur4akgW+ZXfiCzcQiAwKZtMiba/xHJ
	JApuRwJNmQXVJ8NWddoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrmet-006cZN-Pe; Fri, 11 Jun 2021 19:17:36 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmOE-006Y0f-To
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:00:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A945B2000C;
 Fri, 11 Jun 2021 19:00:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhen Lei <thunder.leizhen@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: core: add MTD_DEVICE_ATTR_RO/RW() helper macros
Date: Fri, 11 Jun 2021 21:00:20 +0200
Message-Id: <20210611190020.225544-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210603125323.12142-2-thunder.leizhen@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b4e248632c968d985f0ecfd7924423fbefc39d1c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120023_181974_6A244261 
X-CRM114-Status: UNSURE (   5.17  )
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

On Thu, 2021-06-03 at 12:53:22 UTC, Zhen Lei wrote:
> Compared with the definition of DEVICE_ATTR_RO/RW(), the read and write
> function names of the sysfs attribute have an additional "mtd_" prefix.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
