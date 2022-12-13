Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF441C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9VZeek/mJFdPMqdhGTiDV0gbWn7XSkvd0cwAIQNfjs=; b=oQ8O7xJ9CwlDDA
	bLpNNQQKDKk6C0BYZkn5bpUcBNXd1TmnDmITtl3dpZyLP3/uoPV9ByeuLuNhSLwJGhtS6fGsFJN4G
	q2YFaG1myGSZIFS/UaLupyNW3jB7aKm1R2Egx/TJA5BKs+Al2ku5Szpf37bbllRHJaAhfZJKFIUEe
	84t1y+CHIQVp10jtfhv1Wlmt1eKMRR3eIDnM+5k4dwNXlKw2hJPHKeheP083seMBO3QLMhaeoAqU+
	0szGF2gtc3ba5vgFmTP62Fhj0NEkXSan7ZCvDdj7AI1I/dYccHMsJNsNUOOnmBAFpFy0L7ZaW/lTr
	D10pZIirjdblblT38UNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51sJ-00Eqos-NI; Tue, 13 Dec 2022 09:46:59 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51sG-00EqVD-9u
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2022 09:46:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 87CBB240007;
	Tue, 13 Dec 2022 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670924809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aXJzSwNcbsXGXw+er67BUwq5ojiISWwUZ3aea+WpOLs=;
	b=Vrg8UKM8sm9AissTWxmh62QMeWakR3niVsOJHhKGNCHzJLe2GUPnprQqlq1XsPyDY++J8y
	k43/SvNndYsAh/k1NTrGZ8yzSR81oU1ngtDy3i/VzPu18we2P3Yok8Pd6Vl/OgGNKK07a8
	560/I//6C6KkuOuIv7nXP0Vjg/PjiH9rX8V5TEH3LjZzN2W2QVZGM6m4qAT0iTdLwIBm+Y
	ZNd2ja9G/q9LtNChFMy7yYUGsO3uFn2xl1UdOwe3lQph92fr0qyGZUOXmZIOASMwL3Czhg
	e1TeR8LfM8gw4j9LsdcrxC6T6iCb9UGsFEFHqHR7xUwMofoyIxMYmSzcvhmfrQ==
Date: Tue, 13 Dec 2022 10:46:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kiselev <bigunclemax@gmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: nvmem-cells regression after adding 'call
 of_platform_populate() for MTD partitions'
Message-ID: <20221213104643.052d4a06@xps-13>
In-Reply-To: <b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
	<CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
	<b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
	<CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
	<20221212101449.4e465181@xps-13>
	<CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
	<20221212173730.64224599@xps-13>
	<b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_014656_860271_E0FD5D83 
X-CRM114-Status: GOOD (  23.33  )
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

