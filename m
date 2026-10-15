Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E27CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTP5XHEkFyrqHrEwCENsNxAPkoc7imbmOLf2qx0HtfA=; b=p2WsqN/W1PtvgvdmGuyte2d+19
	UxXq4JwyQUzOIYX0dEQG4/FIo0S8Pjgw8AqoFal9WZEtXcEykLXdzdfx7nyO/k7jOuQUi+R9UUe2s
	+Nio0pUvIpbuBlvqY9cWs3fCcew/QlpM4XM8sXsPrzRTkNpIVBDhcHx6/UTXMg33uo/o7xgYKvwN7
	iNg3n+QVq4ekCLoeIZceaP5nXMiXi7r8jqdSrCfVEdEyogcaszcGmyXfi5361SWfXxhmKcZKnB4+e
	gBzDSFIGud3E0xRpUB+8O2TL871OtVI+q3Ku5wm9Jv3jB9OP17S1lerHHFpvnpalW85maNLDVRGYa
	jHiy+2Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHns-0000000HGxp-3g99;
	Thu, 15 Oct 2026 09:31:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHnr-0000000HGws-1rM9
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 09:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iRaXeKhUNjHXGpTHHMq9qJh0jfK4pRDZnGKPUhbBq/w=; b=V+DN8sLZbB8RXJYhviyELyrrtC
	LptWOBkohcP4Zot60y8ZFllEyMX7OGDmPoaYlHBlsYwrBeWe0TuxegjXG0OHHf0dbV2dEwjvhPDAw
	v1k0LMfxm3ucznWIGWr7SorFaEiRlPip2tJwhDB0ZBlz1sGdMJmxXdiVK0ZwFv5ymu2BYDxGU2lBT
	7oFqJZjvZm3Jwh45YwEhq9gckt8tNwH11XvEI9rl4lIkJICbBz7AwCZpTQSUex+7zC1iIOPVEiiV6
	rERNiIq0OwkAy63cEvHIXHg5wNAPwP0Yh54I9jazDlivDcvLtq03VWNN1NWLByiGRmvkAl5SDV8Pm
	NXYGYqGg==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHHne-00000000Atl-14hl
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 09:31:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iRaXeKhUNjHXGpTHHMq9qJh0jfK4pRDZnGKPUhbBq/w=;
	b=Yzj0lm5DlwcUf1WeGfqGOu/OHAt4yjNR1H9xjxXI3DtulLV9fAp76rw8QynbmLRgXWh95Sz7w
	Q2bO8cJFOEGH8WjSALlk3zeJGxoFgqButvjALLzF+pHIlcqDNdQrNicD8W7r77kFeVDhONVtqiA
	bNzZdJOEvpPE/YW+GyLcB80=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4j52ZY4h8dz1cyPY;
	Thu, 15 Oct 2026 17:19:17 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 980BE40572;
	Thu, 15 Oct 2026 17:30:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 15 Oct 2026 17:30:31 +0800
Subject: Re: [PATCH 1/2] mtd: ubi: block: forbid direct reclaim I/O during
 synchronous read
To: Yelin Fei <yelinfei66@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
 <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7fa1fa75-df70-a721-3403-53ec43162aca@huawei.com>
