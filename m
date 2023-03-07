Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D13C678D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3Sh3UoKcRPkzV5yydpec70mDpXzbjl7211XBapkhiM=; b=vO9zGLg0vx6VYS
	6jzBsOZdz1H/v8wM3DQgzkyERDTFC7L1epOlgQ+i68yoAZTOWbmFIfciWP+SYDS1q89XlMiwZOtlj
	ykdHwvG/FphMMHdzYMoR9zyFtC3foNkoRGl+AxCT9oG6d2ehzAB4gTmChFlkTQAGXG0cyD6INat6d
	rcX8S0Mh11m3N0ZhbD1yYPlJWiVLIK9v6LxmqbvA+3BHIcClH/if7zXUb39BsMRR8bTFdFgju/lnh
	ZVsPWMikltRFv7HFPuKQ6jhGnY2go+ZzZIbmCoAlTVDdtpuLyUby3VBHfgH+V2vX2IbehNvV7Rf29
	0LtiI90vpUdSa2vk0N+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcsi-002DCJ-Ii; Tue, 07 Mar 2023 19:21:52 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcsW-002D7U-J6; Tue, 07 Mar 2023 19:21:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AF33EE0002;
	Tue,  7 Mar 2023 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678216896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jiRALHWp1e55wkcvOyL9CF4DO76BHMp1mu0i9xqSDT8=;
	b=LUwmOwDODq5cIiSeh8c/7f3GcXpTtevBpMqwe5mR0kWLi15eHV4KanB+gV5vxGXrAMxxFd
	ximCxN7g1beDKseM5NdjfeTCvWiJhNp5j1fjjBXnaCXAVXXgt/KFjjKL8fOn0tnb8KO/Qs
	Iw3omJ8VBkP33XZ25TFrlAEll7JOMqCMOFLwsUhbt0I6fVmHegVc7oTmDy/XaEeumSI0aA
	mgVffttYfwEKkC2frA/GRLYNSgRlNsuKYEkxHEIOTdi5JhEd7oYrRnVJu7mGUsu5dOmBsw
	V4CEbvTdQkl3LqKcNBhdLOHHPX6zROxL3GffnpLLJvwYfHPWjDHDaZmlPcGA2g==
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
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru,
	oxffffaa@gmail.com
Subject: Re: [PATCH v4] mtd: rawnand: meson: initialize struct with zeroes
Date: Tue,  7 Mar 2023 20:21:33 +0100
Message-Id: <20230307192133.274898-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227102425.793841-1-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4ce341de6c02d02aba7c78a6447ccfcaa9eeb328'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112140_780535_85D37B80 
X-CRM114-Status: UNSURE (   9.95  )
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

On Mon, 2023-02-27 at 10:24:25 UTC, Arseniy Krasnov wrote:
> This structure must be zeroed, because it's field 'hw->core' is used as
> 'parent' in 'clk_core_fill_parent_index()', but it will be uninitialized.
> This happens, because when this struct is not zeroed, pointer 'hw' is
> "initialized" by garbage, which is valid pointer, but points to some
> garbage. So 'hw' will be dereferenced, but 'core' contains some random
> data which will be interpreted as a pointer. The following backtrace is
> result of dereference of such pointer:
> 
> [    1.081319]  __clk_register+0x414/0x820
> [    1.085113]  devm_clk_register+0x64/0xd0
> [    1.088995]  meson_nfc_probe+0x258/0x6ec
> [    1.092875]  platform_probe+0x70/0xf0
> [    1.096498]  really_probe+0xc8/0x3e0
> [    1.100034]  __driver_probe_device+0x84/0x190
> [    1.104346]  driver_probe_device+0x44/0x120
> [    1.108487]  __driver_attach+0xb4/0x220
> [    1.112282]  bus_for_each_dev+0x78/0xd0
> [    1.116077]  driver_attach+0x2c/0x40
> [    1.119613]  bus_add_driver+0x184/0x240
> [    1.123408]  driver_register+0x80/0x140
> [    1.127203]  __platform_driver_register+0x30/0x40
> [    1.131860]  meson_nfc_driver_init+0x24/0x30
> 
> Changelog:
> v1 -> v2:
>  * More details in the commit message.
> v2 -> v3:
>  * Add 'a' article to "interpreted as a pointer".
> v3 -> v4:
>  * Add changelog.
> 
> Fixes: 1e4d3ba66888 ("mtd: rawnand: meson: fix the clock")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
