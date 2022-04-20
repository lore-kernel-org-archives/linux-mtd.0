Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A439C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMnCSl8EjMpXrCgc08Kdfsx9Wo071gzuD3PMzoqEqrw=; b=VxuBNuPcUlesy5
	robZfIxG0zcfD6hYR1k/hDQJWatebxrkidx9Txs7HfB8OGoNm0XPUxoFknwbUdsPvPUIJB0gNj6Go
	zBwitpjZAd/gr+gYPmmfztwqCL2z8AN6qQt/8cfy7NNFsP3JJAJ1Udm4/nhlGTdB/+u5jdT2cTTa2
	tO3lm2IDY/cZe7Rdvr2TkJbILsqBGbYxGpQ6qQf7lV4RE3hRtgsU24MIjGLO1mvj3ZKpkJMQ0MLvH
	8XCcv0zVhggt2wTAeCmIryWGLaOHhG6EC1FR7F/XjFaHHzr8nQfRC6n8jyloRM/e1kxBnoRT6ZHgq
	8jCv9lQ+LTXwjNu2j7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh9Ys-00906P-5l; Wed, 20 Apr 2022 12:35:58 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh9Yd-009026-UT; Wed, 20 Apr 2022 12:35:45 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 20 Apr
 2022 20:35:41 +0800
Message-ID: <f20078df-bf96-a972-25ce-7e9dce3f99d7@amlogic.com>
Date: Wed, 20 Apr 2022 20:35:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/2] dt-bindings: nand: meson: refine Amlogic NAND
 controller driver
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
 <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin
 Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-3-liang.yang@amlogic.com>
 <20220420094107.4799f15a@xps13>
 <b880c64c-7651-c445-4e5e-74cb7a1e76ee@amlogic.com>
 <20220420141620.4fd68eef@xps13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220420141620.4fd68eef@xps13>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_053544_052324_97935B95 
X-CRM114-Status: GOOD (  14.05  )
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

