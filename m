Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76184C7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 29 May 2023 19:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgawXwPumMOn2L/v8sAwzM6OiyfHLGSoykZwJwS6IsM=; b=Kop3h0CZHQwRha
	pxF3HUlJyz41tMcuGnZ7gDqNh47WtS4ObFql1xlcJvdC15K3EoAtX+EEHFF/mHR4s/rP4lDgZVLmy
	BWPMJDNq1KoVoZYw6d8dv4kqn9C99DxROofJABcKtY7X/2RzGmBgbFtfh5jiuHIuKczY1YOxsOHRW
	MwsmiqHsiun52OBkOw28X8B1/na00z/ew0WwgUTdItYaqO5Lz6vUDdUigedwEmUZVG93pX9am/n5+
	cffJH2SnMg2MrVDUNPnjkhTQ1CN1hbLZ7rzrEenzU/L1xbd9GnbdUSbdWXzf+QasYbwVbvXbo5YJU
	iS37RpvXe4YtxSC8Uoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iu5-00BYT0-2m;
	Mon, 29 May 2023 19:51:41 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iu1-00BYRn-27;
	Mon, 29 May 2023 19:51:39 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5F1165FD1A;
	Mon, 29 May 2023 22:51:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685389895;
	bh=3d6U0HghAzN5LgdrsysRgTv1ZTeSOPS8yDHMndRcRb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=fYlo62nD/OyjWWBooBcikbstYg73KtRuFpPjLKl+qfAJ32gGYj+WrVzW94ZKb50Vj
	 2Rom3xRokEEIqTXMjrfhGTjGZkBqTzrACtHRenVortQbYxYw0ch/5kqn1x6WrVxf8f
	 GZ8OchM8DbMsZP1fLbdVjB+2tG3BG0FKA6287E+dEKwjnwweppRHs5kuXWSMagp+8v
	 2PB6S+MpewAwOpLqsB/0hipOi0fdmN6ZL4EA5EnLdCHEnYOfO6cb8VPV0iOjCGTTzs
	 Aam3MMlutg4PkEnOfjK/ajHYeUEPiDGZyznmoHYNxGi0pVK2fbkuHkKlz/oiNljgmD
	 z2aU8RjZC0cJg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 29 May 2023 22:51:35 +0300 (MSK)
Message-ID: <ae791be4-1c44-240d-2559-37523b654506@sberdevices.ru>
Date: Mon, 29 May 2023 22:46:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/5] mtd: rawnand: meson: always read whole OOB bytes
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
 <20230515094440.3552094-4-AVKrasnov@sberdevices.ru>
 <20230522173813.08afe6b8@xps-13>
 <84a2e0c4-cc6f-1743-ee93-c13bc8bf09f1@sberdevices.ru>
 <20230526190905.1d5a3821@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230526190905.1d5a3821@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/29 07:59:00 #21367693
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_125138_047788_04DA3DA9 
X-CRM114-Status: GOOD (  24.59  )
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

