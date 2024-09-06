Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74CEE6FE27
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFNeTAHqhtmBk9ZPRXX9570b7XPLH1vowi7gS1ARf7c=; b=s916UzAVC20Yw9
	4J8D8gMeYryqavBHjnhkknoNPjTz2s7rJQfOhyrn7bvbIcRsE8gPGzGx8VDKy9m/bZgfMY/BboaAV
	4iNvBHPSP/1JG60U0pmChmxAnQB2RvI9HHDQsyPFUPj+H49gXGyvOEg7eVVmW76ulzTwErnFgRBO+
	4s9L3XaTU9C/lY0VPuVu2HElG6nj9zDkaLYkPkxNDHeNHEENMZRv18uEFWkG5f+B0OjHgCp/wtHiF
	y/U1h66FR1KsvyXCmFEJAeVFWUfvFJI0wImxpLIhDXJYkqPDPh7XZNQnrlZK2OlGUJlHBAvDYkyFU
	F7reFlVlep+GMyJMXMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smal3-0000000Cjgw-3f9Z;
	Fri, 06 Sep 2024 15:20:21 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaVV-0000000CfCV-3PDm;
	Fri, 06 Sep 2024 15:04:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C59C1BF205;
	Fri,  6 Sep 2024 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gLX4GxsDjXuYrcRxyG/fXuf+Afhpxwi7So/zPttJNUw=;
	b=kRg5+knSqmEj0BHFU8nCB6ceUaYg8uGpewryyD4TR1SpbbaUtuMO8VAonAzH3uVLnsS7gw
	jrUQ5SLNAAdnc7FKr6/knZl9dhd70RR3ff31QMYqp2U4K8FLK2DZmapqd8z7IhL8aFLwj0
	VTZva4B32Bq7FhWHii/kxctEMqzdgJ9OWfeYTSDL0zBjjPK6BTdEaW8YFl9Uxb7djHPRsv
	5WEUf10V26FyD56JhKfSMKiJyEqLEE7VOhj0K+A60uMvNT3I+iy0zNoOsplrgUcypNAHfb
	qs0CYdtjVLh+rihj0XiU5XtwhuT7zlQanOvxkBq5mi6f1NS0jUiUapji1r9HVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>,
	miquel.raynal@bootlin.com,
	michal.simek@amd.com,
	richard@nod.at,
	vigneshr@ti.com,
	liang.yang@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux@treblig.org,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	erick.archer@gmx.com,
	christophe.jaillet@wanadoo.fr,
	val@packett.cool,
	christophe.kerello@foss.st.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	krzk@kernel.org,
	jic23@kernel.org
Subject: Re: [PATCH -next RESEND 01/10] mtd: rawnand: arasan: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:04:13 +0200
Message-ID: <20240906150413.734809-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-2-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7021a797689d288a06cb48d0da44880d1dcaff8d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080418_037864_50D82664 
X-CRM114-Status: UNSURE (   4.53  )
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

On Mon, 2024-08-26 at 09:43:19 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
