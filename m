Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1973EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4YiNI0W1iZBsChOT7qcDLuSRU6Jf3OyBCHrdcdfcI0=; b=pysSmqql0P8E0T
	zWLSBm9RWkwBz4ZWHMVF7kOQc4J46o2L2kzGTpTL9JVKZkt8YrohEAM/C0b9smjGsD8Si3SyS+GKG
	Nx0o0OUPnOkr3O33VyalIawp8JzyzCLm6wXbHV0DOzkPkvyQP79z3T2MD3+u6d6mUjvr3/i7UrGqh
	9hadhUgg0e/qpBRb51dyJSyM38xN792KwUDmKVOUIb+oiebZRYxs0HUxwfzldZgW9RM96yQBPQqVe
	0GqXpPz4bBJvUO8QDjECdDnI3/fWoHEB422ZB3z6lOS+qTjVqMbitKaraKelOdnan6Emyf83ER9Ih
	iITIBj5oUOpehkYVR5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH77i-00Gk6A-04;
	Wed, 05 Jul 2023 18:21:06 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH77e-00Gk4p-1u;
	Wed, 05 Jul 2023 18:21:04 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso107022661fa.1;
        Wed, 05 Jul 2023 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688581256; x=1691173256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w7iqWni3eK8x3dTleEGq98e3HnfEpiof9+EFvCVfJeA=;
        b=lcHhhZJ6UA3AaQGfvUqt/v6qgzBe4qjRli/ZwMNWbWFNKRJuoYH/PNcBNy64/kkQ77
         Qm1aUvHQGPebLCfWmTrgGclckRL2j19Cu2XFej0v1AWuWlpg0Si8hgXauI9+QgK0gBQ4
         2MADHn/a+BIrH8jeGN7OEyfb+N9fAyIYgNd2xBcalXN+8RPMcM2a35wdI0zJXiMPwKMd
         /kUxQVqpOykM6keZP7tPcp38JOnNiK8oCzYQ6kxbs5u9KFU9m9mOTc+5HAp7T4Nk5P8v
         4a0fQVoWHivgC2jfuBLVJ6m6YiErJ+3/lvX7+B3NqNSiaUrdb7D6NwEJGuMciykXo8Mj
         /SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688581256; x=1691173256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7iqWni3eK8x3dTleEGq98e3HnfEpiof9+EFvCVfJeA=;
        b=UVEyTA9jKmlHTfGjT/WB9cp7gagWDDGiAh4ESb6jA7p7/LuRfXtJO8JKHA5dUFSHGh
         xo2c9DmnlNmI4RcYR0CBDuaIGtIgXKBWc2kQVUIWd2L4ZNDHnja5gBPpjzviUQkPJni0
         LA5/s44tajAzsWJX8mM98DBor4i/wCkg8OK/BHxooZ4RuBoY3gZxBvC0dYK+SrhIZBvt
         5rLBrk8szO82jEdhAZtt0rFmH2McPW81wQ2vkG+C8Znb6WO56ZF6alOoQLMLFL78Rtrk
         c5vD0CWg3yFsScw2uNdqxJ2sERdMI6ET8CanPT7TDXESFPAMphpdk9EED7TZIoVSDguZ
         pj/Q==
X-Gm-Message-State: ABy/qLZ2W0+5C2oG0QURykZGwZPnTrbOyxAXUVwxcwNG4wtLrUXLz1Sq
	ccFPkpHz8SzhMFi5GrA37yk=
X-Google-Smtp-Source: APBJJlGrUgXkEQsV1QF3xFlWaDw9jfN/TvbHLUD9SGHxGFDYPwKfO0V/VHYG98M8lFENx5tsGzAgfg==
X-Received: by 2002:a19:7418:0:b0:4f9:5d2a:e0f6 with SMTP id v24-20020a197418000000b004f95d2ae0f6mr11255992lfe.14.1688581255815;
        Wed, 05 Jul 2023 11:20:55 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id qx22-20020a170906fcd600b009931baa0d44sm6553278ejb.140.2023.07.05.11.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 11:20:55 -0700 (PDT)
