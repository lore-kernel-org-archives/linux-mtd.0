Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6A4CD37B4
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2024 14:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7u18fHn2dCAz9qImgl+iS2VzgLylZ3P/776zhnsAfw=; b=COWq83RMZPtl10
	35ci1jFrK8C3eLDG3c5VyX+yHOjaguW0q3CULQPJ15bMF/gpjkuFNOs9og64urniXu4Tzr+RrlZPy
	pysZm7s/vVksSPpg7mEUZegNvyVLeUpYl9/zhF12e584oOrZtgZwp/AYeARD/gK24TgxmDtkBw6Ju
	0ZvA7apKFZdqqjITzyF/P3gR1I0yEe08LWaNIB58WEndthWPT7DmYucG0g+xtl3RGGXaM2t4gMqpc
	QbaKKo5hrdI/Wd0Lg3dli/p2N7ImcVHMhjj2FPrMre6UZ/kmmG1A+SW44h/x9+fuS8k2e7w/nHGYC
	ZtI4iehFmw24ZvV3a3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqjy-00000004iRa-1KWh;
	Wed, 04 Sep 2024 14:12:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqgF-00000004hUI-24n7;
	Wed, 04 Sep 2024 14:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18C565C555E;
	Wed,  4 Sep 2024 14:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D5AC4CEC2;
	Wed,  4 Sep 2024 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725458898;
	bh=3q29PgcQ2KYbEcJauFATC6sMPQysTk+ZOJKpqoIZtgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AK75AI5zKferY+Gqc5ROJeCW1lOZK5vJL8aQ/JR8oTEgAupYZwsDGQUNM7SR3Y8Nl
	 aN9CARNwUf4lFYiqcGKxHQrxAzdvbLz4tZ9l6v6yfDHLyk+g3fync0P/DpELqdueM4
	 VqMSWSuAvvj0/qJ9sgI2KMTJg2u+GhpFtR+4VYOcDUJl+X8uAeJGzMvYMJmagGkhrT
	 aPs+HGBEhsoWn2TVEc07oG3wm9e2f2TibwTGdhEdYRSHQ9tGL4go/lztRpysx7aMRX
	 4iUguOX+jtRsz9ymoOCQOdS2boyKOyySgJVZ/+MpzSTJTPobuvOMZW9uS/xHEOCHDr
	 hvYU6RPff+xEg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  <linux-arm-kernel@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH next 2/2] mtd: rawnand: mtk: Fix init error path
In-Reply-To: <20240826153019.67106-2-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Mon, 26 Aug 2024 17:30:19 +0200")
References: <20240826153019.67106-1-miquel.raynal@bootlin.com>
	<20240826153019.67106-2-miquel.raynal@bootlin.com>
Date: Wed, 04 Sep 2024 16:08:15 +0200
Message-ID: <mafs05xrbika8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_070819_670388_9EFD0EC0 
X-CRM114-Status: GOOD (  10.36  )
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

On Mon, Aug 26 2024, Miquel Raynal wrote:

> Reviewing a series converting the for_each_chil_of_node() loops into
> their _scoped variants made me realize there was no cleanup of the
> already registered NAND devices upon error which may leak memory on
> systems with more than a chip when this error occurs. We should call the
> _nand_chips_cleanup() function when this happens.
>
> Fixes: Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Did a quick scan. Can't see anything (obvious) else being leaked on
error paths.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
