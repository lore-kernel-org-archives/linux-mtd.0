Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF87C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0om8v6ah4cza5WFCecanX4nrseme03JL2ewkMIN2auk=; b=FNgixMjCh6jbNh
	6RyVZsAGuBa/54jgZzPwoZ08O1fUQu4dhBAWFpxxeCamHJQLGJaXgUJVoOP3tbfk8iVRDxVDqpDso
	IjQX27ezJ4hFyolScdyfgRZpeIrpnBhBmbYDo8lFN94P8BxFtRCO6mY4TZYwD0g/r4sNbqs9ngwLx
	FrJOwHEIzwbFfN3t4I6VYDKhXrihirQfJODUgCDwgoKGqCTfV+ShlMpb7FcdStQ8Cw5cAEKrzSxDN
	p1/8WEPZS86GUsNZk9CtlMieVlZ2ozZMSrXvq9VYg4mew6uXzVM+uHPFJ738AEwVzL8/3FUrp3r7H
	daRo8Dv7RFDrVj/4PO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phTWC-00HXZU-2e;
	Wed, 29 Mar 2023 10:59:04 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phTW7-00HXXA-0P;
	Wed, 29 Mar 2023 10:59:01 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id DA0455FD1C;
	Wed, 29 Mar 2023 13:58:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680087532;
	bh=2RiAZcjm7f7fZ6eDOOysdqaLXhVvLMfLn4XnqyG2nKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=MEnJ+y7qM8X68v4BX902DNuyddPZX+zOuwWBOqRh8gxt7xxAJa/dG8X/L2L+WrwI3
	 Z2CGIP3E+n3mAj/+o+GINFap/38+X/sSR84fmAe9WS0q6rbfhoIN5ioFURiQMNqM4S
	 1EezKrN/EoeXdL4uo3IJQgD5LEiJuDX/aWs6AGYjO754F4rZtz7YIqXbvkX2hTClV/
	 O1Rpc4VeDLhR76pKJaMy2eM39AnuaKCAZsekaAY8etg9b9ikLYQjJnQGmMDnuXrp/9
	 dyGl8hPkWnBxJtfLi80MKXafN3VUw+R2EzbJvJ39IsraJN6SfQ0hmCbilGyVbbMKMC
	 zWmbmkZedjxpw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 29 Mar 2023 13:58:51 +0300 (MSK)
Message-ID: <f3dfc075-08e2-36a8-1526-e2bbd6eb110f@sberdevices.ru>
Date: Wed, 29 Mar 2023 13:55:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, <oxffffaa@gmail.com>
References: <3794ffbf-dfea-e96f-1f97-fe235b005e19@sberdevices.ru>
 <447abc1b-b4a3-5848-c99a-ecbff11486fe@linaro.org>
 <c110bd0f-f25a-a74a-07cb-4c3fdb8ef306@sberdevices.ru>
 <20230329110054.68455418@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230329110054.68455418@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/29 07:09:00 #21026578
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_035859_854642_5F8C4358 
X-CRM114-Status: GOOD (  21.65  )
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

