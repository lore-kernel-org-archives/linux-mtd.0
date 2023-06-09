Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21271C7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQDXfGn3ZrZf7xMSzq6Lf6qgbjcUIzGxDe9eoCMcqrs=; b=YL1tyHPGK1Qvkc
	iacypv03UtmQkUtmJsXBxnpUXYP0YbYZaW3lpZPSNT4W071RGAvIe3UOMwA7mea89WyWbHGuBUu7T
	Y1otv2HcxYoY0lai3FwhsuN9G+Ha9ANOaM6Y0d6GvvlwMVDN2HQ4XkrtZaItMBuwF5mBgifcz8574
	ehkN5Twz4kGAhVlbg/syiC5/SkibAjNajcQZBo6wG5yV2MxT7m5siOmrs6jsmcCg8jkvunvIuiyTM
	6V7cq3r/hQPVmN7NMJHV1Jg+OMq24Z/hxRO4vEMG7dWHcJfKYQ+mzdeM4F15O7C0XT0LOIFzxaV20
	mX2pNMDCVgTr36JR+m3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dzQ-00DQPG-1d;
	Fri, 09 Jun 2023 15:25:24 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dzL-00DQGg-35;
	Fri, 09 Jun 2023 15:25:21 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxk2pYyBf/sCVtzjt4I4rozLT44scAgkgI8mNqrb5ms=;
	b=C8YxCA3SmF51PinnYqw5XNEXMsesUX5OzJyssygzcTO4MqX5gOkMkxKBIhp3+4bHMyliU1
	sGcajN9qwPKH0gdmgqZfzrwipqB2l1DtK9zpcpKgbOWxmi9J0ZonTjI2FgVJRqfNffPUYS
	bt4QpTGzKu334CiohwdIGlH/SBq4sVwdpkmYUiE8i2efg8B1FiCGtEeqyiFsfxFplXP7Sg
	3VfgAznsQ10nH7EM+LkAXcecjXYHeXc0d72yTO+stTrxVjT6nV5kXF/4YQbDuPMj2z6V6W
	LZb3OoZeF+PQQGbPGiSbIpREJ8nnhQjqQjdhGNGghThIidpOaLiRnTkaa7kymQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CF7D1BF20C;
	Fri,  9 Jun 2023 15:25:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
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
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: meson: replace integer consts with proper defines
Date: Fri,  9 Jun 2023 17:25:10 +0200
Message-Id: <20230609152510.1187013-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608043644.1271186-1-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'30540a0d05d85ef7e6f740e62c3b44c87396e56c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082520_143785_4E70A871 
X-CRM114-Status: UNSURE (   5.15  )
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

On Thu, 2023-06-08 at 04:36:44 UTC, Arseniy Krasnov wrote:
> Add defines for column address. It makes driver more readable, because
> bitwise OR with 0 looks useless.
> 
> Suggested-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
