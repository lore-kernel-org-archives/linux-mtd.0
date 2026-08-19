Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D59C5B572
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T+pCghLAY0B91hEHP4u/LxmCr1pSae9dXgAi4Trjxc=; b=Mqvgs8vWZoSPmq
	O5rV08Hf5k7QabfjZGC0oX/ALlAohwiSh1SSULcpc5yg2Nnxrhm7AthLL9+5HbNR9HNgpcgJeDcOS
	7Oh2P8QupAbaL8TSOXwOqRcJDGm7oHZOXm7LJEBWvRTTIWTNBpo2/2LkZyfejw5ZpTC3zs8IYANF/
	DauaU444cicvQh1XG8Uonaa8zg4o4s+K/QPIk841ZdDlKu8USge9ay+iHKk5CIIbImgTCfKiYK6Gd
	o8BsMt05/6Phv7bDS21aBzbZpp4u/NhSRc8qYMdPqmeLxvmMKj5ZzwVTyCTGH2ygbE0szj8e5pBRR
	bNk6YTFAQvgyV+EDkmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZ7z-000000092Us-3oFp;
	Wed, 19 Aug 2026 05:46:19 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZ7v-000000092Tc-14cn
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 05:46:19 +0000
X-UUID: 405dd3469b9111f19a56ed5b684f684d-20260819
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:943e49de-a050-4a7d-84eb-b0ba1e38e7f1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:c9ae4c6940793613cf6a0b79a0ab56f2,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|52
	,EDM:-3|-100,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 405dd3469b9111f19a56ed5b684f684d-20260819
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 87162550; Wed, 19 Aug 2026 13:45:57 +0800
Message-ID: <cc164348-2b5a-45a8-8322-7efa9a392248@kylinos.cn>
Date: Wed, 19 Aug 2026 13:45:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: block2mtd: Fix divide error when erase_size is
 zero
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 brauner@kernel.org, jack@suse.cz, hch@lst.de
Cc: syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com,
 stable@vger.kernel.org
References: <25ec7ba58facdf29b42ca43dcf11cd98e2089a5f.1786589041.git.xiaopei01@kylinos.cn>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <25ec7ba58facdf29b42ca43dcf11cd98e2089a5f.1786589041.git.xiaopei01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_224616_520326_1AB2EC0A 
X-CRM114-Status: GOOD (  16.24  )
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

