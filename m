Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635CDCCFA03
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUI7FddlAliW1bTsT8dhTwLnCiDdwWwgEJQqthyZA/c=; b=HtBoAgNEMykpk8
	nfsuPubYwDs9BE+VtUryWgKxt1ZeXDnV4OuusFrb5u8uDWRLFwGzU8VmHYIjOc2A0Ulf44gShdmLD
	G9qDx7rpjworYUhPatdCTehXhC6fxESsGIcw8XbAAoQ+HWQGQyvOYjiJ1TYR+xTNjOUZsFivkU8f7
	wT5y1V5SIEJpX3s8mX+ZBokNBoVWwiWY8+0C0mNZIpDGoEhNLzoDqljg/k0jDxfGp8B61QuzIh3C0
	I1bcXIQwkHix76lNlTpYhXx9ZEqFFYXLuFO89f8xtZUWToUdeebF2rVeXbEcHvIzF6EZI38Tfe3Hz
	p6l6zPm111bi+OmV4L8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0PO-0000000FdWy-2SRo;
	Thu, 06 Nov 2025 13:52:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0PL-0000000FdW3-0mw2
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 13:52:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1E544E4156D;
	Thu,  6 Nov 2025 13:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C0A46068C;
	Thu,  6 Nov 2025 13:52:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E6E1118507C9;
	Thu,  6 Nov 2025 14:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762437123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jlA1rDTx6Lva7xxbNDSbnwmuIRj6XrFx8dhfkF20V3Y=;
	b=N7QrAgMkWFI6HQA3UOPNdJgTNfngqMabJGVtz4L+Z73P+g7Zy9UbJTU+6nw0C9k9RuS7d4
	0t10bFhDoUFVEGJ+Dg0SVEPlweQKe2PAXJr8Jz4p0vCtadpzf6O74ZnS7GqYOlZvfDaY6I
	k8zAULnGAfPT+lFjrdeN7WGH5nH4+yQEOKBvD68jGpg820Mlfz+H4dZozShrI33OjfvP+U
	M+bXMIHVwX6aB2riVG3gPYDkVh8w03xBzHKb5BrG3VlwReQesR+l62n1eXPZUVCqRHWdIc
	lXqhB86i08GEcs4OdPzXCoemI/MVE/PUPlPSH2kxSDqNCyBJvDcIaP6LQyRDCw==
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
Subject: Re: [PATCH -next v6 24/26] mtd: rawnand: sunxi: Convert to common
 field_{get,prep}() helpers
In-Reply-To: <e1c879967328d8c1098aaa014845c2f11874d7c7.1762435376.git.geert+renesas@glider.be>
	(Geert Uytterhoeven's message of "Thu, 6 Nov 2025 14:34:12 +0100")
References: <cover.1762435376.git.geert+renesas@glider.be>
	<e1c879967328d8c1098aaa014845c2f11874d7c7.1762435376.git.geert+renesas@glider.be>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 06 Nov 2025 14:51:43 +0100
Message-ID: <87frar8e1c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_055211_359338_BCAE9FC9 
X-CRM114-Status: UNSURE (   8.02  )
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

SGVsbG8gR2VlcnQsCgpPbiAwNi8xMS8yMDI1IGF0IDE0OjM0OjEyICswMSwgR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6Cgo+IERyb3AgdGhlIGRyaXZl
ci1zcGVjaWZpYyBmaWVsZF9nZXQoKSBhbmQgZmllbGRfcHJlcCgpIG1hY3JvcywgaW4gZmF2b3IK
PiBvZiB0aGUgZ2xvYmFsbHkgYXZhaWxhYmxlIHZhcmlhbnRzIGZyb20gPGxpbnV4L2JpdGZpZWxk
Lmg+Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4KPiAtLS0KPiB2NjoKPiAgIC0gTmV3LgoKVGhhbmtzIGZvciBwcmVlbXB0aXZl
bHkgaGFuZGxpbmcgdGhpcyBjYXNlIQoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpUaGFuc2ssCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
