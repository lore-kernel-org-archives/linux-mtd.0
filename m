Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B28C352A1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHAHbCBI86PMc17JUZvtzE99O1D/8N+mrj3XAWEd7zw=; b=qrQdhFWWweE3pk
	miVDXwPhjDm3DHy2QVvQNVJE/nepheUwmzLkUjA+9bVjfTBjj77oX7JXuqhUkNMu3VJU1ojrRKCzV
	6OeWSJ56Hrvo/C0Fr0LCyECOSwWdDWcMpW+LtYxmIRALzMA/8NNHxSuiU+USv8K1abm2SwzMvXd/T
	QZUBV+JDlCOSmeeoSmsrSUXQkYkRurrG5zTLSTQbluhGHCrZ1jV05p6qB9vnATL9aIboO3ay1xpPp
	6oaq6BjIY7C8XGCIBxowJRPTV25QcTNimRLDTRR/z/ggeFnmnyFDKUYZqcF6BuYJEX2OMv3cOJK87
	wiI+RoG5AaG3IbUNEO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Wvh-0091vv-KY; Tue, 06 Dec 2022 12:20:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2WvU-0091px-FX; Tue, 06 Dec 2022 12:19:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 91C4A660035D;
	Tue,  6 Dec 2022 12:19:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670329194;
	bh=l310F9lHcGhGvP4PuGtAy05tWbjB4PQoJ3xaWw36ABM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gttCpPDYm0hfTw/9o5b8PCwS0lR+0JzCaoDBMHOUWsCpuY1DQIz6ReUTPcpHKJnCk
	 Etv1bSL67CKIoWAbqV8tdl520zDnCNEHZ5MfLI7LPHa2T0TQaVYH3Il3UmKg6PU1Yt
	 +SZh2bw1HX+hvWvGjZ8zK6yi1EdGtpYBQI7WTZKzIzh1Q7TrvtZhxBwEFGZbijunJW
	 JEfWxF7VXO1BOocXgHM8IjdVpHOdlfy0VdG6s4JcvVwDHs8AmCL2RENS3siV937e8f
	 I8xkIxGm/+gcRYMox0bVcOz0FFD02COEr2s6tjgk9HidF8K2iH31MbnisDs5eLVohj
	 Mc97lj4nNI3UA==
Message-ID: <9992c9a5-059a-9396-32ce-7ed63cd12a96@collabora.com>
Date: Tue, 6 Dec 2022 13:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
 <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
 <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_041956_673500_0A29F970 
X-CRM114-Status: GOOD (  14.25  )
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

SWwgMDYvMTIvMjIgMTA6MDQsIFhpYW5nc2hlbmcgSG91ICjkvq/npaXog5wpIGhhIHNjcml0dG86
Cj4gSGkgQW5nZWxvLAo+IAo+IE9uIE1vbiwgMjAyMi0xMi0wNSBhdCAxNToyMSArMDEwMCwgQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6Cj4+IElsIDA1LzEyLzIyIDA3OjU3LCBYaWFu
Z3NoZW5nIEhvdSBoYSBzY3JpdHRvOgo+Pj4gQWRkIG1lZGlhdGVrLHJ4LWxhdGNoLWxhdGVuY3kg
cHJvcGVydHkgd2hpY2ggYWRqdXN0IHJlYWQgZGVsYXkgaW4KPj4+IHRoZQo+Pj4gdW5pdCBvZiBj
bG9jayBjeWNsZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFuZ3NoZW5nIEhvdSA8eGlhbmdz
aGVuZy5ob3VAbWVkaWF0ZWsuY29tPgo+Pj4gQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4+IC0tLQo+Pj4gICAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL21lZGlhdGVrLHNwaS1tdGstc25maS55YW1sICAgICB8IDcKPj4+
ICsrKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9tZWRpYXRl
ayxzcGktCj4+PiBtdGstc25maS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9tZWRpYXRlayxzcGktCj4+PiBtdGstc25maS55YW1sCj4+PiBpbmRleCBiYWIyM2Yx
YjExZmQuLjZlNmZmOGQ3M2ZjZCAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWssc3BpLW10ay0KPj4+IHNuZmkueWFtbAo+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9tZWRpYXRlayxzcGktbXRr
LQo+Pj4gc25maS55YW1sCj4+PiBAQCAtNDUsNiArNDUsMTMgQEAgcHJvcGVydGllczoKPj4+ICAg
ICAgICBkZXNjcmlwdGlvbjogZGV2aWNlLXRyZWUgbm9kZSBvZiB0aGUgYWNjb21wYW55aW5nIEVD
QyBlbmdpbmUuCj4+PiAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvcGhhbmRsZQo+Pj4gICAgCj4+PiArICBtZWRpYXRlayxyeC1sYXRjaC1sYXRlbmN5Ogo+Pj4g
KyAgICBkZXNjcmlwdGlvbjogUnggZGVsYXkgdG8gc2FtcGxlIGRhdGEgd2l0aCB0aGlzIHZhbHVl
LCB0aGUKPj4+IHZhbHVlCj4+PiArICAgICAgICAgICAgICAgICB1bml0IGlzIGNsb2NrIGN5Y2xl
Lgo+Pgo+PiBDYW4ndCB3ZSB1c2UgbmFub3NlY29uZHMgb3IgbWljcm9zZWNvbmRzIGFzIGEgdW5p
dCBoZXJlLCBpbnN0ZWFkIG9mCj4+IGNsb2NrIGN5Y2xlcz8KPiAKPiBUaGUgY2xvY2sgY3ljbGUg
d2lsbCBiZSB2YXJpb3VzIHdpdGggTWVkaWFUZWsgU1BJIE5BTkQgY29udHJvbGxlciB3aGljaAo+
IGNsb2NrIGZyZXF1ZW5jeSBjYW4gc3VwcG9ydCAyNi81Mi82OC84MS8xMDRNSHouLi4KPiBJdGBz
IG1heSBiZSBlYXN5IHRvIGNvbmZpZ3VyZSBhbmQgdW5kZXJzdGFuZCB3aXRoIGNsb2NrIGN5Y2xl
IGluIHVuaXQuCj4gCgpZZXMsIGJ1dCB3aGF0ZXZlciBjbG9jayBmcmVxdWVuY3kgd2UgdXNlLCB0
aGUgdGFyZ2V0IGlzIHRvIGFsd2F5cyB3YWl0IGZvcgpYIG5hbm9zZWNvbmRzLCByaWdodD8KCldh
aXRpbmcgZm9yIDUgY2xvY2sgY3ljbGVzIGF0IDEwNE1IeiBpcyBvYnZpb3VzbHkgbm90IHRoZSBz
YW1lIGFzIHdhaXRpbmcKZm9yIHRoZSBzYW1lIDUgY2xvY2sgY3ljbGVzIGF0IDI2TUh6OiBpbiB0
aGF0IGNhc2UsIGV4cHJlc3NpbmcgdGhlIHZhbHVlCmluIG5hbm9zZWNvbmRzIG9yIG1pY3Jvc2Vj
b25kcyB3b3VsZCBtYWtlIHRoYXQgaW5kZXBlbmRlbnQgZnJvbSB0aGUKY29udHJvbGxlcidzIGNs
b2NrIGZyZXF1ZW5jeSBhcyB0aGUgY2FsY3VsYXRpb24gZnJvbSBgdGltZWAgdG8gYGN5Y2xlc2AK
d291bGQgYmUgcGVyZm9ybWVkIGluc2lkZSBvZiB0aGUgZHJpdmVyLgoKUmVnYXJkcywKQW5nZWxv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
