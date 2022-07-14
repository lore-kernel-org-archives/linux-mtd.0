Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71768C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 21:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0kPAbH3kPd6khtNMn+nUXBD/4a+K7XGhiMek/yk6qc=; b=I00kXzLsAfTc1FuvI/YuyRFCoC
	pTyfb6OrQEUtoh4MAXSlcLQgi8mzj0gL/nxu9mcRfB4grwl9puPEti5EKTr/5CZMTM5Sci85pjaXZ
	dcAPQtyCKin2N0noHApu86jShZwMBHbJajG7N9dHzoEci9qR3zCllJFSOy5LD3g7D0ekzuHZUTHkT
	uyiat1yNX7MT8fgJfTktrMPuoODhR2P2e1jZVEweo97l2Fi4SKgLSEPU/JEFT8F1YwjQsUFc2QomS
	nwQa6HgOlNf185rqXh+jsrEhD/zkF91U3d5i/aM+uDZQxFSphcLb8MLpRKwKEjeJHWXbXIyILgAX/
	EPq/hLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6kr-001nev-D0; Thu, 14 Jul 2022 21:52:17 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6ke-001nZo-Oa; Thu, 14 Jul 2022 21:52:06 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id EEABB22238;
	Thu, 14 Jul 2022 23:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657835518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUOOklFf429NJHGjFaL0HxFv89LnFvPtMIbNqZTM4d0=;
	b=HSkIfATqx+Z/1khW1hK+6puc0ECVGu02CCNcVyvWwwxFtkmNvepbMsWDMYOqDCJN9552/Q
	jpV5u9uj2zXqR6KVmUiRi6qnHalq2wx1hvKHbXfAZ7L5VYX18olHGeTivSo0mSj4iuktL4
	opgvlduW4U0xYcytb9s/OnvmWHuLf7o=
MIME-Version: 1.0
Date: Thu, 14 Jul 2022 23:51:56 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
In-Reply-To: <20220714205529.GE17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <33abf7b84860049c4a22605578303ff2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_145204_999998_625BD4A7 
X-CRM114-Status: GOOD (  29.51  )
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

