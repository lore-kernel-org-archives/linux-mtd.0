Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47B4EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OT37TGqEjbNuS2g2fQzfm0aBq192AIwqg2QZD1Z3fIs=; b=j1mXRBAFu1xKnE
	YgOsl2ORaGKfSAUrk8YQ4ZXsApwtdJ9GnXrTYuO8+mgvK3HAJBrUTbXNp6BHbtIYmPquzCw+NbJh6
	xK45IPAqbC0fqA335xbydmXbPMxH7uYOtScrTq8Nif1/odoIbd+UMSMs9glbr0G3S3mVfxEaWVnRq
	+9I4HUrrZ+r8qlcOYw0rXQ9b0J+zlOAypdhke896BcUzd5U88c9waKxMB+61ftGNmInItytmUzoRg
	p1xLyqfdZ0xfZTS3jxG8O2B0/Y4AZ5O4L8VY0FE0sR2ZRYyHP88aZk1mvVx4Sm13Q5CRbjwSSbpDQ
	1cq/LhVXxbPrFNu3sq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfVL-00DJ27-1X;
	Tue, 04 Jul 2023 12:51:39 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfVF-00DIzv-2A;
	Tue, 04 Jul 2023 12:51:37 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C178B120056;
	Tue,  4 Jul 2023 15:51:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C178B120056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688475087;
	bh=TLQ4bVsJ6/y2FcfOGOxoCr2CNTZbBW/B4otEHDJxOy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=JOBlX3JdnBRO3v4641iouALiZVk/6soMmfxeiXQ6L6bX/KJgtrB4XL+7i1ImqgSTy
	 4IjM358Sd6o4ANjJDDzT+d3S+LbBVHEADyuSnGowSptC5WYwXibt93E5SobQO4V04l
	 kP5y2tU9H/GjegWASj5XNId+X06Df+Hq2C/6W20ZkFetEyxfBM0alD8q/ev++49WqN
	 aAer9SGgecYFCTXBToLsvNKJzXYEdoPJ8Go6/q2Kv3pGHXlyXFWnejdr+FwBY4bo7T
	 o7jugOycNCxvMFd8WFtaSPPHeuLrV+2LDSdF1qr5naPdH6L47sWYv+ENXxlZfB3YHD
	 a67YQaFgAeaLw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 15:51:27 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 15:51:17 +0300
Message-ID: <47994f36-27d4-e5e4-73a9-6d4225671eec@sberdevices.ru>
Date: Tue, 4 Jul 2023 15:46:18 +0300
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
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230704144357.286281dc@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178418 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_055134_397131_7E8955F4 
X-CRM114-Status: GOOD (  26.92  )
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

