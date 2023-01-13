Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF7BC54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNlHBzZnhkL6x3zD95B6RGJiOcPYZix0jxc+yDGAjZI=; b=OkiENDecDEp4Es
	O7PoX2DnbBC/SbiLuElr87wMA3Z56y3XBdgO5366tqrJPzDvU0Q/R8eot96mV1c8QuKdcRSDB39AH
	0ReMjaZJlF09wmTWM3vrDVH6l1bUXuScKf2bT4bDm/ipI+QwWQJ65wTWBAY5qvAptJIfMHwdu141h
	ImSO9MT3+zG0mFiFsbzErQU27T1rQK/Sq9/eA28mZuHuKieHlHSMZB55JzZxwDXUI6MOsrCutuiaY
	OU8m+p3Y7kkQOOsJLLKV2/2MsOMJeiCz9tei9NMT2Mh/BM2VRBOanC5k2/rXNkXnS/fsADyhYR4yb
	SwWTCuM7vXat8tKnomKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN3L-003SVc-Pf; Fri, 13 Jan 2023 16:37:15 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN3I-003SSj-Vm
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 16:37:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CE64CFF805;
	Fri, 13 Jan 2023 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673627827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpmX4y9LbawaPZeaZoouYayz+UDVFOuIN2RMRGBB0Ig=;
	b=cGxM3HCu3bAUJ70zM4D96iKF/E5Jy/XYvb5bHDmutwQUizArUMAzTnb8jleaaO/vJlScfu
	8vrF75jSw8B/dZLy3G1eQEKzpR+btViAn1A0Bs6B+PFi+N6bN/8tDnBvPSexhAb3UP/Jnj
	Vrpq0krq4YDToGjefVTFP2BICwdF6gRpLXruBGtbWGQkaC2YhjYc47jxHQjLRwWN9SH2iI
	1eI9ag5zjY4dHPrySh6yjSb9nQ3tlYxH/mRgFgq1JyLuzG5SbhISiUhidjVQcBlME6aRdF
	W4Xrweol+DPy/k5geH4rD3xxrvM8wEtq2cFxdh8p3LwD234vDmmhvP+yjwintg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/3] mtd: rawnand: Check the data only read pattern only once
Date: Fri, 13 Jan 2023 17:37:03 +0100
Message-Id: <20230113163703.1296084-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112093637.987838-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9f820fc0651c32f8dde26b8e3ad93e1b9fdb62c4'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_083713_173321_0F46501C 
X-CRM114-Status: UNSURE (   8.29  )
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

On Thu, 2023-01-12 at 09:36:35 UTC, Miquel Raynal wrote:
> Instead of checking if a pattern is supported each time we need it,
> let's create a bitfield that only the core would be allowed to fill at
> startup time. The core and the individual drivers may then use it in
> order to check what operation they should use. This bitfield is supposed
> to grow over time.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
