Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70327CFD2F6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Nov 2025 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pB4MbMdWzept8y7R5G23UTU5lgatEWYiaU+3+VJXkRs=; b=1P7mDPdPw3/Uww
	vwQeZCCbEpYwp6Amuqvhi7POwkjxJYhEVhZi7v7suqD5VZ1plfJ15+mGubbHK7R0YpH7RsckPDFal
	Y93tZYIQNqUXFY0c5ch5HZrBn9lqiF/ZSE7PoTBQLHhGsYY1LhldAtnUb7IpyHUMKP8J8h5KeSqkK
	hs94thAz8MsDnkwhzrNCPVAoPZKQH8IBeZnBm2hxib3Fz9DRF4e4u26CvRrDVqTP967UBAw9knRMZ
	AW/O3M39ReUkEIEjMmiZUuaAvAGxxN8rPfMnlsZ07euV1ILeIs60MiqkqLA2O8hVq4E2qw8i5pG78
	1XJsjrzw95lwoW2NMuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKKT-00000001XE8-2kXi;
	Sat, 29 Nov 2025 12:45:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPKKR-00000001XDL-1BgK
	for linux-mtd@lists.infradead.org;
	Sat, 29 Nov 2025 12:45:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 03C321A1DE4;
	Sat, 29 Nov 2025 12:45:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBCF760706;
	Sat, 29 Nov 2025 12:45:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 109BA11910699;
	Sat, 29 Nov 2025 13:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764420325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TImXxPp3fH8t3WgGQuC2IHIt10tqIWX7TcyUqtyR31I=;
	b=KpLK2to1cF7NAB3dxoOLV/QWk7f3DOgDWnlCCQ/eWjBGe2OiLoz4MRPaxtNjJ5LhgTdO2x
	liQWrTjoV8SzbJ0IRNAWzjSTpxuBdKdZK+nMBBo+lz6eN4ScfF10Zi8hpoNB3oNhnhPAkB
	EBcOP1L5+m8y1BhDyM8QV2Sd1zOhoSjtmlz4x+NWF5bSJDvmY6HuADwinRYPvMGebmhy3r
	ecHZmVrqRYz0ygRRnstaU1i/ARfGhaUjItbgMb+f1cIphEqym8E4UMuA0rRIXKXq4K6uEQ
	20vrn9fsYJ9NCOmjJv1jyigd96ejKGwakw15qyOFOaK5wOwWkE03lUfTBtfXBQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yury Norov <yury.norov@gmail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Nicolas
 Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>,  Herbert Xu <herbert@gondor.apana.org.au>,
  David Miller <davem@davemloft.net>,  Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>,  Joel
 Stanley <joel@jms.id.au>,  Andrew Jeffery <andrew@codeconstruct.com.au>,
  Crt Mori <cmo@melexis.com>,  Jonathan Cameron <jic23@kernel.org>,
  Lars-Peter Clausen <lars@metafoo.de>,  Jacky Huang
 <ychuang3@nuvoton.com>,  Shan-Chun Hung <schung@nuvoton.com>,  Rasmus
 Villemoes <linux@rasmusvillemoes.dk>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Johannes Berg
 <johannes@sipsolutions.net>,  Jakub Kicinski <kuba@kernel.org>,  Alex
 Elder <elder@ieee.org>,  David Laight <david.laight.linux@gmail.com>,
  Vincent Mailhol <mailhol.vincent@wanadoo.fr>,  Jason Baron
 <jbaron@akamai.com>,  Borislav Petkov <bp@alien8.de>,  Tony Luck
 <tony.luck@intel.com>,  Michael Hennerich <Michael.Hennerich@analog.com>,
  Kim Seer Paller <kimseer.paller@analog.com>,  David Lechner
 <dlechner@baylibre.com>,  Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
  Andy Shevchenko
 <andy@kernel.org>,  Richard Genoud <richard.genoud@bootlin.com>,  Cosmin
 Tanislav <demonsingur@gmail.com>,  Biju Das <biju.das.jz@bp.renesas.com>,
  Jianping Shen <Jianping.Shen@de.bosch.com>,  Nathan Chancellor
 <nathan@kernel.org>,  Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-renesas-soc@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-edac@vger.kernel.org,
  qat-linux@intel.com,  linux-gpio@vger.kernel.org,
  linux-aspeed@lists.ozlabs.org,  linux-iio@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v6 11/26] mtd: rawnand: sunxi: #undef
 field_{get,prep}() before local definition
In-Reply-To: <703d7eec56074148daed4ea45b637f8a83f15305.1762435376.git.geert+renesas@glider.be>
	(Geert Uytterhoeven's message of "Thu, 6 Nov 2025 14:33:59 +0100")
References: <cover.1762435376.git.geert+renesas@glider.be>
	<703d7eec56074148daed4ea45b637f8a83f15305.1762435376.git.geert+renesas@glider.be>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Sat, 29 Nov 2025 13:45:09 +0100
Message-ID: <87h5udm2i2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_044531_446698_F8B90A68 
X-CRM114-Status: UNSURE (   7.43  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpPbiAwNi8xMS8yMDI1IGF0IDE0OjMzOjU5ICswMSwgR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6Cgo+IFByZXBhcmUgZm9yIHRoZSBhZHZl
bnQgb2YgZ2xvYmFsbHkgYXZhaWxhYmxlIGNvbW1vbiBmaWVsZF9nZXQoKSBhbmQKPiBmaWVsZF9w
cmVwKCkgbWFjcm9zIGJ5IHVuZGVmaW5pbmcgdGhlIHN5bWJvbHMgYmVmb3JlIGRlZmluaW5nIGxv
Y2FsCj4gdmFyaWFudHMuICBUaGlzIHByZXZlbnRzIHJlZGVmaW5pdGlvbiB3YXJuaW5ncyBmcm9t
IHRoZSBDIHByZXByb2Nlc3Nvcgo+IHdoZW4gaW50cm9kdWNpbmcgdGhlIGNvbW1vbiBtYWNyb3Mg
bGF0ZXIuCj4KPiBTdWdnZXN0ZWQtYnk6IFl1cnkgTm9yb3YgPHl1cnkubm9yb3ZAZ21haWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+Cj4gLS0tCgpGaW5hbGx5IGFwcGxpZWQgdG8gbmFuZC9uZXh0LCB3aWxsIGJlIHBhcnQg
b2YgdGhlIG5leHQgbWVyZ2Ugd2luZG93LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
