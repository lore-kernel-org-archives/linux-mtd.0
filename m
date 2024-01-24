Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51649C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CWKaWAQAsBU7xHmep7sdUR/MgBPKhjEcuuEoCT0kTg=; b=WO1U7wBpMj/qCg
	7rxg61y5KTVlGOPJert+L2rB25342TiPMzlxpJrob6+JycxK29oId5UAKDR/srm/1C1OiQMNsvdjl
	6Yf1fzK3KxUJiN/X/P86p+XULBM/eYMsKtnxwRVauSeduu4wCwQ6kKIN39CO2d7xyvGeShtTDAknj
	ZfteywCAo8r7AD80KRdY05iQScZzG985BLECFnG8CNInQK8gVd3t0XYSy9PEZQ9DkP3gIznwOgGbn
	blfVOgtJ5RyOAhjJPx/KiGygoJsQgTwLupsW1BZKQZcJR+Z6KCjO1JRyc7nOAOIajwhCFf7LqvMhL
	W8u4qOLYVxqILJgoNkCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh4w-004Txi-36;
	Wed, 24 Jan 2024 17:30:22 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSh4s-004Tve-1L;
	Wed, 24 Jan 2024 17:30:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA1FD20003;
	Wed, 24 Jan 2024 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706117414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDJPwgnovDPZQtAnXZHhrhDNXtdN2BbUYDsnE5iArNU=;
	b=mVolzOCPVR+lxctmATLnQTHk4XMcD68acOR4A0c9we6uG8asCXhfcSc+YaoDS30d/2LjvO
	AISia/Qos/zBCf3VLdQL5f9dT5FZ6VccdjYGftW2FmfLbT0vPSRcKqIiwb0oWwRt4eyJVY
	gmvu4QKQQAk41BWtsNp3SIU3ZW/7d2rRiLzpfm2fcNUk/6fRR6ncNGDd/c5YOQRZKCY8ja
	7yxHhLBOlL8zNE6myAxm0ZdG8O+lBwiyuI2su77WxAAiyGzB2dpxorEFJYOYEziVmxw+Kw
	tEwATAwPhXMunV+sZBaQLLSZ+HCYf1FTzSOKNCNsGKJYSfsX25VnsZZf7mIQog==
Date: Wed, 24 Jan 2024 18:30:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: dregan@mail.com, richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 kursad.oney@broadcom.com, florian.fainelli@broadcom.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com,
 baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v3 02/10] ARM: dts: broadcom: bcmbca: Add NAND
 controller node
Message-ID: <20240124183008.04a1bcb0@xps-13>
In-Reply-To: <20240124030458.98408-3-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
	<20240124030458.98408-3-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_093018_759695_40C4AAA7 
X-CRM114-Status: GOOD (  15.08  )
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

