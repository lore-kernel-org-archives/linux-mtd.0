Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B51E94625
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 02:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEYiu7VdEiYOdioZZyLiy15xTHIgCXVP1kDIadrZvXc=; b=W33QGlP9sh+4j3kEAV9b+o6GEc
	XNn6FUBAIFDQ3DskjVbppso2GYZkdLscBar02FjVzYUxVwLvrs+6vzm/uGc66NJslruCBx0dqSiBv
	IaFVTO3jZhCWlQrHF64dRH9TWBYpllguX9Wjrl9qN22x5liz0rOLwgURxnaxFlvDFIfYuCtpr20m0
	jm4B3rLbzcMSxwr88mlfbJqKuRg8pbawosaQYP4KMUoAdQeh797gR5znN0+3uGNlLlecBNYURGcwm
	WnjqWsfQhGz5qDcreQ553Dc762SVqTBZ4/PgRs5nSUw1gTCpXxicczrZn6dObP8XNIbb0+VRayVqK
	pc4QiG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpded-0000000GL43-1kNV;
	Tue, 10 Feb 2026 02:39:07 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdea-0000000GL3V-0mB8
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 02:39:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=O4jDuR2fNAQ4csxqN5S9ZSHHRI67rXEyorkyut5yGG8=;
	b=Wfs+D22YGqg6HL18EPw33ALwI2OHwBvi5Jk1j+6YmL5YESvmJDQh1QRDDtxy3av7snLquNJbb
	+aaiwCl/NcgwKAnwUnHqSJuKHkhTr5fOyMdg/CG52CKfOlauQjH5fVg3rrEYwcskmdp8FTGkuOa
	yUKwsztpzaAdiW6IRuT87HA=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f95JB0y1dznTVj;
	Tue, 10 Feb 2026 10:35:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A40E40565;
	Tue, 10 Feb 2026 10:38:52 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Feb 2026 10:38:52 +0800
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
To: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
 <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
Date: Tue, 10 Feb 2026 10:38:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_183904_890383_C41E926A 
X-CRM114-Status: GOOD (  24.89  )
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

