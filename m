Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACE9EE49A5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+wKkbBv7/0zQp0rssKlxaCvLJiGqnW5ih5lAH+WOEs=; b=z7VXQtk0CkMN03
	xrqfZnTi64pWrVcW3ow0aQNKam4prBTTiR5qqmXVAwin5KhNQxfvwVIR+vMVL0r9mICLrLPwWyrlW
	pZymQDZy0fLr1J9MN5nndl9Iig7rJVHvxR5zlCxwvX4WTcUDE08BiPTTAqVzMPLdrcuervquo1Xqr
	+pjlZHDFmiL5SBOwS7hdMlohJVGKV7/5UoYU/GkGsOL834iO9iz+KKmJPkziRUL+mCtENli+SMuxR
	uSJJsqUzPc64mZSMyMd5YcmWxT+2uIRxiCmuWa6H6wcGRN9/ukT4jeS9jtDeCiW+IYu+iowmhTlYA
	utg3a41WQEvsA+FouIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXznl-00DPzQ-1G;
	Mon, 21 Aug 2023 07:58:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXznN-00DPgI-09;
	Mon, 21 Aug 2023 07:57:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBD85C0002;
	Mon, 21 Aug 2023 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692604671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IUv1o9IMNE3avyw4itt9oKedRJf+XuJZ1Of8jI5p344=;
	b=FgVCZzjueGuohcIwUfV3YqZNYJT2uf1bFgJQnpCdGt4r3uV/NbakTu2Gn303Ss01ka5qOV
	0tI7OIaQeSIb8I6QHINr5eOboVwA16o8e2BtpqW7FchqJaXHQ3IJb62DV64FmjxrNtJey6
	bLzQySO7eo7MS4r0y50ciF+hdyX9QJlwrxdkBxGu/YRHKekxSedTTek6TKKvlrkLeO6nX6
	YW3ww1VDSltXcL3P52+tMpr3UdMUo8fkUh9puqQi2TQmOWcuRLEnGK6IdxM8V7zXCbpUp6
	1fNVQDUiGUHodWjOdJYtaAIMFDphPvFA/tAC4LHmXf+VZvqqo61Ps3L8eTCV6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>,
	miquel.raynal@bootlin.com
Cc: alexandre.torgue@foss.st.com,
	angelogioacchino.delregno@collabora.com,
	christophe.kerello@foss.st.com,
	christophe.leroy@csgroup.eu,
	dmitry.torokhov@gmail.com,
	frank.li@vivo.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jinpu.wang@ionos.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	mcoquelin.stm32@gmail.com,
	michael@walle.cc,
	michal.simek@amd.com,
	paul@crapouillou.net,
	philmd@linaro.org,
	pratyush@kernel.org,
	richard@nod.at,
	robh@kernel.org,
	rogerq@kernel.org,
	samuel@sholland.org,
	stefan@agner.ch,
	tudor.ambarus@linaro.org,
	u.kleine-koenig@pengutronix.de,
	vigneshr@ti.com,
	vz@mleia.com,
	wens@csie.org,
	yangyingliang@huawei.com
Subject: Re: [PATCH -next v3 07/12] mtd: rawnand: mtk: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 09:57:48 +0200
Message-Id: <20230821075748.33248-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-8-lizetao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2b34e8bd2f582be6342a9baae31a519698392444'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005753_215443_EDA4500E 
X-CRM114-Status: UNSURE (   7.30  )
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

On Mon, 2023-08-21 at 03:17:32 UTC, Li Zetao wrote:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly, so drop
> the label "clk_disable". And both mtk_nfc_enable_clk() and
> mtk_nfc_disable_clk() now have a single user, which is the resume or
> suspend callback, so drop this two helper function and just move related
> operations in the resume or suspend function.
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
