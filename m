Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBBCC02185
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ex0qKhdiM0Jp0zm3KU1zPUaU6tvNabxtpw0KwZyrpvg=; b=V1hs/IV2OBW/ac
	2TpjY8HCmlTOFHmFtP/pI2Ec5HhzVH9VjOt1cGn0YBZf4Bkl02milCgqR1NVoIARvrEOZKx0bR+c6
	QqwS3orBQv995JsBXDGIvR9quSQqasftG1yET3co5ugiXDdijg9T0VaSuduf9owQWcZRAx2XbQSrl
	lMIme0FiKY6Xck0M0/KLFhSeJn7KZc1GGgEpjYPtW0+4H8Q1lDRRvB0+ldoIEyE2ZULd6l2rmdp8h
	0ft5b1PJMWnrSQGYIWBb2XGGC1PxV1YAzcHGSoYDgQyhMU8Y8+8mEgSGsZ1N0ZNmCQUJlxBR0jkhw
	8HK6YE/NnfVyCjUf98Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8OE-0000000CoRC-2zlz;
	Wed, 15 Jan 2025 18:45:18 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Ab-0000000ClLs-4ADC;
	Wed, 15 Jan 2025 18:31:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 420B0FF803;
	Wed, 15 Jan 2025 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736965870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLoWi3Wg0eiQh/tot5fchMc56NRkY1AedYStPaUs9Pk=;
	b=XVoQSRAsHPXADFu3jVGI7dBwCecPD+dviwtiINSG7gG2QTYI7ZKoCGbAlzsXnHawAhGKwl
	24LiXfzCQR3pIZBqvn9qb/WI76bBR/gYM5iK3v27XfrrihWyj6I9DuAIL0fsvT3vsw3I/q
	czvnLPptcYBnGEnhrm8GhgmQ8vCeUtjENVYUkzFUKo7lU8h2121ib4vf8mK5lggJa2imhw
	wuKxnh8Eev9ag9+Xsu7zpWrkt2h27deaKdBBBwhgImA9Rm+AwpotMeHj0kiG0/Az9PUc1t
	KHhtrdM1rJLw5PWkyTBKEJFeu2A3AfGxN8CmN6JVLXE0bXGUEx1cXfp5ava0qA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v3 21/27] mtd: spinand: Create distinct fast and slow read from cache variants
