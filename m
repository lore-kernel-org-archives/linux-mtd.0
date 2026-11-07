Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89881606A326
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GT/wmM0O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWje3/2R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B3ddvdVekABD7Ko3l79UlCjjOtGcKV8PSLiYpWwRTzw=; b=GT/wmM0OODcw/a3XWeHVakIn0L
	tvW2PH3SV175AsdsU/XnSw4dFA/G52j3ttT2/7F+XDQNfIU3PDfDdBygVWHnwKfFZTE3mPpAhudhs
	fHTLWSqZSuWK8VmnY5wlYAWrJMdelo1bUahjVaDFNUC22MRvqKwSTztyM/K7WyVRU4khKmd0JY2Oq
	jjyKih7fsfjg+7NAiyOi37hT8qwh9RiT6S9G/hc+hcGR6hjJGBIgcaFDOid2Y4C+i9Tcy8IjJdc/c
	3QL/z1J7xX1lzOV+KBS4Xf1B3XaC+3RoGD5DBVUlmOST7BYh+QBaTdJ84uddyuPdQujtzwGzJqOwP
	ybvBTX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnKe-0000000FOqF-42r4;
	Sat, 07 Nov 2026 20:48:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPnKc-0000000FOpp-3Wuq;
	Sat, 07 Nov 2026 20:48:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4EC3611AD;
	Sat,  7 Nov 2026 20:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4921F0089F;
	Sat,  7 Nov 2026 20:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794084489;
	bh=XiglxFtRswHRrbBgkGYgYBGQsVeSRteW99GaZhMNGiM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OWje3/2Rv7EJDS7J7WAZQ3IaKVBQIPUWgb0tHrXervawYZQjOzVkhShNBwmS1w0Ly
	 NYzny1weZVmROwiM5tWc21yb3MqfhlxLsSki4pBb95h2faR0TLPOt33oizxPzqU42L
	 qsZAMTfit6cvC1nImdFlId31OFqnsXb9MkcVL1pKkpy87MdgH/XuAF4ToOXabjsXGQ
	 cF/aE3/+3UYQmxXLqYrzTKwinwq0GAropZvrRS5tFQphZKCI/yA+kvKt9ycqpqbdvI
	 D6yWmoFemZW3fA01bwPsJbXw+8gocEUHNOnaBHmmuHh9sUcO/vZWR56WTIzSTM9uOx
	 J0JnvKin7eX3Q==
Message-ID: <sashiko-outbox-203327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 51/58] mtd: rawnand: mpc5121: retain chip state across
 removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Brian
 Norris" <computersforpeace@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>, "Arseniy
 Krasnov" <AVKrasnov@sberdevices.ru>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Vitaly Wool" <vitalywool@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>, "Russell King" <rmk+kernel@arm.linux.org.uk>, "David
 Woodhouse" <David.Woodhouse@intel.com>, "Mike Rapoport" <rppt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Christophe
 Kerello" <christophe.kerello@st.com>, "Jason Roberts" <jason.e.roberts@intel.com>, "Michal
 Simek" <michal.simek@amd.com>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Mason
 Yang" <masonccyang@mxic.com.tw>, "Ramuthevar Vadivel Murugan" <vadivel.muruganx.ramuthevar@linux.intel.com>, "Stefan
 Agner" <stefan@agner.ch>, "Lucas Stach" <dev@lynxeye.de>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Dmitry Osipenko" <digetx@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Jorge
 Ramirez-Ortiz" <jorge.ramirez@oss.qualcomm.com>, "Heiko Stuebner" <heiko@sntech.de>, "Yifeng
 Zhao" <yifeng.zhao@rock-chips.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Jacky Huang" <ychuang3@nuvoton.com>, "Shan-Chun
 Hung" <schung@nuvoton.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Han
 Xu" <han.xu@nxp.com>, "Liang Yang" <liang.yang@amlogic.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Kamal Dasu" <kamal.dasu@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Vladimir
 Zapolskiy" <vz@mleia.com>, "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Harvey Hunt" <harveyhuntnexus@gmail.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>, "Michael Walle" <michael@walle.cc>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Tze Yee Ng" <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
 <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-51-0181ef0cc4c8@gmail.com>
Date: Sat, 07 Nov 2026 20:48:02 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiBtcGM1
MTIxOiBtaXNzaW5nIEZpeGVzIHRyYWlsZXIgZm9yIHByb2JlIGxlYWsgYW5kCiAgcmVtb3ZhbCBV
QUYKLS0KCmNvbW1pdCA2NDhjZDIxY2MyZWFjM2M0MDAxMDMzYTExZTlhYzRkZTY0NmMyNWI2CkF1
dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cgo+IG10ZDog
cmF3bmFuZDogbXBjNTEyMTogcmV0YWluIGNoaXAgc3RhdGUgYWNyb3NzIHJlbW92YWwKPgo+IERy
YWluIE5BTkQgYWNjZXNzIGJlZm9yZSB1bm1hcHBpbmcgdGhlIGV4dGVybmFsIGNoaXAtc2VsZWN0
IHJlZ2lzdGVycy4KPiBLZWVwIHRoZSBlbWJlZGRlZCBjaGlwIGFuZCBjb250cm9sbGVyIGFsaXZl
IHVudGlsIHRoZSBmaW5hbCBNVEQKPiByZWZlcmVuY2UsIGFuZCB1bndpbmQgc2Nhbm5lZCBOQU5E
IHN0YXRlIG9uIHVuc3VwcG9ydGVkIGdlb21ldHJ5IGFuZAo+IHB1YmxpY2F0aW9uIGZhaWx1cmUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KCltTZXZlcml0eTogTG93XQpUaGlzIGZpeGVzIGEgcHJvYmUtdGltZSBsZWFrIG9mIG5h
bmRfc2NhbigpIGFsbG9jYXRpb25zIGFuZCBhCnVzZS1hZnRlci1mcmVlIG9uIGRldmljZSByZW1v
dmFsIHdoaWxlIE1URCBoYW5kbGVzIHJlbWFpbiBvcGVuLCBib3RoCnByZXNlbnQgc2luY2UgdGhl
IGRyaXZlciB3YXMgYWRkZWQuICBTaG91bGQgaXQgaW5jbHVkZSBhIEZpeGVzOiB0YWc/CgogIEZp
eGVzOiBiYjMxNWY3NDlmOGMgKCJtdGQ6IG5hbmQ6IEFkZCBNUEM1MTIxIE5BTkQgRmxhc2ggQ29u
dHJvbGxlciBkcml2ZXIiKQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MTEwNy1zdWJtaXQtcmF3bmFuZC1yZXRhaW5lZC1oYW5kbGUt
bGlmZXRpbWUtdjEtdjEtMC0wMTgxZWYwY2M0YzhAZ21haWwuY29tP3BhcnQ9NTEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
