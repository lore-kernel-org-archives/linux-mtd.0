Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08161C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rt7lbDPGStM9R1FovWTvl1sdVfBHnlHXG5JVu2G9Wcs=; b=IbADUHQ12zFHIo
	VBDFxRKiOEV/iueNr1FlonofXaTRld4kr0ERk8XMIIWtMNHDujNvE5mHxJDrhI4gQUJHErssB3jR0
	/AJiHHeyaKsRC+Ft6lFhv84c5siWqtSptKoEjFpCkdEmhtQR0Ild0ICmgm8ldDueKQmwbO4mHZT8f
	QSAymfapyoizxv77D/ChHVbNGGS4LIf5CAFmUtkO0xDpono/LXlby3DRZOh73MTXfjtkBFYAa+Ah9
	xWeVFi/UD/jg0w98+FJAAaWFzlc2VmC4TmvSUTaHmdjIu13BL7Twl8kL/H3eEbgwKGsRlTjiDyIKa
	3QFI7467jiqmFmfYKWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1280-00Eqtj-2t; Fri, 02 Dec 2022 09:14:40 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p127o-00EqsB-LG; Fri, 02 Dec 2022 09:14:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 193101BF216;
	Fri,  2 Dec 2022 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669972463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mo+eSjGRNKIzkQtyYbswTdgChJlhTFTWdGiiawXOxBI=;
	b=VdhNUhNp8yqwDIE7OuxejSu6Dr4RHeTfyVcIJZ5G8h7bbIXyBBgg0RRGGSWEkM5GgrgxkM
	t9nIVpFkYMg7rxsaIrXm+mSsspuXCjl59NGOk0hP01XMqLUjPpQ6efmBjFE0hLbUNomTvA
	zhcla/lwYfWI+GrvAdoAIMapwNRYOKrNw7uL9DRZmOqkdKe9OlrUaHZtgqiTba/9zyo3o0
	HieI0tG3U8hUM6at+spQzIccZyYRHsQzeOwckry6hDvgcDTU3uP9jdMleLVG52DMQ9ai2y
	4wUWf7UA685CoEs8+JUvJXq10x6eGHkCDkc4Ny6LJm99FDsugtgIh0yX8B/RZQ==
Date: Fri, 2 Dec 2022 10:14:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Marek Vasut
 <marex@denx.de>, Francesco Dolcini <francesco.dolcini@toradex.com>, Shawn
 Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221202101418.6b4b3711@xps-13>
