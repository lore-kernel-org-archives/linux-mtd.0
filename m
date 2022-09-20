Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB8DECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+p3tMzaceXHRf1J3yJBi1hapK8cOWam8GAUUjzxATE=; b=tW9ZIv7i5BCw/h
	5S/zTqOi1WpXaVpbz8xOSDCpMVaCQE4JKTwkIW+tV195h9S/nuedW2u/fo8n1j8eCSdliTlTuF0Ff
	FpzRKYFuYT+cYMR3gswbcj7A0dDyeaRB+kAeAtDHK95Xvj0IxleWXsVzaWmeK9d7tOeA4NAdcb9SP
	Gb6m6POaDZvHpOlHLPjA4bc0/71awuAhSGcDiNQR14cHPOfmtYxOc4eRJCzzcGxHNs9bDXIp7lOke
	X6Oq9tbGOyTAPMVstgmkKFW4FSFTqACJJasNyJREprp6RkpVR39G7PTKN2Zna0uwjY49kVK62NB9D
	sCF3/yRqljLV4QO5GLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYi1-001reN-U4; Tue, 20 Sep 2022 08:34:26 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYh3-001qae-FT; Tue, 20 Sep 2022 08:33:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 73154240016;
	Tue, 20 Sep 2022 08:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUnn0SY0b8c7FVel+4XFVvwfMMOQPbhzVNyjtzhQiFw=;
	b=bze4aP3PaHTj8wKk6e/nhNZUg8Mwu+wOSEBNZAAyM2136lvloJGWzGeVLVydwbJ8ZF4ezw
	/AOUoPsNJjwAQCHHinK9DlaNeofYcRfnEtycP4TmU+vUCBZ2g2uJKUnp55QZmZZxKZmcFw
	IXxrF9Bx3rUxsBODFoGdcrZymJqF13ebA0GNbfUIPAze9kql8CMP9pV2FwlF0q0KYjHtaT
	lpePgYIIwnQOMGzsICvkkLnIDy2afBeEDguIFf6I/k2g4Bj2LhvKN5CH/dRT423s1JTJ82
	9t4OSbxr4AVn/NvO0gEXmEt2fUxX+kIwOEEYURWD8HjtinLRaJ6Oj+6hxVxgBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	BiChao Zheng <bichao.zheng@amlogic.com>,
	YongHui Yu <yonghui.yu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 5/5] mtd: rawnand: meson: not support legacy clock
Date: Tue, 20 Sep 2022 10:33:08 +0200
Message-Id: <20220920083309.600866-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907080405.28240-6-liang.yang@amlogic.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f9ee58cea849331287df21beb5bcc884f2d19356'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013325_689834_2920C919 
X-CRM114-Status: UNSURE (   6.13  )
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

On Wed, 2022-09-07 at 08:04:05 UTC, Liang Yang wrote:
> meson NFC driver use common clock interfaces. so the test robot report
> some errors once using the legacy clock with HAVE_LEGACY_CLK on.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
