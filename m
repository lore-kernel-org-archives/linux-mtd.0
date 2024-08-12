Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7D4C52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=He2bRQCdaZBHE0Pzh0MM/LG2F92m8kNSwK56WllGFUA=; b=gGwL3Q1sdEEPPq
	cP0IUgLyhkaVYPdYo9AH4dtYU2n5Aurw1nW/FkNQAAH8PeG+YnRHWUmtAIesOH58HijlUq/ioruXG
	L7DCsn35y3WR70MbgYGygMhL8jbm5UP+C6EtKdwSOhGgtjk3x9Hvz0qm1dtPC6UpdXwTUgnaPvZoC
	Ma1Ir+eTBVKl0FDxlLoYIH6sIU6FJy5yIMBaBZuieakmXmo+Sg4zsa5JtU0Mb9wq+IbsJKFRAUnhQ
	DuvuAruLPwV5rjCYfbabkKSJuKilkNFQjGyaEnSB/Rn+vhCNGRJMNDPVb1WE3Dr/+Czh8lWCIylBD
	oSnNJTy+d8YqI9vqctow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdPl8-0000000HCR7-3GEB;
	Mon, 12 Aug 2024 07:46:30 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdPl5-0000000HCQj-0t96
	for linux-mtd@lists.infradead.org;
	Mon, 12 Aug 2024 07:46:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0BAA60002;
	Mon, 12 Aug 2024 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723448783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYJhz07idCmll0VNWnjmDisDihkjE0werNys1pVEO3Q=;
	b=Z4mW4LdRNvEZqdaZMcyTuoJ7VIbeeqc2hHDGsKNErW76JnRwY5FwmpMf+Yh+wWhT62BoZo
	VRn71biGCirvzb/WFkktT/vY8XMYPaLERYFBoD43yk+O1ad2nJIbTMiWdyc13CguY/RU/+
	kkG2AE9qoqiioGlJO144gJkUBblehNG8ZDzghMNO1MVwHVN75m6NeQ+5K7XsNvMe19gsf+
	NcMb9hghIJ9plw1Bxl2T6zC7EzpqPvpXcqi1WUeDqgOtFZpXtQ7YjQQzHT8j78pGCw0sVE
	ZKIq3ZDtUnUqynJRm8ObF/CH1NWfKNyxdM13zCav9u4dKssOoKvxS34BXohEsQ==
Date: Mon, 12 Aug 2024 09:46:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/3] mtd: rawnand: Add Loongson-1 NAND Controller
 driver
Message-ID: <20240812094621.1f4954d4@xps-13>
In-Reply-To: <CAJhJPsUfRpkK6sNuHR0tNfr24bnv8HhJc6FQ0W+_=WeRouhzJQ@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-3-60787c314fa4@gmail.com>
	<20240506095938.4a910adc@xps-13>
	<CAJhJPsUfRpkK6sNuHR0tNfr24bnv8HhJc6FQ0W+_=WeRouhzJQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_004627_720409_F59B72A1 
X-CRM114-Status: GOOD (  11.72  )
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

SGkgS2VndWFuZywKCj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIG5mYy0+ZGF0
YS0+cGFyc2VfYWRkcmVzcyhjaGlwLCBhZGRycywgbmFkZHJzLCBjbWQpOwo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgLyogc2V0IE5BTkQgYWRkcmVzcyAqLwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgbmFuZF93cml0ZWwobmZjLCBOQU5EX0FERFIxLCBuZmMtPmFkZHIxX3JlZyk7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICBuYW5kX3dyaXRlbChuZmMsIE5BTkRfQUREUjIsIG5m
Yy0+YWRkcjJfcmVnKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAr
ICAgICAgICAgICAgIGNhc2UgTkFORF9PUF9EQVRBX0lOX0lOU1RSOgo+ID4gPiArICAgICAgICAg
ICAgIGNhc2UgTkFORF9PUF9EQVRBX09VVF9JTlNUUjoKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIG9mZnNldCA9IG5hbmRfc3Vib3BfZ2V0X2RhdGFfc3RhcnRfb2ZmKHN1Ym9wLCBvcF9pZCk7
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBuZmMtPmxlbiA9IG5hbmRfc3Vib3BfZ2V0X2Rh
dGFfbGVuKHN1Ym9wLCBvcF9pZCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoaW5z
dHItPnR5cGUgPT0gTkFORF9PUF9EQVRBX0lOX0lOU1RSKQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBuZmMtPmJ1ZiA9Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAodm9pZCAqKWluc3RyLT5jdHguZGF0YS5idWYuaW4gKyBvZmZzZXQ7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBlbHNlIGlmIChpbnN0ci0+dHlwZSA9PSBOQU5EX09QX0RBVEFf
T1VUX0lOU1RSKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuZmMtPmJ1ZiA9
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKWluc3RyLT5j
dHguZGF0YS5idWYub3V0ICsgb2Zmc2V0OyAgCj4gPgo+ID4gVGhlIGJ1ZiBwb2ludGVyIGZlZWxz
IGNsdW5reS4gWW91IGRvbid0IGtub3cgZm9yIGhvdyBsb25nIHRoZSBidWZmZXIKPiA+IHlvdSBw
b2ludCB0byB3aWxsIGJlIHZhbGlkLCBwbGVhc2UgZG9uJ3QgZG8gdGhhdC4KPiA+ICAKPiBUaGUg
YnVmIHBvaW50ZXIgaXMgdXNlZCBmb3IgRE1BIHRyYW5zZmVyIGFmdGVyd2FyZHMuCj4gSSByZWZl
cnJlZCB0byBvdGhlciBkcml2ZXJzLCBhbmQgdGhleSB1c2VkIHRoZSBzYW1lIGFwcHJvYWNoLgo+
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjguOS9zb3VyY2UvZHJpdmVycy9t
dGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jI0w2NDcKCm5mY19vcCBpcyBhIGxv
Y2FsIHZhcmlhYmxlLCBpdCBkb2Vzbid0IGxpdmUgcGFzdCB0aGUgZnVuY3Rpb24gY2FsbC4KCj4g
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC45L3NvdXJjZS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyNMMzY2CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
