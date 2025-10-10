Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F38CCAC5BB
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Oct 2025 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCaS/hOKDppYj4nWXMeC/wz/wMdAmzJ0CHhjOlun7ok=; b=qMzcfRso/wlRh1
	9fiecwcHR4H1l93BPK+R3VEGbsZaTrDfNnL0Ja/Nw+XDPm5Yj7LMEcoaJ+Z517BmxpN6RLTzZaMR2
	5FBvtH/BEKQRNUKrxUCics8DLkrM82cYVWpaKI9f4ttWn5PHJAA0qaGZAVNSHhQokxCJfOnn7r6lA
	QdCC/NBKRXruq4GaW3RlKbTZcw9ZdCR9KSwna8qmqJsOr3Zs/5QMUy1y+aASHLBvRXyJdsf0rX+9L
	w0vK1C+Ntdpld2w4JkuN9tlN18tPSQ6R2Fg8rCDDytQI1isLbEVkfh6/QILYnmVbtuOZwhxud6MKc
	xB4727WU29e1mpIulQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AAq-00000008Ez7-2j2c;
	Fri, 10 Oct 2025 10:16:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7AAn-00000008Ey3-14vT;
	Fri, 10 Oct 2025 10:16:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BC1EB1A127A;
	Fri, 10 Oct 2025 10:16:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BD1360667;
	Fri, 10 Oct 2025 10:16:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 154DD102F220B;
	Fri, 10 Oct 2025 12:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760091383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=n6HazN1sAWLIGVuPB5Q33kUmi4chDMBKIuv8XrJPLYE=;
	b=AA+qF05a9hf8XgayaG9t7T6DbV/WtbQkquFY9zFxQEJ/DdGBMziJQNqBRxPG5qTeOVSpvN
	uwzClc0Ux+cYTSI+IDMaAGevIWNlkkYOyDFH/CEnmBrAT1YW2OWmBceZlOu4MQAa+JOkUn
	u7Tw0fVKzGgHj3FQ96Ug3/TB6NJIkI5cMRN8pBNYi50mWGvk5RpbFpOIZispudvlRzSMnY
	JwoJMfpbikfmJrTEf8HhVzW3d3uc6uzk5hNLYAQbnvRqFAvm01uxxRA50uonqAeTKCkXn1
	LBqZsuSFzTrlLYLDlP5AhW5q1V96m4SjMuduf9sJ/J0KA1UAKq1WL+4J61gwYA==
Message-ID: <76033f73-4a8f-45c1-90a3-63a4eae2adaa@bootlin.com>
Date: Fri, 10 Oct 2025 12:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-3-richard.genoud@bootlin.com>
 <414c16db-cdd1-433d-b0ae-915e11d964f0@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <414c16db-cdd1-433d-b0ae-915e11d964f0@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_031629_427104_44E0A1C1 
X-CRM114-Status: GOOD (  14.70  )
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