CgpPbiAwNC4wNy4yMDIzIDE1OjQzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gQVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFRodSwgOCBKdW4gMjAyMyAw
Nzo0NzoyOCArMDMwMDoKPiAKPj4gSWYgdGhlcmUgaXMgbm8gd2lyZWQgcmVhZHkvYnVzeSBwaW4s
IGNsYXNzaWMgd2F5IHRvIHdhaXQgZm9yIGNvbW1hbmQKPj4gY29tcGxldGlvbiBpcyB0byB1c2Ug
ZnVuY3Rpb24gJ25hbmRfc29mdF93YWl0cmR5KCknLiBNZXNvbiBOQU5EIGhhcwo+PiBzcGVjaWFs
IGNvbW1hbmQgd2hpY2ggYWxsb3dzIHRvIHdhaXQgZm9yIE5BTkRfU1RBVFVTX1JFQURZIGJpdCB3
aXRob3V0Cj4+IHJlYWRpbmcgc3RhdHVzIGluIGEgc29mdHdhcmUgbG9vcCAoYXMgJ25hbmRfc29m
dF93YWl0cmR5KCknIGRvZXMpLiBUbwo+PiB1c2UgaXQgc2VuZCB0aGlzIGNvbW1hbmQgYWxvbmcg
d2l0aCBOQU5EX0NNRF9TVEFUVVMsIHRoZW4gd2FpdCBmb3IgYW4KPj4gaW50ZXJydXB0LCBhbmQg
YWZ0ZXIgaW50ZXJydXB0IHNlbmQgTkFORF9DTURfUkVBRDAuIFNvIHRoaXMgZmVhdHVyZQo+PiBh
bGxvd3MgdG8gdXNlIGludGVycnVwdCBkcml2ZW4gd2FpdGluZyB3aXRob3V0IHdpcmVkIHJlYWR5
L2J1c3kgcGluLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IExpYW5nIFlhbmcgPGxpYW5nLnlhbmdAYW1s
b2dpYy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNi
ZXJkZXZpY2VzLnJ1Pgo+PiAtLS0KPj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
YyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jCj4+IGluZGV4IDA3NGUxNDIyNWMwNi4uOWYwNWUxMTNiNGVhIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+IEBAIC0zOCw2ICszOCw3IEBACj4+ICAjZGVmaW5l
IE5GQ19DTURfU0NSQU1CTEVSX0RJU0FCTEUJMAo+PiAgI2RlZmluZSBORkNfQ01EX1NIT1JUTU9E
RV9ESVNBQkxFCTAKPj4gICNkZWZpbmUgTkZDX0NNRF9SQl9JTlQJCUJJVCgxNCkKPj4gKyNkZWZp
bmUgTkZDX0NNRF9SQl9JTlRfTk9fUElOCSgoMHhiIDw8IDEwKSB8IEJJVCgxOCkgfCBCSVQoMTYp
KQo+PiAgCj4+ICAjZGVmaW5lIE5GQ19DTURfR0VUX1NJWkUoeCkJKCgoeCkgPj4gMjIpICYgR0VO
TUFTSyg0LCAwKSkKPj4gIAo+PiBAQCAtMTc5LDYgKzE4MCw3IEBAIHN0cnVjdCBtZXNvbl9uZmMg
ewo+PiAgCXUzMiBpbmZvX2J5dGVzOwo+PiAgCj4+ICAJdW5zaWduZWQgbG9uZyBhc3NpZ25lZF9j
czsKPj4gKwlib29sIG5vX3JiX3BpbjsKPj4gIH07Cj4+ICAKPj4gIGVudW0gewo+PiBAQCAtMzky
LDcgKzM5NCw0MiBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfc2V0X2RhdGFfb29iKHN0cnVjdCBu
YW5kX2NoaXAgKm5hbmQsCj4+ICAJfQo+PiAgfQo+PiAgCj4+IC1zdGF0aWMgaW50IG1lc29uX25m
Y19xdWV1ZV9yYihzdHJ1Y3QgbWVzb25fbmZjICpuZmMsIGludCB0aW1lb3V0X21zKQo+PiArc3Rh
dGljIGludCBtZXNvbl9uZmNfd2FpdF9ub19yYl9waW4oc3RydWN0IG1lc29uX25mYyAqbmZjLCBp
bnQgdGltZW91dF9tcywKPj4gKwkJCQkgICAgYm9vbCBuZWVkX2NtZF9yZWFkMCkKPj4gK3sKPj4g
Kwl1MzIgY21kLCBjZmc7Cj4+ICsKPj4gKwltZXNvbl9uZmNfY21kX2lkbGUobmZjLCBuZmMtPnRp
bWluZy50d2IpOwo+PiArCW1lc29uX25mY19kcmFpbl9jbWQobmZjKTsKPj4gKwltZXNvbl9uZmNf
d2FpdF9jbWRfZmluaXNoKG5mYywgQ01EX0ZJRk9fRU1QVFlfVElNRU9VVCk7Cj4+ICsKPj4gKwlj
ZmcgPSByZWFkbChuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DRkcpOwo+PiArCWNmZyB8PSBORkNf
UkJfSVJRX0VOOwo+PiArCXdyaXRlbChjZmcsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NGRyk7
Cj4+ICsKPj4gKwlyZWluaXRfY29tcGxldGlvbigmbmZjLT5jb21wbGV0aW9uKTsKPj4gKwljbWQg
PSBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgTkZDX0NNRF9DTEUgfCBOQU5EX0NNRF9TVEFUVVM7
Cj4+ICsJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4gKwo+PiAr
CS8qIHVzZSB0aGUgbWF4IGVyYXNlIHRpbWUgYXMgdGhlIG1heGltdW0gY2xvY2sgZm9yIHdhaXRp
bmcgUi9CICovCj4+ICsJY21kID0gTkZDX0NNRF9SQiB8IE5GQ19DTURfUkJfSU5UX05PX1BJTiB8
IG5mYy0+dGltaW5nLnRiZXJzX21heDsKPj4gKwl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsg
TkZDX1JFR19DTUQpOwo+PiArCj4+ICsJaWYgKCF3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQo
Jm5mYy0+Y29tcGxldGlvbiwKPj4gKwkJCQkJIG1zZWNzX3RvX2ppZmZpZXModGltZW91dF9tcykp
KQo+PiArCQlyZXR1cm4gLUVUSU1FRE9VVDsKPj4gKwo+PiArCWlmIChuZWVkX2NtZF9yZWFkMCkg
ewo+PiArCQljbWQgPSBuZmMtPnBhcmFtLmNoaXBfc2VsZWN0IHwgTkZDX0NNRF9DTEUgfCBOQU5E
X0NNRF9SRUFEMDsKPj4gKwkJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01E
KTsKPj4gKwkJbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOwo+PiArCQltZXNvbl9uZmNfd2FpdF9j
bWRfZmluaXNoKG5mYywgQ01EX0ZJRk9fRU1QVFlfVElNRU9VVCk7Cj4+ICsJfQo+IAo+IEkgZm9y
Z290IGFib3V0IHRoaXMsIHlvdSBzaG91bGQgYXZvaWQgb3BlbiBjb2RpbmcgY29yZSBoZWxwZXJz
LCBjYW4geW91Cj4gcGxlYXNlIHNlbmQgYSBmb2xsb3d1cCBwYXRjaCB0byB1c2UgbmFuZF9zdGF0
dXNfb3AoKSBhbmQKPiBuYW5kX2V4aXRfc3RhdHVzX29wKCkgPwoKQSBvaywgc286CjEpIFNlbmRp
bmcgTkFORF9DTURfU1RBVFVTIGdvZXMgdG8gbmFuZF9zdGF0dXNfb3AoKQoyKSBTZW5kaW5nIE5B
TkRfQ01EX1JFQUQwIGdvZXMgdG8gbmFuZF9leGl0X3N0YXR1c19vcCgpCgpPaywgbm8gcHJvYmxl
bSEgSSdsbCBwcmVwYXJlIGFuZCBzZW5kIGl0IG9uIHRoaXMgd2VlayEKClRoYW5rcywgQXJzZW5p
eQoKPiAKPj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IG1lc29u
X25mY193YWl0X3JiX3BpbihzdHJ1Y3QgbWVzb25fbmZjICpuZmMsIGludCB0aW1lb3V0X21zKQo+
PiAgewo+PiAgCXUzMiBjbWQsIGNmZzsKPj4gIAlpbnQgcmV0ID0gMDsKPj4gQEAgLTQyMCw2ICs0
NTcsMjcgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcXVldWVfcmIoc3RydWN0IG1lc29uX25mYyAq
bmZjLCBpbnQgdGltZW91dF9tcykKPj4gIAlyZXR1cm4gcmV0Owo+PiAgfQo+PiAgCj4+ICtzdGF0
aWMgaW50IG1lc29uX25mY19xdWV1ZV9yYihzdHJ1Y3QgbWVzb25fbmZjICpuZmMsIGludCB0aW1l
b3V0X21zLAo+PiArCQkJICAgICAgYm9vbCBuZWVkX2NtZF9yZWFkMCkKPj4gK3sKPj4gKwlpZiAo
bmZjLT5ub19yYl9waW4pIHsKPj4gKwkJLyogVGhpcyBtb2RlIGlzIHVzZWQgd2hlbiB0aGVyZSBp
cyBubyB3aXJlZCBSL0IgcGluLgo+PiArCQkgKiBJdCB3b3JrcyBsaWtlICduYW5kX3NvZnRfd2Fp
dHJkeSgpJywgYnV0IGluc3RlYWQgb2YKPj4gKwkJICogcG9sbGluZyBOQU5EX0NNRF9TVEFUVVMg
Yml0IGluIHRoZSBzb2Z0d2FyZSBsb29wLAo+PiArCQkgKiBpdCB3aWxsIHdhaXQgZm9yIGludGVy
cnVwdCAtIGNvbnRyb2xsZXJzIGNoZWNrcyBJTwo+PiArCQkgKiBidXMgYW5kIHdoZW4gaXQgZGV0
ZWN0cyBOQU5EX0NNRF9TVEFUVVMgb24gaXQsIGl0Cj4+ICsJCSAqIHJhaXNlcyBpbnRlcnJ1cHQu
IEFmdGVyIGludGVycnVwdCwgTkFORF9DTURfUkVBRDAgaXMKPj4gKwkJICogc2VudCBhcyB0ZXJt
aW5hdG9yIG9mIHRoZSByZWFkeSB3YWl0aW5nIHByb2NlZHVyZSBpZgo+PiArCQkgKiBuZWVkZWQg
KGZvciBhbGwgY2FzZXMgZXhjZXB0IHBhZ2UgcHJvZ3JhbW1pbmcgLSB0aGlzCj4+ICsJCSAqIGlz
IHJlYXNvbiBvZiAnbmVlZF9jbWRfcmVhZDAnIGZsYWcpLgo+PiArCQkgKi8KPj4gKwkJcmV0dXJu
IG1lc29uX25mY193YWl0X25vX3JiX3BpbihuZmMsIHRpbWVvdXRfbXMsCj4+ICsJCQkJCQluZWVk
X2NtZF9yZWFkMCk7Cj4+ICsJfSBlbHNlIHsKPj4gKwkJcmV0dXJuIG1lc29uX25mY193YWl0X3Ji
X3BpbihuZmMsIHRpbWVvdXRfbXMpOwo+PiArCX0KPj4gK30KPj4gKwo+PiAgc3RhdGljIHZvaWQg
bWVzb25fbmZjX3NldF91c2VyX2J5dGUoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKm9vYl9i
dWYpCj4+ICB7Cj4+ICAJc3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKm1lc29uX2NoaXAgPSB0
b19tZXNvbl9uYW5kKG5hbmQpOwo+PiBAQCAtNjIzLDcgKzY4MSw3IEBAIHN0YXRpYyBpbnQgbWVz
b25fbmZjX3J3X2NtZF9wcmVwYXJlX2FuZF9leGVjdXRlKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQs
Cj4+ICAJaWYgKGluKSB7Cj4+ICAJCW5mYy0+Y21kZmlmby5ydy5jbWQxID0gY3MgfCBORkNfQ01E
X0NMRSB8IE5BTkRfQ01EX1JFQURTVEFSVDsKPj4gIAkJd3JpdGVsKG5mYy0+Y21kZmlmby5ydy5j
bWQxLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+PiAtCQltZXNvbl9uZmNfcXVldWVf
cmIobmZjLCBQU0VDX1RPX01TRUMoc2RyLT50Ul9tYXgpKTsKPj4gKwkJbWVzb25fbmZjX3F1ZXVl
X3JiKG5mYywgUFNFQ19UT19NU0VDKHNkci0+dFJfbWF4KSwgdHJ1ZSk7Cj4+ICAJfSBlbHNlIHsK
Pj4gIAkJbWVzb25fbmZjX2NtZF9pZGxlKG5mYywgbmZjLT50aW1pbmcudGFkbCk7Cj4+ICAJfQo+
PiBAQCAtNjY5LDcgKzcyNyw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3dyaXRlX3BhZ2Vfc3Vi
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+ICAKPj4gIAljbWQgPSBuZmMtPnBhcmFtLmNoaXBf
c2VsZWN0IHwgTkZDX0NNRF9DTEUgfCBOQU5EX0NNRF9QQUdFUFJPRzsKPj4gIAl3cml0ZWwoY21k
LCBuZmMtPnJlZ19iYXNlICsgTkZDX1JFR19DTUQpOwo+PiAtCW1lc29uX25mY19xdWV1ZV9yYihu
ZmMsIFBTRUNfVE9fTVNFQyhzZHItPnRQUk9HX21heCkpOwo+PiArCW1lc29uX25mY19xdWV1ZV9y
YihuZmMsIFBTRUNfVE9fTVNFQyhzZHItPnRQUk9HX21heCksIGZhbHNlKTsKPj4gIAo+PiAgCW1l
c29uX25mY19kbWFfYnVmZmVyX3JlbGVhc2UobmFuZCwgZGF0YV9sZW4sIGluZm9fbGVuLCBETUFf
VE9fREVWSUNFKTsKPj4gIAo+PiBAQCAtOTUyLDcgKzEwMTAsOCBAQCBzdGF0aWMgaW50IG1lc29u
X25mY19leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+ICAJCQlicmVhazsKPj4gIAo+
PiAgCQljYXNlIE5BTkRfT1BfV0FJVFJEWV9JTlNUUjoKPj4gLQkJCW1lc29uX25mY19xdWV1ZV9y
YihuZmMsIGluc3RyLT5jdHgud2FpdHJkeS50aW1lb3V0X21zKTsKPj4gKwkJCW1lc29uX25mY19x
dWV1ZV9yYihuZmMsIGluc3RyLT5jdHgud2FpdHJkeS50aW1lb3V0X21zLAo+PiArCQkJCQkgICB0
cnVlKTsKPj4gIAkJCWlmIChpbnN0ci0+ZGVsYXlfbnMpCj4+ICAJCQkJbWVzb25fbmZjX2NtZF9p
ZGxlKG5mYywgZGVsYXlfaWRsZSk7Cj4+ICAJCQlicmVhazsKPj4gQEAgLTEyNDgsNiArMTMwNyw3
IEBAIG1lc29uX25mY19uYW5kX2NoaXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICAJc3Ry
dWN0IG10ZF9pbmZvICptdGQ7Cj4+ICAJaW50IHJldCwgaTsKPj4gIAl1MzIgdG1wLCBuc2VsczsK
Pj4gKwl1MzIgbmFuZF9yYl92YWwgPSAwOwo+PiAgCj4+ICAJbnNlbHMgPSBvZl9wcm9wZXJ0eV9j
b3VudF9lbGVtc19vZl9zaXplKG5wLCAicmVnIiwgc2l6ZW9mKHUzMikpOwo+PiAgCWlmICghbnNl
bHMgfHwgbnNlbHMgPiBNQVhfQ0VfTlVNKSB7Cj4+IEBAIC0xMjg3LDYgKzEzNDcsMTUgQEAgbWVz
b25fbmZjX25hbmRfY2hpcF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gIAltdGQtPm93bmVy
ID0gVEhJU19NT0RVTEU7Cj4+ICAJbXRkLT5kZXYucGFyZW50ID0gZGV2Owo+PiAgCj4+ICsJcmV0
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJuYW5kLXJiIiwgJm5hbmRfcmJfdmFsKTsKPj4g
KwlpZiAocmV0ID09IC1FSU5WQUwpCj4+ICsJCW5mYy0+bm9fcmJfcGluID0gdHJ1ZTsKPj4gKwll
bHNlIGlmIChyZXQpCj4+ICsJCXJldHVybiByZXQ7Cj4+ICsKPj4gKwlpZiAobmFuZF9yYl92YWwp
Cj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCj4+ICAJcmV0ID0gbmFuZF9zY2FuKG5hbmQsIG5z
ZWxzKTsKPj4gIAlpZiAocmV0KQo+PiAgCQlyZXR1cm4gcmV0Owo+IAo+IAo+IFRoYW5rcywKPiBN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
