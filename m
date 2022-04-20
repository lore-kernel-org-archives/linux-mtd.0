Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61E7C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IO9u6qpPCSxZJDxRCP7odlqIt4lo5R+YooI2FLtAbo=; b=Av/pJ8GxkSzhN7
	jkT/GxzFx2hjOv1BS10kDIYSiKDxyUtzWneZ3nPLPJi2U9wB1O6fIJ5xJmadFWZBBNJ4xrebc3WVd
	kp1xP11L2Ze2S/MuiJ32YL8OBmZMJwWCaqWRTl/qzooTEto98tzU+v6XuGBw2mzHBCrLhf9LVmDGr
	Y/sP2zH7MuHq8I8v2X/1oPnUpd4CBdxERNYABtwyutkQ5ukSUjwmdrcgyY1dX1YNQvNa5m0ES7qN1
	gLAMi7kfLTXxzwv3M77jWngz9k6s2cN6EcEJH/aQJVZcCsLgvck1pLBTo2qPHkeI5/BpRrJlTPaKU
	EpnlkyIQdjCFPetNozBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh9GK-008w7D-Cl; Wed, 20 Apr 2022 12:16:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh9G2-008vwb-Hc; Wed, 20 Apr 2022 12:16:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23321FF805;
 Wed, 20 Apr 2022 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650456985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6u55jL+XmZA+fHd05psyLDQ16L/uB8ALDHyFrbmkic=;
 b=aJkjaeqJFBhCS2FkHRCKWdLWfLlpTA4DxfP+ZF47mKkengFjj4PyzO/qrovv6sFgfsbDDJ
 ynMAI2a5RdfIQv8i8MNgAxwcbSrtg5V0WW6X8E0txevji75qDUZug8PAcwTCcGM/xIBg5L
 KsneZafPiuvbM1yGwWuEsECzQNCg9jrjJlq8SunHQIgTfaq6x+VsyaziI+wEV2jH+CVMDu
 Ya8Wel/qLkxBmnLtyMaxQ62hSKk5vz9v3y+zrAPZpnV+iYyOFMsNPYNyXXHV5qjH3YJiR5
 M/dmHwPBlQm7ANzENtulJFZ405nEg/VGVqUF7kQ5NAP5YZjsO39tL6uBJVdWVQ==
Date: Wed, 20 Apr 2022 14:16:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: nand: meson: refine Amlogic NAND
 controller driver
Message-ID: <20220420141620.4fd68eef@xps13>
In-Reply-To: <b880c64c-7651-c445-4e5e-74cb7a1e76ee@amlogic.com>
References: <20220402074921.13316-1-liang.yang@amlogic.com>
 <20220402074921.13316-3-liang.yang@amlogic.com>
 <20220420094107.4799f15a@xps13>
 <b880c64c-7651-c445-4e5e-74cb7a1e76ee@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_051631_099746_7DBC4AE1 
X-CRM114-Status: GOOD (  16.16  )
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

