Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D958AC6FD19
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Mar 2023 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnVFjfvgKOQ5bCpiV3TAMpafoquiNWFMAu5iOXwDENQ=; b=xEuPkFVFbTP0jE
	O78mAt0eEyZr5hPlXPMx+FEBHfO1P762ZZqoeTirLBNd9uZhUagL+D/to95id5wN7EI9zvG3vxuuV
	DKzZ3TVn51OyYWQdI63jCIJJGqYrmh83G4yntR70rYHrfzlOc/t8fdMD1Iul6VN/z1R1fKpT6IyJD
	FgccDz2BPcWJ0VUy8NScWejkd4MS5rt2BZgUzPBUDC7vXTPFHeqpuQSeoy7OLZT7xtP1eQe0w0htT
	08hvib5XpjV5EKxjkbWulPr1UZGWKvRudl56UprgUqB1Xax2io0OuZ4YYiKvo5xp7lJtdjJsR7G3U
	4C8zffd27u223spR3G/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgCH-005OBN-N1; Mon, 13 Mar 2023 11:18:33 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgC4-005O5U-7W; Mon, 13 Mar 2023 11:18:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 902CA100005;
	Mon, 13 Mar 2023 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678706295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XOFpHOYu/H34Q2s+uwCeSHHQZCRIFK+aDl1wzsSdNlQ=;
	b=mVTipQjYC4iXdBOVs4SnNxA5VDqWyafInznBZdUaXtkHWT9+6cDncJ0vUkBhL0AOpiyqqi
	TlaYW49Xx/L3SzPV/kNCaTovQ9xlvsId5XSWHzP6KlmakXsmS6NDL3SIxYYCjl97LaDwR8
	yNJ2wSsuTZm5CTLDzG3GhUzzk1EaEzL3Aj64r1ADABqxkSXDH9L2no0tkbL8pDNxKZgvNF
	mW22Xqp+R6J2TnAOfufNZw5VUQn2+pJBIB+PoG2hihV8YwRjqDU+mFhYN9zEuZq3BrktAI
	HM2Qhqfjx80wLB+pkcAdLniwvv/+oGS+d7ptC4Fb4lXaN6qUosc+gDOLYSVQig==
Date: Mon, 13 Mar 2023 12:18:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [RFC PATCH v1] mtd: rawnand: meson: invalidate cache on polling
 ECC bit
Message-ID: <20230313121808.27170d1b@xps-13>
In-Reply-To: <20f7f1f8-e8f8-b3e1-251e-27db71ab6840@sberdevices.ru>
References: <d4ef0bd6-816e-f6fa-9385-f05f775f0ae2@sberdevices.ru>
	<20f7f1f8-e8f8-b3e1-251e-27db71ab6840@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_041820_557399_01C2BB25 
