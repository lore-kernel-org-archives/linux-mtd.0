Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5D2C48BD1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:11:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23D0613B8
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 19:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B23D0613B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuT+eF9ahpiweLBxZLvgKdD/QTc6FyXGVR9LNmFTxMI=; b=zZ7WQpDSaE4Km8
	c9G8M09Kdjwjybye2xqqH6FGfmJbJXwP4kFrAvNLtoMpVMFb+ppK08dAKSKwR9GgsMsdtG1F93jsG
	bQuDWjZxeHFNFUcUArjt3lXkNyCS8MXetNe+3m1hF9H7PDyXnZXkcjRYnIve+VYKYa19GEYhNidRV
	kyQaz6FyTV7koy+htgyivw7hI2q9PvfVrtWR7TYhDyN12lXgiQ0DHz2omjpIolpsxfM+T7sXgOtOr
	qKdCk0RDBs9mzY4JFeodMk7uDCzcwNOD3oC17b9oeqSjrE6SWOo9+7VKGsJDfksLJxFklNcGRqHKR
	/4Kohi+XOyf4eCrcCESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrmYB-006azP-RA; Fri, 11 Jun 2021 19:10:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmNv-006Xt4-Ah
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:00:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 59BBA60007;
 Fri, 11 Jun 2021 19:00:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Heiko Schocher <hs@denx.de>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, kernel test robot <lkp@intel.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] mtd: devices: add support for microchip 48l640
 EERAM
Date: Fri, 11 Jun 2021 20:59:59 +0200
Message-Id: <20210611185959.225258-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210607033909.1424605-3-hs@denx.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'88d1250267535b26106ca9582701bbad940cec01'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120003_566612_F18AEF60 
X-CRM114-Status: UNSURE (   5.41  )
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

On Mon, 2021-06-07 at 03:39:09 UTC, Heiko Schocher wrote:
> The Microchip 48l640 is a 8KByte EERAM connected via SPI.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> Tested-by: Fabio Estevam <festevam@denx.de>
> Reported-by: kernel test robot <lkp@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
