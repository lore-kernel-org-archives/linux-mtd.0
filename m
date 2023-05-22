Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52191C77B73
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7ljm4ap+t9q+pUguHb+NIGyANqZQEQQl+28pFVHPto=; b=hvVhE+j15Vl5Et
	qF3ImeqF6XkqyFBY7LfidVrSWICHHrMe/Zq4Zvt0WcEb/Zko2eKKZoDuMcPaL5j5YkTIT60tGPPSL
	eL2r0FgYTajYqWAilP2f3c19Cq5NQV3hxb/gpzM6G94yH7uc5EmXTG6hUKlNZu+er33Ht+wLXEuSI
	+PT6RpZXPCf9T4nv3n0LECfLsqsHj8FbvYjYFpp++6ixEj+4bE6HIfMEyfHW63ppc1kSIckGpULgM
	Wq6j5EgRlBDv8wVtYvkpzEW9zEkPDvFGtSKzaM8awEYVm6R46Voz+27CEc9ALbzePIDjbhPCxHIzK
	JBrJkZb1+0x/0k7l1GUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q16nk-006t0P-02;
	Mon, 22 May 2023 14:46:20 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q16nU-006svw-1x;
	Mon, 22 May 2023 14:46:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 20DC740005;
	Mon, 22 May 2023 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684766761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z97QcL8z6xmYm5A3uwe7N+++cwdw3dgMa47oOZgJgFY=;
	b=JSYBgD0ta/vb/ROv8mvsU1g5Q8TvFe+e6a8P1dtEiUimRU8tQah0BBCMqwBfyBEC1jJCgD
	oHXyqQapKb6113Rj4Of9hjzDBFcSeSJMz7Ykq7Jfhz4ZoVr5y6wZ7FYrQJNKlQzvseGJue
	AJzyJ2OMmpnBICe74whOC0BVHTRJWvyUOUKM3xI/TVt4+53kotxasumgwnVOcgHKpmDjwT
	osWIQG5m7JYj7hpSF53+bPqcHwIQj7doy/U+hGhzPc1Zbco1Lf1nemCrfc41l4ptlXB7o8
	WO+5HZPwKGUH7j9UkJKX2HVOAulsXzMGdQhRpR5DQE+h55bDrT2hDm4FpfJ/sw==
Date: Mon, 22 May 2023 16:45:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFm?=
 =?UTF-8?B?YcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Add SEAMA partition types
Message-ID: <20230522164559.6c599c61@xps-13>
In-Reply-To: <CACRpkdYLZ36Ad5y7qLUTFix6yx=jBQ=ZvxaB9U-fhqQ_fvvXCQ@mail.gmail.com>
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
	<20230509093129.40b30c7a@xps-13>
	<CACRpkdYLZ36Ad5y7qLUTFix6yx=jBQ=ZvxaB9U-fhqQ_fvvXCQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_074604_950199_1261BDD3 
X-CRM114-Status: GOOD (  35.02  )
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