QW0gMjAyMi0wNy0xNCAyMjo1NSwgc2NocmllYiBNaWNoYWwgU3VjaMOhbmVrOgo+IE9uIFRodSwg
SnVsIDE0LCAyMDIyIGF0IDA5OjQxOjQ4UE0gKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+
IEhpLAo+PiAKPj4gQW0gMjAyMi0wNy0xNCAyMToxOSwgc2NocmllYiBNaWNoYWwgU3VjaGFuZWs6
Cj4+ID4gSXQgaXMgbm9ybWFsIHRoYXQgZGV2aWNlcyBhcmUgZGVzaWduZWQgd2l0aCBtdWx0aXBs
ZSB0eXBlcyBvZiBzdG9yYWdlLAo+PiA+IGFuZCBvbmx5IHNvbWUgdHlwZXMgb2Ygc3RvcmFnZSBh
cmUgcHJlc2VudC4KPj4gPgo+PiA+IFRoZSBrZXJuZWwgY2FuIGhhbmRsZSB0aGlzIHNpdHVhdGlv
biBncmFjZWZ1bGx5IGZvciBtYW55IHR5cGVzIG9mCj4+ID4gc3RvcmFnZSBkZXZpY2VzIHN1Y2gg
YXMgbW1jIG9yIGF0YSBidXQgaXQgcmVwb3J0cyBhbmQgZXJyb3Igd2hlbiBzcGkKPj4gPiBmbGFz
aCBpcyBub3QgcHJlc2VudC4KPj4gPgo+PiA+IE9ubHkgcHJpbnQgYSBub3RpY2UgdGhhdCB0aGUg
c3RvcmFnZSBkZXZpY2UgaXMgbWlzc2luZyB3aGVuIG5vIHJlc3BvbnNlCj4+ID4gdG8gdGhlIGlk
ZW50aWZ5IGNvbW1hbmQgaXMgcmVjZWl2ZWQuCj4+ID4KPj4gPiBDb25zaWRlciByZXBseSBidWZm
ZXJzIHdpdGggYWxsIGJpdHMgc2V0IHRvIHRoZSBzYW1lIHZhbHVlIG5vIHJlc3BvbnNlLgo+PiAK
Pj4gSSdtIG5vdCBzdXJlIHlvdSBjYW4gY29tcGFyZSBTUEkgd2l0aCBBVEEgYW5kIE1NQy4gSSdt
IGp1c3Qgc3BlYWtpbmcgCj4+IG9mCj4+IERUIG5vdywgYnV0IHRoZXJlLCBmb3IgQVRBIGFuZCBN
TUMgeW91IGp1c3QgZGVzY3JpYmUgdGhlIGNvbnRyb2xsZXIgCj4+IGFuZAo+PiBpdCB3aWxsIGF1
dG8tZGV0ZWN0IHRoZSBjb25uZWN0ZWQgc3RvcmFnZS4gV2hlcmVhcyB3aXRoIFNQSSB5b3UgCj4+
IGRlc2NyaWJlCj4gCj4gV2h5IGRvZXMgbW1jIGFzc3VtZSBzdG9yYWdlIGFuZCBTRElPIG11c3Qg
YmUgZGVzY2liZWQ/IFdoeSB0aGUgc3BlY2lhbAo+IGNhc2luZz8KCkkgY2FuJ3QgZm9sbG93IHlv
dSBoZXJlLiBNeSBTRElPIHdpcmVsZXNzIGNhcmQganVzdCB3b3JrcyBpbiBhbiBTRApzbG90IGFu
ZCBkb2Vzbid0IGhhdmUgdG8gYmUgZGVzY3JpYmVkLgoKPj4gYm90aCB0aGUgY29udHJvbGxlciBh
bmQgdGhlIGZsYXNoLiBTbyBJJ2QgYXJndWUgdGhhdCB5b3VyIGhhcmR3YXJlCj4+IGRlc2NyaXB0
aW9uIGlzIHdyb25nIGlmIGl0IGRlc2NyaWJlcyBhIGZsYXNoIHdoaWNoIGlzIG5vdCBwcmVzZW50
Lgo+IAo+IEF0IGFueSByYXRlIHRoZSBzaXR1YXRpb24gaXMgdGhlIHNhbWUgLSB0aGUgc3RvcmFn
ZSBtYXkgYmUgcHJlc2VudAo+IHNvbWV0aW1lcy4gSSBkb24ndCB0aGluayBhc3N1bWluZyBzb21l
IGtpbmQgb2YgZGV2aWNlIGJ5IGRlZnVhbHQgaXMgYQo+IHNvdW5kIHByYWN0aWNlLgoKV2hlcmUg
aXMgdGhlIGFzc3VtcHRpb24gd2hlbiB0aGUgRFQgdGVsbHMgeW91IHRoZXJlIGlzIGEgZmxhc2gK
b24gYSBzcGVjaWZpYyBjaGlwIHNlbGVjdCBidXQgYWN0dWFsbHkgdGhlcmUgaXQgaXNuJ3QuIFNo
b3VsZG4ndAp0aGUgRFQgdGhlbiBiZSBmaXhlZD8KCk1heWJlIEkgZG9uJ3QgdW5kZXJzdGFuZCB5
b3VyIHByb2JsZW0uIFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8Kc29sdmU/IEkgbWVhbiB0aGlzIGp1
c3QgZGVtb3RlcyBhbiBlcnJvciB0byBhbiBpbmZvIG1lc3NhZ2UuCgo+IEhvd2V2ZXIsIHdoZW4g
dGhlIGJvYXJkIGlzIGRlc2lnbmVkIGZvciBhIHNwZWNpZmljIGtpbmQgb2YgZGV2aWNlIHdoaWNo
Cj4gaXMgbm90IGFsd2F5cyBwcmVzZW50LCBhbmQgdGhlIGtlcm5lbCBjYW4gZGV0ZWN0IHRoZSBk
ZXZpY2UsIGl0IGlzCj4gcGVyZmVjdGx5IGZpbmUgdG8gZGVzY3JpYmUgaXQuCj4gCj4gVGhlIGFs
dGVybmF0aXZlIGlzIHRvIG5vdCB1c2UgdGhlIGRldmljZSBhdCBhbGwsIGV2ZW4gd2hlbiBwcmVz
ZW50LAo+IHdoaWNoIGlzIGtpbmQgb2YgdXNlbGVzcy4KCk9yIGxldCB0aGUgYm9vdGxvYWRlciB1
cGRhdGUgeW91ciBkZXZpY2UgdHJlZSBhbmQgZGlzYWJsZSB0aGUgZGV2aWNlCmlmIGl0J3Mgbm90
IHRoZXJlPyBPciBsb2FkIGFuIG92ZXJsYXkgaWYgaXQgaXMgdGhlcmU/CgotbWljaGFlbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
