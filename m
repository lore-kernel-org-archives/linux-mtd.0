Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51416C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA0vtfSfkrYxha7PFd2dqiJz9DQBrV9FLk1CZfwlSwk=; b=SBVI9QpmviJmTAfxTP8f3HwS9f
	uKWHzatKfeXkwA184XupsJdpgqyRoDmhj4BWmW4OrC+Tiedzf5DeoEewij75HPaRjiZvIOmqGDzUb
	5I2CjhMskO1KpUE5mJSPI9pSK8uSTGfJo0JqQ562iW+ObGKBOYL6/caJeO91qJhRCP/CT24xJSMXC
	g5BjBg4LEd8d0f04z99ue27GVEEO6YNzyS1glMuVpBu1f4zVw7pMHmQKO+u+YJSN024u0IBEE6QnM
	WfIaOOVk263VOmCvYAaLO2t1bXlMo+rhPzqFMv31vBzdfbLbBbNkkFbjzSTxjJeJzugIzmBCbjW+J
	dNCodkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1new8Z-004xbX-VA; Thu, 14 Apr 2022 09:51:40 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1new8V-004xaN-LH
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 09:51:37 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 523652223A;
 Thu, 14 Apr 2022 11:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649929892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQczWkxt6C6RQJavgWeWLcLLt74X0PEIwqF89ebEzJg=;
 b=FsxB4Zeo6D5nOScWxByQkHw02uWV8Xov6sq0MSrpfbqyePoLkibaq/yiNGHOOuZx1wegp9
 1S09GJR9ICXx5Ee0S0pBKm28uT3c7qC9YS72xhpJ9qWkOsdRVaYAY4GAuUijDdabfDMLzN
 4xpYMjaMjWDTeL5BOCBaPPRiKFPGzS0=
MIME-Version: 1.0
Date: Thu, 14 Apr 2022 11:51:32 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: Parse BFPT to determine the 4-Byte
 Address Mode methods
In-Reply-To: <78aa1754-2f04-9f0b-72ef-f06535a413b0@microchip.com>
References: <20220411125346.118274-1-tudor.ambarus@microchip.com>
 <20220411125346.118274-2-tudor.ambarus@microchip.com>
 <63b485a1e48d3116f8f49cc427049f81@walle.cc>
 <78aa1754-2f04-9f0b-72ef-f06535a413b0@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9867708d5625e5bf8f5f50c72385efb6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_025135_894557_A59DD02A 
