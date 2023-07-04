Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6734BEB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKEVUgjrpEOtWh3NKVoMYIcMP2ZToo9uXUyv6vqIMwc=; b=DymP0idAT453hu
	l5jTEG83uMoOOZgS6r1Pum9G5ZhjT7CZWfAFY0kDs9eRYR3Xmh8O8CbjRUCXYmKeXciYP0VuaOruW
	ESzj6yejlDGJsHMqim6XpyCXSVW1A72sK7cCMcNfgbGFNdw20U22juLSsbdLKpvav5Hz6YWJ2ZEpk
	I3WDaNaViEfRiBmObkqco4pXSg9Jchr9fVXzHiYgGTLC+XQsSwYy9CkHPT8YW+iaOYepuswPJ7eMB
	/uHqe2GAeqzdIivf2US/qP8ZmohMJTJlHTRIlSdd2BCbREFA4AYcxoAPJXPGNzBy980N4WzGMSwE3
	ZDrXI9sArRepCxV9AKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjy4-00Dx2g-0r;
	Tue, 04 Jul 2023 17:37:36 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjxz-00Dwzy-2y;
	Tue, 04 Jul 2023 17:37:33 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6876C100069;
	Tue,  4 Jul 2023 20:37:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6876C100069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688492248;
	bh=0t+mR7aNfe+ylAtBNvEGCWYPJQx/8WNK8PjxOwrmOTA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:From;
	b=EIFPPYpZJB8y2bcROy4Q+4zWKdi0+Ib+gA3lCPMFpqJu4mUljOrGG/pCWOfyJ632J
	 O3cmZMq3vc9YD1iv4z0BHcGK+wWEMaEnkcYQP6lKik2gzxY0m8SciVZFqqU/NbXoqa
	 6q5o35SdgFVj93wzzxtac1lZW61l+jg1XfKXdGMf0a9CaqOPpGPDT1zwgM3QirNDu+
	 4d3NtPQnBnfnP6CD8hxpbloZCPJfj+yIuAkV5nGL1iSSkfwbAQwKhhwn1LVriTRVxT
	 TXK/RSVwFppOizc7LrvjRDzwple+astxMeoW9ArzwFmWyfyaCUnRWRx8pC7C2D3DQO
	 wgcn1eNK6d9pQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 20:37:28 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 20:37:16 +0300
Message-ID: <59246d83-7c4b-8b34-3173-71bdb698c2aa@sberdevices.ru>
Date: Tue, 4 Jul 2023 20:32:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] mtd: rawnand: meson: waiting w/o wired ready/busy
 pin
Content-Language: en-US
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
 <20230608044728.1328506-3-AVKrasnov@sberdevices.ru>
 <20230704144357.286281dc@xps-13>
 <47994f36-27d4-e5e4-73a9-6d4225671eec@sberdevices.ru>
 <20230704151220.67857861@xps-13>
 <73849b9c-0700-4946-84a2-428f98f0a6d6@sberdevices.ru>
In-Reply-To: <73849b9c-0700-4946-84a2-428f98f0a6d6@sberdevices.ru>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178432 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_103732_341298_E9B05EC5 
X-CRM114-Status: GOOD (  20.04  )
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