SGkgS3J6eXN6dG9mLAoKTGUgMTAvMTAvMjAyNSDDoCAxMDo0NSwgS3J6eXN6dG9mIEtvemxvd3Nr
aSBhIMOpY3JpdMKgOgo+IE9uIDEwLzEwLzIwMjUgMTA6NDAsIFJpY2hhcmQgR2Vub3VkIHdyb3Rl
Ogo+PiBUaGUgSDYxNiBOQU5EIGNvbnRyb2xsZXIgaXMgcXVpdGUgZGlmZmVyZW50IGZyb20gdGhl
IEExMCBhbmQgQTIzIG9uZXMsCj4+IHNvbWUgcmVnaXN0ZXJzIG9mZnNldCBjaGFuZ2VkLCBhbmQg
c29tZSBuZXcgb25lIGFyZSBpbnRyb2R1Y2VkLgo+PiBBbHNvLCB0aGUgRE1BIGhhbmRsaW5nIGlz
IGRpZmZlcmVudCAoaXQgdXNlcyBjaGFpbmVkIGRlc2NyaXB0b3JzKQo+Pgo+IAo+IAo+IFN1Ympl
Y3Q6IG5vdCBuZXcgY29tcGF0aWJsZSwgYnV0ICJINjE2IiBvciB3aGF0ZXZlciBkZXZpY2UgaXMg
Y2FsbGVkLgo+IE90aGVyd2lzZSBldmVyeSBjb21taXQgd291bGQgYmUgY2FsbGVkIGxpa2UgdGhh
dCBtYWtpbmcgZ2l0IGxvZwo+IC0tb25lbGluZSB1c2VsZXNzLgpJbmRlZWQuCgo+IAo+PiBTbywg
aW50cm9kdWNlIGEgbmV3IGNvbXBhdGlibGUgdG8gcmVwcmVzZW50IHRoaXMgdmVyc2lvbiBvZiB0
aGUgSVAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91
ZEBib290bGluLmNvbT4KPj4gLS0tCj4+ICAgLi4uL210ZC9hbGx3aW5uZXIsc3VuNGktYTEwLW5h
bmQueWFtbCAgICAgICAgIHwgNTYgKysrKysrKysrKysrKystLS0tLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA0MyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYWxsd2lubmVyLHN1bjRpLWEx
MC1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FsbHdp
bm5lcixzdW40aS1hMTAtbmFuZC55YW1sCj4+IGluZGV4IDA1NGI2YjhiZjliOS4uY2M2MzA5MWZl
OTM2IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L2FsbHdpbm5lcixzdW40aS1hMTAtbmFuZC55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvYWxsd2lubmVyLHN1bjRpLWExMC1uYW5kLnlhbWwKPj4gQEAg
LTYsMzQgKzYsNjQgQEAgJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4+ICAgCj4+ICAgdGl0bGU6IEFsbHdpbm5lciBBMTAgTkFORCBDb250cm9s
bGVyCj4+ICAgCj4+IC1hbGxPZjoKPj4gLSAgLSAkcmVmOiBuYW5kLWNvbnRyb2xsZXIueWFtbAo+
PiAtCj4+ICAgbWFpbnRhaW5lcnM6Cj4+ICAgICAtIENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9y
Zz4KPj4gICAgIC0gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+PiAgIAo+PiAr
YWxsT2Y6Cj4+ICsgIC0gJHJlZjogbmFuZC1jb250cm9sbGVyLnlhbWwKPiAKPiAKPiBJZiBtb3Zp
bmcgaXQsIGNhbiB5b3UgcGxhY2UgaXQgbGlrZSBpbiBleGFtcGxlLXNjaGVtYSwgc28gYXQgdGhl
IGJvdHRvbSwKPiBhYm92ZSB1bmV2YWx1YXRlZFByb3BzPwpZZXMsIGFic29sdXRlbHkuCgo+IAo+
PiArCj4+ICsgIC0gaWY6Cj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBjb21wYXRp
YmxlOgo+PiArICAgICAgICAgIGNvbnRhaW5zOgo+PiArICAgICAgICAgICAgZW51bToKPj4gKyAg
ICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuNGktYTEwLW5hbmQKPj4gKyAgICAgICAgICAgICAg
LSBhbGx3aW5uZXIsc3VuOGktYTIzLW5hbmQtY29udHJvbGxlcgo+PiArICAgIHRoZW46Cj4+ICsg
ICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBjbG9ja3M6Cj4+ICsgICAgICAgICAgaXRlbXM6
Cj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBCdXMgQ2xvY2sKPj4gKyAgICAgICAgICAg
IC0gZGVzY3JpcHRpb246IE1vZHVsZSBDbG9jawo+PiArICAgICAgICBjbG9jay1uYW1lczoKPj4g
KyAgICAgICAgICBpdGVtczoKPj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGFoYgo+PiArICAgICAg
ICAgICAgLSBjb25zdDogbW9kCj4+ICsKPj4gKyAgLSBpZjoKPj4gKyAgICAgIHByb3BlcnRpZXM6
Cj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+ICsgICAgICAgICAgY29udGFpbnM6Cj4+ICsgICAg
ICAgICAgICBlbnVtOgo+PiArICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW41MGktaDYxNi1u
YW5kLWNvbnRyb2xsZXIKPj4gKyAgICB0aGVuOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAg
ICAgICAgY2xvY2tzOgo+PiArICAgICAgICAgIGl0ZW1zOgo+PiArICAgICAgICAgICAgLSBkZXNj
cmlwdGlvbjogQnVzIENsb2NrCj4+ICsgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBNb2R1bGUg
Q2xvY2sKPj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IEVDQyBDbG9jawo+PiArICAgICAg
ICAgICAgLSBkZXNjcmlwdGlvbjogTUJ1cyBDbG9jawo+PiArICAgICAgICBjbG9jay1uYW1lczoK
Pj4gKyAgICAgICAgICBpdGVtczoKPj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGFoYgo+PiArICAg
ICAgICAgICAgLSBjb25zdDogbW9kCj4+ICsgICAgICAgICAgICAtIGNvbnN0OiBlY2MKPj4gKyAg
ICAgICAgICAgIC0gY29uc3Q6IG1idXMKPj4gKwo+PiAgIHByb3BlcnRpZXM6Cj4+ICAgICBjb21w
YXRpYmxlOgo+PiAgICAgICBlbnVtOgo+PiAgICAgICAgIC0gYWxsd2lubmVyLHN1bjRpLWExMC1u
YW5kCj4+ICAgICAgICAgLSBhbGx3aW5uZXIsc3VuOGktYTIzLW5hbmQtY29udHJvbGxlcgo+PiAr
ICAgICAgLSBhbGx3aW5uZXIsc3VuNTBpLWg2MTYtbmFuZC1jb250cm9sbGVyCj4+ICAgICByZWc6
Cj4+ICAgICAgIG1heEl0ZW1zOiAxCj4+ICAgCj4+ICAgICBpbnRlcnJ1cHRzOgo+PiAgICAgICBt
YXhJdGVtczogMQo+PiAgIAo+PiAtICBjbG9ja3M6Cj4+IC0gICAgaXRlbXM6Cj4+IC0gICAgICAt
IGRlc2NyaXB0aW9uOiBCdXMgQ2xvY2sKPj4gLSAgICAgIC0gZGVzY3JpcHRpb246IE1vZHVsZSBD
bG9jawo+PiAtCj4+IC0gIGNsb2NrLW5hbWVzOgo+PiAtICAgIGl0ZW1zOgo+PiAtICAgICAgLSBj
b25zdDogYWhiCj4+IC0gICAgICAtIGNvbnN0OiBtb2QKPiAKPiAKPiBZb3UgY2Fubm90IHJlbW92
ZSBpdC4gQnJvYWRlc3QgY29uc3RyYWludHMsIHNlZSB3cml0aW5nIHNjaGVtYS4KPiAKPiBvciBt
eSBzdGFuZGFyZCByZWZlcmVuY2UgZXhhbXBsZToKPiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni4xMS1yYzYvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy91ZnMvcWNvbSx1ZnMueWFtbCNMMTI3Ck9rCgpUaGFua3MhCgo+IAo+IAo+IEJlc3QgcmVnYXJk
cywKPiBLcnp5c3p0b2YKCgotLSAKUmljaGFyZCBHZW5vdWQsIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