Date: Wed, 15 Jan 2025 19:31:02 +0100
Message-ID: <173696548250.435435.10416906996871126975.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com> <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103114_290445_E54B9906 
X-CRM114-Status: GOOD (  13.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxMCBKYW4gMjAyNSAxNTo0NToyMyArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBTbyBmYXIsIHRoZSBTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX09QIG1hY3JvIHdhcyB0
YWtpbmcgYSBmaXJzdAo+IGFyZ3VtZW50LCAiZmFzdCIsIHdoaWNoIHdhcyBpbmR1Y2luZyB0aGUg
cG9zc2liaWxpdHkgdG8gc3VwcG9ydCBoaWdoZXIKPiBidXMgZnJlcXVlbmNpZXMgdGhhbiB3aXRo
IHRoZSBub3JtYWwgKHNsb3dlcikgcmVhZCBmcm9tIGNhY2hlCj4gYWx0ZXJuYXRpdmUuIEluIHBy
YWN0aWNlLCB3aXRob3V0IGZyZXF1ZW5jeSBjaGFuZ2Ugb24gdGhlIGJ1cywgdGhpcyB3YXMKPiBs
aWtlbHkgd2l0aG91dCBlZmZlY3QsIGJlc2lkZXMgcGVyaGFwcyBhbGxvd2luZyBhbm90aGVyIHZh
cmlhbnQgb2YgdGhlCj4gc2FtZSBjb21tYW5kLCB0aGF0IGNvdWxkIHJ1biBhdCB0aGUgZGVmYXVs
dCBoaWdoZXN0IHNwZWVkLiBJZiB3ZSB3YW50IHRvCj4gc3VwcG9ydCB0aGlzIGZ1bGx5LCB3ZSBu
ZWVkIHRvIGFkZCBhIGZyZXF1ZW5jeSBwYXJhbWV0ZXIgdG8gdGhlIHNsb3dlc3QKPiBjb21tYW5k
LiBCdXQgYmVmb3JlIHdlIGRvIHRoYXQsIGxldCdzIGRyb3AgdGhlICJmYXN0IiBib29sZWFuIGZy
b20gdGhlCj4gbWFjcm8gYW5kIGR1cGxpY2F0ZSBpdCwgdGhpcyB3aWxsIGZ1cnRoZXIgaGVscCBz
dXBwb3J0aW5nIGhhdmluZwo+IGRpZmZlcmVudCBmcmVxdWVuY2llcyBhbGxvd2VkIGZvciBlYWNo
IHZhcmlhbnQuCj4gCj4gWy4uLl0KClRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBoYXZlIGJlZW4gYXBw
bGllZCB0byBuYW5kL25leHQ6CgpbMjEvMjddIG10ZDogc3BpbmFuZDogQ3JlYXRlIGRpc3RpbmN0
IGZhc3QgYW5kIHNsb3cgcmVhZCBmcm9tIGNhY2hlIHZhcmlhbnRzCiAgICAgICAgY29tbWl0OiAw
NDIwODcyNDc4MzVkYWQxZWM1ZTM5MDUyYWJmMDIyZmQxM2M2MzI2ClsyMi8yN10gbXRkOiBzcGlu
YW5kOiBBZGQgYW4gb3B0aW9uYWwgZnJlcXVlbmN5IHRvIHJlYWQgZnJvbSBjYWNoZSBtYWNyb3MK
ICAgICAgICBjb21taXQ6IDdjZTBkMTZkNTgwMmJmZGU0MjA5ZTUyZWU4YWQ2NDRjYTFlYWI0MjMK
WzIzLzI3XSBtdGQ6IHNwaW5hbmQ6IEVuaGFuY2UgdGhlIGxvZ2ljIHdoZW4gcGlja2luZyBhIHZh
cmlhbnQKICAgICAgICBjb21taXQ6IDY2NmMyOTliZTY5NmYwMmMzMzU0ZGExMDQyOTVmYjk0Yjhm
NjVkMjUKWzI0LzI3XSBtdGQ6IHNwaW5hbmQ6IEFkZCBzdXBwb3J0IGZvciByZWFkIERUUiBvcGVy
YXRpb25zCiAgICAgICAgY29tbWl0OiA4NTg2YmM4ZDk1NDg4ZGZhYWRiYzFhZjg5YmE1OTkwMGQy
YzM5MTE5ClsyNS8yN10gbXRkOiBzcGluYW5kOiB3aW5ib25kOiBVcGRhdGUgdGhlICpKVyBjaGlw
IGRlZmluaXRpb25zCiAgICAgICAgY29tbWl0OiAxZWE4MDhiNGQxNWI5YmRkYzQ4YWY3NWIwNjY4
YjgyMzY2YjViOTI3ClsyNi8yN10gbXRkOiBzcGluYW5kOiB3aW5ib25kOiBBZGQgY29tbWVudCBh
Ym91dCBuYW1pbmcKICAgICAgICBjb21taXQ6IDYxYzcxNTVlM2ZlOTM4ZDRkYTQ2NzFiMmY4NGUy
OWVhZjc5ZjVmNDYKWzI3LzI3XSBtdGQ6IHNwaW5hbmQ6IHdpbmJvbmQ6IEFkZCBzdXBwb3J0IGZv
ciBEVFIgb3BlcmF0aW9ucwogICAgICAgIGNvbW1pdDogYmU3YTA1ZGI0MjUyZWRiZmZiNDM0ODRi
MTQ3NTUwNDhmYjhkYjcxMAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