CgpPbiAwNC4wNy4yMDIzIDE2OjA3LCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6Cj4gCj4gCj4gT24g
MDQuMDcuMjAyMyAxNjoxMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGkgQXJzZW5peSwKPj4K
Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgNCBKdWwgMjAyMyAxNTo0
NjoxOCArMDMwMDoKPj4KPj4+IE9uIDA0LjA3LjIwMjMgMTU6NDMsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4+Pj4gSGkgQXJzZW5peSwKPj4+Pgo+Pj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBUaHUsIDggSnVuIDIwMjMgMDc6NDc6MjggKzAzMDA6Cj4+Pj4gICAKPj4+Pj4gSWYg
dGhlcmUgaXMgbm8gd2lyZWQgcmVhZHkvYnVzeSBwaW4sIGNsYXNzaWMgd2F5IHRvIHdhaXQgZm9y
IGNvbW1hbmQKPj4+Pj4gY29tcGxldGlvbiBpcyB0byB1c2UgZnVuY3Rpb24gJ25hbmRfc29mdF93
YWl0cmR5KCknLiBNZXNvbiBOQU5EIGhhcwo+Pj4+PiBzcGVjaWFsIGNvbW1hbmQgd2hpY2ggYWxs
b3dzIHRvIHdhaXQgZm9yIE5BTkRfU1RBVFVTX1JFQURZIGJpdCB3aXRob3V0Cj4+Pj4+IHJlYWRp
bmcgc3RhdHVzIGluIGEgc29mdHdhcmUgbG9vcCAoYXMgJ25hbmRfc29mdF93YWl0cmR5KCknIGRv
ZXMpLiBUbwo+Pj4+PiB1c2UgaXQgc2VuZCB0aGlzIGNvbW1hbmQgYWxvbmcgd2l0aCBOQU5EX0NN
RF9TVEFUVVMsIHRoZW4gd2FpdCBmb3IgYW4KPj4+Pj4gaW50ZXJydXB0LCBhbmQgYWZ0ZXIgaW50
ZXJydXB0IHNlbmQgTkFORF9DTURfUkVBRDAuIFNvIHRoaXMgZmVhdHVyZQo+Pj4+PiBhbGxvd3Mg
dG8gdXNlIGludGVycnVwdCBkcml2ZW4gd2FpdGluZyB3aXRob3V0IHdpcmVkIHJlYWR5L2J1c3kg
cGluLgo+Pj4+Pgo+Pj4+PiBTdWdnZXN0ZWQtYnk6IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1s
b2dpYy5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92
QHNiZXJkZXZpY2VzLnJ1Pgo+Pj4+PiAtLS0KPj4+Pj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4+Pj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+IGluZGV4IDA3NGUxNDIyNWMwNi4uOWYw
NWUxMTNiNGVhIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9u
YW5kLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+
IEBAIC0zOCw2ICszOCw3IEBACj4+Pj4+ICAjZGVmaW5lIE5GQ19DTURfU0NSQU1CTEVSX0RJU0FC
TEUJMAo+Pj4+PiAgI2RlZmluZSBORkNfQ01EX1NIT1JUTU9ERV9ESVNBQkxFCTAKPj4+Pj4gICNk
ZWZpbmUgTkZDX0NNRF9SQl9JTlQJCUJJVCgxNCkKPj4+Pj4gKyNkZWZpbmUgTkZDX0NNRF9SQl9J
TlRfTk9fUElOCSgoMHhiIDw8IDEwKSB8IEJJVCgxOCkgfCBCSVQoMTYpKQo+Pj4+PiAgCj4+Pj4+
ICAjZGVmaW5lIE5GQ19DTURfR0VUX1NJWkUoeCkJKCgoeCkgPj4gMjIpICYgR0VOTUFTSyg0LCAw
KSkKPj4+Pj4gIAo+Pj4+PiBAQCAtMTc5LDYgKzE4MCw3IEBAIHN0cnVjdCBtZXNvbl9uZmMgewo+
Pj4+PiAgCXUzMiBpbmZvX2J5dGVzOwo+Pj4+PiAgCj4+Pj4+ICAJdW5zaWduZWQgbG9uZyBhc3Np
Z25lZF9jczsKPj4+Pj4gKwlib29sIG5vX3JiX3BpbjsKPj4+Pj4gIH07Cj4+Pj4+ICAKPj4+Pj4g
IGVudW0gewo+Pj4+PiBAQCAtMzkyLDcgKzM5NCw0MiBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNf
c2V0X2RhdGFfb29iKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+Pj4+ICAJfQo+Pj4+PiAgfQo+
Pj4+PiAgCj4+Pj4+IC1zdGF0aWMgaW50IG1lc29uX25mY19xdWV1ZV9yYihzdHJ1Y3QgbWVzb25f
bmZjICpuZmMsIGludCB0aW1lb3V0X21zKQo+Pj4+PiArc3RhdGljIGludCBtZXNvbl9uZmNfd2Fp
dF9ub19yYl9waW4oc3RydWN0IG1lc29uX25mYyAqbmZjLCBpbnQgdGltZW91dF9tcywKPj4+Pj4g
KwkJCQkgICAgYm9vbCBuZWVkX2NtZF9yZWFkMCkKPj4+Pj4gK3sKPj4+Pj4gKwl1MzIgY21kLCBj
Zmc7Cj4+Pj4+ICsKPj4+Pj4gKwltZXNvbl9uZmNfY21kX2lkbGUobmZjLCBuZmMtPnRpbWluZy50
d2IpOwo+Pj4+PiArCW1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKPj4+Pj4gKwltZXNvbl9uZmNf
d2FpdF9jbWRfZmluaXNoKG5mYywgQ01EX0ZJRk9fRU1QVFlfVElNRU9VVCk7Cj4+Pj4+ICsKPj4+
Pj4gKwljZmcgPSByZWFkbChuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DRkcpOwo+Pj4+PiArCWNm
ZyB8PSBORkNfUkJfSVJRX0VOOwo+Pj4+PiArCXdyaXRlbChjZmcsIG5mYy0+cmVnX2Jhc2UgKyBO
RkNfUkVHX0NGRyk7Cj4+Pj4+ICsKPj4+Pj4gKwlyZWluaXRfY29tcGxldGlvbigmbmZjLT5jb21w
bGV0aW9uKTsKPj4+Pj4gKwljbWQgPSBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgTkZDX0NNRF9D
TEUgfCBOQU5EX0NNRF9TVEFUVVM7Cj4+Pj4+ICsJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSAr
IE5GQ19SRUdfQ01EKTsKPj4+Pj4gKwo+Pj4+PiArCS8qIHVzZSB0aGUgbWF4IGVyYXNlIHRpbWUg
YXMgdGhlIG1heGltdW0gY2xvY2sgZm9yIHdhaXRpbmcgUi9CICovCj4+Pj4+ICsJY21kID0gTkZD
X0NNRF9SQiB8IE5GQ19DTURfUkJfSU5UX05PX1BJTiB8IG5mYy0+dGltaW5nLnRiZXJzX21heDsK
Pj4+Pj4gKwl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+Pj4+PiAr
Cj4+Pj4+ICsJaWYgKCF3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJm5mYy0+Y29tcGxldGlv
biwKPj4+Pj4gKwkJCQkJIG1zZWNzX3RvX2ppZmZpZXModGltZW91dF9tcykpKQo+Pj4+PiArCQly
ZXR1cm4gLUVUSU1FRE9VVDsKPj4+Pj4gKwo+Pj4+PiArCWlmIChuZWVkX2NtZF9yZWFkMCkgewo+
Pj4+PiArCQljbWQgPSBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgTkZDX0NNRF9DTEUgfCBOQU5E
X0NNRF9SRUFEMDsKPj4+Pj4gKwkJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdf
Q01EKTsKPj4+Pj4gKwkJbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOwo+Pj4+PiArCQltZXNvbl9u
ZmNfd2FpdF9jbWRfZmluaXNoKG5mYywgQ01EX0ZJRk9fRU1QVFlfVElNRU9VVCk7Cj4+Pj4+ICsJ
fSAgCj4+Pj4KPj4+PiBJIGZvcmdvdCBhYm91dCB0aGlzLCB5b3Ugc2hvdWxkIGF2b2lkIG9wZW4g
Y29kaW5nIGNvcmUgaGVscGVycywgY2FuIHlvdQo+Pj4+IHBsZWFzZSBzZW5kIGEgZm9sbG93dXAg
cGF0Y2ggdG8gdXNlIG5hbmRfc3RhdHVzX29wKCkgYW5kCj4+Pj4gbmFuZF9leGl0X3N0YXR1c19v
cCgpID8gIAo+Pj4KPj4+IEEgb2ssIHNvOgo+Pj4gMSkgU2VuZGluZyBOQU5EX0NNRF9TVEFUVVMg
Z29lcyB0byBuYW5kX3N0YXR1c19vcCgpCj4+PiAyKSBTZW5kaW5nIE5BTkRfQ01EX1JFQUQwIGdv
ZXMgdG8gbmFuZF9leGl0X3N0YXR1c19vcCgpCj4+Pgo+Pj4gT2ssIG5vIHByb2JsZW0hIEknbGwg
cHJlcGFyZSBhbmQgc2VuZCBpdCBvbiB0aGlzIHdlZWshCj4+Cj4+IEV4YWN0bHkuIFNvcnJ5IEkg
aGFkIHRoaXMgaW4gbWluZCBidXQgSSBsaWtlbHkgZm9yZ290IHRvIHdyaXRlIGl0Cj4+IGRvd24u
Cj4gCj4gT2ssIGdvdCBpdCEKCkhtLCBzZWVtcyAnaW50IG5hbmRfZXhpdF9zdGF0dXNfb3Aoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCknIGlzIG5vdCBleHBvcnRlZCwKc28gSSBjYW4ndCB1c2UgaXQg
aW4gdGhlIE1lc29uIG1vZHVsZS4gV2hpbGUgJ25hbmRfc3RhdHVzX29wKCknIHdvcmtzIG9rLgpN
YXkgSSBjYW4gZXhwb3J0ICduYW5kX2V4aXRfc3RhdHVzX29wKCk/JwoKVGhhbmtzLCBBcnNlbml5
CgoKPiAKPiBUaGFua3MsIEFyc2VuaXkKPiAKPj4KPj4gVGhhbmtzLAo+PiBNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