CgpPbiAyOS4wMy4yMDIzIDEyOjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMjkgTWFyIDIwMjMg
MTE6MzM6MzggKzAzMDA6Cj4gCj4+IE9uIDI5LjAzLjIwMjMgMTE6MDksIFR1ZG9yIEFtYmFydXMg
d3JvdGU6Cj4+Pgo+Pj4KPj4+IE9uIDMvMjkvMjMgMDg6NDcsIEFyc2VuaXkgS3Jhc25vdiB3cm90
ZTogIAo+Pj4+IFZhbGlkIG1hc2sgaXMgMHgzRkZGLCB3aXRob3V0IHRoaXMgcGF0Y2ggdGhlIGZv
bGxvd2luZyBwcm9ibGVtcyB3ZXJlCj4+Pj4gZm91bmQ6Cj4+Pj4KPj4+PiAxKSBbICAgIDAuOTM4
OTE0XSBDb3VsZCBub3QgZmluZCBhIHZhbGlkIE9ORkkgcGFyYW1ldGVyIHBhZ2UsIHRyeWluZwo+
Pj4+ICAgICAgICAgICAgICAgICAgIGJpdC13aXNlIG1ham9yaXR5IHRvIHJlY292ZXIgaXQKPj4+
PiAgICBbICAgIDAuOTQ3Mzg0XSBPTkZJIHBhcmFtZXRlciByZWNvdmVyeSBmYWlsZWQsIGFib3J0
aW5nCj4+Pj4KPj4+PiAyKSBSZWFkIHdpdGggZGlzYWJsZWQgRUNDIG1vZGUgd2FzIGJyb2tlbi4K
Pj4+Pgo+Pj4+IEZpeGVzOiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQg
c3VwcG9ydCBmb3IgQW1sb2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+Pj4+IENjOiA8U3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3Yg
PEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4KPj4+PiAtLS0KPj4+PiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbWVzb25fbmFuZC5jIHwgNiArKystLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9u
YW5kLmMKPj4+PiBpbmRleCBhMjg1NzRjMDA5MDAuLjA3NGUxNDIyNWMwNiAxMDA2NDQKPj4+PiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+PiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+PiBAQCAtMjgwLDcgKzI4MCw3IEBAIHN0YXRp
YyB2b2lkIG1lc29uX25mY19jbWRfYWNjZXNzKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIGludCBy
YXcsIGJvb2wgZGlyLAo+Pj4+ICAKPj4+PiAgCWlmIChyYXcpIHsKPj4+PiAgCQlsZW4gPSBtdGQt
PndyaXRlc2l6ZSArIG10ZC0+b29ic2l6ZTsKPj4+PiAtCQljbWQgPSAobGVuICYgR0VOTUFTSyg1
LCAwKSkgfCBzY3JhbWJsZXIgfCBETUFfRElSKGRpcik7Cj4+Pj4gKwkJY21kID0gKGxlbiAmIEdF
Tk1BU0soMTMsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsgIAo+Pj4KPj4+IFdoYXQg
aGFwcGVucyB3aGVuIGxlbiA+IEdFTk1BU0soMTMsIDApPyBEbyB5b3UgY2hlY2sgdGhpcyBzb21l
d2hlcmU/ICAKPj4KPj4gJ2xlbicgd2lsbCBiZSB0cmltbWVkLiBJJ20gbm90IHN1cmUgdGhhdCB0
aGlzIGNhc2UgaXMgcG9zc2libGUgaGVyZSwgYmVjYXVzZSBHRU5NQVNLKDEzLCAwKQo+PiBpcyBo
YXJkd2FyZSBsaW1pdCBmb3IgdGhpcyBOQU5EIGNvbnRyb2xsZXIsIHNvICd3cml0ZXNpemUnIGFu
ZCAnb29ic2l6ZScgd2lsbCBiZSBpbml0aWFsaXplZAo+PiB0byBmaXQgdGhpcyB2YWx1ZS4gTW9y
ZW92ZXIgR0VOTUFTSygxMywgMCkgaXMgMTZLYiAtIGkgdGhpbmsgaXQgaXMgYmlnIGVub3VnaCBm
b3Igc2luZ2xlCj4+IHJlYWQuIEFsc28gaSdtIG5vdCBzdXJlIHRoYXQgaXQgaXMgZ29vZCBhcHBy
b2FjaCB0byBjaGVjayAnbGVuJyBoZXJlIC0gd2UgYXJlIGluIHRoZSBtaWRkbGUKPj4gb2YgTkFO
RCByZWFkIHByb2Nlc3NpbmcuCj4gCj4gTm8sIHlvdSBzaG91bGQgY2hlY2sgdGhlIHBhZ2Ugc2l6
ZSB3aWxsIG5vdCBleGNlZWQgdGhpcyBsaW1pdCBpbiB0aGUKPiBhdHRhY2ggaG9vaywgbGlrZWx5
Lgo+IAo+IFlvdSBzaG91bGQgYWxzbyByZWZ1c2UgZXhlY19vcCBvcGVyYXRpb25zIHdpdGggYSBk
YXRhIGxlbmd0aCBiaWdnZXIKPiB0aGFuIDE2ayAoZWl0aGVyIHdpdGggYSBtYW51YWwgY2hlY2sg
aW4geW91ciBvd24gcGFyc2VyIG9yIGp1c3QgYnkKPiBwcm92aWRpbmcgdGhlIG1heCBzaXplIHRv
IHRoZSBwYXJzZXIgdGFibGUsIGRlcGVuZGluZyBvbiB3aGF0J3MgdXNlZCkuCj4KCiAKT2ssIEkg
c2VlLgoKVGhhbmtzLCBBcnNlbml5Cgo+Pgo+Pj4KPj4+IFBsZWFzZSBpbnRyb2R1Y2UgYSBtYWNy
by9maWVsZCBmb3IgR0VOTUFTSygxMywgMCksIGhhdmluZyBzdWNoIG1hc2sKPj4+IHNjYXR0ZXJl
ZCBhbG9uZyB0aGUgY29kZSBsb29rcyBoYWNraXNoIGFuZCBkb2Vzbid0IGhlbHAgcmVhZGFiaWxp
dHkuCj4+PiBZb3UnbGwgZ2V0IHRvIHVzZSBGSUVMRF9QUkVQIGFzIHdlbGwuICAKPj4KPj4gQWNr
LCBpJ2xsIGRvIGl0IGluIHYzCj4+Cj4+IFRoYW5rcywgQXJzZW5peQo+Pgo+Pj4gICAKPj4+PiAg
CQl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+Pj4+ICAJCXJldHVy
bjsKPj4+PiAgCX0KPj4+PiBAQCAtNTQ0LDcgKzU0NCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZj
X3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGludCBsZW4pCj4+Pj4g
IAlpZiAocmV0KQo+Pj4+ICAJCWdvdG8gb3V0Owo+Pj4+ICAKPj4+PiAtCWNtZCA9IE5GQ19DTURf
TjJNIHwgKGxlbiAmIEdFTk1BU0soNSwgMCkpOwo+Pj4+ICsJY21kID0gTkZDX0NNRF9OMk0gfCAo
bGVuICYgR0VOTUFTSygxMywgMCkpOwo+Pj4+ICAJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSAr
IE5GQ19SRUdfQ01EKTsKPj4+PiAgCj4+Pj4gIAltZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4+
Pj4gQEAgLTU2OCw3ICs1NjgsNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY193cml0ZV9idWYoc3Ry
dWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPj4+PiAgCWlmIChyZXQpCj4+
Pj4gIAkJcmV0dXJuIHJldDsKPj4+PiAgCj4+Pj4gLQljbWQgPSBORkNfQ01EX00yTiB8IChsZW4g
JiBHRU5NQVNLKDUsIDApKTsKPj4+PiArCWNtZCA9IE5GQ19DTURfTTJOIHwgKGxlbiAmIEdFTk1B
U0soMTMsIDApKTsKPj4+PiAgCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NN
RCk7Cj4+Pj4gIAo+Pj4+ICAJbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOyAgCj4gCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
