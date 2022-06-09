Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F553C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REIEQ9gP79J5GzgAHocMKPuJHU9NKCGdqT/r6GKBwRs=; b=ojuz65AQ/DZbVM
	8gRGZQfGoM0OC3Mw6+7VvX3q1YtF2N3QiQ/tX7cACRxXIkf4m4T9tdxt/KFOc5YmrDfG9MhJZ8IGk
	ke3BbY0ves0jISp1xMonE1+VCej9qT1q5lj4nUdu37Q4bf3ezgTuimdSd6jrotIsEBNBbEjLTWnFl
	MjcMgdywcxZ+Fl8XQGOME+CFRGhwYlu0+SA0isWr4P1XH1syV5qk/GACRU7x8zIvu+2wo3fy/YlHn
	YPBhByy7cin57h2SiX2UDE5tQ08RMh72Aj/Bt3gDu/uo6czbiYCWUH8frTyQZ/c9ZqHDD7Rk4/Igy
	SsVPxXN8/YzonpyrXHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI01-0023sM-JZ; Thu, 09 Jun 2022 13:14:58 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHvq-00215g-Pc
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:10:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C4EFAFF803;
	Thu,  9 Jun 2022 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDdTQJH21wnVJzJGeiGX4/UOPovJLTiw/9VizdL98JQ=;
	b=Z6+iHR4Lf4yyD5IbQSVmRRiHEdWZ5ohOtBh41fibad4s+aQdrxDtS3QS+wNoCUIHCwvKp9
	rcN2GeuyCbbewDRrlbl88bYelgEC4YUMvfcunV1Qn4mTTBgCVliubaEXqpPaZ0s1i6PMdd
	NbgMQoKKUi382rwv1/jrZskIhYb9RbnPPt9YalhCXWKPSlhoH0BAL6Me+Fr43X/3qIREkl
	M55qQ6hmKzeC+WSP2jzmcDdQJIwwLwEDmxoOaLYfvqGe/3pQdK8XM/IAZFkoxoHtKfajIg
	B+UXJqIUscBDPWviAh3BZUbrjgoT9JFWwWmNgT7thlCocWFeTEgQ6zeyTE2Q0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Lamparter <chunkeey@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	dev@aboehler.at
Subject: Re: [PATCH v2] Revert "mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00 NAND flash"
Date: Thu,  9 Jun 2022 15:10:36 +0200
Message-Id: <20220609131036.293589-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607185918.1048204-1-chunkeey@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2c5947cffd81ac8181346efacdca3c777ab330ba'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_061039_003347_5A02ADA0 
X-CRM114-Status: GOOD (  14.74  )
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

On Tue, 2022-06-07 at 18:59:18 UTC, Christian Lamparter wrote:
> This reverts commit 3380557fc7e28d9bce7607e16d98f123d36da4ca.
> 
> It turned out this "4-byte" ID might have been an honest mistake.
> Regrettably, the chip Andreas has might be a counterfeit or is
> damaged in some other way and shouldn't have ended up in a router.
> 
> Andreas reported his chip is returning just four bytes:
> "98 f1 80 15 00 00 00 00".
> 
> However, according to Kioxia/Toshiba's datasheet, there should
> have been at least another byte that would have contained the
> correct OOB size that Andreas needed.
> 
> Miquel and Andreas are both favoring reverting the patch over
> further, possibly hacky modifications:
> "[Reverting] is the safest option here. Apart from this device, we
> do not know how many devices have these damaged/counterfeit chips.
> If it is just a couple and only on Fritzboxes, as suggested in the
> Github issue the patch could be carried through OpenWrt[...]"
> 
> Thanks to several users on the openwrt forum and github issue,
> who stayed along for the ride:
>  - Peter-vdL for reporting the issue and testing patches.
>  - neg2led and Hannu Nyman who did all the
>    datasheet digging and debugging.
> 
> Cc: Andreas Boehler <dev@aboehler.at>
> Suggested-by: Andreas Boehler <dev@aboehler.at>
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Link: https://github.com/openwrt/openwrt/issues/9962
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