In-Reply-To: <20221202071900.1143950-1-francesco@dolcini.it>
References: <20221202071900.1143950-1-francesco@dolcini.it>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_011429_049147_EEFC164C 
X-CRM114-Status: GOOD (  24.42  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gRnJpLCAgMiBEZWMg
MjAyMiAwODoxOTowMCArMDEwMDoKCj4gRnJvbTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNj
by5kb2xjaW5pQHRvcmFkZXguY29tPgo+IAo+IEFkZCBhIGZhbGxiYWNrIG1lY2hhbmlzbSB0byBo
YW5kbGUgdGhlIGNhc2UgaW4gd2hpY2ggI3NpemUtY2VsbHMgaXMgc2V0Cj4gdG8gPDA+LiBBY2Nv
cmRpbmcgdG8gdGhlIERUIGJpbmRpbmcgdGhlIG5hbmQgY29udHJvbGxlciBub2RlIHNob3VsZCBo
YXZlCj4gc2V0IGl0IHRvIDAgYW5kIHRoaXMgaXMgbm90IGNvbXBhdGlibGUgd2l0aCB0aGUgbGVn
YWN5IHdheSBvZgo+IHNwZWNpZnlpbmcgcGFydGl0aW9ucyBkaXJlY3RseSBhcyBjaGlsZCBub2Rl
cyBvZiB0aGUgbmFuZC1jb250cm9sbGVyIG5vZGUuCgpJIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0s
IEkgdW5kZXJzdGFuZCB0aGUgZml4LCBidXQgSSBoYXZlIHRvIHNheSwgSQpzdHJvbmdseSBkaXNs
aWtlIGl0IDopIFRvdWNoaW5nIGFuIG10ZCBjb3JlIGRyaXZlciB0byBmaXggYSBzaW5nbGUKYnJv
a2VuIHVzZSBjYXNlIGxpa2UgdGhhdCBpcy4uLiBwcm9ibGVtYXRpYywgZm9yIHRoZSBsZWFzdC4K
CkkgYW0gc29ycnkgYnV0IGlmIGEgNi4wIGtlcm5lbCBicmVha3MgYmVjYXVzZToKLSBhIGxlZ2Fj
eSBzY2hlbWUgaXMgdXNlZCBpbiB0aGUgZGVzY3JpcHRpb24KLSB1LWJvb3Qgc3RpbGwgZG9lcyBu
b3QgY29uZm9ybSB0byB0aGUgRFQgc3RhbmRhcmQKLSBhIHBhdGNoIHRyaWVzIHRvIG1ha2UgYSB0
b29sIGhhcHB5ClRoZW4gdGhlIHNvbHV0aW9uIGlzIGNsZWFybHkgbm90IGFuICdtdGQgY29yZScg
bWFpbmxpbmUgcGF0Y2guCgpJZiB5b3UgcmVhbGx5IHdhbnQgdG8gd29ya2Fyb3VuZCBVLUJvb3Qs
IGVpdGhlciB5b3UgcmV2ZXJ0IHRoYXQgcGF0Y2gKb3IgeW91IGp1c3QgZml4IHRoZSBEVCBkZXNj
cmlwdGlvbiBpbnN0ZWFkLiBUaGUgcGFyZW50L2NoaWxkL3BhcnRpdGlvbnMKc2NoZW1lIGhhcyBi
ZWVuIGVuZm9yY2VkIGZvciBtYXliZSA1IHllYXJzIG5vdyBhbmQgZm9yIGEgZ29vZCByZWFzb246
IGEKTkFORCBjb250cm9sbGVyIHdpdGggcGFydGl0aW9ucyBkb2VzIG5vdCBtYWtlIF9hbnlfIHNl
bnNlLiBUaGVyZSBhcmUKcGxlbnR5IG9mIGV4YW1wbGVzIG91dCB0aGVyZSwgaW14Ny1jb2xpYnJp
LmR0c2kgaGFzIHJlY2VpdmVkIG1hbnkKdXBkYXRlcyBzaW5jZSBpdHMgaW50cm9kdWN0aW9uIChm
b3IgdGhlIGJlc3QpLCBzbyB3aHkgbm90IHRoaXMgb25lPwoKQ2hlZXJzLApNaXF1w6hsCgo+IFRo
aXMgZml4ZXMgYSBib290IGZhaWx1cmUgb24gY29saWJyaS1pbXg3IGFuZCBwb3RlbnRpYWxseSBv
dGhlciBib2FyZHMuCj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogNzUz
Mzk1ZWExZTQ1ICgiQVJNOiBkdHM6IGlteDc6IEZpeCBOQU5EIGNvbnRyb2xsZXIgc2l6ZS1jZWxs
cyIpCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1k0ZGdCVEdOV3BNNlNRWElA
ZnJhbmNlc2NvLW5iLmludC50b3JhZGV4LmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY2VzY28g
RG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYyB8IDExICsrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNl
cnMvb2ZwYXJ0X2NvcmUuYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYwo+IGlu
ZGV4IDE5MjE5MGM0MmZjOC4uYWEzYjdmYTYxZTUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0
X2NvcmUuYwo+IEBAIC0xMjIsNiArMTIyLDE3IEBAIHN0YXRpYyBpbnQgcGFyc2VfZml4ZWRfcGFy
dGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwKPiAgCj4gIAkJYV9jZWxscyA9IG9mX25f
YWRkcl9jZWxscyhwcCk7Cj4gIAkJc19jZWxscyA9IG9mX25fc2l6ZV9jZWxscyhwcCk7Cj4gKwkJ
aWYgKHNfY2VsbHMgPT0gMCkgewo+ICsJCQkvKgo+ICsJCQkgKiBVc2UgI3NpemUtY2VsbHMgPSA8
MT4gZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkKPiArCQkJICogaW4gY2FzZSAjc2l6ZS1jZWxs
cyBpcyBzZXQgdG8gPDA+IGFuZCBmaXJtd2FyZSBhZGRzCj4gKwkJCSAqIE9GIHBhcnRpdGlvbnMg
d2l0aG91dCBzZXR0aW5nIGl0Lgo+ICsJCQkgKi8KPiArCQkJcHJfd2Fybl9vbmNlKCIlczogb2Zw
YXJ0IHBhcnRpdGlvbiAlcE9GICglcE9GKSAjc2l6ZS1jZWxscyBpcyA8MD4sIHVzaW5nIDwxPiBm
b3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eS5cbiIsCj4gKwkJCQkgICAgIG1hc3Rlci0+bmFtZSwg
cHAsCj4gKwkJCQkgICAgIG10ZF9ub2RlKTsKPiArCQkJc19jZWxscyA9IDE7Cj4gKwkJfQo+ICAJ
CWlmIChsZW4gLyA0ICE9IGFfY2VsbHMgKyBzX2NlbGxzKSB7Cj4gIAkJCXByX2RlYnVnKCIlczog
b2ZwYXJ0IHBhcnRpdGlvbiAlcE9GICglcE9GKSBlcnJvciBwYXJzaW5nIHJlZyBwcm9wZXJ0eS5c
biIsCj4gIAkJCQkgbWFzdGVyLT5uYW1lLCBwcCwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
