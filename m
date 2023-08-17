Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DCAC27C7A
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 08:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKz1ceRyYhkWZUJ5yLJl6lyES+ClgS4mcKnXaVcl1b8=; b=jRnfdLZkF78NoI
	dwiqLiKBTAPrs97Mz7e7PQbGE+nfLfjeEE0o5niAqg/TzSqbpqqlJS2YaBKqMVfBvgAQygQPL1ahU
	zAAIIg4h1acLM8SErgcNoXJBm92KEImguySpWM9XBr/FlwNrqoIeBOD7egPF+73dVnsFot7F8IYJ2
	l8JIKxznpZNhTRRU2HEMTJ0DYj+uzaJH3caDwjmuIQ6HeV7B49TAZ8W4KYsopJFpxd81JO1PtoOAy
	wez1JlhTFi59YYF8BtoPOwGxyEv1jWU8YIuCmBxjSfdUsiREnLfwGmhdBUvVU9rokFOYkuRqrH2qJ
	4E03kcVvu9yc3o6DYbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYWE-005qIL-1v;
	Thu, 17 Aug 2023 08:38:14 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWYW9-005qHO-0Q;
	Thu, 17 Aug 2023 08:38:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 361EE1C0009;
	Thu, 17 Aug 2023 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692261484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFrTZexqLjQTWDNUsvnncrD9kb8WfaN/zu8FiMtEY4A=;
	b=lCDxw3lXC0rdW6d/sfAkKUVKB76hkI6rZgcTaNM6U7Qx6Izl1d2tvqTk7UV0Z/DOruFrMq
	e1mI0T6e/MO5/fuk6FvcsuoE4e1pdfLL3zH3dSYMf5+noGzZb2FQ5wFH3B4I66yfAGGgEd
	hVlneit7lZSNTujY0iVpbt91htI1D52CZAy5G2jOmtbs68gtApOnwZ65SN05jjoUOOYa0/
	fe0eJ7FjgBTvGTT9fL+OAMondBlTiidxhLbU+qHh7tQ/iqCMKYKGeRCRxV/hfmH5kIJD12
	HbQVMNi/JV61f4tUoUKKg03ZRWhrZ5xcDw+AYzgocORVBX/3CWpctKyyed8BpQ==
Date: Thu, 17 Aug 2023 10:37:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <michal.simek@amd.com>,
 <vz@mleia.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <stefan@agner.ch>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <michael@walle.cc>,
 <frank.li@vivo.com>, <robh@kernel.org>,
 <martin.blumenstingl@googlemail.com>, <philmd@linaro.org>,
 <geert+renesas@glider.be>, <u.kleine-koenig@pengutronix.de>,
 <rogerq@kernel.org>, <paul@crapouillou.net>, <nicolas.ferre@microchip.com>,
 <yangyingliang@huawei.com>, <dmitry.torokhov@gmail.com>, <heiko@sntech.de>,
 <christophe.leroy@csgroup.eu>, <christophe.kerello@foss.st.com>,
 <jinpu.wang@ionos.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next 11/11] mtd: spi-nor: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230817103759.3b8934a7@xps-13>
In-Reply-To: <20230817024509.3951629-12-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
	<20230817024509.3951629-12-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_013810_613734_9B77926D 
X-CRM114-Status: UNSURE (   8.71  )
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

SGkgTGksCgpsaXpldGFvMUBodWF3ZWkuY29tIHdyb3RlIG9uIFRodSwgMTcgQXVnIDIwMjMgMTA6
NDU6MDkgKzA4MDA6Cgo+IEFmdGVyIHRoZSBjb21taXQgN2VmOTY1MWU5NzkyICgiY2xrOiBQcm92
aWRlIG5ldyBkZXZtX2NsayBoZWxwZXJzIGZvcgo+IHByZXBhcmVkIGFuZCBlbmFibGVkIGNsb2Nr
cyIpLCBpdCBjYW4gcmVwbGFjZSB0aGUgcGFpciBvZiBmdW5jdGlvbnMsCj4gZGV2bV9jbGtfZ2V0
KCkgYW5kIGNsa19wcmVwYXJlX2VuYWJsZSgpIHdpdGggYSBzaW5nbGUgaGVscGVyIGZ1bmN0aW9u
Cj4gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKS4gTW9yZW92ZXIsIHRoZSBkcml2ZXIgd2lsbCBrZWVw
cyBhIGNsb2NrIHByZXBhcmVkCj4gKG9yIGVuYWJsZWQpIGR1cmluZyB0aGUgd2hvbGUgbGlmZXRp
bWUgb2YgdGhlIGRyaXZlciwgaXQgaXMgdW5uZWNlc3NhcnkgdG8KPiB1bnByZXBhcmUgYW5kIGRp
c2FibGUgY2xvY2sgZXhwbGljaXRseSB3aGVuIHJlbW92ZSBkcml2ZXIgb3IgaW4gdGhlIGVycm9y
Cj4gaGFuZGxpbmcgcGF0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaSBaZXRhbyA8bGl6ZXRhbzFA
aHVhd2VpLmNvbT4KCldpdGggdGhlIGNvbW1pdCBsb2cgY29ycmVjdGVkIGFzIHN1Z2dlc3RlZCBp
biBhbm90aGVyIGFuc3dlciwKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