X-CRM114-Status: GOOD (  24.05  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDEzIE1h
ciAyMDIzIDEwOjM2OjExICswMzAwOgoKPiBIZWxsbywKPiAKPiB3ZSByZXByb2R1Y2VkIHRoaXMg
cHJvYmxlbSBvbiBvbmUgb2Ygb3VyIGJvYXJkcy4gSXQgdHJpZ2dlcnMgdmVyeSByYXJlCj4gd2hl
biAndXNsZWVwX3JhbmdlKCknIGlzIHByZXNlbnQsIGJ1dCB3aGVuIHNsZWVwaW5nIGlzIHJlbW92
ZWQgLSBpdCBmaXJlcwo+IGFsd2F5cy4gSSBzdXBwb3NlIHByb2JsZW0gaXMgd2l0aCBjYWNoaW5n
LCBhcyAnaW5mb19idWYnIG1lbW9yeSBpcyBtYXBwZWQgYnkKPiAnZG1hX21hcF9zaW5nbGUoKScu
CgpUaGUgZml4IGxvb2tzIHJlYWxseSBsZWdpdGltYXRlLCBpbmRlZWQgSSBnZXQgdGhhdCB0aGUg
dXNsZWVwX3JhbmdlKCkKbWlnaHQgbWFrZSBpdCB3b3JrIG1vc3Qgb2YgdGhlIHRpbWUgYnV0IG5v
dCBhbHdheXMuIEhhdmluZyB0aGlzIGJpdCBpbgphIERNQSBidWYgYXJlYSBpcyBhIGJpdCBzdHJh
bmdlLiBXZWxsLCB0aGUgZml4IExHVE0gYW55d2F5LgoKPiAKPiBUaGFua3MsIEFyc2VuaXkKPiAK
PiBPbiAxMy4wMy4yMDIzIDEwOjMyLCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6Cj4gPiAnaW5mb19i
dWYnIG1lbW9yeSBpcyBjYWNoZWQgYW5kIGRyaXZlciBwb2xscyBFQ0MgYml0IGluIGl0LiBUaGlz
IGJpdAo+ID4gaXMgc2V0IGJ5IHRoZSBOQU5EIGNvbnRyb2xsZXIuIElmICd1c2xlZXBfcmFuZ2Uo
KScgcmV0dXJucyBiZWZvcmUgZGV2aWNlCj4gPiBzZXRzIHRoaXMgYml0LCAnaW5mb19idWYnIHdp
bGwgYmUgY2FjaGVkIGFuZCBkcml2ZXIgd29uJ3Qgc2VlIHVwZGF0ZSBvZgo+ID4gdGhpcyBiaXQg
YW5kIHdpbGwgbG9vcCBmb3JldmVyLgo+ID4gCj4gPiBGaXhlczogOGZhZTg1NmM1MzUwICgibXRk
OiByYXduYW5kOiBtZXNvbjogYWRkIHN1cHBvcnQgZm9yIEFtbG9naWMgTkFORCBmbGFzaCBjb250
cm9sbGVyIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNi
ZXJkZXZpY2VzLnJ1Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFu
ZC5jIHwgOCArKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ID4gaW5kZXgg
NWVlMDEyMzFhYzRjLi4yYzA1YzA4YTBlYWYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29u
X25hbmQuYwo+ID4gQEAgLTE3Niw2ICsxNzYsNyBAQCBzdHJ1Y3QgbWVzb25fbmZjIHsKPiA+ICAK
PiA+ICAJZG1hX2FkZHJfdCBkYWRkcjsKPiA+ICAJZG1hX2FkZHJfdCBpYWRkcjsKPiA+ICsJdTMy
IGluZm9fYnl0ZXM7Cj4gPiAgCj4gPiAgCXVuc2lnbmVkIGxvbmcgYXNzaWduZWRfY3M7Cj4gPiAg
fTsKPiA+IEBAIC01MDMsNiArNTA0LDcgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfZG1hX2J1ZmZl
cl9zZXR1cChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB2b2lkICpkYXRhYnVmLAo+ID4gIAkJCQkJ
IG5mYy0+ZGFkZHIsIGRhdGFsZW4sIGRpcik7Cj4gPiAgCQkJcmV0dXJuIHJldDsKPiA+ICAJCX0K
PiA+ICsJCW5mYy0+aW5mb19ieXRlcyA9IGluZm9sZW47Cj4gPiAgCQljbWQgPSBHRU5DTURJQURE
UkwoTkZDX0NNRF9BSUwsIG5mYy0+aWFkZHIpOwo+ID4gIAkJd3JpdGVsKGNtZCwgbmZjLT5yZWdf
YmFzZSArIE5GQ19SRUdfQ01EKTsKPiA+ICAKPiA+IEBAIC01MjAsOCArNTIyLDEwIEBAIHN0YXRp
YyB2b2lkIG1lc29uX25mY19kbWFfYnVmZmVyX3JlbGVhc2Uoc3RydWN0IG5hbmRfY2hpcCAqbmFu
ZCwKPiA+ICAJc3RydWN0IG1lc29uX25mYyAqbmZjID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRh
KG5hbmQpOwo+ID4gIAo+ID4gIAlkbWFfdW5tYXBfc2luZ2xlKG5mYy0+ZGV2LCBuZmMtPmRhZGRy
LCBkYXRhbGVuLCBkaXIpOwo+ID4gLQlpZiAoaW5mb2xlbikKPiA+ICsJaWYgKGluZm9sZW4pIHsK
PiA+ICAJCWRtYV91bm1hcF9zaW5nbGUobmZjLT5kZXYsIG5mYy0+aWFkZHIsIGluZm9sZW4sIGRp
cik7Cj4gPiArCQluZmMtPmluZm9fYnl0ZXMgPSAwOwo+ID4gKwl9Cj4gPiAgfQo+ID4gIAo+ID4g
IHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4
ICpidWYsIGludCBsZW4pCj4gPiBAQCAtNzEwLDYgKzcxNCw4IEBAIHN0YXRpYyB2b2lkIG1lc29u
X25mY19jaGVja19lY2NfcGFnZXNfdmFsaWQoc3RydWN0IG1lc29uX25mYyAqbmZjLAo+ID4gIAkJ
dXNsZWVwX3JhbmdlKDEwLCAxNSk7Cj4gPiAgCQkvKiBpbmZvIGlzIHVwZGF0ZWQgYnkgbmZjIGRt
YSBlbmdpbmUqLwo+ID4gIAkJc21wX3JtYigpOwo+ID4gKwkJZG1hX3N5bmNfc2luZ2xlX2Zvcl9j
cHUobmZjLT5kZXYsIG5mYy0+aWFkZHIsIG5mYy0+aW5mb19ieXRlcywKPiA+ICsJCQkJCURNQV9G
Uk9NX0RFVklDRSk7Cj4gPiAgCQlyZXQgPSAqaW5mbyAmIEVDQ19DT01QTEVURTsKPiA+ICAJfSB3
aGlsZSAoIXJldCk7Cj4gPiAgfSAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
