Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC7D0E6DD
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2JZwA+CWQl0BaqLhCk92htbiLZZ6L/AUSpgci6Xg6Q=; b=oZtsJIvFH5smda
	gYcLsecV/+zC5lBSR43wFCectmA5dBkm8o2GgAA3j5kU2YtmgdHeN2wYfZa0TLXHi8J1AcEcy/Zcx
	ogz6WElUjwfs+v3ttu2LPMQgZ2GGZARxxEIGeQpgbJoZW0UGhbCEgSQn0pQfS0QUq1euLu0UlSxME
	Io9rYhK+ZOx5cTRsZwmiheWwNi5Zj/xRrZMmr2cZpBhynlY9D9NbHPTRSnlPQSEeFv10Rowy3aygq
	J992BEi6Dw2B3ng0i9FPMbdXX8W79Dc+A+pi6RTjTG2Qk+Xzn0tRVq7yd91Qlia+qvVJaVghsC/mj
	WA/MfBsLV6MA2qaG7M5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pHA-00000006oUr-2brV;
	Mon, 21 Oct 2024 10:04:36 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFS-00000006ntm-3hrv
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:02:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D187E2000A;
	Mon, 21 Oct 2024 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QciFo5dHP82ddOCHWNzJYcO3C8zVXIkPV5OK4TqBMaU=;
	b=GycgOCIfxCXrcQXTiVuFoR0fYyM4MyIRHEAwnywG9UMcbbzK+adWXKp+REYp6goMRx2luM
	uNWaWYePYAb8LqyAd19A0Kl6vcsENb8tyAFtrcdf14h9jxZWN+TiZJBG6/r3Dxr/6aBgz0
	vmPpbsUR8qZDuIkqqCjuX+OydYlFOtErGI1ijybsVi3AcCbTMFOXMQzXr+bVwsTogsKh/h
	Vco6JYUwG2LqQrLs5Ipmp9Y4V46bb9OciB37NB+YPmx2PFys0u8e1c/EO5MH1TIpSRBmHH
	sLqmkvu+S+3cx6fY5Se4boclvkPDrtJBo5AwIZCQLbh4QbHVtHHu+gCiYxGzKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] mtd: rawnand: davinci: break the line correctly
Date: Mon, 21 Oct 2024 12:02:48 +0200
Message-ID: <20241021100248.173452-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007122350.75285-2-brgl@bgdev.pl>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ded621161b02a7dbee39e82863334301ffd731e5'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030251_093401_9F625009 
X-CRM114-Status: UNSURE (   6.57  )
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

On Mon, 2024-10-07 at 12:23:49 UTC, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The line in nand_davinci_get_pdata() prototype is broken in a weird and
> unreadable way. Make it consistent with the rest of the code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
