Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49200CF3186
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIQ6Zwav3NP7/qViCHzrQoathyHdPtYvXE6VPyMG2lo=; b=R77xFk3IKnt/WJ
	0zpj3n0jQpz6ulk3W1lCQWsdXa7nHHd0f3hb8h6+unPgD7YdhnPxOrsQRFsG/JtkoPWKpbQxcBPWr
	tZkgqJf9b0cIjVu+XHiGuBvp72DTZ/nZmRRKa9uy8+QAksX4WtpjFHkP3Eeq2nqCUPX7qPB/CD1X7
	3gBSDGWBGJ6GtYar3D3Hvjb8fKvi3wkd9Otg5qUkVTV57CYClpDeM0D6RvuFlWYls0YWMEKTSKcIx
	xkW1/LiCCINgVFB8Grm2CgIhLwCZgudIe7CtWIu9DyO0kjOrId+Mm5WbSR0SmK2cfpNeDiJyhDu7H
	1XHfI6I+pCWcTUEYY9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLenH-00000002th8-28PH;
	Wed, 19 Nov 2025 09:48:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLenE-00000002tf1-1wrC
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 09:48:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C6864E41794;
	Wed, 19 Nov 2025 09:47:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E44B760720;
	Wed, 19 Nov 2025 09:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C86010371A28;
	Wed, 19 Nov 2025 10:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763545676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gK+LpoJANvwF55wwTCTYvBqZF4AfkizsKPUWssaz8k8=;
	b=PIPyyuj4oPsQg2Mgv/JY2ZedxflwsVFgnS6H/TLC+gMVKf8PUExM36+PzqFtY+liu+E+nu
	1DOLd7gSes3S0xROeu71i8jQJ0Tf8Hv1bh+gG51GH2NZv7O72CaChG4mJNgi+ox7cjM6tP
	ID5p+0Lc+xJKBnllhdc40aPHWPYYuaMtaWZV/BwlIMnuMC2Gwxi32fCcCFnP3T+HkPqyaU
	jQaAkKHqUelX6mWDSRmJo4k/q2xBSnJs6GjNaYMNlmt2ZPCfN8oKakeEbaWbfF6UukqtrV
	NsIHcvEdvGxFSIFTpPT7S22owaush4D+vZbViSLijAeUhtoKzmuWLhkj4mrrxQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno?=
 =?utf-8?Q?=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
In-Reply-To: <20251117175955.GA225586-robh@kernel.org>
References: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
 <20251117-mtd-memregion-v1-2-7b35611c79a6@bootlin.com>
 <20251117175955.GA225586-robh@kernel.org>
