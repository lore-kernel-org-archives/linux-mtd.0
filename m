Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6587BC47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C06A2613D6
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C06A2613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nIO5vp/xQvjQhKpQSwtAr8GX4QJZW//w08wLWv2g3w=; b=UGEoeIPvXcP91u
	An7lnkb24mspLA/t4jS2SPsU8qda5v7iBkOBrNBEchqW7wH7QYVZ84RRnffrvKEoiQUbhrgjnYEH7
	Zvq6OErz0FhDxplF8/WgaSsoQuBGQOFruiGlpnI5B5YiUBaCilPVcxPGUiguHL3Mhz7gObs0cvTmD
	prChWiQG7wL2TsnqJxu7hpav2E1XyL4BhI4N8/Y79KaYbh0A3RXYH4wtEM9EywskzCSbZxTz2ymip
	oOgw11jpxb6oVT6uIpMa/gbOREOqnfR+RK6Dk4hGwWteGkhb3vPSrot7D7hHM3i8B3qQzzg5YGoeI
	N38An0x8dqwYhkbfkXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llppM-00Crxh-Vq; Wed, 26 May 2021 09:27:49 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpRQ-00ChwO-Us
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:03:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5516B60014;
 Wed, 26 May 2021 09:03:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: core: Potential NULL dereference in mtd_otp_size()
Date: Wed, 26 May 2021 11:02:59 +0200
Message-Id: <20210526090259.180775-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <YJ6Iw3iNvGycAWV6@mwanda>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c3c8c051df3ee5042dd91593593a8b0e008f4c85'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020305_173835_F829BD7D 
X-CRM114-Status: UNSURE (   6.02  )
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

On Fri, 2021-05-14 at 14:27:15 UTC, Dan Carpenter wrote:
> If kmalloc() fails then it could lead to a NULL dereference.  Check and
> return -ENOMEM on error.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
