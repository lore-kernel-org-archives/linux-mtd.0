Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECDAC3A59D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/qOGT49xPR0Kf4E/zHvNJUida8lmKH4UYBt1nnrwiQ=; b=UczZgOvVuoNiBZ
	6sVfbYF7+fN4MRP9c7HVGp9OcYLkK3q1rvHDGllcIlab3LAajEztmwI+tDP2UdKEsZYLmC1XC92Ew
	6t10o83if7X0CtThUz7M74UBz8tJXCT39wISNjcgp6ZcVT2w1VrgV4/lkht2evVy/dgNiwN/ALcUO
	7dWRBoM+4CE9WHY3VexWgbZcqiHTFx4QeWhWDsXpmli1KffYIXkAAJ/lwB/YMb0u2TJVmVs1TAjhD
	PakYSKGaaa2853g98pRhAMLJajzsvKfohoSQo7qZLiR5bIK6FK0w6rMM833l9pun9INKv8xQob9cm
	9fuwfXL1uP9T0NpG2QKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsJ1-00HZPK-0v; Mon, 24 Oct 2022 07:55:31 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omsIp-00HZLv-Eq; Mon, 24 Oct 2022 07:55:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BC1EF1C000E;
	Mon, 24 Oct 2022 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666598113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+DtEIbWCTrMoEhxqNZp5xO+0p2o8LDxYvX/bSafQhA=;
	b=EKvNS6u8jnjegmr7GDNhG+HxpDM+Wj8+KWSwkrOzg4G/WtiE/ROOrbblmt3pAjrvfgueMZ
	jNTxNy9LBLmzrpAyINZWgaV33dHQsxd2oSo/1LGCIw3PJwc8S4Gp1tPDIZwDQizaBcpvvY
	S3ztUWTpqBY/bKIMXiZzkz2tMvCnNm3MdwXcvuQA9cOxsDUOftYKyK5T8gE5BZQRipHKSD
	MEoTEyocU8KUQ2bKMtZt6sK6di8sKvOZGKxCEN0+nn2aWJyMv0pJI2PBN9TXXCi3sZ5UiY
	Jci8bOiL/oSTvMdSx5T2vTxAVT3MDnq5GdNYYMuKfU1RrQ0HaA8QlN4H7V8uHw==
Date: Mon, 24 Oct 2022 09:55:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, Ben Dooks
 <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>, Arnd
 Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tomasz
 Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Guenter
 Roeck <linux@roeck-us.net>, Chanwoo Choi <cw00.choi@samsung.com>, Stephen
 Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Message-ID: <20221024095507.302687f8@xps-13>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
	<20221021203329.4143397-2-arnd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_005519_816885_3B70EFD6 
X-CRM114-Status: GOOD (  10.75  )
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

SGkgQXJuZCwKCmFybmRAa2VybmVsLm9yZyB3cm90ZSBvbiBGcmksIDIxIE9jdCAyMDIyIDIyOjI3
OjM1ICswMjAwOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IEEg
bnVtYmVyIG9mIGRldmljZSBkcml2ZXJzIHJlZmVyZW5jZSBDT05GSUdfQVJNX1MzQzI0WFhfQ1BV
RlJFUSBvcgo+IHNpbWlsYXIgc3ltYm9scyB0aGF0IGFyZSBubyBsb25nZXIgYXZhaWxhYmxlIHdp
dGggdGhlIHBsYXRmb3JtIGdvbmUsCj4gdGhvdWdoIHRoZSBkcml2ZXJzIHRoZW1zZWx2ZXMgYXJl
IHN0aWxsIHVzZWQgb24gbmV3ZXIgcGxhdGZvcm1zLAo+IHNvIHJlbW92ZSB0aGVzZSBoYWNrcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKQWNrZWQt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
