Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1027CC52D7C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qd6oHGSvlyJKfN6k6NbrINGhB3ZKhTede2LsgHqlcWg=; b=DXP4ADyFyV+nAH
	aZ22o2Q4yewtE2GegqaydMHREY8echtYsiTDM6SyfNPAegoTiCuwwEt7mkThwB5yIk3s4RjVRbqlT
	4U7QWjYsuXH/7c6raOxD9+r0iQDDE884lZrBD1txKk0ihO7Z65pSLzg58cQse+gAIrq+M5/mE12y4
	jxHunaYnH8te8Zizvro8AqBjVSdHGvXauZ1h9c/Wp2v7UduhwAVrAjFbQilIDvs+B/5fPgjzXrad1
	cJr9TsgOu7O7m/mRtZRFUFCJ3swNyEo+50QIyslzpcIlwY3R342bSH5wrFBvACMK44pk4wTuS/Slz
	3He3YFYcbHIhQPw1DAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shY6L-000000008SY-1Tqp;
	Fri, 23 Aug 2024 17:29:29 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shY5Y-000000008N0-0ncP;
	Fri, 23 Aug 2024 17:28:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F5A81BF205;
	Fri, 23 Aug 2024 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=39K7tc3e0+c8JsHHlSNsIL/mIOqCw4GElUEw8pk8bv0=;
	b=fSTwPzVlyfxghOmNiW7wuk/STl7UuDpohlbS+JLl2wHwaluRPYUnz1DEJwldEgeRvdN2kD
	l1m5EeLpUxN1tZolMidPQqNPKEWckaHlRZpHpy1BpAg+fl2VepPB00G0gR9Qf4efLqbM71
	yoBto3N+tevNZMaIFZ5blMkH1YWcmd80bGH0o+qm0HlBHwbZ+aI/3YVueF1tkG49QNgEws
	YFbu52WuAAZPyrF3pQ/+IuW8A/WCOM2r76eHPrw5L+SvY/Y4eBbL4uX83Qs5+nmaiHSjQn
	5e07aJWZSa7y6Y6P2y7xmDejt+H0gZsaWfKSVuCqSCzXqIo1VtSLegGdxWdAWA==
Date: Fri, 23 Aug 2024 19:28:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kees Cook <kees@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91)
 SoC support), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2] mtd: nand: raw: atmel: Add message on DMA usage
Message-ID: <20240823192836.0e7ddbb0@xps-13>
In-Reply-To: <20240821142006.645306-1-ada@thorsis.com>
References: <20240821142006.645306-1-ada@thorsis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_102840_382324_7D486D22 
X-CRM114-Status: UNSURE (   8.08  )
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

SGkgQWxleGFuZGVyLAoKYWRhQHRob3JzaXMuY29tIHdyb3RlIG9uIFdlZCwgMjEgQXVnIDIwMjQg
MTY6MjA6MDUgKzAyMDA6Cgo+IExpa2UgZm9yIG90aGVyIGF0bWVsIGRyaXZlcnMgKHNlcmlhbCwg
Y3J5cHRvLCBtbWMsIOKApiksIHRvby4KCkkgd2FzIGFib3V0IHRvIHRha2UgdGhlIHBhdGNoIGJ1
dCBJIGZpZ3VyZWQgb3V0IHRoZSBwcmVmaXggd2FzIHdyb25nLApwbGVhc2UgY2hhbmdlIGl0IHRv
ICJtdGQ6IHJhd25hbmQ6IGF0bWVsOiIgKGFuZCBkb24ndCBmb3JnZXQgdG8gY29sbGVjdApOaWNv
bGEncyB0YWcpLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRGFobCA8YWRhQHRob3Jz
aXMuY29tPgo+IC0tLQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