SGkgTGludXMsCgpsaW51cy53YWxsZWlqQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCA5IE1heSAy
MDIzIDIwOjMwOjMzICswMjAwOgoKPiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDk6MzHigK9BTSBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+IGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZyB3cm90ZSBvbiBTYXQsIDA2IE1heSAyMDIzIDE3OjI5OjQzICsw
MjAwOgo+ID4gIAo+ID4gPiBUaGlzIHR5cGUgb2YgZmlybXdhcmUgcGFydGl0aW9uIGFwcGVhciBp
biBzb21lIGRldmljZXMgaW4KPiA+ID4gTkFORCBmbGFzaCwgc28gd2UgbmVlZCB0byBiZSBhYmxl
IHRvIHRhZyB0aGUgcGFydGl0aW9ucwo+ID4gPiB3aXRoIHRoZSBhcHByb3ByaWF0ZSB0eXBlLgo+
ID4gPgo+ID4gPiBUaGUgb3JpZ2luIG9mIHRoZSAiU0VBdHRsZSBpTUFnZSIgaXMgdW5rbm93bi4g
IAo+ID4KPiA+IEkgZG9uJ3Qgc2VlIGFueSBrZXJuZWwgY2hhbmdlcywgd2h5IGRvIHdlIG5lZWQg
YW4gYWRkaXRpb25hbCBiaW5kaW5nPyAgCj4gCj4gVGhlIGJpbmRpbmdzIGFyZSBub3Qgc3RyaWN0
bHkgYm91bmQgdG8gTGludXgsIGl0J3MgbW9yZSBsaWtlIGFsbCBPUzplcwo+IHVzZXMgdGhlIExp
bnV4IERUIGJpbmRpbmcgcmVwbyBiZWNhdXNlIGl0IGlzIHRoZSBiaWdnZXN0IHByb2plY3QuCgpZ
ZXMsIHRoYXQncyB3aHkgSSB3YW50ZWQgbW9yZSBjb250ZXh0IDotKQoKPiBBbHNvIHdlIGFjdHVh
bGx5IG1lcmdlIGEgYnVuY2ggb2YgYmluZGluZ3MganVzdCB0byBkZXNjcmliZSBoYXJkd2FyZQo+
IChvciB0aGluZ3MgbGlrZSBwYXJ0aXRpb25zKSwgaW4gdGhlIGhvcGUgb2YgbWFraW5nIHVzZSBv
ZiB0aGVtIGluIHRoZQo+IGxvbmcgcnVuLgoKSXQncyBhbHdheXMgcHJvYmxlbWF0aWMgdG8gZG8g
aXQgdGhpcyB3YXkgYmVjYXVzZSBubyB1c2VyID09IG5vIHByZWNpc2UKcmVxdWlyZW1lbnQuIEFz
IGJpbmRpbmcgYXJlIHN1cHBvc2VkIHRvIHJlbWFpbiBzdGFibGUsIGFuZCBiZWNhdXNlIHdlLApo
dW1hbiBhcmUgZmFyIGZyb20gcGVyZmVjdCB3aGVuIGl0IGNvbWVzIHRvIHJlYWQgdGhlIGZ1dHVy
ZSwgSSBvZgpjb3Vyc2UgcHJlZmVyIHdoZW4gdGhlcmUgaXMgYW4gaW1wbGVtZW50YXRpb24gdGhh
dCB1c2VzIHRoZSBuZXcgYmluZGluZwpzbyB3ZSBjYW4gbW9yZSBlYXNpbHkgc3BvdCB0aGUgaXNz
dWVzLgoKPiBBbnl3YXlzLCBmb3IgdGhlIHJlY29yZCwgdGhlIGZ1bGwgc3Rvcnk6Cj4gCj4gQ3Vy
cmVudGx5IHRoaXMgYmluZGluZyBpcyB1c2VkIGluIG91dC1vZi10cmVlIE9wZW5XcnQgY29kZSwg
d2hlcmUgaXQKPiBpcyB1c2VkIGFzIG1hZ2ljIGZvciBzcGxpdHRpbmcgcGFydGl0aW9ucyB3aXRo
IG10ZHNwbGl0Lgo+IAo+IEkgZ3Vlc3MgeW91IG1pZ2h0IGJlIGZhbWlsaWFyIHdpdGggbXRkc3Bs
aXQuIEl0IGlzIGEgc29mdHdhcmUgcGFydGl0aW9uCj4gc3BsaXR0ZXIgdGhhdCBtYWtlcyBpdCBw
b3NzaWJsZSB0byBzcGxpdCBhIGJpZyBwYXJ0aXRpb24gaW50byBzbWFsbGVyCj4gcGFydGl0aW9u
cyBkeW5hbWljYWxseSwgdXNpbmcgbWFnaWMgYmxvY2sgaWRlbnRpZmllcnMuCj4gCj4gVGhlIHR5
cGljYWwgdXNlY2FzZSBpcyB0byBwdXQgdGhlIGtlcm5lbCBpbiB0aGUgZmlyc3QgZmxhc2ggYmxv
Y2tzLAo+IHRoZW4gcGFkIHVwIHRvIHRoZSBuZWFyZXN0IGV2ZW4gZXJhc2UgYmxvY2ssIGFuZCB0
aGVuIGFkZCBhCj4gSkZGUzIgb3IgVUJJIGZpbGVzeXN0ZW0gaW1tZWRpYXRlbHkgdGhlcmUuCj4g
Cj4gVGhpcyB3YXkgaXQgYXZvaWRzIHVzaW5nIHN0YXRpYyBwYXJ0aXRpb25pbmcsIHRoZSB0b29s
cyByZWJ1aWxkaW5nIHRoZQo+IGZpcm13YXJlIGNhbiBkeW5hbWljYWxseSBzcGxpdCBvZmYgbW9y
ZSBmbGFzaCBhcyB0aGUga2VybmVsIGltYWdlCj4gZ3Jvd3MuCj4gCj4gVGhlIG10ZHNwbGl0IGNv
ZGUgdXNlcyBkaWZmZXJlbnQgbWFnaWMgbnVtYmVycyB0byBpZGVudGlmeSB3aGVyZQo+IHRoZSBk
aWZmZXJlbnQgcGFydGl0aW9ucyBzdGFydC4KCklzIG10ZHNwbGl0IGFjdGluZyBvbiBhIGRldmlj
ZSBvciBvbiBhIHBhcnRpdGlvbj8gUmlnaHQgbm93IHlvdSBkZWZpbmUKYSBwYXJ0aXRpb24gdG8g
YmUgY29tcGF0aWJsZSB3aXRoIHNlYW1hLCBJIHdvdWxkIGhhdmUgaW1hZ2luZWQgdGhlCnBhcnRp
dGlvbnMgY29udGFpbmVyIHNob3VsZCBiZSBjb21wYXRpYmxlIHdpdGggc2VhbWEgaW5zdGVhZCBv
ZgpmaXhlZC1wYXJ0aXRpb25zLCBidXQgSSBoYXZlbid0IGxvb2tlZCBhdCB0aGUgd2hvbGUgaW1w
bGVtZW50YXRpb24sIHNvCm1heWJlIG15IGNvbW1lbnQgaXMganVzdCB3cm9uZy4KCj4gT25lIHN1
Y2ggdHlwZSBvZiBwYXJ0aXRpb24gaXMgc2VhbWEsIHNvIHRoZSBjb2RlIG5lZWRzIHRvIGtub3cK
PiB0aGF0IGl0IHNob3VsZCBsb29rIGZvciBzZWFtYSBtYWdpYyB0byBkZXRlcm1pbmUgdGhlIHNp
emUgYW5kCj4gc3BsaXQgdGhpcyBwYXJ0aXRpb24gaW4gYSBrZXJuZWwgYW5kIHJvb3RmcyBwYXJ0
LiBUaGlzIGlzIHRoZSBjb2RlOgo+IGh0dHBzOi8vZ2l0Lm9wZW53cnQub3JnLz9wPW9wZW53cnQv
b3BlbndydC5naXQ7YT10cmVlO2Y9dGFyZ2V0L2xpbnV4L2dlbmVyaWMvZmlsZXMvZHJpdmVycy9t
dGQvbXRkc3BsaXQ7aD0zZTBkZjg1NjcxM2E4NGIxZGVjZjE3MTkwZjE3MWNiMTBjZTdhNzU3O2hi
PUhFQUQKClRoYXQncyB2ZXJ5IGluZm9ybWF0aXZlLCB0aGFua3MgZm9yIGFsbCB0aGUgY29udGV4
dC4gSSBiZWxpZXZlIHRoaXMKY291bGQgYWN0dWFsbHkgYmUgcGFydCBvZiB0aGUgYmluZGluZyBk
ZXNjcmlwdGlvbiAobm90IHRoZSAidGhpcyBpcyBhbgpvcGVuV1JUIHN0dWZmIiwgb2YgY291cnNl
KS4KCj4gSXQgaXMgYSBiaXQgc2FkIHRoYXQgbm8tb25lIGhhcyB0aGUgZW5lcmd5IHRvIHByb3Bv
c2UgbXRkc3BsaXQKPiB1cHN0cmVhbSwgSSB0aGluayBpdCBpcyBxdWl0ZSBnZW5lcmljIGFuZCBn
ZW5lcmFsbHkgdXNlZnVsLiBJIHN0YXJ0ZWQKPiB0byBtYWtlIGFuIHVwc3RyZWFtIHBhdGNoIGJ1
dCBnb3QgZXhoYXVzdGVkIHdpdGggdGhlIHRhc2suCgo6LSkKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