SGkgRGF2aWQsCgpkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlIG9uIFR1ZSwgMjMgSmFuIDIwMjQg
MTk6MDQ6NTAgLTA4MDA6Cgo+IEZyb206IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJv
YWRjb20uY29tPgo+IAo+IEFkZCBzdXBwb3J0IGZvciBCcm9hZGNvbSBTVEIgTkFORCBjb250cm9s
bGVyIGluIEJDTUJDQSBBUk12NyBjaGlwIGR0cwo+IGZpbGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tPgo+IFJldmlld2VkLWJ5
OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYz
OiBOb25lCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+IC0tLQo+ICBhcmNoL2FybS9ib290
L2R0cy9icm9hZGNvbS9iY200NzYyMi5kdHNpICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiAg
YXJjaC9hcm0vYm9vdC9kdHMvYnJvYWRjb20vYmNtNjMxMzguZHRzaSAgICB8IDEwICsrKysrKysr
Ky0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYnJvYWRjb20vYmNtNjMxNDguZHRzaSAgICB8IDE3ICsr
KysrKysrKysrKysrKysrCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2Jyb2FkY29tL2JjbTYzMTc4LmR0
c2kgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9icm9hZGNv
bS9iY202NzU2LmR0c2kgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiAgYXJjaC9hcm0vYm9v
dC9kdHMvYnJvYWRjb20vYmNtNjg0Ni5kdHNpICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
IGFyY2gvYXJtL2Jvb3QvZHRzL2Jyb2FkY29tL2JjbTY4NTUuZHRzaSAgICAgfCAxNyArKysrKysr
KysrKysrKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9icm9hZGNvbS9iY202ODc4LmR0c2kgICAg
IHwgMTcgKysrKysrKysrKysrKysrKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvYnJvYWRjb20vYmNt
OTQ3NjIyLmR0cyAgICB8ICA0ICsrKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvYnJvYWRjb20vYmNt
OTYzMTM4LmR0cyAgICB8ICA0ICsrKysKPiAgYXJjaC9hcm0vYm9vdC9kdHMvYnJvYWRjb20vYmNt
OTYzMTM4ZHZ0LmR0cyB8IDEyICsrKysrLS0tLS0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9icm9h
ZGNvbS9iY205NjMxNDguZHRzICAgIHwgIDQgKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9icm9h
ZGNvbS9iY205NjMxNzguZHRzICAgIHwgIDQgKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9icm9h
ZGNvbS9iY205Njc1Ni5kdHMgICAgIHwgIDQgKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9icm9h
ZGNvbS9iY205Njg0Ni5kdHMgICAgIHwgIDQgKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9icm9h
ZGNvbS9iY205Njg1NS5kdHMgICAgIHwgIDQgKysrKwo+ICBhcmNoL2FybS9ib290L2R0cy9icm9h
ZGNvbS9iY205Njg3OC5kdHMgICAgIHwgIDQgKysrKwo+ICAxNyBmaWxlcyBjaGFuZ2VkLCAxNjUg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvYnJvYWRjb20vYmNtNDc2MjIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2Jyb2Fk
Y29tL2JjbTQ3NjIyLmR0c2kKPiBpbmRleCA3Y2QzOGRlMTE4YzMuLjU1ZmYxODA0M2Q5NiAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9icm9hZGNvbS9iY200NzYyMi5kdHNpCj4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvYnJvYWRjb20vYmNtNDc2MjIuZHRzaQo+IEBAIC0xMzgsNiAr
MTM4LDIzIEBAIGhzc3BpOiBzcGlAMTAwMCB7Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4g
IAkJfTsKPiAgCj4gKwkJbmFuZF9jb250cm9sbGVyOiBuYW5kLWNvbnRyb2xsZXJAMTgwMCB7Cj4g
KwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiArCQkJ
Y29tcGF0aWJsZSA9ICJicmNtLG5hbmQtYmNtNjMxMzgiLCAiYnJjbSxicmNtbmFuZC12Ny4xIiwg
ImJyY20sYnJjbW5hbmQiOwo+ICsJCQlyZWcgPSA8MHgxODAwIDB4NjAwPiwgPDB4MjAwMCAweDEw
PjsKPiArCQkJcmVnLW5hbWVzID0gIm5hbmQiLCAibmFuZC1pbnQtYmFzZSI7Cj4gKwkJCWJyY20s
bmFuZC11c2Utd3AgPSA8MD47Cj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwo+ICsJCQlu
YW5kY3M6IG5hbmRAMCB7Cj4gKwkJCQljb21wYXRpYmxlID0gImJyY20sbmFuZGNzIjsKPiArCQkJ
CXJlZyA9IDwwPjsKPiArCQkJCW5hbmQtb24tZmxhc2gtYmJ0Owo+ICsJCQkJYnJjbSxuYW5kLWVj
Yy11c2Utc3RyYXA7CgpEZXNjcmliaW5nIHRoZSBOQU5EIGNoaXAgaW4gYSBTb0MgRFRTSSBkb2Vz
IG5vdCBsb29rIHJlbGV2YW50IHRvIG1lLgpFdmVuIG1vcmUgaWYgeW91IGFkZCBzb21ldGhpbmcg
bGlrZSB0aGlzIG5hbmQtZWNjLXVzZS1zdHJhcCBzZXR0aW5nCndoaWNoIGlzIHZlcnkgYm9hcmQg
ZGVwZW5kZW50LgoKU2FtZSBhcHBsaWVzIHRvIHlvdXIgYXJtNjQgRFQgcGF0Y2guCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
