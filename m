Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6275C46467
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhFOHlQ8b4fokK/RuGcRAesn/is0Wvhf1HUio62xahI=; b=renfcbr3kIRcqG
	0K+rQwScP6IscX/iR4bo5s5tAfaEAFOLZw03AqcPu+WzKcP0ucWLFi2eAmTkcaU6dqoOLtjFZT8Em
	KQdCNHJp7+aQcKUmd/RkIhHQsU8ZgQs+oiXVOQrznZLCD/zJGMq38dJ/Bc/FwPt8F1G1z+29H8HL/
	5tRMEDRoagvqcW7xwK40HJbASoIpjuv+Tpy0jTWrpa34MJ/8X/XKgcm/F4NPUup1fPBzuyJiz5dG6
	B2hathJQ6rkDZm4GOj/yA0KEKToH9Wumm/o0yFVVN4cFwKqgaPkKMRH0aI/c8nN/ffhKp7IzIgg0n
	Ib2wullzm8fElJ1J2ZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIsb-00Ak65-On; Mon, 02 Jan 2023 11:21:22 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIrb-00AjWQ-3g; Mon, 02 Jan 2023 11:20:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E4567240009;
	Mon,  2 Jan 2023 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cHX8Aqnc2BeWf4Socc5lhFPPs1ftUXPoV0NGTjWgg/A=;
	b=ogtyDxur2TztkFZttad/c6NxZB09n/9LG5EgyyOPdMjmVgu79W45Z+6y6d0Cgvrj2c2pJ1
	AB2DSxgTvo+CAxECBvc7b0GeioGAb6iDYjY/jdqjwhWaZ2grU6fxdrYHtBgClj04WsKDIW
	HFRd7vz/bm2HwhBWLx2shmvCak6ew50ZMfxrrY/2sezIFeGrOpH0eMjEJyhUlcwT0KtBl+
	4AwWLY72ta9nj6Kl04BsAMyLiQvmVkI98C+HWhOzozmdZloGq1YBJM0d88yh42nN9epEU2
	2vqUiTcBtFFWkncuX6jEUCh/R9QbUYZ2nc1B/JOzrLRNvVmOZu2Qf3noOfIVig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/7] mtd: rawnand: sunxi: Remove an unnecessary check
Date: Mon,  2 Jan 2023 12:20:15 +0100
Message-Id: <20230102112015.250755-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229181526.53766-4-samuel@sholland.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'85e8177e581964a727410c781410f626e1cb4c25'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_032019_337934_0A9B12D5 
X-CRM114-Status: UNSURE (   6.61  )
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

On Thu, 2022-12-29 at 18:15:22 UTC, Samuel Holland wrote:
> Each chip is required to have a unique CS number ("reg" property) in the
> range 0-7, so there is no need to separately count the number of chips.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