Message-ID: <ebb0d719-4fa0-791d-f160-e8ffc75385b1@gmail.com>
Date: Wed, 5 Jul 2023 20:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] mtd: rawnand: rockchip-nand-controller: copy hwecc
 PA data to oob_poi buffer
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
References: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com>
 <539cfba7-dd6f-015e-b990-a2335cb3aac9@gmail.com>
 <20230704170858.2a64c181@xps-13>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20230704170858.2a64c181@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_112102_632330_72B4C0E3 
X-CRM114-Status: GOOD (  26.80  )
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

CgpPbiA3LzQvMjMgMTc6MDgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgSm9oYW4sCj4gCj4g
amJ4NjI0NEBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAxNSBKdW4gMjAyMyAxOTozNDoxMyArMDIw
MDoKPiAKPj4gUm9ja2NoaXAgYm9vdCBibG9ja3MgYXJlIHdyaXR0ZW4gcGVyIDQgeCA1MTIgYnl0
ZSBzZWN0b3JzIHBlciBwYWdlLgo+PiBFYWNoIHBhZ2UgbXVzdCBoYXZlIGEgcGFnZSBhZGRyZXNz
IChQQSkgcG9pbnRlciBpbiBPT0IgdG8gdGhlIG5leHQgcGFnZS4KCj4gCj4gT25seSB3aGVuIHVz
ZWQgYXMgYm9vdCBkZXZpY2UgSSBndWVzcz8gSXQncyBhIEJvb3RST00gbGltaXRhdGlvbi4KClll
cywgcmVxdWlyZWQgYnkgdGhlIEJvb3RST00uCgo+IAo+PiBQYWdlcyBhcmUgd3JpdHRlbiBpbiBh
IHBhdHRlcm4gZGVwZW5kaW5nIG9uIHRoZSBOQU5EIGNoaXAgSUQuCj4+IFRoaXMgbG9naWMgdXNl
ZCB0byBidWlsZCBhIHBhZ2UgcGF0dGVybiB0YWJsZSBpcyBub3QgZnVsbHkgZGlzY2xvc2VkIGFu
ZAo+PiBpcyBub3QgZWFzeSB0byBmaXQgaW4gdGhlIE1URCBmcmFtZXdvcmsuCj4+IFRoZSBmb3Jt
dWxhIGluIHJrX25mY193cml0ZV9wYWdlX2h3ZWNjKCkgZnVuY3Rpb24gaXMgbm90IGNvcnJlY3Qu
Cj4+IE1ha2UgaHdlY2MgYW5kIHJhdyBiZWhhdmlvciBpZGVudGljYWwuCj4gCgo+IFNvIHRoaXMg
aXMgYSBmaXggYXMgd2VsbCwgZGVzZXJ2ZXMgYSB0YWcuIFdoYXRldmVyIHRoZSByZWFzb24gd2h5
IHlvdQo+IG5lZWQgdGhpcywgdGhlIGlzc3VlIHlvdSBhcmUgc29sdmluZyBpczogd3JpdGVfcGFn
ZV9od2VjYyBhbmQKPiB3cml0ZV9wYWdlX3JhdyBhcmUgbm90IGFsaWduZWQuCgpGaXhlczogMDU4
ZTBlODQ3ZDU0ICgibXRkOiByYXduYW5kOiByb2NrY2hpcDogTkZDIGRyaXZlciBmb3IgUkszMzA4
LCBSSzI5MjggYW5kIG90aGVycyIpCgo+IAo+PiBHZW5lcmF0ZSBib290IGJsb2NrIHBhZ2UgYWRk
cmVzcyBhbmQgcGF0dGVybiBmb3IgaHdlY2MgaW4gdXNlciBzcGFjZQo+PiBhbmQgY29weSBQQSBk
YXRhIHRvL2Zyb20gdGhlIGFscmVhZHkgcmVzZXJ2ZWQgbGFzdCA0IGJ5dGVzIGJlZm9yZSBFRUMK
PiAKPiBFQ0MKCk9LCgo+IAo+PiBpbiB0aGUgY2hpcC0+b29iX3BvaSBkYXRhIGxheW91dC4KPj4K
Pj4gVGhpcyBwYXRjaCBicmVha3MgYWxsIGV4aXN0aW5nIGpmZnMyIHVzZXJzIHRoYXQgaGF2ZSBm
cmVlIE9PQiBvdmVybGFwCj4+IHdpdGggdGhlIHJlc2VydmVkIHNwYWNlIGZvciBQQSBkYXRhLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29tPgo+PiAt
LS0KPj4KPj4gQ2hhbmdlZCBWMzoKPj4gICBDaGFuZ2UgcHJlZml4ZXMKPj4gICBSZXdvcmQKPj4g
LS0tCj4+ICAuLi4vbXRkL25hbmQvcmF3L3JvY2tjaGlwLW5hbmQtY29udHJvbGxlci5jICAgfCAz
NCArKysrKysrKysrKystLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3JvY2tj
aGlwLW5hbmQtY29udHJvbGxlci5jCj4+IGluZGV4IDM3ZmMwN2JhNS4uNWEwNDY4MDM0IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIu
Ywo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXIu
Ywo+PiBAQCAtNTk4LDcgKzU5OCw3IEBAIHN0YXRpYyBpbnQgcmtfbmZjX3dyaXRlX3BhZ2VfaHdl
Y2Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPj4gIAlpbnQgcGFnZXNf
cGVyX2JsayA9IG10ZC0+ZXJhc2VzaXplIC8gbXRkLT53cml0ZXNpemU7Cj4+ICAJaW50IHJldCA9
IDAsIGksIGJvb3Rfcm9tX21vZGUgPSAwOwo+PiAgCWRtYV9hZGRyX3QgZG1hX2RhdGEsIGRtYV9v
b2I7Cj4+IC0JdTMyIHJlZzsKPj4gKwl1MzIgdG1wOwo+PiAgCXU4ICpvb2I7Cj4+Cj4+ICAJbmFu
ZF9wcm9nX3BhZ2VfYmVnaW5fb3AoY2hpcCwgcGFnZSwgMCwgTlVMTCwgMCk7Cj4+IEBAIC02MjUs
NiArNjI1LDEzIEBAIHN0YXRpYyBpbnQgcmtfbmZjX3dyaXRlX3BhZ2VfaHdlY2Moc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPj4gIAkgKgo+PiAgCSAqICAgMHhGRiAweEZG
IDB4RkYgMHhGRiB8IEJCTSBPT0IxIE9PQjIgT09CMyB8IC4uLgo+PiAgCSAqCj4+ICsJICogVGhl
IGNvZGUgaGVyZSBqdXN0IHN3YXBzIHRoZSBmaXJzdCA0IGJ5dGVzIHdpdGggdGhlIGxhc3QKPj4g
KwkgKiA0IGJ5dGVzIHdpdGhvdXQgbG9zaW5nIGFueSBkYXRhLgo+PiArCSAqCj4+ICsJICogVGhl
IGNoaXAtPm9vYl9wb2kgZGF0YSBsYXlvdXQ6Cj4+ICsJICoKPj4gKwkgKiAgICBCQk0gIE9PQjEg
T09CMiBPT0IzIHwuLi4uLi58ICBQQTAgIFBBMSAgUEEyICBQQTMKPj4gKwkgKgo+PiAgCSAqIENv
bmZpZ3VyZSB0aGUgRUNDIGFsZ29yaXRobSBzdXBwb3J0ZWQgYnkgdGhlIGJvb3QgUk9NLgo+PiAg
CSAqLwo+PiAgCWlmICgocGFnZSA8IChwYWdlc19wZXJfYmxrICogcmtuYW5kLT5ib290X2Jsa3Mp
KSAmJgo+PiBAQCAtNjM1LDIxICs2NDIsMTcgQEAgc3RhdGljIGludCBya19uZmNfd3JpdGVfcGFn
ZV9od2VjYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqYnVmLAo+PiAgCX0KPj4K
Pj4gIAlmb3IgKGkgPSAwOyBpIDwgZWNjLT5zdGVwczsgaSsrKSB7Cj4+IC0JCWlmICghaSkgewo+
PiAtCQkJcmVnID0gMHhGRkZGRkZGRjsKPj4gLQkJfSBlbHNlIHsKPj4gKwkJaWYgKCFpKQo+PiAr
CQkJb29iID0gY2hpcC0+b29iX3BvaSArIChlY2MtPnN0ZXBzIC0gMSkgKiBORkNfU1lTX0RBVEFf
U0laRTsKPj4gKwkJZWxzZQo+PiAgCQkJb29iID0gY2hpcC0+b29iX3BvaSArIChpIC0gMSkgKiBO
RkNfU1lTX0RBVEFfU0laRTsKPj4gLQkJCXJlZyA9IG9vYlswXSB8IG9vYlsxXSA8PCA4IHwgb29i
WzJdIDw8IDE2IHwKPj4gLQkJCSAgICAgIG9vYlszXSA8PCAyNDsKPj4gLQkJfQo+Pgo+PiAtCQlp
ZiAoIWkgJiYgYm9vdF9yb21fbW9kZSkKPiAKCj4gU28gd2Ugbm8gbG9uZ2VyIG5lZWQgYm9vdF9y
b21fbW9kZT8gT3IgZG8gd2U/Cgpib290X3JvbV9tb2RlIGlzIHN0aWxsIGluIHVzZSBmb3IgZWNj
IHN3aXRjaGluZy4KCj4gCj4+IC0JCQlyZWcgPSAocGFnZSAmIChwYWdlc19wZXJfYmxrIC0gMSkp
ICogNDsKPj4gKwkJdG1wID0gb29iWzBdIHwgb29iWzFdIDw8IDggfCBvb2JbMl0gPDwgMTYgfCBv
b2JbM10gPDwgMjQ7Cj4+Cj4+ICAJCWlmIChuZmMtPmNmZy0+dHlwZSA9PSBORkNfVjkpCj4+IC0J
CQluZmMtPm9vYl9idWZbaV0gPSByZWc7Cj4+ICsJCQluZmMtPm9vYl9idWZbaV0gPSB0bXA7Cj4+
ICAJCWVsc2UKPj4gLQkJCW5mYy0+b29iX2J1ZltpICogKG9vYl9zdGVwIC8gNCldID0gcmVnOwo+
PiArCQkJbmZjLT5vb2JfYnVmW2kgKiAob29iX3N0ZXAgLyA0KV0gPSB0bXA7Cj4+ICAJfQo+Pgo+
PiAgCWRtYV9kYXRhID0gZG1hX21hcF9zaW5nbGUobmZjLT5kZXYsICh2b2lkICopbmZjLT5wYWdl
X2J1ZiwKPj4gQEAgLTgxMiwxMiArODE1LDE3IEBAIHN0YXRpYyBpbnQgcmtfbmZjX3JlYWRfcGFn
ZV9od2VjYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1OCAqYnVmLCBpbnQgb29iX29uLAo+PiAg
CQlnb3RvIHRpbWVvdXRfZXJyOwo+PiAgCX0KPj4KPj4gLQlmb3IgKGkgPSAxOyBpIDwgZWNjLT5z
dGVwczsgaSsrKSB7Cj4+IC0JCW9vYiA9IGNoaXAtPm9vYl9wb2kgKyAoaSAtIDEpICogTkZDX1NZ
U19EQVRBX1NJWkU7Cj4+ICsJZm9yIChpID0gMDsgaSA8IGVjYy0+c3RlcHM7IGkrKykgewo+PiAr
CQlpZiAoIWkpCj4+ICsJCQlvb2IgPSBjaGlwLT5vb2JfcG9pICsgKGVjYy0+c3RlcHMgLSAxKSAq
IE5GQ19TWVNfREFUQV9TSVpFOwo+PiArCQllbHNlCj4+ICsJCQlvb2IgPSBjaGlwLT5vb2JfcG9p
ICsgKGkgLSAxKSAqIE5GQ19TWVNfREFUQV9TSVpFOwo+PiArCj4+ICAJCWlmIChuZmMtPmNmZy0+
dHlwZSA9PSBORkNfVjkpCj4+ICAJCQl0bXAgPSBuZmMtPm9vYl9idWZbaV07Cj4+ICAJCWVsc2UK
Pj4gIAkJCXRtcCA9IG5mYy0+b29iX2J1ZltpICogKG9vYl9zdGVwIC8gNCldOwo+PiArCj4+ICAJ
CSpvb2IrKyA9ICh1OCl0bXA7Cj4+ICAJCSpvb2IrKyA9ICh1OCkodG1wID4+IDgpOwo+PiAgCQkq
b29iKysgPSAodTgpKHRtcCA+PiAxNik7Cj4+IC0tCj4+IDIuMzAuMgo+Pgo+IAo+IAo+IFRoYW5r
cywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