X-CRM114-Status: GOOD (  22.40  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc2ZkcC5jCj4+PiBpbmRleCBhNTIxMTU0M2QzMGQuLjJlNDBlYmEzNzQ0ZCAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+PiArKysgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3NmZHAuYwo+Pj4gQEAgLTQwMSw2ICs0MDEsOTMgQEAgc3RhdGljIHZvaWQK
Pj4+IHNwaV9ub3JfcmVnaW9uc19zb3J0X2VyYXNlX3R5cGVzKHN0cnVjdCBzcGlfbm9yX2VyYXNl
X21hcCAqbWFwKQo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoH0KPj4+IAo+Pj4gKy8qKgo+Pj4gKyAq
IHNwYW5zaW9uX3NldF80Ynl0ZV9hZGRyX21vZGUoKSAtIFNldCA0LWJ5dGUgYWRkcmVzcyBtb2Rl
IGZvcgo+Pj4gU3BhbnNpb24KPj4+ICsgKiBmbGFzaGVzLgo+Pj4gKyAqIEBub3I6wqDCoMKgwqAg
cG9pbnRlciB0byAnc3RydWN0IHNwaV9ub3InLgo+Pj4gKyAqIEBlbmFibGU6wqAgdHJ1ZSB0byBl
bnRlciB0aGUgNC1ieXRlIGFkZHJlc3MgbW9kZSwgZmFsc2UgdG8gZXhpdCAKPj4+IHRoZQo+Pj4g
NC1ieXRlCj4+PiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGRyZXNzIG1vZGUuCj4+PiArICoK
Pj4+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgLWVycm5vIG90aGVyd2lzZS4KPj4+ICsgKi8K
Pj4+ICtpbnQgc3BhbnNpb25fc2V0XzRieXRlX2FkZHJfbW9kZShzdHJ1Y3Qgc3BpX25vciAqbm9y
LCBib29sIGVuYWJsZSkKPj4gCj4+IE1oLCBzbyBub3cgc29tZSBjYWxsYmFjayBmdW5jdGlvbnMg
YXJlIGluIHRoZSBjb3JlIGxpa2UgdGhlIHF1YWQgCj4+IGVuYWJsZQo+PiBtZXRob2RzIGFuZCBz
b21lIGFyZSBpbiBzZmRwLmMuIEkgdGhpbmsgdGhlcmUgc2hvdWxkIGJlIG9ubHkgdGhlIAo+PiBw
YXJzaW5nCj4+IGluIHNmZHAuYyBhbmQgYWxsIHRoZSBjYWxsYmFjayBtZXRob2RzIHNob3VsZCBi
ZSBpbiBjb3JlLmM7IGFzIHRoZXkgCj4+IGFyZQo+PiBwb3RlbnRpYWxseSB1c2VkIGJ5IHRoZSB2
ZW5kb3IgbW9kdWxlcy4KPiAKPiBBbGwgc2V0XzRieXRlX2FkZHJfbW9kZSBtZXRob2RzIGFyZSBk
ZWZpbmVkIGluIHNmZHAuYyBhbmQgZGVjbGFyZWQgaW4gCj4gc2ZkcC5oLgo+IEkga2VwdCB0aGUg
bWV0aG9kcyBkZWZpbmVkIGluIHNmZHAuYyBiZWNhdXNlIFNGRFAgZGVmaW5lcyB0aGVpciAKPiBi
ZWhhdmlvci9ob3cKPiB0aGV5IHdvcmsuIFZlbmRvcnMgYWxyZWFkeSBoYXZlIGFjY2VzcyB0byBh
bGwgdGhlc2UgbWV0aG9kcyB3aGVuIAo+IGluY2x1ZGluZwo+IGNvcmUuaCAod2hpY2ggaW5jbHVk
ZXMgc2ZkcC5oKS4gTm8gbmVlZCB0byBtb3ZlIHRoZW0gdG8gY29yZSwgYXMgdGhleSAKPiBhcmUK
PiBTRkRQIHNwZWNpZmljLgoKVGhlIHNhbWUgaXMgdHJ1ZSBmb3IgdGhlIHF1YWQgZW5hYmxlIG1l
dGhvZCBhbmQgdGhleSByZXNpZGUgaW4gY29yZS5jLgpBZ2FpbiwgSSB0aGluayBzZmRwLmMgc2hv
dWxkIGJlIGFib3V0IHRoZSBwYXJzaW5nLCBub3QgdGhlIGZsYXNoIApoYW5kbGluZwppdHNlbGYu
IChBbmQgc2ZkcC5oIHNob3VsZCBiZSB0aGUgZXF1aXZhbGVudCB0byB0aGUgc3BlYyBpbiB0ZXJt
cyBvZgpjb25zdGFudHMpLiBJIG1lYW4gU0ZEUCB3aWxsIGV2ZW50dWFsbHkgY292ZXIgZXZlcnl0
aGluZywgc28gd2lsbCB5b3UgCm1vdmUKYWxsIG1ldGhvZHMgb3ZlciB0byBzZmRwLmM/IEFsbCB0
aGVzZSBtZXRob2RzIGNhbiBiZSB1c2VkIHdpdGggZmxhc2hlcwp3aXRob3V0IFNGRFAuCgpTRkRQ
IGp1c3QgY29sbGVjdHMgYWxsIHRoZSBkaWZmZXJlbnQgbWV0aG9kcyB1c2VkIGJ5IGZsYXNoIG1h
bnVmYWN0dXJlcnMKYW5kIHB1dCB0aGVtIGludG8gYSB0YWJsZS4gSSBkb24ndCBzZWUgaG93IFNG
RFAgaXMgYSBzcGVjIHdoZXJlIHRoZXkgCnNwZWNpZnkKYSBwYXJpY3VsYXIgbWV0aG9kIGFuZCBh
bGwgdGhlIGZsYXNoIG1hbnVmYWN0dXJlciBwaWNrIHRoYXQgdXAuIEkgdGhpbmsgCml0CmlzIHRo
ZSBvdGhlciB3YXkgYXJvdW5kLCBhIGZsYXNoIG1hbnVmYWN0dXJlciBkb2VzIHNvbWV0aGluZwpw
cm9wcmlldGFyeSBhbmQgdGhlbiBpdCBldmVudHVhbGx5IGVuZHMgdXAgaW4gdGhlIFNGRFAgc3Bl
Yy4KCj4+PiBAQCAtNjA2LDYgKzY5MywyNCBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFyc2VfYmZw
dChzdHJ1Y3Qgc3BpX25vciAKPj4+ICpub3IsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gCj4+PiArwqDCoMKgwqAgc3dpdGNoIChiZnB0
LmR3b3Jkc1tCRlBUX0RXT1JEKDE2KV0gJiAKPj4+IEJGUFRfRFdPUkQxNl80Ql9BRERSX01PREVf
TUFTSykKPj4+IHsKPj4gCj4+IEkgd2FzIHdvbmRlcmluZyB3aHkgdGhpcyBpcyBlbmNvZGVkIGFz
IHNpbmdsZSBiaXRzIGFuZCBub3QgYXMgYW4KPj4gZW51bWVyYXRpb24uIFRvIG1lIGl0IGxvb2tz
IGxpa2UgaXQgaXMgaW50ZW5kZWQgdG8gc3VwcG9ydAo+IAo+IGJlY2F1c2UgSSBwYXJzZSAyIGJp
dHMgYW5kIGNoZWNrIGlmIGJvdGggdGhlIGVudGVyIGFuZCB0aGUgZXhpdCBtZXRob2RzIAo+IG9m
Cj4gdGhlIDRiIGFkZHIgbW9kZSBhcmUgc3BlY2lmaWVkLgoKTm8sIEknbSBvbmx5IHNwZWFraW5n
IG9mIGVpdGhlciB0aGUgZW50cnkgb3IgdGhlIGV4aXQgbWFzay4gU2VlCmJlbG93LgoKPj4gZGlm
ZmVyZW50IG1ldGhvZHMgYXQgdGhlIHNhbWUgdGltZS4gVGh1cyBJIHRoaW5rIHRoZXJlIG1pZ2h0
IGJlCj4+IG11bHRpcGxlIGJpdHMgc2V0IGluIGVhY2ggZW50cnkgYW5kIGV4aXQgbWFzayBhdCBv
bmNlLiBUaGUgc3BlYwo+PiBsaXN0cyBhbGwgdGhlIGVudHJpZXMgYXMgeF94eHgxLCB4X3h4MXgs
IC4uCj4+IAo+Pj4gK8KgwqDCoMKgIGNhc2UgQkZQVF9EV09SRDE2XzRCX0FERFJfTU9ERV9CUldS
Ogo+PiAuLiB0aGVuIHRoaXMgd2lsbCBvbmx5IG1hdGNoIGlmIGV4YWN0bHkgdGhlc2UgdHdvIGJp
dHMgYXJlIHNldC4KPj4gCj4gCj4gdGhlc2UgMiBiaXRzIGFyZToKPiBkcml2ZXJzL210ZC9zcGkt
bm9yL3NmZHAuaDojZGVmaW5lIEJGUFRfRFdPUkQxNl80Ql9BRERSX01PREVfQlJXUgo+ICAgICAg
ICAgICAgICAgICAgXAo+IGRyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5oLSAgICAgKEJGUFRfRFdP
UkQxNl9FTjRCX0JSV1IgfAo+IEJGUFRfRFdPUkQxNl9FWDRCX0JSV1IpCgpJIGtub3cgdGhpcyBh
cmUgdHdvIGJpdHMsIGJ1dCBJTUhPIHRoZXJlIGNhbiBiZSBtdWx0aXBsZSBiaXRzCnNldCBpbiAq
ZWFjaCogb2YgdGhlc2UgbWFza3MuIEVnLiB0aGUgZW50ZXIgbWFzayBjb3VsZCBiZQowYjAwMDEx
IHdoaWNoIHdvdWxkIGluZGljYXRlIHRoYXQgYm90aCB0aGUgZmlyc3QgYW5kIHRoZSBzZWNvbmQK
ZW50ZXIgbWV0aG9kIGlzIHN1cHBvcnRlZC4KKEknZCBleHBlY3QgdGhhdCB0aGUgZXhpdCBtYXNr
IHdpbGwgdGhlbiBiZSAwYjAwMDExLCB0b28pLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
