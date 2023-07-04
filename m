Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA76EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYIgQOJs74/cvhkA3cT78w1F4v8CWrXn9pAxSBmTLAA=; b=qlBdD/3FaLSVy3
	iHASbslzBM06v11RT1ujQnbxALAloxcYQDXiccBAocpiZTUCRyMnc+b9UhUak0OHtLRdup2/CRq1N
	tbYHCRjIqAsXd8sNTve84Xw9hG4Wg8JtotVZkF26Rf5WaAIyDnkY0kCvbojNNiKaW3lCl6SO7I70Q
	ayvoD0bICDm66CYQDuf8sw1hyG+KelM/KDfps+JmwYn52gmIZFmqj9+eoBJxR4Bn3Vc8yWPZf3DRE
	H9twcqOHSzGY7ekEqBR0B3YVaiViH6v8UBEAbyrYkb4zT4XA2OgYYplJy5G3jKSSvokeflNL3i8nV
	laE5RGnyx+3Se/ZOO8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfqC-00DLiW-2v;
	Tue, 04 Jul 2023 13:13:12 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfq8-00DLey-0y;
	Tue, 04 Jul 2023 13:13:10 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8B27C120054;
	Tue,  4 Jul 2023 16:13:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8B27C120054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688476385;
	bh=GlVkjDGUz+TG2KzYPrtHEhH8cUxqlz7tg0ytJOgmFnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=heH7xLD0G9O248QeBQKzS6wk28tLWNSdCUYDhg0JXnXl1g+A2NQcU/bkwepT2EdtA
	 R6CVhTpsitP2OyUN5DgQeUBqG46IJeZBh18XrQjyM4L1kLE4T8vdIXrF2vK9xqptW1
	 s7C+3naoP1u4u+uWYLttBcacIOv84bcE/gk3/3baFboZV+eXAFCg93ukMlpWy5Pb4J
	 QREvr7YkogO/7yIC+j0xFy63Hlxvoxgx1XTdn7le9Q2bpj0sRuLL+fDO4FKJZ966C9
	 PAlfYnLiNz28mFXUndIlb0LX9Gzq71R13qI6EkgEH+hxNNtsWj/IxDLosB4Lne+clS
	 DjF9u6dOr3WWA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 16:13:05 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 16:12:54 +0300
Message-ID: <73849b9c-0700-4946-84a2-428f98f0a6d6@sberdevices.ru>
Date: Tue, 4 Jul 2023 16:07:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] mtd: rawnand: meson: waiting w/o wired ready/busy
 pin
Content-Language: en-US
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
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230704151220.67857861@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178419 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_061308_689925_E25DA508 
X-CRM114-Status: GOOD (  18.92  )
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

