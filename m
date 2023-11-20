Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB72C54E76
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhHEc1w64O00wqUfqhHOuCIRSM5AOTaHO1PhOnOGIak=; b=rwdkmuLznU10lI
	5wkb3rB11BrZVJtu0agzvOC2hBR++oXEcPMy1iFLpOZbALKVz4UZRTVgnL/xu7x/l0+wmvgyiJ2s7
	gJ1Zpgn0pr0cmssqU4ATz4Lx1rlDTiBCPRVe7Gy22YmMQKArRvwdnWTPURewzb8Lw2axXWiQd9MdM
	vmc2FjGtbIa3zme5K+bbCy+9z7ruROWJZnSRDZ2p6EXiJo/x/Yqv0sbvEEtemm2Focxfsv9+O+N4M
	AaLwvr6S/xAB4QLy/HasUj1FfdYqPTJPb/gTvNb318qa+aOAcxhh4xSqHToYUSV3fMKJDy69ZE2HQ
	I9GP6o8+0u3XEGTEktoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r51nh-00BoXB-2Q;
	Mon, 20 Nov 2023 10:46:45 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r51nd-00BoUw-2u;
	Mon, 20 Nov 2023 10:46:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 532FB6000C;
	Mon, 20 Nov 2023 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700477194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=riWKqnHwmmCAfQ9aq9A27h5PgZAbzaHajFTcCAZAdzU=;
	b=d0pzteUyP+wl0OT0DVXIPrwH0cXU/NkGKnVXIUWykOx2r9nxJfl+2sWDZi6Vxjj6v+GZSD
	3VJnXgMEVMQLcOeTyAU3BbnmkPpjI8hqIzoApI02DpQyA8SJhgGpOvKy0sxRqiBq2TnPql
	EImn/3TdQ00ZHDLZI7Guf9IUBkw1zO+ayHhnijyz4isVLfRntQRyup4MSkoZ7oIis786CI
	HWHAyRbzFMBz/FvVovfJkMFz5Kks+IpAUiwDNlEg4UnoV+WhiJLA8973zQIY8L9gQuNXUl
	5IDxyCyodc7dIxkSN4nroyF2eLLMqj+CpaRXD//XpKwLaCvhbniJkRonx06/Sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: meson: initialize clock register
Date: Mon, 20 Nov 2023 11:46:30 +0100
Message-Id: <20231120104630.3524940-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120064239.3304108-1-avkrasnov@salutedevices.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'acb1fd579efbcac26ce8f9c4fc8bd82f7eaa56e9'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_024642_086826_93EDD77B 
X-CRM114-Status: UNSURE (   5.95  )
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

On Mon, 2023-11-20 at 06:42:39 UTC, Arseniy Krasnov wrote:
> Clock register must be also initialized during controller probing. If
> this is not performed (for example by bootloader before) - controller
> will not work.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
