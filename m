Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4022C6FD1D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tjwk+FVe7em2r55sJa0SL+gHHFjX/Qov4BUkq3QpwXM=; b=pY7M+BhcP/VieD
	XZaU+IYqTOQEzIQdAES7xkLZItjGCujja8QfJJsNFFA9OZbPQsJttXXgnqUc29UfiO6L8qYyDbEkr
	2Yqy3m7pmfY5N0q4nFXLri+rZSlInw3+UkaH6WIcdYLCwsSoqvql5qwjQRUURMgLZKFZMDRPgcxOc
	z8GSmM5LRIJTSdoZRsZAf+poDQCYy254Mnjdj5YEzNzjiQkm/N7XUuyB3cDyWpVmBNUG+ojq7VTP4
	DBL3zjoOCFQFSduBw+3EBCV6cC2NU++9hJGAZlZQerkIdi6GVIpj6RubthWRxeqdqKksK7YpUHORM
	PalijwcqSxCPY02T8t3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDBZ-008j1t-1H;
	Mon, 20 Mar 2023 10:56:17 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDBU-008izq-1F;
	Mon, 20 Mar 2023 10:56:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F32F2100005;
	Mon, 20 Mar 2023 10:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679309768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQZBTxR72v88DWqOkd9Sluoui0Bao8eYZDsZXQxqA28=;
	b=VxYTLGInkJvfjeaj7Neytsu8uNvRUIiE49gqXD4G7IYzp69lGacCJleDaRjf7cGURQHX63
	8Un188hKrfxfLJ2cZZszeDSGpLeKBECGJu+riu1j7buowBSSeXyA+EJfkN6ANpbm55ePU1
	e3ToqRPBbQIs8aGm0fLNtTclxaCP0sP/oQsas0NeZfDCZ4k/jmRotlcohNosd7/JvNlUEf
	6UAKzSwKyUR0N+kFIwWlmuhIWc8/K7QWlHqNOaoAUwTeaR+94HTFa//gcNGWIb8JUq3/ld
	0wxRt52adHTkvCq/NJClDHVTXDtXM/9Ko1MeNt19jwh+U5GVlDZezCBfv5sPfw==
Date: Mon, 20 Mar 2023 11:55:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Arseniy Krasnov
 <avkrasnov@sberdevices.ru>, Liang Yang <liang.yang@amlogic.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [RFC PATCH v1] mtd: rawnand: meson: invalidate cache on polling
 ECC bit
Message-ID: <20230320115558.49c5a062@xps-13>
In-Reply-To: <20230320104314.i2stk665xbrleb53@CAB-WSD-L081021>
References: <d4ef0bd6-816e-f6fa-9385-f05f775f0ae2@sberdevices.ru>
	<20f7f1f8-e8f8-b3e1-251e-27db71ab6840@sberdevices.ru>
	<20230313121808.27170d1b@xps-13>
	<dc46c06f-6b36-3c1c-bf96-2ef37e29dfdb@linaro.org>
	<20230320104314.i2stk665xbrleb53@CAB-WSD-L081021>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_035612_689014_38989962 
X-CRM114-Status: GOOD (  31.96  )
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

