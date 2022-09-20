Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E119ECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HANDLZPuq7ZILID2cZsmQLArcwoJk79qGUrKIWNkNe8=; b=rRck66UWL42diR
	v1Uh6onKu1/5rURH40guUTBN9bWRBeb5vTImk/HbkNXNaB0w+irCVTIFS2pS2kjeUhXfuvNADJJBY
	bG7oL7VdenGb5/7H//Xlz/p3G3mZ1rjdUtTv2rhw6+zYe4EhASAvS1P59eKTVGdjS4YvJLrKr0fth
	adagOHNyp+/2R+83VdSrjjvgQqrx0UET+z7MdB0l2BAWUSK/SwpvAGsFZWuwSbu4J0m9FfvLkVlST
	p+u7uc6q22htBauJP4j8mEHtn+viAcDAtnRasSLtSCSczS3m/eaiQWUMSz3GekGi4Ryj9eTdJaPtz
	Cbu+iQrZFr36iFGvltAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYMD-001eAB-9g; Tue, 20 Sep 2022 08:11:53 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLe-001dZP-Ho
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:11:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 72B18E0014;
	Tue, 20 Sep 2022 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/aDi97q7WLzJZ7h57IhprMRU3z7CPClkMT5+WoehnE=;
	b=BKt84ZhgIyptoGTwgRSWm2bKqo0HXbKqTq7/RcDdR5K+NENd2kN3L3iYrY28xyD02CurNI
	VUkSzPB6sFh/125yORNzYJSh2Yf0q5nlsaFHBe/hs2wDjifRTZ2R9P0L4tbWLZMay9QDo2
	lC3Qy8Oxv+9+/gPwbB3cnAnvtIT/yjleAvolyK5mzEWCNqR6wj/Y4lTo1rrgkAA6mwLKH2
	32Zp7aBUGGbH07AMC7nbaEa8VfTiIJ5PuM/Rr0BkoqhwzyZlEWRCMTRI8MxNxbd9tAD+yb
	Jh+mR9CHqAqHeCACuR35P87R3FLa4+EcJu5+pRsag/Vou5lL5oB8a7+pYjiQYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Roger Quadros <rogerq@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Colin Ian King <colin.king@intel.com>,
	linux-kernel@vger.kernel.org (open list),
	William Zhang <william.zhang@broadcom.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: Add individual glue driver selection
Date: Tue, 20 Sep 2022 10:11:13 +0200
Message-Id: <20220920081113.597419-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711222323.4048197-3-f.fainelli@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'58fac217aeef7cfbffd24bb8be5b2db0ba52d161'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011118_842161_16BBB6C6 
X-CRM114-Status: UNSURE (   8.78  )
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

On Mon, 2022-07-11 at 22:23:23 UTC, Florian Fainelli wrote:
> Allow each platform to define a dedicated Kconfig entry for its glue
> driver such that we can decide on a per-platfomr basis whether to build
> it or not. This allows for a finer grained control over the resulting
> kernel image or set of modules.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
