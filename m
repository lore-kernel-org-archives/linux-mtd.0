Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9233AC25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hq173NjJakPLp0kj1Gc0Vd4Mzrj8Tx3TfMFHx0bol6g=; b=TAP+Yf/X9O2JCJ
	grbOHxXfWC11nYK7SwvL/iBqa37jzjbW4O+DSaZzDEO7oWUT5+iv1h8owQiCoac1k4DB7f8IpZE5g
	ZK51E2/NlJBDYnu1BCjC/UHPRif9xLAZ2w2t5WfHeV4zZAH7P9PA3nQIybyeBXrEMmy1ySeyMOJA6
	H/0d1C/Yd9lx22CEYV7DENAOhNXm5HGn6RxKU3VcvlpiBFlxfQsfDZUR7zAqcuBA9TUPWYwOSaMfh
	/QjYwsysrV6lxZ6YN3QoU3WeYW30sQgZJ6n6zn682m/hvAH02lCPTtnJs1uZua6Hr8Vs5N4bHza4B
	CaNF7isyc1ySe7ZYop6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZK6-0000000EqQ6-3DEW;
	Mon, 27 May 2024 12:19:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJX-0000000Eq1u-0IbV
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:19:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7B0940002;
	Mon, 27 May 2024 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5R7cFvSC577zVMzteD0DF9w8WqoOSObu+odjjrmcu2o=;
	b=imvQUyHgyIxwYidVmqJN9MmX9i3l48IJPLOi70z+9I5UTrUvBdtVjFvgVi5HmqRHZkXhS/
	kJQLjfYd37qYhC4cChZwiZg1bjmUeKQBykpk+G8m9NcaarYmL+Q+FDiT90cp7KMXSAfHln
	yLwgJYsMG+T0kmDSMmFnNfCMeNJJ0TaVVM0+COnsSgFHSK9jSP8Hoba8RLDIgBaOXVefsp
	dZUotLv20rKdxgE4aHGjHt5MsaNfoKhEDf1QCXdm2pJdymRR/Xh3dLcTP4GQk/yftg7K9e
	d7wZZxdjhoKsObq4Cb+BgaHCo7ImeJKg+zhEH5wTTBu2mRJJcUJU8PS15VP7wQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: nand: mxc_nand: implement exec_op
Date: Mon, 27 May 2024 14:18:51 +0200
Message-Id: <20240527121851.178571-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522-mtd-nand-mxc-nand-exec-op-v4-2-75b611e0ac44@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3df54960b63cce13c5b4daab5793f8e8b056c4ad'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051855_407812_D4698C17 
X-CRM114-Status: UNSURE (   7.16  )
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

On Wed, 2024-05-22 at 05:39:52 UTC, Sascha Hauer wrote:
> This converts the driver to the more modern exec_op which gets us rid
> of a bunch of legacy code. Tested on i.MX27 and i.MX25.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
