Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC77EC88E4D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05+s++8nQoKQe3yoAMfa2SqOgpAfzGCKjWUOv9KayDM=; b=jyfPyHv53G8a2u
	iN2uovvlpm9WE8XdTiYeLTBfyT7CV0KaDDsZk6YqFzTQqIpupu/2m3Vy4Tjd7sQc2lfgJwud7qjEj
	NiQNGp326J37jBAUxIdu9xG339TPvgfxjA8cfAfchgFp/a3zvBCahqOIu8VNr5+Ug6VKCgRTGFwJx
	35NOAqiWudvhVPp1/SG+KMo8ymincW5dw7L5QJblwUT61vZASngVg9sRdeKzF0sk1/YX+Tgo6viws
	gYTQON1m1HcqQljIxMU2w0njmqc5Mh1EEiEN01KqQPalT3NoqCqafqiLMzcqUtO/MQENiejeuWZx8
	pUen0jTOL40y9PENvNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51Fp-0000000GkER-3439;
	Fri, 11 Sep 2026 13:25:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51Fo-0000000GkEF-1hqz
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 13:25:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88CBE6020C;
	Fri, 11 Sep 2026 13:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E081F000FF;
	Fri, 11 Sep 2026 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789133119;
	bh=K4Ldxi/ZlTGjQ6moA2LIJ7Z2SgM2eFjuTQuvrL/U/wA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AsDH3hpuHQm8QJOBSEgX9+/vhDIlwBRv91bpb6n8jrUELTQI+hzl5KqhZdLR9hSlM
	 r3cZ1OxGbahXrJVWc+cksRpRICcQ+faTtJDLr9FWCvQ69bAIUH09vpMubmqUjdau7a
	 FZHqTci5oPVLNoRhdmvsHa0L5N9bS2A53UESqFJnz2hRWPbmQmmkowCF+sxecZqIO5
	 P7vJppFqblTERVyqYwfKXYSg3TBfKNG88LIq1gF2Mr6vJTqkO3ItxdGXGMlkWX/AF2
	 8xQTbG/Sqw62Jqeze4ZGz5xm6SBhMAUYlWZB3JHdukuCkUwX04Lmxy2/p3qGvArd79
	 0TiO/geDyVT0w==
From: Michael Walle <mwalle@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
In-Reply-To: <20260827082656.2772784-1-runyu.xiao@seu.edu.cn>
References: <20260827082656.2772784-1-runyu.xiao@seu.edu.cn>
Subject: Re: [PATCH v5] mtd: spi-nor: core: Fix mutex leak in
 spi_nor_rww_start_exclusive()
Message-Id: <178913311701.1915651.4791624215787396187.b4-ty@b4>
Date: Fri, 11 Sep 2026 15:25:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Thu, 27 Aug 2026 16:26:56 +0800, Runyu Xiao wrote:
> spi_nor_rww_start_exclusive() is used as a wait_event_killable()
> condition. When an RWW operation is already in progress, it returns
> false while still holding nor->lock. The wait condition is then retried,
> but spi_nor_rww_end_exclusive() needs the same lock to clear the RWW
> state, so the wait can deadlock.
> 
> Use the same guard(mutex) pattern as the other RWW helpers so nor->lock
> is released on both the busy and successful return paths.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: core: Fix mutex leak in spi_nor_rww_start_exclusive()
      commit: 14dc3dee0efd18a7b85ba59879e7e217c7c6279a

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
