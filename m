Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CCEEE6B76
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Feb 2026 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FunG2ZFoA49ZccOo+j66W793pEDHu4d1M+cIfawrW4=; b=yID35GaBYRV1Cltcczfn5rA/TM
	EOj9e+f7vupqZxbwjcQtL7LuVqvZJ+Pv7fU6/jQ24jOFPTAg+su10hiSi64EY5NOq0qyBRpgkJelr
	o76UYpoBs6BiN/Da23Drn8iyizMVQ5zvqXOP4YHch9/u6/ZhAVaAC3nkwiKtdMw4pL3mqjosqy2by
	3WXGtyW2fhcLMUzi7E7vDuBfYAwrAPunYwxprmNgppZzWw+7aKnfQArIo0+x59CDm7IQqUDuyxWtk
	nR03H4sG6s6Fa9E10TSogQaMvG0pMHL7uBQ6mGOamOopD2Be3IfmVOtRKnvtL+UeC5vIz0rNMmhCV
	30YXWmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodEV-0000000CE0h-09tG;
	Sat, 07 Feb 2026 07:59:59 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vodER-0000000CDzu-26QR
	for linux-mtd@lists.infradead.org;
	Sat, 07 Feb 2026 07:59:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ck6XkZNOCX8yHIJxvxMlr2RiEQH4smBz5FbWUWkcWmA=;
	b=N6LFfqul0VJYjj7DOr5R1AY3Cr4F343xtdUklMYI3t+V2Q8nuYUd2PV1e0ysBH4NEkYqjZBvw
	M3KzR7FdAsrZmfugE0Q5DS/gXKLlBIKjgFpOUXhYxzvVj6Sl93vchGCWB3bes2/iyIhUgyl5TZu
	J7Pf+RYHlo9nka/5uFsTQjE=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f7NYp5dFBznTbf;
	Sat,  7 Feb 2026 15:55:58 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id DF4A740562;
	Sat,  7 Feb 2026 15:59:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Feb 2026 15:59:46 +0800
Subject: Re: [PATCH] jffs2: use fs_umode_to_dtype() for dirent type
To: Adarsh Das <adarshdas950@gmail.com>
CC: <dwmw2@infradead.org>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <134dec36-3bcf-89a4-2817-a880afa4280f@huawei.com>
 <20260207073948.48144-1-adarshdas950@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6fed1bb5-7d9a-c60d-f243-4e06d29c8af8@huawei.com>
Date: Sat, 7 Feb 2026 15:59:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260207073948.48144-1-adarshdas950@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_235956_808416_4EDE284D 
X-CRM114-Status: GOOD (  14.91  )
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

1NogMjAyNi8yLzcgMTU6MzksIEFkYXJzaCBEYXMg0LS1wDoKPiBIaSBaaGloYW8sCj4gCj4gVGhh
bmsgeW91IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3IG15IHBhdGNoIQo+IAo+IEknbSB0
cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgaXNzdWUgeW91J3ZlIGlkZW50aWZpZWQuIEkgbG9va2Vk
IGF0IHRoZQo+IGZzX3Vtb2RlX3RvX2R0eXBlKCkgaW1wbGVtZW50YXRpb24gaW4gZnMvZnNfdHlw
ZXMuYzoKPiAKPiAgICAgIHVuc2lnbmVkIGNoYXIgZnNfdW1vZGVfdG9fZHR5cGUodW1vZGVfdCBt
b2RlKSB7Cj4gICAgICAgICAgcmV0dXJuIGZzX2Z0eXBlX3RvX2R0eXBlKGZzX3Vtb2RlX3RvX2Z0
eXBlKG1vZGUpKTsKPiAgICAgIH0KPiAKPj5Gcm9tIHdoYXQgSSBjYW4gc2VlLCBpdCBzZWVtcyBs
aWtlIHRoZSBmdW5jdGlvbiBkb2VzIHByb2R1Y2UgRlRfRklGTyAoNSkgCj4gYXMgYW4gaW50ZXJt
ZWRpYXRlIHZhbHVlLCBidXQgdGhlbiBjb252ZXJ0cyBpdCBiYWNrIGJlZm9yZSByZXR1cm5pbmcu
Cj4gSGVyZSdzIHdoYXQgSSB0aGluayBoYXBwZW5zIGZvciBTX0lGSUZPICgwMDEwMDAwKToKPiAK
PiBPbGQgYml0LXNoaWZ0IGNvZGU6Cj4gICAgICB0eXBlID0gKG1vZGUgJiBTX0lGTVQpID4+IDEy
Cj4gICAgICAgICAgID0gKDAwMTAwMDAgJiAwMDE3MDAwMCkgPj4gMTIKPiAgICAgICAgICAgPSAw
MDEwMDAwID4+IDEyCj4gICAgICAgICAgID0gMSAoRFRfRklGTykKPiAKPiBOZXcgZnNfdW1vZGVf
dG9fZHR5cGUoKSBjb2RlOgo+ICAgICAgU3RlcCAxOiBmc191bW9kZV90b19mdHlwZSgwMDEwMDAw
KQo+ICAgICAgICAgICAgICA9IGZzX2Z0eXBlX2J5X2R0eXBlW1NfRFQoMDAxMDAwMCldCj4gICAg
ICAgICAgICAgID0gZnNfZnR5cGVfYnlfZHR5cGVbMV0KPiAgICAgICAgICAgICAgPSBGVF9GSUZP
ID0gNQo+IAo+ICAgICAgU3RlcCAyOiBmc19mdHlwZV90b19kdHlwZSg1KQo+ICAgICAgICAgICAg
ICA9IGZzX2R0eXBlX2J5X2Z0eXBlWzVdCj4gICAgICAgICAgICAgID0gRFRfRklGTyA9IDEKPiAK
Ck9oLCB0aGF0J3MgZnNfdW1vZGVfdG9fZHR5cGUsIHNvcnJ5IGZvciB0aGUgbWlzdGFrZSwgSSBz
YXcgaXQgYXMgCidmc191bW9kZV90b19mdHlwZScuCgo+IEknbSBub3Qgc3VyZSBob3cgRlRfRklG
TyAoNSkgd291bGQgcmVtYWluIGFmdGVyIHRoZSBmdW5jdGlvbiByZXR1cm5zLCBzaW5jZQo+IGl0
IHNlZW1zIHRvIGdldCBjb252ZXJ0ZWQgYmFjayB0byBEVF9GSUZPICgxKSBpbiBzdGVwIDIuCj4g
Cj4gSWYgdGhlcmUncyBhbiBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2gsIEkgY2FuIGVkaXQgbXkg
cGF0Y2ggYW5kIGtlZXAgY2hhbmdlcyBpbiBvbmx5IGpmZnMyX21rbm9kLgo+IC4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
