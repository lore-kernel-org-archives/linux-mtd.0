Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B10EE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVeWu0bXoMx7XuwwlcD4/WD1Cg6Go+fZ4aNb1cSbDAY=; b=b8qzoGlv1uKO93
	VvTGar7ouZugwmGt5Htv/2x0LuHi+Lhd5iRTqErwEdKi4Qbj+Im87nrouNy6UjSNr3vJ+d23iuTZq
	tfiRxbxEkeMa/uVT7g0h60TP8XKBVDa7L5mfq8d61Eo3/byV7nn5aXCU4/dZ3x56+9MMOx1DJ0ml+
	YOdW0m2zzm71A358z4AOsbhxDaKDYYsFbtIjXwby6rMTNSFoLWqHU2VD+AG6spQf+xheHGFTeipBH
	Cm7hIV3wvFPEWm8DPjjUPflIS7JX3EQzYX+OMPBYAyJHD1xFJ/H22rz+JKzGHcClxi9CtH1Gv1EE+
	njrJlWlZqigBLxYypj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjEf-000wam-1N;
	Mon, 11 Sep 2023 15:54:01 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjEb-000wXC-1X
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 15:53:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E264560010;
	Mon, 11 Sep 2023 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694447631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlumLDfPViZc0xloFKIh644KDGw78c+ut/NV7iKNtlQ=;
	b=PGYyhmBDNxgZ23BYOsmdh+lwPt+28Bu0FcRd5Y0euqtud4y8TVkLV5w1nqSLU3RhGc0ged
	ZMx0YS7XU4RIMdFShZSRG+7+4uq+tYiS7oSIvMd/O0umfw/ZAh+O89Y0qHI5+XaI8QdMw7
	tqBE/RfhWXmIMGu0bqpYBl9i17WwJxQfRZ0Pwalccef1RMGombaFZaiT387NI50rfg6ehm
	hJWDgZ/ITNPFRxUySAvfzy0G9acnFCbnvJacSil2KtV/76zis/Ay+tXHP5buSv2KQoCUSC
	xKAnqYm3NFswi6TeVP9y2dpSpk9C1s6tcx3+my40GVlrHjqceleGPILjemvVwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Ricardo Ribalda <ribalda@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: physmap-core: Restore map_rom fallback
Date: Mon, 11 Sep 2023 17:52:42 +0200
Message-Id: <20230911155242.610991-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <550e8c8c1da4c4baeb3d71ff79b14a18d4194f9e.1693407371.git.geert+renesas@glider.be>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6792b7fce610bcd1cf3e07af3607fe7e2c38c1d8'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085357_664742_72565A82 
X-CRM114-Status: UNSURE (   7.52  )
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

On Wed, 2023-08-30 at 15:00:34 UTC, Geert Uytterhoeven wrote:
> When the exact mapping type driver was not available, the old
> physmap_of_core driver fell back to mapping the region as ROM.
> Unfortunately this feature was lost when the DT and pdata cases were
> merged.  Revive this useful feature.
> 
> Fixes: 642b1e8dbed7bbbf ("mtd: maps: Merge physmap_of.c into physmap-core.c")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