CgrlnKggMjAyNi84LzEzIDEwOjQ4LCBQZWkgWGlhbyDlhpnpgZM6Cj4gVGhlIGVyYXNlIHNpemUg
aXMgcGFyc2VkIGZyb20gdGhlICJibG9jazJtdGQiIG1vZHVsZSBwYXJhbWV0ZXIgYW5kIGNhbgo+
IGJlIHNldCB0byB6ZXJvLiBhZGRfZGV2aWNlKCkgdGhlbiBldmFsdWF0ZXMKPiAKPiAgICAgICAg
IGlmIChzaXplICUgZXJhc2Vfc2l6ZSkKPiAKPiB3aXRoIGEgemVybyBkaXZpc29yLCB3aGljaCB0
cmlnZ2VycyBhIGRpdmlkZSBlcnJvcjoKPiAKPiBkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBQUkVF
TVBUIFNNUCBQVEkKPiBSSVA6IDAwMTA6YWRkX2RldmljZSBkcml2ZXJzL210ZC9kZXZpY2VzL2Js
b2NrMm10ZC5jOjI5NiBbaW5saW5lXQo+IFJJUDogMDAxMDpibG9jazJtdGRfc2V0dXAyKzB4NTky
LzB4ZGEwIGRyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmM6NDU5Cj4gQ2FsbCBUcmFjZToK
PiBibG9jazJtdGRfc2V0dXArMHgyNy8weGUwIGRyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRk
LmM6NDc2Cj4gcGFyYW1fYXR0cl9zdG9yZSsweDIxNC8weDMxMCBrZXJuZWwvcGFyYW1zLmM6NTg5
Cj4gbW9kdWxlX2F0dHJfc3RvcmUrMHg2NS8weDkwIGtlcm5lbC9wYXJhbXMuYzo5MDQKPiBrZXJu
ZnNfZm9wX3dyaXRlX2l0ZXIrMHgzYTQvMHg1NDAgZnMva2VybmZzL2ZpbGUuYzozNDUKPiAuLi4K
PiAKPiBSZWplY3QgYSB6ZXJvIGVyYXNlIHNpemUgYmVmb3JlIHBlcmZvcm1pbmcgdGhlIG1vZHVs
byBvcGVyYXRpb24gc28gdGhlCj4gZXhpc3RpbmcgImVyYXNlc2l6ZSBtdXN0IGJlIGEgZGl2aXNv
ciBvZiBkZXZpY2Ugc2l6ZSIgZXJyb3IgcGF0aAo+IHJlcG9ydHMgdGhlIGludmFsaWQgYXJndW1l
bnQgYW5kIGZyZWVzIHRoZSBkZXZpY2UuCj4gCj4gRml4ZXM6IGVhNmQ4MzNhM2ZkZCAoIm10ZDog
YmxvY2sybXRkOiBjaGVjayBkZXZpY2Ugc2l6ZSIpCj4gUmVwb3J0ZWQtYnk6IHN5emJvdCtiMzIw
YTRkNWY2NWE2MWRiYmY4OUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzZhN2I1OGJhLmFjMzYxYzA5LjIyZmYwYS4wMDQ1LkdB
RUBnb29nbGUuY29tLwo+IFN1Z2dlc3RlZC1ieTogSsO2cm4gRW5nZWwgPGpvZXJuQGJhcmVseXNl
Y3VyZS5vcmc+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBQ
ZWkgWGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+CkFkZCBjYyBNYWludGFpbmVycy4KPiAtLS0K
PiBjaGFuZ2VzIGluIHYzOgo+IDEucmVtb3ZlIChsb25nKSBjYXN0IGR1ZSB0byBidWlsZCBlcnJv
cnMgaW4gMzJiaXQgY29uZmlnIHN5c3RlbXMKPiAyLmNoYW5nZXMgZ2l0IGxvZyBhYm91dCAobG9u
ZykgY2FzdAo+IAo+IGNoYW5nbG9ncyBpbiB2MjoKPiAxLkFkZCBTdWdnZXN0ZWQtYnkgdGFnCj4g
Mi5yZW1vdmUgdW5uZWNlc3NhcnkgKGxvbmcpIGNhc3QgZnJvbSB0aGUgc2l6ZQo+IC0tLQo+ICBk
cml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvZGV2aWNlcy9ibG9jazJtdGQuYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmMK
PiBpbmRleCAwM2U4MGIyYzRmNWEuLjM0OWZhMDdiZTMxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9j
azJtdGQuYwo+IEBAIC0yOTMsNyArMjkzLDcgQEAgc3RhdGljIHN0cnVjdCBibG9jazJtdGRfZGV2
ICphZGRfZGV2aWNlKGNoYXIgKmRldm5hbWUsIGludCBlcmFzZV9zaXplLAo+ICAJfQo+ICAKPiAg
CXNpemUgPSBiZGV2X25yX2J5dGVzKGJkZXYpOwo+IC0JaWYgKChsb25nKXNpemUgJSBlcmFzZV9z
aXplKSB7Cj4gKwlpZiAoIWVyYXNlX3NpemUgfHwgKGxvbmcpc2l6ZSAlIGVyYXNlX3NpemUpIHsK
PiAgCQlwcl9lcnIoImVyYXNlc2l6ZSBtdXN0IGJlIGEgZGl2aXNvciBvZiBkZXZpY2Ugc2l6ZVxu
Iik7Cj4gIAkJZ290byBlcnJfZnJlZV9ibG9jazJtdGQ7Cj4gIAl9CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