1NogMjAyNi8yLzkgMjM6NDUsIFRvbWFzIEFsdmFyZXogVmFub2xpINC0tcA6Cj4+Pgo+Pj4gSnVz
dCBhcyBhIHN1bW1hcnkgb2YgdGhlIHdob2xlIHRoaW5nOgo+Pj4KPj4+IC0gSGFwcGVucyBvbmx5
IHdoZW4gd2UgaW50cm9kdWNlIDYuMTIuNTcga2VybmVsIGludG8gb3VyIHRlc3Rpbmcgc3lzdGVt
Lgo+Pj4KPj4+IC0gVGhlIGJvYXJkcyBnbyBmcm9tIHJ1bm5pbmcgNi4xMi41NywgdG8gNC4xNC4y
MCwgdG8gNi4xLjc1IGZvcgo+Pj4gdGVzdGluZyBvbGQgcmVsZWFzZS4gV2hlbiB0aGUgNi4xLjc1
IHRyaWVzIHRvIGFjY2VzcyBmaWxlcyBpbiB0aGUgY2ZnCj4+PiB2b2x1bWUsIHRoZXJlIHdlIHNl
ZSB0aGUgZXJyb3IuCj4+IFRoZSBzYW1lIHViaWZzIGltYWdlIGlzIGxvYWRlZCBieSA2LjEyLjU3
LCA0LjE0LjIwIGFuZCA2LjEuNzU/IEFuZCB0aGUgdWJpCj4+IHZvbHVtZSB3b24ndCBiZSBmb3Jt
YXR0ZWQgYWZ0ZXIgc3dpdGNoaW5nIGtlcm5lbD8KPiAKPiBZZXMsIHRoZSBzYW1lIHViaWZzIGlt
YWdlIGlzIHNoYXJlZCBieSB0aGUga2VybmVscy9hcHBsaWNhdGlvbnMuCj4gCj4+IElmIEkgdW5k
ZXJzdGFuZCByaWdodCwgZG8geW91IGJhY2twb3J0IHViaWZzIGJ1Z2ZpeCBwYXRjaGVzIHRvIDQu
MTQ/Cj4gCj4gTm8gd2UgZG9uJ3QuIFRoZSBhcHBsaWNhdGlvbiB0aGF0IHVzZXMgNC4xNC4yMCBp
cyB0aGUgcmVhZC1vbmx5IGZhY3RvcnkgaW1hZ2UsCj4gd2hpY2ggaXMgbm90IHVwZGF0ZWQgbm9y
bWFsbHkuIEl0IG1vdW50cyB0aGUgdWJpIHZvbHVtZSBidXQgaXQgb25seSByZWFkcyBhIGZpbGUK
PiBmcm9tIGl0LCB3b24ndCBkbyBtdWNoIHRvIGl0LiBUaGlzIG9uZSBpbiBwYXJ0aWN1bGFyIHdh
cyBjb21waWxlZCBpbiAyMDE4IGZvcgo+IGV4YW1wbGUsIHNvIGl0IGRvZXMgbm90IGluY2x1ZGUg
dGhvc2UgY29tbWl0cy4KCklzIHRoZSB1YmlmcyBtb3VudGVkIGluIHJlYWRvbmx5IG1vZGUgaW4g
NC4xND8KSWYgbm90LCB0aGUgZG9fa2lsbF9vcnBoYW4gcHJvY2VzcyB3aWxsIGJlIGNvbW1pdHRl
ZCBvbiBmbGFzaC4KPiAKPj4gRm9sbG93aW5nIGNvbW1pdHMgY291bGQgY29ycnVwdCB0aGUgdWJp
ZnMgaW1hZ2UsIHdoaWNoIG1heSBsZWFkIHRvIHRoZQo+PiBwcm9ibGVtOgo+PiAxLiBlZTE0Mzhj
ZTVkYzRkNjdkZDhkZDFmZjUxNTgzMTIyYTYxZjViZDllIHViaWZzOiBDaGVjayBsaW5rIGNvdW50
IG9mIGlub2Rlcwo+PiB3aGVuIGtpbGxpbmcgb3JwaGFucy4KPj4gMi4gNGFiMjVhYzhiMmI1NTE0
MTUxZDVmOTFjZjk1MTRkZjA4ZGQyNjkzOCB1YmlmczogRml4Cj4+IHViaWZzX3RuY19sb29rdXAo
KSB1c2FnZSBpbiBkb19raWxsX29ycGhhbnMoKQo+Pgo+PiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
YXBwbHkgZml4IHBhdGNoZXMgdGhyb3VnaCA0LjE0fkhFQUQuCj4+IChnaXQgbG9nIHY0LjE0Li5I
RUFEIGZzL3ViaWZzLykKPiAKPiBCeSB0aGlzIHlvdSBtZWFuIHRoYXQgdGhlc2UgcGF0Y2hlcyBj
YW4gbGVhZCB0byBjb3JydXB0aW9uIHdoZW4gc3dpdGNoaW5nIHRvIGEKPiB2ZXJzaW9uIG9mIHRo
ZSBrZXJuZWwgdGhhdCBkb2VzIG5vdCBoYXZlIHRoZW0/IElmIHRoYXQgaXMgd2hhdCB5b3UgbWVh
biwgSSBkb24ndAo+IHRoaW5rIGl0IGlzIHRoZSBjYXNlIGJlY2F1c2Ugd2UgaGF2ZSBiZWVuIHJ1
bm5pbmcgNi4xIHdpdGggdGhlc2UgcGF0Y2hlcyBmb3IKPiBtb3JlIHRoYW4gYSB5ZWFyIGFuZCBu
ZXZlciBzZWVuIHRoZSBpc3N1ZSwgaG93ZXZlciBpdCBhcHBlYXJzIHdpdGhpbiBob3VycyBvZgo+
IGludHJvZHVjaW5nIDYuMTIgaW50byB0aGUgbWl4Lgo+IAo+IFNvbWVob3cgdGhlcmUgaXMgc29t
ZSBkaWZmZXJlbmNlIGluIGJldHdlZW4gNi4xMiBhbmQgNi4xIHRoYXQgbWFrZXMgdGhpcyBlcnJv
cgo+IGhhcHBlbiwgYnV0IGl0IGNvdWxkIHBvdGVudGlhbGx5IGhhdmUgdG8gZG8gYWxzbyB3aXRo
IGp1bXBpbmcgZnJvbSA2LjEyIHRvIDQuMTQsCj4gZXZlbiB0aG91Z2gganVtcGluZyBmcm9tIDYu
MSB0byA0LjE0IGhhcyBub3QgY2F1c2VkIHRoZSBwcm9ibGVtIGZvciB0aGUgcGFzdCAxKwo+IHll
YXIuClRoZSBjb21taXQgM2FmMmQzYThjNTZmZTdkYzI0ZjYwYzRkZjBhYjg1YjdhYzk0MTkwMigi
dWJpZnM6IEZpeCAKdW5hdHRhY2hlZCBpbm9kZSB3aGVuIHBvd2VyY3V0IGhhcHBlbnMgaW4gY3Jl
YXRpbmciKSBbdjYuMTFdIGlzIAppbnRyb2R1Y2VkIGJldHdlZW4gNi4xIGFuZCA2LjEyLCB3aGlj
aCB3aWxsIGFkZCBldmVyeSBpbm9kZSBpbnRvIG9ycGhhbiAKYXJlYSBhdCB0aGUgYmVnaW5pbmcg
b2YgY3JlYXRpb24uCgpTbywgeW91IG1heSB0cnkgb3B0aW9uICAxIG9yIDIgYW5kIGNoZWNrIHdo
ZXRoZXIgdGhlIHByb2JsZW0gY291bGQgaGFwcGVuOgoxLiBtb3VudCA0LjE0IHJlYWRvbmx5CjIu
IGJhY2twb3J0IGZpeCBwYXRjaGVzIG9uIDQuMTQKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gVG9tYXMK
PiAKPiAKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