SGkgTWF4aW0sCgpmaWRvX21heEBpbmJveC5ydSB3cm90ZSBvbiBNb24sIDEyIERlYyAyMDIyIDIw
OjU3OjQ5ICswMzAwOgoKPiBIaSwgTWlxdWVsIQo+IAo+IE9uIDEyLjEyLjIwMjIgMTk6MzcsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gCj4gPiBMZXQgbWUgdHJ5IHRvIHJlY2FwIHRoZSBzaXR1YXRp
b24gZm9yIGFsbCB0aGUgcGVvcGxlIEkganVzdCBpbnZvbHZlZDoKPiA+IAo+ID4gKiBBbiBFdGhl
cm5ldCBkcml2ZXIgZ2V0cyBpdHMgbWFjIGFkZHJlc3MgZnJvbSBhbiBudm1lbSBjZWxsLiBUaGUK
PiA+ICAgIEV0aGVybmV0IGNvbnRyb2xsZXIgRFQgbm9kZSB0aGVuIGhhcyBhbiAibnZtZW0tY2Vs
bHMiIHByb3BlcnR5Cj4gPiAgICBwb2ludGluZyB0b3dhcmRzIGFuIG52bWVtIGNlbGwuCj4gPiAq
IFRoZSBudm1lbSBjZWxsIGNvbWVzIGZyb20gYW4gbXRkIHBhcnRpdGlvbi4KPiA+ICogVGhlIG10
ZCBwYXJ0aXRpb24gaXMgZmxhZ2dlZCB3aXRoIGEgcGFydGljdWxhciBjb21wYXRpYmxlCj4gPiAg
ICAod2hpY2ggaXMgYWxzbyBuYW1lZCAibnZtZW0tY2VsbHMiKSB0byB0ZWxsIHRoZSBrZXJuZWwg
dGhhdCB0aGUgbm9kZQo+ID4gICAgcHJvZHVjZXMgbnZtZW0gY2VsbHMuCj4gPiAqIFRoZSBtdGQg
cGFydGl0aW9uIGl0c2VsZiBoYXMgbm8gZHJpdmVyLCBidXQgaXMgdGhlIGNoaWxkIG5vZGUgb2Yg
YQo+ID4gICAgInBhcnRpdGlvbnMiIGNvbnRhaW5lciB3aGljaCBoYXMgb25lIChpbiB0aGlzIGNh
c2UsCj4gPiAgICAiZml4ZWQtcGFydGl0aW9ucyIsIHNlZSB0aGUgc25pcHBldCBiZWxvdykuCj4g
PiAKPiA+IEJlY2F1c2UgdGhlICJudm1lbS1jZWxscyIgcHJvcGVydHkgb2YgdGhlIEV0aGVybmV0
IG5vZGUgcG9pbnRzIGF0IHRoZQo+ID4gbnZtZW0tY2VsbCBub2RlLCB0aGUgY29yZSBjcmVhdGUg
YSBkZXZpY2UgbGluayBiZXR3ZWVuIHRoZSBFdGhlcm5ldAo+ID4gY29udHJvbGxlciAoY29uc3Vt
ZXIpIGFuZCB0aGUgbXRkIHBhcnRpdGlvbiAocHJvZHVjZXIpLgo+ID4gCj4gPiBUaGUgZGV2aWNl
IGxpbmsgaW4gdGhpcyBjYXNlIHdpbGwgbmV2ZXIgYmUgc2F0aXNmaWVkIGJlY2F1c2Ugbm8gZHJp
dmVyCj4gPiBtYXRjaGVzIHRoZSAibnZtZW0tY2VsbHMiIGNvbXBhdGlibGUgb2YgdGhlIHBhcnRp
dGlvbiBub2RlLgo+ID4gCj4gPiBSZXZlcnRpbmcgY29tbWl0IGJjZGYwMzE1YTYxYSAoIm10ZDog
Y2FsbCBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIGZvciBNVEQKPiA+IHBhcnRpdGlvbnMiKSB3b3Vs
ZCBJTUhPIG5vdCBtYWtlIG11Y2ggc2Vuc2UsIHRoZSBwcm9ibGVtIGNvbWVzIGZyb20gdGhlCj4g
PiBkZXZpY2UgbGluayBzaWRlIGFuZCBldmVuIHRoZXJlLCB0aGVyZSBpcyBub3RoaW5nIHJlYWxs
eSAid3JvbmciLAo+ID4gYmVjYXVzZSBJIHJlYWxseSBleHBlY3QgdGhlIG10ZCBkZXZpY2UgdG8g
YmUgcmVhZHkgYmVmb3JlIHRoZQo+ID4gRXRoZXJuZXQgY29udHJvbGxlciBwcm9iZSwgdGhlIGRl
dmljZSBsaW5rIGlzIGxlZ2l0aW1hdGUuCj4gPiAKPiA+IFNvIEkgd291bGQgbGlrZSB0byBleHBs
b3JlIG90aGVyIGFsdGVybmF0aXZlcy4gSGVyZSBhcmUgYSBidW5jaCBvZgo+ID4gaWRlYXMsIGJ1
dCBJJ20gb3BlbjogIAo+IAo+IEhvdyBhYm91dCB0byBjcmVhdGUgc2ltcGxlIGRyaXZlciB3aXRo
IGNvbXBhdGlibGU9Im52bWVtLWNlbGwiIGFuZCB0byBtb3ZlIGFsbCB0aGUgc3VmZiBmcm9tIG1h
aW4gbXRkIGRyaXZlciB3aGljaCBzZXJ2ZXMgbnZtZW0tY2VsbCB0byB0aGUgcHJvYmUgZnVuY3Rp
b24/CgpUaGlzIGlzIHByb2JhYmx5IHdvcnRoIHRoZSB0cnkgYnV0IEkgZG91YnQgeW91IGNhbiBt
YWtlIGl0IHdvcmsgd2l0aG91dApyZWdyZXNzaW9ucyBiZWNhdXNlIElJUkMgdGhlIG52bWVtIHJl
Z2lzdHJhdGlvbiBoYXBwZW5zIG5vIG1hdHRlciB0aGUKY29tcGF0aWJsZSAobm90IG1lbnRpb25p
bmcgdGhlIHVzZXItb3RwIGFuZCBmYWN0b3J5LW90cCBjYXNlcykuIFlvdSBjYW4KZGVmaW5pdGVs
eSB0cnkgdGhpcyBvdXQgaWYgeW91IHRoaW5rIHlvdSBjYW4gY29tZSB1cCB3aXRoIHNvbWV0aGlu
Zwp0aG91Z2guCgpCdXQgSSB3b3VsZCBsaWtlIHRvIGhlYXIgZnJvbSB0aGUgZGV2aWNlLWxpbmsg
Z3VydXMgOikgYmVjYXVzZSBldmVuIGlmCndlIGZpeCBtdGQgd2l0aCBhICJ0cmljayIgbGlrZSBh
Ym92ZSwgSSBndWVzcyB3ZSdsbCB2ZXJ5IGxpa2VseSBmaW5kCm90aGVyIGNvcm5lciBjYXNlcyBs
aWtlIHRoYXQgYW5kIEkgYW0gaW50ZXJlc3RlZCBpbiB1bmRlcnN0YW5kaW5nIHRoZQpyYXRpb25h
bGUgb2Ygd2hhdCBjb3VsZCBiZSBhIHByb3BlciBmaXguCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
