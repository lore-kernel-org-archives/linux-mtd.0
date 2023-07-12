Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93244EB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Am5qOVmnfLE1u8XqGjzbQR/ng6GkHHal/hrY2g5xbLE=; b=nBqYTulIZFdFBG
	86Wwvm5u5+HINGg52RJKUhTuKytCQXjIKiwpKSPGTzlT6C3RwrlHkcmluiDjnYJ6W75L/3qbd5aFG
	qxqln6aMocxfaWhbEdyOjzRCDb5gM13ZLZONUjDINLspYfgxesrt6Cxp2Au3tOEmPqgC/IljVo86R
	mKR9vKMEBNs1zws6yjjplXTDbUIwuxlH1DcasQc+7YWrn3jtAof6I+hL07LZ9O6dgRgY+bcBqb0HY
	2HE1qS+djXYnUoS0iX+wIPoaF55W89Runf85RPG4pC6VyTc74+6K43j1VsPhR1DrQzpKWKF7v4meZ
	Q0jwgoQHor2s4PvzQqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJabT-000APo-2K;
	Wed, 12 Jul 2023 14:14:03 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJabQ-000ANr-2F
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:14:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22ADB20004;
	Wed, 12 Jul 2023 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96l5dWY2XgZDWnI8IDxHvnBqzk3+/RUBHU+MFz1dRt4=;
	b=PRAbtWrdUq/Mti6nxMq7mDuzDVc+9/2rqLd7Rd8TjhkB2ZXw2JpsondFaCTrKd+RqHXdWf
	iRE+Y495CG5s7LhqSWy3Ef+NM3cK/TMim6ykh9k4cfKW+7Prgno4n6C3ORhqcSheMK+lNg
	guVe0NmQ6VwgI6tk9mRYmLAo2flY/8t5u3bQiu4l2evMkPN0tCrhd2kkfzlYNOWc89b4mF
	xiYlddJhXjqu7QzPhJmTQy9+RqL5vrwix2oy3bLYW4+SzisV0gBuyZEGm1tcQdp2QD27Ab
	XG3dsrac94ptKE0bll3rwwmikNxhdNRh0Q2zCz2HvMQDPfioeiPmgDiD0qSTOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] mtd: call external _get and _put in right order
Date: Wed, 12 Jul 2023 16:13:45 +0200
Message-Id: <20230712141345.354928-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620131905.648089-3-alexander.usyskin@intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'79c4a56250216991f1d965ee26dcd273376e4e91'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071400_862678_8E4DA7E8 
X-CRM114-Status: UNSURE (   9.91  )
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

On Tue, 2023-06-20 at 13:19:05 UTC, Alexander Usyskin wrote:
> MTD provider provides mtd_info object to mtd subsystem.
> With kref patch the mtd_info object can be alive after
> provider released mtd device.
> Fix calling order in _get and _put functions to allow
> mtd provider to safely alloc and release mtd object.
> 
> Execute:
> 1) call external _get
> 2) get_module
> 3) add internal kref
> in the get function and opposite order in the put one.
> 
> The _put_device callback should be the last in put
> as the master struct memory may be freed in this callback.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