CgpPbiAyNi4wNS4yMDIzIDIwOjA5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgMjMgTWF5IDIwMjMg
MjA6Mjc6MzUgKzAzMDA6Cj4gCj4+IE9uIDIyLjA1LjIwMjMgMTg6MzgsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+PiBIaSBBcnNlbml5LAo+Pj4KPj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBNb24sIDE1IE1heSAyMDIzIDEyOjQ0OjM3ICswMzAwOgo+Pj4gICAKPj4+PiBUaGlz
IGNoYW5nZXMgc2l6ZSBvZiByZWFkIGFjY2VzcyB0byBPT0IgYXJlYSBieSByZWFkaW5nIGFsbCBi
eXRlcyBvZgo+Pj4+IE9PQiAoZnJlZSBieXRlcyArIEVDQyBlbmdpbmUgYnl0ZXMpLiAgCj4+Pgo+
Pj4gVGhpcyBpcyBub3JtYWxseSB1cCB0byB0aGUgdXNlciAodXNlciBpbiB5b3VyIGNhc2UgPT0g
amZmczIpLiBUaGUKPj4+IGNvbnRyb2xsZXIgZHJpdmVyIHNob3VsZCBleHBvc2UgYSBudW1iZXIg
b2YgdXNlciBhY2Nlc3NpYmxlIGJ5dGVzIGFuZAo+Pj4gdGhlbiB3aGVuIHVzZXJzIHdhbnQgdGhl
IE9PQiBhcmVhLCB0aGV5IHNob3VsZCBhY2Nlc3MgaXQgZW50aXJlbHkuIE9uCj4+PiB0b3Agb2Yg
dGhhdCByZWFkLCB0aGV5IGNhbiBleHRyYWN0IChvciAid3JpdGUgb25seSIpIHRoZSB1c2VyIGJ5
dGVzLiAgCj4+Cj4+IFNvcnJ5LCBJIGRpZG4ndCBnZXQgaXQuIElmIGRyaXZlciBleHBvc2VzIE4g
Ynl0ZXMgb2YgdXNlciBhY2Nlc3NpYmxlIGJ5dGVzLAo+PiBJIG11c3QgYWx3YXlzIHJldHVybiB3
aG9sZSBPT0IgeWVzPyBFLmcuIE4gKyByZXN0IG9mIE9PQgo+IAo+IFllcy4gQXQgdGhlIE5BTkQg
Y29udHJvbGxlciBsZXZlbCwgeW91IGdldCBhc2tlZCBmb3IgZWl0aGVyIGEgcGFnZSBvZgo+IGRh
dGEgKHNvbWV0aW1lcyBhIHN1YnBhZ2UsIGJ1dCB3aGF0ZXZlciksIGFuZC9vciB0aGUgb29iIGFy
ZWEuIFlvdSBuZWVkCj4gdG8gcHJvdmlkZSB3aGF0IGlzIHJlcXVlc3RlZCwgbm8gbW9yZSwgbm8g
bGVzcy4gVGhlIHVwcGVyIGxheWVycyB3aWxsCj4gdHJpbSBkb3duIHdoYXQncyB1bmVlZGVkIGFu
ZCBleHRyYWN0IHRoZSBieXRlcyB0aGV5IHdhbnQuCgpJIHNlZSwgc28gaW4gdGhpcyBjYXNlIEkg
dGhpbmsgdGhpcyBwYXRjaCBjb3VsZCBiZSBtZXJnZWQgdG8gdGhlIHBhdGNoIHdoaWNoCmNoYW5n
ZXMgT09CIGxheW91dCBiZSBtb3ZpbmcgaXQgb3V0IG9mIEVDQyBhcmVhPyBCZWNhdXNlIGRyaXZl
ciBNVVNUIHJldHVybiBhbGwKYnl0ZXMgb2YgT09CIGFyZWEuCgo+IAo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+Pj4+IC0tLQo+
Pj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAyNCArKysrKysrKysrKysr
KysrKysrKysrKysKPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+PiBpbmRleCA4NTI2YTZiODc3MjAuLmEz
MTEwNmM5NDNkNyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9u
YW5kLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+PiBA
QCAtNzU1LDYgKzc1NSwzMCBAQCBzdGF0aWMgaW50IF9fbWVzb25fbmZjX3JlYWRfb29iKHN0cnVj
dCBuYW5kX2NoaXAgKm5hbmQsIGludCBwYWdlLAo+Pj4+ICAJdTMyIG9vYl9ieXRlczsKPj4+PiAg
CXUzMiBwYWdlX3NpemU7Cj4+Pj4gIAlpbnQgcmV0Owo+Pj4+ICsJaW50IGk7Cj4+Pj4gKwo+Pj4+
ICsJLyogUmVhZCBFQ0MgY29kZXMgYW5kIHVzZXIgYnl0ZXMuICovCj4+Pj4gKwlmb3IgKGkgPSAw
OyBpIDwgbmFuZC0+ZWNjLnN0ZXBzOyBpKyspIHsKPj4+PiArCQl1MzIgZWNjX29mZnMgPSBuYW5k
LT5lY2Muc2l6ZSAqIChpICsgMSkgKwo+Pj4+ICsJCQkgICAgICAgTkZDX09PQl9QRVJfRUNDKG5h
bmQpICogaTsKPj4+PiArCj4+Pj4gKwkJcmV0ID0gbmFuZF9yZWFkX3BhZ2Vfb3AobmFuZCwgcGFn
ZSwgMCwgTlVMTCwgMCk7Cj4+Pj4gKwkJaWYgKHJldCkKPj4+PiArCQkJcmV0dXJuIHJldDsKPj4+
PiArCj4+Pj4gKwkJLyogVXNlIHRlbXBvcmFyeSBidWZmZXIsIGJlY2F1c2UgJ25hbmRfY2hhbmdl
X3JlYWRfY29sdW1uX29wKCknCj4+Pj4gKwkJICogc2VlbXMgd29yayB3aXRoIHNvbWUgYWxpZ25t
ZW50LCBzbyB3ZSBjYW4ndCByZWFkIGRhdGEgdG8KPj4+PiArCQkgKiAnb29iX2J1ZicgZGlyZWN0
bHkuICAKPj4+Cj4+PiBETUE/ICAKPj4KPj4gWWVzIEkgZ3Vlc3MsIHRoaXMgYWRkcmVzcyBwYXNz
ZWQgdG8gZXhlY19vcCBjb2RlIGFuZCB1c2VkIGFzIERNQS4KPiAKPiBJZiB5b3VyIGNvbnRyb2xs
ZXIgdXNlcyBETUEgb24gZXhlY19vcCBhY2Nlc3NlcywgdGhlbiB5ZXMuIEV4ZWNfb3AKPiByZWFk
cy93cml0ZXMgYXJlIHVzdWFsbHkgc21hbGwgZW5vdWdoIChvciBub3QgdGltZSBzZW5zaXRpdmUg
YXQgYWxsIGlmCj4gdGhleSBhcmUgYmlnZ2VyKSBzbyBpdCdzIG5vdCByZXF1aXJlZCB0byB1c2Ug
RE1BIHRoZXJlLiBBbnlob3csIG9vYl9idWYKPiBpcyBzdWl0YWJsZSBmb3IgRE1BIHB1cnBvc2Vz
LCBzbyBJJ20gYSBiaXQgc3VycHJpc2VkIHlvdSBuZWVkIGEgYm91bmNlCj4gYnVmZmVyLCBpZiB0
aGF0J3MgdGhlIG9ubHkgcmVhc29uLiBNYXliZSB5b3UgbmVlZCBhIGJvdW5jZSBidWZmZXIgdG8K
PiByZW9yZ2FuaXplIHRoZSBkYXRhLiBUaGF0IHdvdWxkIGJlIGEgbXVjaCBiZXR0ZXIgZXhwbGFu
YXRpb24uCgpZZXMhIEkgcmVtb3ZlIHRoaXMgdGVtcG9yYXJ5IGJ1ZmZlciwgc2VlbXMgbXkgbWlz
dGFrZSEgV2l0aG91dCBpdCBldmVyeXRoaW5nIHdvcmtzCmdvb2QsIEknbGwgcmVtb3ZlIGl0IGZy
b20gdGhlIG5leHQgdmVyc2lvbiEKClRoYW5rcywgQXJzZW5peQoKPiAKPj4+PiArCQkgKi8KPj4+
PiArCQlyZXQgPSBuYW5kX2NoYW5nZV9yZWFkX2NvbHVtbl9vcChuYW5kLCBlY2Nfb2ZmcywgbWVz
b25fY2hpcC0+b29iX2J1ZiwKPj4+PiArCQkJCQkJIE5GQ19PT0JfUEVSX0VDQyhuYW5kKSwgZmFs
c2UpOwo+Pj4+ICsJCWlmIChyZXQpCj4+Pj4gKwkJCXJldHVybiByZXQ7Cj4+Pj4gKwo+Pj4+ICsJ
CW1lbWNweShvb2JfYnVmICsgaSAqIE5GQ19PT0JfUEVSX0VDQyhuYW5kKSwKPj4+PiArCQkgICAg
ICAgbWVzb25fY2hpcC0+b29iX2J1ZiwKPj4+PiArCQkgICAgICAgTkZDX09PQl9QRVJfRUNDKG5h
bmQpKTsKPj4+PiArCX0KPj4+PiAgCj4+Pj4gIAlvb2JfYnl0ZXMgPSBtZXNvbl9uZmNfZ2V0X29v
Yl9ieXRlcyhuYW5kKTsKPj4+PiAgICAKPj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobCAg
Cj4+Cj4+IFRoYW5rcywgQXJzZW5peQo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