Date: Thu, 15 Oct 2026 17:30:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_103101_759731_692B9F66 
X-CRM114-Status: GOOD (  27.05  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi8xMC8xNSAxNTozMywgWWVsaW4gRmVpINC0tcA6Cj4gRnJvbTogWWUgTGluZmVpIDx5
ZWxpbmZlaUBydWlqaWUuY29tLmNuPgo+IAo+IHViaWJsb2NrIGltcGxlbWVudHMgLT5xdWV1ZV9y
cSgpIHN5bmNocm9ub3VzbHk6IHRoZSB0YXNrIHN1Ym1pdHRpbmcgdGhlCj4gYmlvIGV4ZWN1dGVz
IHRoZSB3aG9sZSBVQkkvTVREIHJlYWQgaXRzZWxmLCBmcm9tIGluc2lkZSB0aGUgYmxvY2sgbGF5
ZXIKPiBzdWJtaXNzaW9uIGxvb3AgKGN1cnJlbnQtPmJpb19saXN0IGlzIG5vbi1lbXB0eSkgYW5k
IHdoaWxlIGhvbGRpbmcgdGhlCj4gdGFnX3NldCBTUkNVIHJlYWQgbG9jayAoYmxrX21xX3J1bl9k
aXNwYXRjaF9vcHMoKSwgdGFrZW4gZm9yCj4gQkxLX01RX0ZfQkxPQ0tJTkcgZHJpdmVycykuCj4g
Cj4gQW4gYWxsb2NhdGlvbiBpbiB0aGF0IGNvbnRleHQgbWF5IHRyaWdnZXIgZGlyZWN0IHJlY2xh
aW0sIHdoaWNoIHdpdGgKPiBHRlBfTk9GUyAtIHVzZWQgYnkgYWxsIFVCSSBhbGxvY2F0aW9ucyAt
IG1heSBzeW5jaHJvbm91c2x5IHdyaXRlIGRpcnR5Cj4gcGFnZXMgdG8gc3dhcC4gIE9uIHN5c3Rl
bXMgd2hlcmUgc3dhcCBpcyBiYWNrZWQgYnkgYSBkZXZpY2Ugd2l0aAo+IEJMS19GRUFUX1NZTkNI
Uk9OT1VTICh6cmFtKSwgdGhhdCBlbmRzIGluIHN3YXBfd3JpdGVwYWdlX2JkZXZfc3luYygpCj4g
LT4gc3VibWl0X2Jpb193YWl0KCkuICBUaGUgc3dhcCBiaW8gaXMgb25seSBxdWV1ZWQgb250bwo+
IGN1cnJlbnQtPmJpb19saXN0LCBuZXZlciBkaXNwYXRjaGVkOiBwZXIgc3VibWl0X2Jpb19ub2Fj
Y3Rfbm9jaGVjaygpLAo+IGJpb3Mgc3VibWl0dGVkIHdoaWxlIGEgc3VibWlzc2lvbiBsb29wIGlz
IGFjdGl2ZSBhcmUgb25seSBjb2xsZWN0ZWQgb24KPiBjdXJyZW50LT5iaW9fbGlzdCwgYW5kIHRo
ZWlyIHNvbGUgZGlzcGF0Y2hlciBpcyB0aGUgdGFzayBjdXJyZW50bHkKPiBleGVjdXRpbmcgLT5x
dWV1ZV9ycSgpIC0gd2hpY2ggaXMgbm93IHNsZWVwaW5nIHdhaXRpbmcgZm9yIHRoZSB2ZXJ5Cj4g
c2FtZSBiaW8ncyBjb21wbGV0aW9uLiAgVGhlIHRhc2sgaGFuZ3MgZm9yZXZlciwgdGhlIHBlbmRp
bmcgU1JDVSByZWFkCj4gbG9jayBmcmVlemVzIGdyYWNlIHBlcmlvZHMgKGJsa19tcV90aW1lb3V0
X3dvcmsoKSAtPiBzeW5jaHJvbml6ZV9zcmN1KCkKPiBuZXZlciByZXR1cm5zKSwgYW5kIHRoZSB1
bmZpbmlzaGVkIHJlcXVlc3QgYmxvY2tzIGFsbCBvdGhlciBJL08gdG8gdGhlCj4gZGV2aWNlLgo+
IAo+IFRoaXMgd2FzIG9ic2VydmVkIGluIHRoZSBmaWVsZCBvbiBhIDEgR2lCIFJJU0MtViBuZXR3
b3JraW5nIHByb2R1Y3QKPiBydW5uaW5nIHNxdWFzaGZzLW9uLXViaWJsb2NrIHdpdGggenJhbSBz
d2FwOiA0NyB0YXNrcyBzdHVjayBpbiBkaXNrCj4gc2xlZXAgZm9yIDYwMCsgc2Vjb25kcywgZW5k
aW5nIGluIGEgaHVuZyB0YXNrIHBhbmljLiAgVGhlIGFsbG9jYXRvcgo+IG5ldmVyIHJlYWNoZWQg
dGhlIE9PTSBkZWNpc2lvbiBwb2ludCwgYmVjYXVzZSB0aGUgdGFzayBkaWVkIGluc2lkZQo+IHRy
eV90b19mcmVlX3BhZ2VzKCkuCj4gCj4gTWFyayB0aGUgd2hvbGUgcmVhZCB3aXRoIG1lbWFsbG9j
X25vaW9fc2F2ZSgpL21lbWFsbG9jX25vaW9fcmVzdG9yZSgpCj4gc28gZGlyZWN0IHJlY2xhaW0g
bmV2ZXIgaXNzdWVzIGJsb2NrIEkvTyB3aGlsZSB0aGlzIGRyaXZlciBleGVjdXRlczoKPiByZWNs
YWltIGlzIHJlc3RyaWN0ZWQgdG8gZHJvcHBpbmcgY2xlYW4gcGFnZSBjYWNoZSBhbmQgc2hyaW5r
aW5nIHNsYWJzLAo+IHBhZ2UgKHN3YXApIHJlY2xhaW0gaXMgcGVyZm9ybWVkIGFzeW5jaHJvbm91
c2x5IGJ5IGtzd2FwZCwgYW5kIHRoZQo+IHdvcnN0IGNhc2UgaXMgLUVOT01FTSwgd2hpY2ggcHJv
cGFnYXRlcyB0byB0aGUgY2FsbGVyIGFzIGFuIG9yZGluYXJ5Cj4gcmVjb3ZlcmFibGUgSS9PIGVy
cm9yIC0gYSByZWNvdmVyYWJsZSByZWFkIGZhaWx1cmUgaW5zdGVhZCBvZiBhIHRvdGFsCj4gc3lz
dGVtIGhhbmcuCj4gCj4gVGhpcyBjb3ZlcnMgZXZlcnkgYWxsb2NhdGlvbiBwZXJmb3JtZWQgYmVs
b3cgdWJpX3JlYWRfc2coKSwgaW5jbHVkaW5nCj4gbG9jay10cmVlIGVudHJpZXMsIFZJRCBidWZm
ZXJzIGFuZCBJL08gaGVscGVycywgcmVnYXJkbGVzcyBvZiB0aGUgZ2ZwCj4gZmxhZ3MgdGhleSB1
c2UgaW50ZXJuYWxseS4KPiAKPiBGaXhlczogOWQ1NGM4YTMzZWVjICgiVUJJOiBSL08gYmxvY2sg
ZHJpdmVyIG9uIHRvcCBvZiBVQkkgdm9sdW1lcyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBZZSBMaW5mZWkgPHllbGluZmVpQHJ1aWppZS5jb20uY24+Cj4g
LS0tCj4gICBkcml2ZXJzL210ZC91YmkvYmxvY2suYyB8IDE1ICsrKysrKysrKysrKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCkxvb2tzIGxpa2Ugb3RoZXIgYmxvY2sg
ZHJpdmVycyhlZy4gbnZtZS9uYmQvcmJkLi4pICB3b24ndCB0cmlnZ2VyIGRpcmVjdCAKbWVtIHJl
Y2xhaW0gYnkgdXNpbmcgZmxhZ3MgCkdGUF9BVE9NSUMobnZtZV9wY2lfc2V0dXBfbWV0YV9pdGVy
KS9HRlBfTk9JTyhuYmQgCnNvY2tfeG1pdCkvR0ZQX05PV0FJVChsb29wKS4KClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gaW5k
ZXggMjljMGQ2OTQxYTgxLi5jOWQ0MjE4MWJmNjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
dWJpL2Jsb2NrLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+IEBAIC0zOCw2ICsz
OCw3IEBACj4gICAjaW5jbHVkZSA8bGludXgvYmxrZGV2Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgv
YmxrLW1xLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaGRyZWcuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L3NjaGVkL21tLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvc2NhdHRlcmxpc3QuaD4KPiAgICNpbmNs
dWRlIDxsaW51eC9pZHIuaD4KPiAgICNpbmNsdWRlIDxhc20vZGl2NjQuaD4KPiBAQCAtMTg5LDYg
KzE5MCw3IEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgdWJpYmxvY2tfcmVhZChzdHJ1Y3QgcmVxdWVz
dCAqcmVxKQo+ICAgCWludCBsZWIgPSBwb3M7Cj4gICAJc3RydWN0IHJlcV9pdGVyYXRvciBpdGVy
Owo+ICAgCXN0cnVjdCBiaW9fdmVjIGJ2ZWM7Cj4gKwl1bnNpZ25lZCBpbnQgbm9pb19mbGFnczsK
PiAgIAlpbnQgcmV0Owo+ICAgCj4gICAJYmxrX21xX3N0YXJ0X3JlcXVlc3QocmVxKTsKPiBAQCAt
MjAxLDYgKzIwMywxOCBAQCBzdGF0aWMgYmxrX3N0YXR1c190IHViaWJsb2NrX3JlYWQoc3RydWN0
IHJlcXVlc3QgKnJlcSkKPiAgIAl1Ymlfc2dsX2luaXQoJnBkdS0+dXNnbCk7Cj4gICAJYmxrX3Jx
X21hcF9zZyhyZXEsIHBkdS0+dXNnbC5zZyk7Cj4gICAKPiArCS8qCj4gKwkgKiBUaGlzIGVudGly
ZSBjYWxsYmFjayBydW5zIGluIHRoZSBzeW5jaHJvbm91cyBkaXNwYXRjaCBwYXRoIG9mCj4gKwkg
KiBibGstbXE6IHN1Ym1pdF9iaW9fbm9hY2N0X25vY2hlY2soKSBvbmx5IHF1ZXVlcyBhIGJpbyBz
dWJtaXR0ZWQKPiArCSAqIGZyb20gaGVyZSBvbnRvIGN1cnJlbnQtPmJpb19saXN0LCBhbmQgdGhl
IHNvbGUgZGlzcGF0Y2hlciBvZgo+ICsJICogdGhhdCBsaXN0IGlzIHRoaXMgdmVyeSB0YXNrLCBi
dXN5IGluc2lkZSAtPnF1ZXVlX3JxKCkuICBBbnkKPiArCSAqIGJsb2NrIEkvTyBpc3N1ZWQgZnJv
bSBiZWxvdyB3b3VsZCB0aGVyZWZvcmUgZGVhZGxvY2sgYWdhaW5zdAo+ICsJICogaXRzZWxmIChl
LmcuIHN5bmNocm9ub3VzIHN3YXAgd3JpdGViYWNrIHJlYWNoZWQgdmlhIGRpcmVjdAo+ICsJICog
cmVjbGFpbSkuICBGb3JiaWQgaXQgZm9yIHRoZSB3aG9sZSByZWFkIGluc3RlYWQgb2YgcmVseWlu
ZyBvbgo+ICsJICogZXZlcnkgY2FsbGVlIHVzaW5nIHNhZmUgYWxsb2NhdGlvbiBmbGFncy4KPiAr
CSAqLwo+ICsJbm9pb19mbGFncyA9IG1lbWFsbG9jX25vaW9fc2F2ZSgpOwo+ICsKPiAgIAl3aGls
ZSAoYnl0ZXNfbGVmdCkgewo+ICAgCQkvKgo+ICAgCQkgKiBXZSBjYW4gb25seSByZWFkIG9uZSBM
RUIgYXQgYSB0aW1lLiBUaGVyZWZvcmUgaWYgdGhlIHJlYWQKPiBAQCAtMjIxLDYgKzIzNSw3IEBA
IHN0YXRpYyBibGtfc3RhdHVzX3QgdWJpYmxvY2tfcmVhZChzdHJ1Y3QgcmVxdWVzdCAqcmVxKQo+
ICAgCj4gICAJcnFfZm9yX2VhY2hfc2VnbWVudChidmVjLCByZXEsIGl0ZXIpCj4gICAJCWZsdXNo
X2RjYWNoZV9wYWdlKGJ2ZWMuYnZfcGFnZSk7Cj4gKwltZW1hbGxvY19ub2lvX3Jlc3RvcmUobm9p
b19mbGFncyk7Cj4gICAKPiAgIAlibGtfbXFfZW5kX3JlcXVlc3QocmVxLCBlcnJub190b19ibGtf
c3RhdHVzKHJldCkpOwo+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