Date: Wed, 19 Nov 2025 10:47:52 +0100
Message-ID: <87ikf6qrp3.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_014804_775578_04D65056 
X-CRM114-Status: GOOD (  19.37  )
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

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBPbiBNb24sIE5vdiAxNywg
MjAyNSBhdCAwNjowMDoxNVBNICswMTAwLCBHcmVnb3J5IENMRU1FTlQgd3JvdGU6Cj4+IEVuYWJs
ZSBhY2Nlc3MgdG8gbWVtb3J5IHJlc291cmNlcyBub3Qgb25seSB2aWEgSS9PIGFkZHJlc3MgdXNp
bmcgcmVnLAo+PiBidXQgYWxzbyB0aHJvdWdoIGEgcG9ydGlvbiBvZiBtYWluIG1lbW9yeSB1c2lu
ZyBtZW1vcnktcmVnaW9uLiBUbwo+PiBhY2hpZXZlIHRoaXMsIG5ldyBjb21wYXRpYmxlIHN0cmlu
Z3MgaGF2ZSBiZWVuIGludHJvZHVjZWQ6IG10ZC1tZW0gYW5kCj4+IG10ZC1tZW1yby4KPj4gCj4+
IFNpZ25lZC1vZmYtYnk6IEdyZWdvcnkgQ0xFTUVOVCA8Z3JlZ29yeS5jbGVtZW50QGJvb3RsaW4u
Y29tPgo+PiAtLS0KPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQtcGh5c21hcC55
YW1sICAgICAgIHwgNTkgKysrKysrKysrKysrKysrLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDQwIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLXBoeXNtYXAueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLXBoeXNtYXAueWFtbAo+PiBp
bmRleCAxYjM3NWRlZTgzYjBjLi4wZjc1YTEyMDRiMjYzIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC1waHlzbWFwLnlhbWwKPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQtcGh5c21hcC55YW1sCj4+
IEBAIC0xMywxMCArMTMsNiBAQCBkZXNjcmlwdGlvbjogfAo+PiAgICBGbGFzaCBjaGlwcyAoTWVt
b3J5IFRlY2hub2xvZ3kgRGV2aWNlcykgYXJlIG9mdGVuIHVzZWQgZm9yIHNvbGlkIHN0YXRlCj4+
ICAgIGZpbGUgc3lzdGVtcyBvbiBlbWJlZGRlZCBkZXZpY2VzLgo+PiAgCj4+IC1hbGxPZjoKPj4g
LSAgLSAkcmVmOiBtdGQueWFtbCMKPj4gLSAgLSAkcmVmOiAvc2NoZW1hcy9tZW1vcnktY29udHJv
bGxlcnMvbWMtcGVyaXBoZXJhbC1wcm9wcy55YW1sIwo+PiAtCj4+ICBwcm9wZXJ0aWVzOgo+PiAg
ICBjb21wYXRpYmxlOgo+PiAgICAgIG9uZU9mOgo+PiBAQCAtNjEsNiArNTcsOCBAQCBwcm9wZXJ0
aWVzOgo+PiAgICAgICAgICAgIC0gamVkZWMtZmxhc2gKPj4gICAgICAgICAgICAtIG10ZC1yYW0K
Pj4gICAgICAgICAgICAtIG10ZC1yb20KPj4gKyAgICAgICAgICAtIG10ZC1tZW0KPj4gKyAgICAg
ICAgICAtIG10ZC1tZW1ybwo+Cj4gSSB0aG91Z2h0IHdlIGhhZCBhIGZsYWcgZm9yIHJlYWQgb25s
eS4KClRoZSByZWFkLW9ubHkgZmxhZyBpcyBzZXQgYXQgdGhlIHBhcnRpdGlvbiBsZXZlbCwgbm90
IHRoZSBkZXZpY2UgbGV2ZWwuCgo+Cj4+ICAKPj4gICAgcmVnOgo+PiAgICAgIGRlc2NyaXB0aW9u
OiB8Cj4+IEBAIC0xMTYsNiArMTE0LDEwIEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgbWluSXRlbXM6
IDEKPj4gICAgICBtYXhJdGVtczogOAo+PiAgCj4+ICsgIG1lbW9yeS1yZWdpb246Cj4+ICsgICAg
aXRlbXM6Cj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBNZW1vcnkgcmVnaW9ucyB0byBtYXAgaW50
byBtdGQKPj4gKwo+PiAgICAnI2FkZHJlc3MtY2VsbHMnOgo+PiAgICAgIGNvbnN0OiAxCj4+ICAK
Pj4gQEAgLTEyOSwyMSArMTMxLDI1IEBAIHByb3BlcnRpZXM6Cj4+ICAKPj4gIHJlcXVpcmVkOgo+
PiAgICAtIGNvbXBhdGlibGUKPj4gLSAgLSByZWcKPj4gLQo+PiAtaWY6Cj4+IC0gIHByb3BlcnRp
ZXM6Cj4+IC0gICAgY29tcGF0aWJsZToKPj4gLSAgICAgIGNvbnRhaW5zOgo+PiAtICAgICAgICBj
b25zdDogY29ydGluYSxnZW1pbmktZmxhc2gKPj4gLXRoZW46Cj4+IC0gIHByb3BlcnRpZXM6Cj4+
IC0gICAgc3lzY29uOgo+PiAtICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvcGhhbmRsZQo+PiAtICAgICAgZGVzY3JpcHRpb246Cj4+IC0gICAgICAgIFBoYW5kbGUg
dG8gdGhlIHN5c2NvbiBjb250cm9sbGVyCj4+IC0gIHJlcXVpcmVkOgo+PiAtICAgIC0gc3lzY29u
Cj4+ICsKPj4gK2FsbE9mOgo+PiArICAtICRyZWY6IG10ZC55YW1sIwo+PiArICAtIGlmOgo+PiAr
ICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgY29tcGF0aWJsZToKPj4gKyAgICAgICAgICBj
b250YWluczoKPj4gKyAgICAgICAgICAgIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gbXRkLW1l
bQo+PiArICAgICAgICAgICAgICAtIG10ZC1tZW1ybwo+PiArICAgIHRoZW46Cj4+ICsgICAgICBy
ZXF1aXJlZDoKPj4gKyAgICAgICAgLSBtZW1vcnktcmVnaW9uCj4+ICsgICAgICBwcm9wZXJ0aWVz
Ogo+PiArICAgICAgICBhZGRyLWdwaW9zOiBmYWxzZQo+PiArICAgIGVsc2U6Cj4+ICsgICAgICAk
cmVmOiAvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvbWMtcGVyaXBoZXJhbC1wcm9wcy55YW1s
Iwo+PiArICAgICAgcmVxdWlyZWQ6Cj4+ICsgICAgICAgIC0gcmVnCj4+ICAKPj4gIHVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UKPj4gIAo+PiBAQCAtMjIzLDQgKzIyOSwxOSBAQCBleGFtcGxl
czoKPj4gICAgICAgICAgICAgIHJlZyA9IDwwIDB4MDQwMDAwMDA+Owo+PiAgICAgICAgICB9Owo+
PiAgICAgIH07Cj4+ICsKPj4gKyAgLSB8Cj4+ICsgICAgLyogQW4gZXhhbXBsZSB1c2luZyBtdGQt
bWVtICovCj4+ICsgICAgbWVtX2xvZ3M6IG1lbV9sb2dzQDEwMDAwODAwIHsKPj4gKyAgICAgICAg
cmVnID0gPDB4MSAweDAwMDA4MDAgMHgwIDB4MDAwZjgwMD47Cj4+ICsgICAgICAgIG5vLW1hcDsK
Pj4gKyAgICB9Owo+PiArCj4+ICsgICAgc3JhbSB7Cj4KPiBJdCdzIHJlYWxseSBhbiBhYnVzZSBv
ZiAvcmVzZXJ2ZWQtbWVtb3J5IHRvIGRlZmluZSByZWdpb25zIG91dHNpZGUgb2YgCj4gd2hhdCdz
IGRlZmluZWQgaW4gL21lbW9yeSBub2RlcyAob3Igd2hhdGV2ZXIgZGVmaW5lcyBzeXN0ZW0gbWVt
b3J5KS4gSXMgCj4gdGhhdCB0aGUgY2FzZSBoZXJlIHdpdGggdGhlIHN1c3BpY2lvdXMgJ3NyYW0n
Pwo+Cj4gSWYgd2UgZG8ga2VlcCB0aGlzLCBJJ2QgcmF0aGVyIGp1c3QgYWRkIHRoZSBwcm9wZXJ0
aWVzIGJlbG93IGludG8gdGhlIAo+IC9yZXNlcnZlZC1tZW1vcnkgbm9kZSBpdHNlbGYuIERldmlj
ZXMgYXJlIGNyZWF0ZWQgZm9yIHRob3NlIG5vZGVzIGlmIAo+IHRoZXkgaGF2ZSAnY29tcGF0aWJs
ZScuCgpUaGUgbmFtZSBpcyBpbmRlZWQgbWlzbGVhZGluZy4gSSBkcmV3IGluc3BpcmF0aW9uIGZy
b20gdGhlIGV4YW1wbGUKYWJvdmUsIGJ1dCB0aGUgYWN0dWFsIHVzZSBjYXNlIHdhcyB0byBzaGFy
ZSBkYXRhIGJldHdlZW4gdGhlIGtlcm5lbCBhbmQKYm9vdGxvYWRlciwgZm9yIGluc3RhbmNlLiBU
aGVyZWZvcmUsIGl0IGlzIHRydWx5IHBhcnQgb2YgdGhlIG1haW4KbWVtb3J5LiBJIHdpbGwgbW9k
aWZ5IHRoZSBuYW1lIGFjY29yZGluZ2x5LgoKVGhhbmtzLAoKR3JlZ29yeQoKPgo+Cj4+ICsgICAg
ICAgIGNvbXBhdGlibGUgPSAibXRkLW1lbSI7Cj4+ICsgICAgICAgIG1lbW9yeS1yZWdpb24gPSA8
Jm1lbV9sb2c+Owo+PiArICAgICAgICBiYW5rLXdpZHRoID0gPDQ+Owo+PiArICAgICAgICBkZXZp
Y2Utd2lkdGggPSA8MT47Cj4+ICsgICAgfTsKPj4gKwo+PiAgLi4uCj4+IAo+PiAtLSAKPj4gMi41
MS4wCj4+IAoKLS0gCkdyw6lnb3J5IENMRU1FTlQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