SGkgRG1pdHJ5LAoKZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgMjAgTWFy
IDIwMjMgMTM6NDM6MTQgKzAzMDA6Cgo+IEhlbGxvIGd1eXMhCj4gCj4gV2FzIGl0IGFwcGxpZWQg
dG8gc29tZSBuYW5kICdwcmVwYXJlLWZvci1tZXJnZScgcmVsZWFzZSBicmFuY2g/CgpOb3QgeWV0
LCBJJ2xsIGFwcGx5IGl0IHRoaXMgd2VlayBpbiBtdGQvZml4ZXMsIHlvdSdsbCBiZSBub3RpY2Vk
LgoKVGhhbmtzLApNaXF1w6hsCgo+IE9uIE1vbiwgTWFyIDEzLCAyMDIzIGF0IDEyOjIzOjEyUE0g
KzAxMDAsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+ID4gT24gMTMvMDMvMjAyMyAxMjoxOCwgTWlx
dWVsIFJheW5hbCB3cm90ZTogIAo+ID4gPiBIaSBBcnNlbml5LAo+ID4gPiAKPiA+ID4gYXZrcmFz
bm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIE1vbiwgMTMgTWFyIDIwMjMgMTA6MzY6MTEgKzAz
MDA6Cj4gPiA+ICAgCj4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gCj4gPiA+ID4gd2UgcmVwcm9kdWNl
ZCB0aGlzIHByb2JsZW0gb24gb25lIG9mIG91ciBib2FyZHMuIEl0IHRyaWdnZXJzIHZlcnkgcmFy
ZQo+ID4gPiA+IHdoZW4gJ3VzbGVlcF9yYW5nZSgpJyBpcyBwcmVzZW50LCBidXQgd2hlbiBzbGVl
cGluZyBpcyByZW1vdmVkIC0gaXQgZmlyZXMKPiA+ID4gPiBhbHdheXMuIEkgc3VwcG9zZSBwcm9i
bGVtIGlzIHdpdGggY2FjaGluZywgYXMgJ2luZm9fYnVmJyBtZW1vcnkgaXMgbWFwcGVkIGJ5Cj4g
PiA+ID4gJ2RtYV9tYXBfc2luZ2xlKCknLiAgCj4gPiA+IAo+ID4gPiBUaGUgZml4IGxvb2tzIHJl
YWxseSBsZWdpdGltYXRlLCBpbmRlZWQgSSBnZXQgdGhhdCB0aGUgdXNsZWVwX3JhbmdlKCkKPiA+
ID4gbWlnaHQgbWFrZSBpdCB3b3JrIG1vc3Qgb2YgdGhlIHRpbWUgYnV0IG5vdCBhbHdheXMuIEhh
dmluZyB0aGlzIGJpdCBpbgo+ID4gPiBhIERNQSBidWYgYXJlYSBpcyBhIGJpdCBzdHJhbmdlLiBX
ZWxsLCB0aGUgZml4IExHVE0gYW55d2F5LiAgCj4gPiAKPiA+IFllcCBpdCBsb29rcyBsZWdpdGlt
YXRlIQo+ID4gCj4gPiBMR1RNCj4gPiAKPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ry
b25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+ID4gICAKPiA+ID4gICAKPiA+ID4gPiAK
PiA+ID4gPiBUaGFua3MsIEFyc2VuaXkKPiA+ID4gPiAKPiA+ID4gPiBPbiAxMy4wMy4yMDIzIDEw
OjMyLCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6ICAKPiA+ID4gPiA+ICdpbmZvX2J1ZicgbWVtb3J5
IGlzIGNhY2hlZCBhbmQgZHJpdmVyIHBvbGxzIEVDQyBiaXQgaW4gaXQuIFRoaXMgYml0Cj4gPiA+
ID4gPiBpcyBzZXQgYnkgdGhlIE5BTkQgY29udHJvbGxlci4gSWYgJ3VzbGVlcF9yYW5nZSgpJyBy
ZXR1cm5zIGJlZm9yZSBkZXZpY2UKPiA+ID4gPiA+IHNldHMgdGhpcyBiaXQsICdpbmZvX2J1Zicg
d2lsbCBiZSBjYWNoZWQgYW5kIGRyaXZlciB3b24ndCBzZWUgdXBkYXRlIG9mCj4gPiA+ID4gPiB0
aGlzIGJpdCBhbmQgd2lsbCBsb29wIGZvcmV2ZXIuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEZpeGVz
OiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQgc3VwcG9ydCBmb3IgQW1s
b2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQXJz
ZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4gPiA+ID4gPiAtLS0KPiA+
ID4gPiA+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgOCArKysrKysrLQo+
ID4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9t
ZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+ID4gPiA+
IGluZGV4IDVlZTAxMjMxYWM0Yy4uMmMwNWMwOGEwZWFmIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+ID4gPiA+IEBAIC0xNzYsNiArMTc2LDcgQEAg
c3RydWN0IG1lc29uX25mYyB7Cj4gPiA+ID4gPiAgIAlkbWFfYWRkcl90IGRhZGRyOwo+ID4gPiA+
ID4gICAJZG1hX2FkZHJfdCBpYWRkcjsKPiA+ID4gPiA+ICsJdTMyIGluZm9fYnl0ZXM7Cj4gPiA+
ID4gPiAgIAl1bnNpZ25lZCBsb25nIGFzc2lnbmVkX2NzOwo+ID4gPiA+ID4gICB9Owo+ID4gPiA+
ID4gQEAgLTUwMyw2ICs1MDQsNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY19kbWFfYnVmZmVyX3Nl
dHVwKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHZvaWQgKmRhdGFidWYsCj4gPiA+ID4gPiAgIAkJ
CQkJIG5mYy0+ZGFkZHIsIGRhdGFsZW4sIGRpcik7Cj4gPiA+ID4gPiAgIAkJCXJldHVybiByZXQ7
Cj4gPiA+ID4gPiAgIAkJfQo+ID4gPiA+ID4gKwkJbmZjLT5pbmZvX2J5dGVzID0gaW5mb2xlbjsK
PiA+ID4gPiA+ICAgCQljbWQgPSBHRU5DTURJQUREUkwoTkZDX0NNRF9BSUwsIG5mYy0+aWFkZHIp
Owo+ID4gPiA+ID4gICAJCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7
Cj4gPiA+ID4gPiBAQCAtNTIwLDggKzUyMiwxMCBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfZG1h
X2J1ZmZlcl9yZWxlYXNlKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4gPiA+ID4gPiAgIAlzdHJ1
Y3QgbWVzb25fbmZjICpuZmMgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEobmFuZCk7Cj4gPiA+
ID4gPiAgIAlkbWFfdW5tYXBfc2luZ2xlKG5mYy0+ZGV2LCBuZmMtPmRhZGRyLCBkYXRhbGVuLCBk
aXIpOwo+ID4gPiA+ID4gLQlpZiAoaW5mb2xlbikKPiA+ID4gPiA+ICsJaWYgKGluZm9sZW4pIHsK
PiA+ID4gPiA+ICAgCQlkbWFfdW5tYXBfc2luZ2xlKG5mYy0+ZGV2LCBuZmMtPmlhZGRyLCBpbmZv
bGVuLCBkaXIpOwo+ID4gPiA+ID4gKwkJbmZjLT5pbmZvX2J5dGVzID0gMDsKPiA+ID4gPiA+ICsJ
fQo+ID4gPiA+ID4gICB9Cj4gPiA+ID4gPiAgIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfYnVm
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGludCBsZW4pCj4gPiA+ID4gPiBAQCAt
NzEwLDYgKzcxNCw4IEBAIHN0YXRpYyB2b2lkIG1lc29uX25mY19jaGVja19lY2NfcGFnZXNfdmFs
aWQoc3RydWN0IG1lc29uX25mYyAqbmZjLAo+ID4gPiA+ID4gICAJCXVzbGVlcF9yYW5nZSgxMCwg
MTUpOwo+ID4gPiA+ID4gICAJCS8qIGluZm8gaXMgdXBkYXRlZCBieSBuZmMgZG1hIGVuZ2luZSov
Cj4gPiA+ID4gPiAgIAkJc21wX3JtYigpOwo+ID4gPiA+ID4gKwkJZG1hX3N5bmNfc2luZ2xlX2Zv
cl9jcHUobmZjLT5kZXYsIG5mYy0+aWFkZHIsIG5mYy0+aW5mb19ieXRlcywKPiA+ID4gPiA+ICsJ
CQkJCURNQV9GUk9NX0RFVklDRSk7Cj4gPiA+ID4gPiAgIAkJcmV0ID0gKmluZm8gJiBFQ0NfQ09N
UExFVEU7Cj4gPiA+ID4gPiAgIAl9IHdoaWxlICghcmV0KTsKPiA+ID4gPiA+ICAgfSAgCj4gPiA+
IAo+ID4gPiAKPiA+ID4gVGhhbmtzLAo+ID4gPiBNaXF1w6hsICAKPiA+ICAgCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
