Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E62EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 May 2022 03:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNEM2BhhG7CzPWtRx8RndU5A60Mj5kfpjtNGyOi0BA4=; b=vYXWtV0ILVQybCN/WL5jsVnVwX
	hcd9x+1fiXQjQTPPfa1K7NsARBUX7vInCoERtvM+DEPVfOM10Ut6C2mHyJCH0rA1olO3vBvYyKVFZ
	FMhmFAaLWhBXvfQUt48PHBjtyt7pnqk8O6/zAmgsbV3rfq1Mo4W17d4nNdKsE/PjQ4B2xQojDLW4V
	rIhO2wEeCQVqqzy70PQEvIpKc/wmFvGPCcTQScnI1dchPhJLnLWAbaOQQWuB23k6t4Wk4YLCKoTbk
	xf+TPhUiPv4qiUSb4iqkLePAnazUHk7cCXnur2Etu4a6wtl0bw19SMDf9tlaUCEbEj3nv9JKhNZIP
	8LXEszdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrtOj-00AJX7-HH; Fri, 20 May 2022 03:33:53 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrtOg-00AJUf-6K
 for linux-mtd@lists.infradead.org; Fri, 20 May 2022 03:33:51 +0000
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L4C2p1CNGz1JC7d;
 Fri, 20 May 2022 11:32:18 +0800 (CST)
Received: from [10.174.176.254] (10.174.176.254) by
 kwepemi500023.china.huawei.com (7.221.188.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 20 May 2022 11:33:41 +0800
Subject: Re: [PATCH] mtd: rawnand: fix drivers probe/remove methods
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <christophe.jaillet@wanadoo.fr>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <liwei391@huawei.com>
References: <20220517060753.26710-1-wupeng58@huawei.com>
 <20220519172507.4d9872c3@xps-13>
From: "wupeng (D)" <wupeng58@huawei.com>
Message-ID: <4baeaf4f-0db6-a1cf-23e3-ed7ce521249b@huawei.com>
Date: Fri, 20 May 2022 11:33:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0
MIME-Version: 1.0
In-Reply-To: <20220519172507.4d9872c3@xps-13>
Content-Language: en-US
X-Originating-IP: [10.174.176.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_203350_417628_1C92F41C 
X-CRM114-Status: GOOD (  15.51  )
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

T24gMjAyMi81LzE5IDIzOjI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpLAo+IAo+IHd1cGVu
ZzU4QGh1YXdlaS5jb20gd3JvdGUgb24gVHVlLCAxNyBNYXkgMjAyMiAwNjowNzo1MyArMDAwMDoK
PiAKPj4gRHJpdmVyIHNob3VsZCBjYWxsIHBjaV9kaXNhYmxlX2RldmljZSgpIGlmIGl0IHJldHVy
bnMgZnJvbQo+PiBjYWZlX25hbmRfcHJvYmUoKSB3aXRoIGVycm9yLgo+Pgo+PiBNZWFud2hpbGUs
IHRoZSBkcml2ZXIgY2FsbHMgcGNpX2VuYWJsZV9kZXZpY2UoKSBpbgo+PiBjYWZlX25hbmRfcHJv
YmUoKSwgYnV0IG5ldmVyIGNhbGxzIHBjaV9kaXNhYmxlX2RldmljZSgpCj4+IGR1cmluZyByZW1v
dmFsLgo+IAo+IFBsZWFzZSBmaXggdGhlIHN1YmplY3QgcHJlZml4LCBpdCBzaG91bGQgYmUgIm10
ZDogcmFud25hbmQ6IGNhZmU6Igo+IAo+IEFsc28gRml4ZXMvQ2M6IHN0YWJsZSB0YWdzIG1pZ2h0
IGJlIHVzZWZ1bC4KPiAKPj4gU2lnbmVkLW9mZi1ieTogUGVuZyBXdSA8d3VwZW5nNThAaHVhd2Vp
LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgfCA5ICsr
KysrKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCj4+IGluZGV4IDlkYmYwMzE3MTZhNi4u
YWYxMTllMzc2MzUyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25h
bmQuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+PiBAQCAtNjc5
LDggKzY3OSwxMCBAQCBzdGF0aWMgaW50IGNhZmVfbmFuZF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKPj4gICAJcGNpX3NldF9tYXN0ZXIocGRldik7Cj4+ICAgCj4+ICAgCWNhZmUgPSBremFs
bG9jKHNpemVvZigqY2FmZSksIEdGUF9LRVJORUwpOwo+PiAtCWlmICghY2FmZSkKPj4gLQkJcmV0
dXJuICAtRU5PTUVNOwo+PiArCWlmICghY2FmZSkgewo+PiArCQllcnIgPSAtRU5PTUVNOwo+PiAr
CQlnb3RvIG91dF9kaXNhYmxlX2RldmljZTsKPj4gKwl9Cj4+ICAgCj4+ICAgCW10ZCA9IG5hbmRf
dG9fbXRkKCZjYWZlLT5uYW5kKTsKPj4gICAJbXRkLT5kZXYucGFyZW50ID0gJnBkZXYtPmRldjsK
Pj4gQEAgLTgwMSw2ICs4MDMsOCBAQCBzdGF0aWMgaW50IGNhZmVfbmFuZF9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwKPj4gICAJcGNpX2lvdW5tYXAocGRldiwgY2FmZS0+bW1pbyk7Cj4+ICAg
IG91dF9mcmVlX210ZDoKPj4gICAJa2ZyZWUoY2FmZSk7Cj4+ICsgb3V0X2Rpc2FibGVfZGV2aWNl
Ogo+PiArCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPj4gICAgb3V0Ogo+PiAgIAlyZXR1cm4g
ZXJyOwo+PiAgIH0KPj4gQEAgLTgyMiw2ICs4MjYsNyBAQCBzdGF0aWMgdm9pZCBjYWZlX25hbmRf
cmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+PiAgIAlwY2lfaW91bm1hcChwZGV2LCBjYWZl
LT5tbWlvKTsKPj4gICAJZG1hX2ZyZWVfY29oZXJlbnQoJmNhZmUtPnBkZXYtPmRldiwgMjExMiwg
Y2FmZS0+ZG1hYnVmLCBjYWZlLT5kbWFhZGRyKTsKPj4gICAJa2ZyZWUoY2FmZSk7Cj4+ICsJcGNp
X2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBjaV9kZXZpY2VfaWQgY2FmZV9uYW5kX3RibFtdID0gewo+IAo+IAo+IFRoYW5rcywKPiBN
aXF1w6hsCj4gLgo+IApIae+8jAogICAgVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgY29ycmVjdGlu
ZyB0aGUgcHJvYmxlbSBhbmQgSSB3aWxsIGZpeCB0aGUgdW5xdWFsaWZpZWQgc3ViamVjdCBuYW1l
LgoKVGhhbmtzLApQZW5nIFd1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
