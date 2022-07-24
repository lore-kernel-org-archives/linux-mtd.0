Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207B8C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 01:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkDGItDG9F+Gvcx1jF8TTtf7fl132YAwVaRnGgXMZHU=; b=J6cOIqC3DX8Auf1aw+qFOXTtsD
	lGbuQ5kJZgU7N0nQ0pYmTGOeaGMYq2hAcqOywJ53jSJkI8SCD9RVTJ8Uh4UM5amxdrhgnSb6OVH1G
	3AO48JmLQevWTOLd/c1r4ucL/APz3814VrMZp9EvPJUZS2Xw5KV2GQ7tqAJcgrBKciJAZdDucYGUG
	aVZgko3fnmWV25coe+gHxbu4Irt68XDwhO1qhZ6qFfLlhqBggJyMgOgwEP67RsoYVhpfe8y1gNIS0
	YBPJk0VYFXasF7FMoWNpRSOByP0IH/9v6Xxsp4rnTu8p/FDlBoMXHx4b9nFa/e3URhJ9RWHcROJN8
	qEKnZFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQK0-009MRZ-Nu; Sun, 24 Jul 2022 01:22:16 +0000
Received: from out28-97.mail.aliyun.com ([115.124.28.97])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQJx-009MLz-Dg
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 01:22:15 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08158591|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0251032-0.00206122-0.972836;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.Oc.Ojt._1658625725;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Oc.Ojt._1658625725)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 09:22:07 +0800
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com, tmn505@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
 <c522ee04-4183-c2ff-8c35-ce2bbbc1bc95@wanadoo.fr>
From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <9ca88fec-12c5-4fc8-80b7-9a94af3af89f@wanyeetech.com>
Date: Sun, 24 Jul 2022 09:22:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c522ee04-4183-c2ff-8c35-ce2bbbc1bc95@wanadoo.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_182213_657899_5E80968C 
X-CRM114-Status: GOOD (  14.63  )
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

SGkgQ2hyaXN0b3BoZSwKCk9uIDIwMjIvNy8yMyDkuIvljYgxMToxNSwgQ2hyaXN0b3BoZSBKQUlM
TEVUIHdyb3RlOgo+IExlIDIyLzA3LzIwMjIgw6AgMTg6NDgsIOWRqOeQsOadsCAoWmhvdSBZYW5q
aWUpIGEgw6ljcml0wqA6Cj4+IEFkZCBTRkMgc3VwcG9ydCBmb3IgdGhlIFgxMDAwIFNvQywgdGhl
IFgxNjAwIFNvQywgYW5kIHRoZSBYMjAwMCBTb0MKPj4gZnJvbSBJbmdlbmljLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiDlkajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNo
LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvc3BpL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA5ICsKPj4gwqAgZHJpdmVycy9zcGkvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvc3BpL3NwaS1pbmdlbmljLXNmYy5jIHwgNjYyIAo+PiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgMyBmaWxlcyBj
aGFuZ2VkLCA2NzIgaW5zZXJ0aW9ucygrKQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9zcGkvc3BpLWluZ2VuaWMtc2ZjLmMKPj4KPgo+IFsuLi5dCj4KPj4gK3N0YXRpYyBpbnQgaW5n
ZW5pY19zZmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gK3sKPj4gK8Kg
wqDCoCBzdHJ1Y3QgaW5nZW5pY19zZmMgKnNmYzsKPj4gK8KgwqDCoCBzdHJ1Y3Qgc3BpX2NvbnRy
b2xsZXIgKmN0bHI7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIGN0bHIgPSBz
cGlfYWxsb2NfbWFzdGVyKCZwZGV2LT5kZXYsIHNpemVvZigqc2ZjKSk7Cj4+ICvCoMKgwqAgaWYg
KCFjdGxyKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4KPiBkZXZtX3NwaV9h
bGxvY19tYXN0ZXIoKT8gKCsgZXJyb3IgaGFuZGxpbmcgc2ltcGxpZmljYXRpb24pCj4gT3IgdGhl
cmUgc2hvdWxkIGJlIGEgLnJlbW92ZSgpIGZ1bmN0aW9uLgo+CgpTdXJlLCB3aWxsIGRvIGluIHRo
ZSBuZXh0IHZlcnNpb24uCgoKVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMhCgoKPiBDSgo+Cj4+ICsK
Pj4gK8KgwqDCoCBzZmMgPSBzcGlfY29udHJvbGxlcl9nZXRfZGV2ZGF0YShjdGxyKTsKPj4gKwo+
PiArwqDCoMKgIHNmYy0+c29jX2luZm8gPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYt
PmRldik7Cj4+ICvCoMKgwqAgaWYgKCFzZmMtPnNvY19pbmZvKSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBkZXZfZXJyKCZwZGV2LT5kZXYsICJObyBvZiBtYXRjaCBkYXRhIHByb3ZpZGVkXG4iKTsKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FTk9ERVY7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cl9wdXRfbWFzdGVyOwo+PiArwqDCoMKgIH0KPj4gKwo+Cj4gWy4uLl0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