SGkgTWlxdWVsLAoKT24gMjAyMi80LzIwIDIwOjE2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IFsg
RVhURVJOQUwgRU1BSUwgXQo+IAo+IEhpIExpYW5nLAo+IAo+Pj4+ICttYWludGFpbmVyczoKPj4+
PiArICAtIGxpYW5nLnlhbmdAYW1sb2dpYy5jb20KPj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+
Pj4gKyAgY29tcGF0aWJsZToKPj4+PiArICAgIGVudW06Cj4+Pj4gKyAgICAgIC0gImFtbG9naWMs
bWVzb24tZ3hsLW5mYyIKPj4+PiArICAgICAgLSAiYW1sb2dpYyxtZXNvbi1heGctbmZjIgo+Pj4+
ICsKPj4+PiArICByZWc6Cj4+Pj4gKyAgICBtYXhJdGVtczogMgo+Pj4+ICsKPj4+PiArICAnI2Fk
ZHJlc3MtY2VsbHMnOgo+Pj4+ICsgICAgY29uc3Q6IDEKPj4+Cj4+PiBOb3Qgc3VyZSB0aGlzIHBy
b3BlcnR5IGlzIG5lZWRlZC4KPj4gdGhpcyBpcyBmb3IgdGhlIHN1Ym5vZGUsIHN1Y2ggYXMgbmFu
ZEAwLgo+IAo+IFllcyBidXQgaWYgeW91IHJlZmVyIHRvIG5hbmQtY29udHJvbGxlci55YW1sIHlv
dSBubyBsb25nZXIgbmVlZCB0aGVzZS4Kb2ssIGkgd2lsbCB0cnkgaXQuCj4gCj4+PiAgICAKPj4+
PiArCj4+Pj4gKyAgJyNzaXplLWNlbGxzJzoKPj4+PiArICAgIGNvbnN0OiAwCj4+Pgo+Pj4gRGl0
dG8uIFBsdXMsIHRoaXMgb25lIGxvb2tzIHdyb25nIGFueXdheS4KPj4gdGhpcyBpcyBmb3IgdGhl
IHN1Ym5vZGUsIHN1Y2ggYXMgbmFuZEAwLiBkbyB5b3UgbWVhbiBzLycnLyIiLz8KPiAKPiBTb3Jy
eSwgdGhpcyBpcyBub3QgIndyb25nIGFueXdheSIsIG15IGZhdWx0LiBCdXQgc3RpbGwsIHlvdSBk
b24ndCBuZWVkCj4gdGhpcyBwcm9wZXJ0eSBmb3IgdGhlIHNhbWUgcmVhc29uIGFzIGFib3ZlLgpv
ay4KPiAKPj4+ICAgIAo+Pj4+ICsKPj4+PiArICByZWctbmFtZXM6Cj4+Pj4gKyAgICBpdGVtczoK
Pj4+PiArICAgICAgLSBjb25zdDogbmZjCj4+Pj4gKyAgICAgIC0gY29uc3Q6IGVtbWMKPj4+Cj4+
PiBXaHkgZG8geW91IG5lZWQgdGhlIGVtbWMgcmVnaXN0ZXIgbWFwPyBEbyB5b3UgcmVhbGx5IG5l
ZWQgdG8gcGVyZm9ybSBhCj4+PiByZWdpc3RlciBhY2Nlc3MgdGhlcmU/Cj4+IHllcywgd2UgaGF2
ZSB0byBhY2Nlc3MgdGhlIGVtbWMgcmVnaXN0ZXIgbWFwLiBiZWNhdXNlIHRoZSBORkMgY2xvY2sg
Y29tZXMgZnJvbSBTREVNTUNfQ0xPQ0sgcmVnaXN0ZXIuCj4gCj4gQnV0IGlmIGl0J3MgYSBjbG9j
ayB5b3Ugc2hvdWxkIGdldCB0aGUgY2xvY2sgYW5kIGNhbGwKPiBjbGtfcHJlcGFyZV9lbmFibGUo
KSwgeW91IGRvbid0IG5lZWQgdG8gcG9rZSBkaXJlY3RseSBpbiB0aGUgcmVnaXN0ZXJzLgo+IERv
IHlvdT8KCm5vLCBpdCBkb2Vzbid0LiBpdCBpcyBzcGVjaWFsIGFuZCB0aGUgcmVhc29uIHdoeSBu
ZWVkIHRvIGltcGxlbWVudCBhIE1NQyAKc3ViIGNsb2NrIGRyaXZlciBwcmV2aW91c2x5LiBhbHNv
IHdlIGRvbid0IGltcGxlbWVudCBpdCBhcyBhIGNsb2NrIApwcm92aWRlciBpbiBkcml2ZXJzL2Ns
ay9tZXNvbi8sIGJlY2F1c2UgdGhlIFNERU1NQ19DTE9DSyByZWdpc3RlciBpcyAKaW50ZXJuYWwg
aW4gTUNJIGNvbnRyb2xsZXIuCj4gCj4+Pj4gK2V4YW1wbGVzOgo+Pj4+ICsgIC0gfAo+Pj4+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2F4Zy1jbGtjLmg+Cj4+Pj4gKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+Pj4+ICsg
ICAgYXBiIHsKPj4+PiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+Pj4gKyAgICAgICNz
aXplLWNlbGxzID0gPDI+Owo+Pj4KPj4+IE5vdCBzdXJlIHlvdSBuZWVkIHRoaXMgdXBwZXIgbm9k
ZSBpbiB0aGUgZXhhbXBsZS4KPj4gdXNlIHRoZSB1cHBlciBub2RlIHRvIGluZGljYXRlIHRoZSAi
I2FkZHJlc3MtY2VsbHMiIGFuZCAiI3NpemUtY2VsbHMiLiBpZiBpIGRvIG5vdCBkbyB0aGF0LCBk
dF9iaW5kaW5nX2NoZWNrIHdpbGwgcmVwb3J0Ogo+PiAgICAiLi4uLi5yZWc6MDogWzAsIDMwNzIw
LCAwLCAyNTZdIGlzIHRvbyBsb25nIiBhbmQKPj4gICAgIi4uLi4ucmVnOjE6IFswLCAyODY3Miwg
MCwgMjA0OF0gaXMgdG9vIGxvbmciLgo+IAo+IG9rLCBtYXliZSwgSSdsbCBsZXQgYmluZGluZ3Mg
bWFpbnRhaW5lciByZXZpZXcgdGhhdC4KCm9rLiB0aGFua3MuCgo+IAo+Pj4gICAgCj4+Pj4gKyAg
ICAgIG5hbmQtY29udHJvbGxlckA3ODAwIHsKPj4+PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsKPj4+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPj4+PiArICAgICAgICBjb21w
YXRpYmxlID0gImFtbG9naWMsbWVzb24tYXhnLW5mYyI7Cj4+Pj4gKyAgICAgICAgcmVnID0gPDB4
MCAweDc4MDAgMHgwIDB4MTAwPiwKPj4+PiArICAgICAgICAgICAgICA8MHgwIDB4NzAwMCAweDAg
MHg4MDA+Owo+Pj4+ICsgICAgICAgIHJlZy1uYW1lcyA9ICJuZmMiLCAiZW1tYyI7Cj4+Pj4gKwo+
Pj4+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9FREdFX1JJU0lO
Rz47Cj4+Pj4gKyAgICAgICAgY2xvY2tzID0gPCZjbGtjIENMS0lEX1NEX0VNTUNfQz4sCj4+Pj4g
KyAgICAgICAgICAgICAgICAgPCZjbGtjIENMS0lEX0ZDTEtfRElWMj47Cj4+Pj4gKyAgICAgICAg
Y2xvY2stbmFtZXMgPSAiY29yZSIsICJkZXZpY2UiOwo+Pj4+ICsKPj4+PiArICAgICAgfTsKPj4+
PiArICAgIH07Cj4+Pj4gKy4uLgo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4gLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