CgpPbiAwNC4wNy4yMDIzIDE2OjEyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgNCBKdWwgMjAyMyAx
NTo0NjoxOCArMDMwMDoKPiAKPj4gT24gMDQuMDcuMjAyMyAxNTo0MywgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdy
b3RlIG9uIFRodSwgOCBKdW4gMjAyMyAwNzo0NzoyOCArMDMwMDoKPj4+ICAgCj4+Pj4gSWYgdGhl
cmUgaXMgbm8gd2lyZWQgcmVhZHkvYnVzeSBwaW4sIGNsYXNzaWMgd2F5IHRvIHdhaXQgZm9yIGNv
bW1hbmQKPj4+PiBjb21wbGV0aW9uIGlzIHRvIHVzZSBmdW5jdGlvbiAnbmFuZF9zb2Z0X3dhaXRy
ZHkoKScuIE1lc29uIE5BTkQgaGFzCj4+Pj4gc3BlY2lhbCBjb21tYW5kIHdoaWNoIGFsbG93cyB0
byB3YWl0IGZvciBOQU5EX1NUQVRVU19SRUFEWSBiaXQgd2l0aG91dAo+Pj4+IHJlYWRpbmcgc3Rh
dHVzIGluIGEgc29mdHdhcmUgbG9vcCAoYXMgJ25hbmRfc29mdF93YWl0cmR5KCknIGRvZXMpLiBU
bwo+Pj4+IHVzZSBpdCBzZW5kIHRoaXMgY29tbWFuZCBhbG9uZyB3aXRoIE5BTkRfQ01EX1NUQVRV
UywgdGhlbiB3YWl0IGZvciBhbgo+Pj4+IGludGVycnVwdCwgYW5kIGFmdGVyIGludGVycnVwdCBz
ZW5kIE5BTkRfQ01EX1JFQUQwLiBTbyB0aGlzIGZlYXR1cmUKPj4+PiBhbGxvd3MgdG8gdXNlIGlu
dGVycnVwdCBkcml2ZW4gd2FpdGluZyB3aXRob3V0IHdpcmVkIHJlYWR5L2J1c3kgcGluLgo+Pj4+
Cj4+Pj4gU3VnZ2VzdGVkLWJ5OiBMaWFuZyBZYW5nIDxsaWFuZy55YW5nQGFtbG9naWMuY29tPgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2Vz
LnJ1Pgo+Pj4+IC0tLQo+Pj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCA3
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYwo+Pj4+IGluZGV4IDA3NGUxNDIyNWMwNi4uOWYwNWUxMTNiNGVhIDEwMDY0NAo+
Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+IEBAIC0zOCw2ICszOCw3IEBACj4+
Pj4gICNkZWZpbmUgTkZDX0NNRF9TQ1JBTUJMRVJfRElTQUJMRQkwCj4+Pj4gICNkZWZpbmUgTkZD
X0NNRF9TSE9SVE1PREVfRElTQUJMRQkwCj4+Pj4gICNkZWZpbmUgTkZDX0NNRF9SQl9JTlQJCUJJ
VCgxNCkKPj4+PiArI2RlZmluZSBORkNfQ01EX1JCX0lOVF9OT19QSU4JKCgweGIgPDwgMTApIHwg
QklUKDE4KSB8IEJJVCgxNikpCj4+Pj4gIAo+Pj4+ICAjZGVmaW5lIE5GQ19DTURfR0VUX1NJWkUo
eCkJKCgoeCkgPj4gMjIpICYgR0VOTUFTSyg0LCAwKSkKPj4+PiAgCj4+Pj4gQEAgLTE3OSw2ICsx
ODAsNyBAQCBzdHJ1Y3QgbWVzb25fbmZjIHsKPj4+PiAgCXUzMiBpbmZvX2J5dGVzOwo+Pj4+ICAK
Pj4+PiAgCXVuc2lnbmVkIGxvbmcgYXNzaWduZWRfY3M7Cj4+Pj4gKwlib29sIG5vX3JiX3BpbjsK
Pj4+PiAgfTsKPj4+PiAgCj4+Pj4gIGVudW0gewo+Pj4+IEBAIC0zOTIsNyArMzk0LDQyIEBAIHN0
YXRpYyB2b2lkIG1lc29uX25mY19zZXRfZGF0YV9vb2Ioc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwK
Pj4+PiAgCX0KPj4+PiAgfQo+Pj4+ICAKPj4+PiAtc3RhdGljIGludCBtZXNvbl9uZmNfcXVldWVf
cmIoc3RydWN0IG1lc29uX25mYyAqbmZjLCBpbnQgdGltZW91dF9tcykKPj4+PiArc3RhdGljIGlu
dCBtZXNvbl9uZmNfd2FpdF9ub19yYl9waW4oc3RydWN0IG1lc29uX25mYyAqbmZjLCBpbnQgdGlt
ZW91dF9tcywKPj4+PiArCQkJCSAgICBib29sIG5lZWRfY21kX3JlYWQwKQo+Pj4+ICt7Cj4+Pj4g
Kwl1MzIgY21kLCBjZmc7Cj4+Pj4gKwo+Pj4+ICsJbWVzb25fbmZjX2NtZF9pZGxlKG5mYywgbmZj
LT50aW1pbmcudHdiKTsKPj4+PiArCW1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKPj4+PiArCW1l
c29uX25mY193YWl0X2NtZF9maW5pc2gobmZjLCBDTURfRklGT19FTVBUWV9USU1FT1VUKTsKPj4+
PiArCj4+Pj4gKwljZmcgPSByZWFkbChuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DRkcpOwo+Pj4+
ICsJY2ZnIHw9IE5GQ19SQl9JUlFfRU47Cj4+Pj4gKwl3cml0ZWwoY2ZnLCBuZmMtPnJlZ19iYXNl
ICsgTkZDX1JFR19DRkcpOwo+Pj4+ICsKPj4+PiArCXJlaW5pdF9jb21wbGV0aW9uKCZuZmMtPmNv
bXBsZXRpb24pOwo+Pj4+ICsJY21kID0gbmZjLT5wYXJhbS5jaGlwX3NlbGVjdCB8IE5GQ19DTURf
Q0xFIHwgTkFORF9DTURfU1RBVFVTOwo+Pj4+ICsJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSAr
IE5GQ19SRUdfQ01EKTsKPj4+PiArCj4+Pj4gKwkvKiB1c2UgdGhlIG1heCBlcmFzZSB0aW1lIGFz
IHRoZSBtYXhpbXVtIGNsb2NrIGZvciB3YWl0aW5nIFIvQiAqLwo+Pj4+ICsJY21kID0gTkZDX0NN
RF9SQiB8IE5GQ19DTURfUkJfSU5UX05PX1BJTiB8IG5mYy0+dGltaW5nLnRiZXJzX21heDsKPj4+
PiArCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+Pj4gKwo+Pj4+
ICsJaWYgKCF3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJm5mYy0+Y29tcGxldGlvbiwKPj4+
PiArCQkJCQkgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKSkpCj4+Pj4gKwkJcmV0dXJuIC1F
VElNRURPVVQ7Cj4+Pj4gKwo+Pj4+ICsJaWYgKG5lZWRfY21kX3JlYWQwKSB7Cj4+Pj4gKwkJY21k
ID0gbmZjLT5wYXJhbS5jaGlwX3NlbGVjdCB8IE5GQ19DTURfQ0xFIHwgTkFORF9DTURfUkVBRDA7
Cj4+Pj4gKwkJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4+PiAr
CQltZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4+Pj4gKwkJbWVzb25fbmZjX3dhaXRfY21kX2Zp
bmlzaChuZmMsIENNRF9GSUZPX0VNUFRZX1RJTUVPVVQpOwo+Pj4+ICsJfSAgCj4+Pgo+Pj4gSSBm
b3Jnb3QgYWJvdXQgdGhpcywgeW91IHNob3VsZCBhdm9pZCBvcGVuIGNvZGluZyBjb3JlIGhlbHBl
cnMsIGNhbiB5b3UKPj4+IHBsZWFzZSBzZW5kIGEgZm9sbG93dXAgcGF0Y2ggdG8gdXNlIG5hbmRf
c3RhdHVzX29wKCkgYW5kCj4+PiBuYW5kX2V4aXRfc3RhdHVzX29wKCkgPyAgCj4+Cj4+IEEgb2ss
IHNvOgo+PiAxKSBTZW5kaW5nIE5BTkRfQ01EX1NUQVRVUyBnb2VzIHRvIG5hbmRfc3RhdHVzX29w
KCkKPj4gMikgU2VuZGluZyBOQU5EX0NNRF9SRUFEMCBnb2VzIHRvIG5hbmRfZXhpdF9zdGF0dXNf
b3AoKQo+Pgo+PiBPaywgbm8gcHJvYmxlbSEgSSdsbCBwcmVwYXJlIGFuZCBzZW5kIGl0IG9uIHRo
aXMgd2VlayEKPiAKPiBFeGFjdGx5LiBTb3JyeSBJIGhhZCB0aGlzIGluIG1pbmQgYnV0IEkgbGlr
ZWx5IGZvcmdvdCB0byB3cml0ZSBpdAo+IGRvd24uCgpPaywgZ290IGl0IQoKVGhhbmtzLCBBcnNl
bml5Cgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