SGkgTGlhbmcsCgo+ID4+ICttYWludGFpbmVyczoKPiA+PiArICAtIGxpYW5nLnlhbmdAYW1sb2dp
Yy5jb20KPiA+PiArCj4gPj4gK3Byb3BlcnRpZXM6Cj4gPj4gKyAgY29tcGF0aWJsZToKPiA+PiAr
ICAgIGVudW06Cj4gPj4gKyAgICAgIC0gImFtbG9naWMsbWVzb24tZ3hsLW5mYyIKPiA+PiArICAg
ICAgLSAiYW1sb2dpYyxtZXNvbi1heGctbmZjIgo+ID4+ICsKPiA+PiArICByZWc6Cj4gPj4gKyAg
ICBtYXhJdGVtczogMgo+ID4+ICsKPiA+PiArICAnI2FkZHJlc3MtY2VsbHMnOgo+ID4+ICsgICAg
Y29uc3Q6IDEgIAo+ID4gCj4gPiBOb3Qgc3VyZSB0aGlzIHByb3BlcnR5IGlzIG5lZWRlZC4gIAo+
IHRoaXMgaXMgZm9yIHRoZSBzdWJub2RlLCBzdWNoIGFzIG5hbmRAMC4KClllcyBidXQgaWYgeW91
IHJlZmVyIHRvIG5hbmQtY29udHJvbGxlci55YW1sIHlvdSBubyBsb25nZXIgbmVlZCB0aGVzZS4K
Cj4gPiAgIAo+ID4+ICsKPiA+PiArICAnI3NpemUtY2VsbHMnOgo+ID4+ICsgICAgY29uc3Q6IDAg
IAo+ID4gCj4gPiBEaXR0by4gUGx1cywgdGhpcyBvbmUgbG9va3Mgd3JvbmcgYW55d2F5LiAgCj4g
dGhpcyBpcyBmb3IgdGhlIHN1Ym5vZGUsIHN1Y2ggYXMgbmFuZEAwLiBkbyB5b3UgbWVhbiBzLycn
LyIiLz8KClNvcnJ5LCB0aGlzIGlzIG5vdCAid3JvbmcgYW55d2F5IiwgbXkgZmF1bHQuIEJ1dCBz
dGlsbCwgeW91IGRvbid0IG5lZWQKdGhpcyBwcm9wZXJ0eSBmb3IgdGhlIHNhbWUgcmVhc29uIGFz
IGFib3ZlLgoKPiA+ICAgCj4gPj4gKwo+ID4+ICsgIHJlZy1uYW1lczoKPiA+PiArICAgIGl0ZW1z
Ogo+ID4+ICsgICAgICAtIGNvbnN0OiBuZmMKPiA+PiArICAgICAgLSBjb25zdDogZW1tYyAgCj4g
PiAKPiA+IFdoeSBkbyB5b3UgbmVlZCB0aGUgZW1tYyByZWdpc3RlciBtYXA/IERvIHlvdSByZWFs
bHkgbmVlZCB0byBwZXJmb3JtIGEKPiA+IHJlZ2lzdGVyIGFjY2VzcyB0aGVyZT8gIAo+IHllcywg
d2UgaGF2ZSB0byBhY2Nlc3MgdGhlIGVtbWMgcmVnaXN0ZXIgbWFwLiBiZWNhdXNlIHRoZSBORkMg
Y2xvY2sgY29tZXMgZnJvbSBTREVNTUNfQ0xPQ0sgcmVnaXN0ZXIuCgpCdXQgaWYgaXQncyBhIGNs
b2NrIHlvdSBzaG91bGQgZ2V0IHRoZSBjbG9jayBhbmQgY2FsbApjbGtfcHJlcGFyZV9lbmFibGUo
KSwgeW91IGRvbid0IG5lZWQgdG8gcG9rZSBkaXJlY3RseSBpbiB0aGUgcmVnaXN0ZXJzLgpEbyB5
b3U/Cgo+ID4+ICtleGFtcGxlczoKPiA+PiArICAtIHwKPiA+PiArICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9heGctY2xrYy5oPgo+ID4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiA+PiArICAgIGFwYiB7Cj4gPj4gKyAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ID4+ICsgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsg
IAo+ID4gCj4gPiBOb3Qgc3VyZSB5b3UgbmVlZCB0aGlzIHVwcGVyIG5vZGUgaW4gdGhlIGV4YW1w
bGUuICAKPiB1c2UgdGhlIHVwcGVyIG5vZGUgdG8gaW5kaWNhdGUgdGhlICIjYWRkcmVzcy1jZWxs
cyIgYW5kICIjc2l6ZS1jZWxscyIuIGlmIGkgZG8gbm90IGRvIHRoYXQsIGR0X2JpbmRpbmdfY2hl
Y2sgd2lsbCByZXBvcnQ6Cj4gICAiLi4uLi5yZWc6MDogWzAsIDMwNzIwLCAwLCAyNTZdIGlzIHRv
byBsb25nIiBhbmQKPiAgICIuLi4uLnJlZzoxOiBbMCwgMjg2NzIsIDAsIDIwNDhdIGlzIHRvbyBs
b25nIi4KCm9rLCBtYXliZSwgSSdsbCBsZXQgYmluZGluZ3MgbWFpbnRhaW5lciByZXZpZXcgdGhh
dC4KCj4gPiAgIAo+ID4+ICsgICAgICBuYW5kLWNvbnRyb2xsZXJANzgwMCB7Cj4gPj4gKyAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
Cj4gPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWF4Zy1uZmMiOwo+ID4+
ICsgICAgICAgIHJlZyA9IDwweDAgMHg3ODAwIDB4MCAweDEwMD4sCj4gPj4gKyAgICAgICAgICAg
ICAgPDB4MCAweDcwMDAgMHgwIDB4ODAwPjsKPiA+PiArICAgICAgICByZWctbmFtZXMgPSAibmZj
IiwgImVtbWMiOwo+ID4+ICsKPiA+PiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQg
SVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+ID4+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xrYyBDTEtJ
RF9TRF9FTU1DX0M+LAo+ID4+ICsgICAgICAgICAgICAgICAgIDwmY2xrYyBDTEtJRF9GQ0xLX0RJ
VjI+Owo+ID4+ICsgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiZGV2aWNlIjsKPiA+PiAr
Cj4gPj4gKyAgICAgIH07Cj4gPj4gKyAgICB9Owo+ID4+ICsuLi4gIAoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
