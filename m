Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195C7C36005
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 02:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUeJaf2PUfWuUC9HS/wX+ooTA0F109J0jYbHDOfPDlo=; b=2kOsS40gnSqFBU6fxi6lIPii4n
	FEVJQIEPOmOM5yMKS1SQTXItnOV60n0Fw994s/qvHKz0QR2gVuBSaj9eE5hUQr00MSpxu7MsVoOGx
	DTZbEMrFIrS5qkkUWE7IpNVUMH+mymqADazId9n7vfxJQItv4p2cL6K/EZ0kof7oc1dArgtR+XmMj
	kPXdCVAnQ2d92EH8xzoEvYXJHLRcVQD7bpcESKuZqzBhTYWfXy4W53g3Yv7nh+FGGYezOuupR3ZYh
	DzvlD+nPHPpZOMLfdOet693/PBC+lgiYWMscGlpE4ArCrhVWrYSgfc14E7+iZ4/WdAagmldmbrf0F
	ppMFPJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txGqg-00000007RGK-1Ezb;
	Wed, 26 Mar 2025 02:50:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txGqc-00000007RFE-43tm
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 02:50:33 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZMrqP3w07z13LCv;
	Wed, 26 Mar 2025 10:49:53 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D90901800FD;
	Wed, 26 Mar 2025 10:50:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 26 Mar 2025 10:50:15 +0800
Subject: Re: [PATCH] jffs2: check jffs2_prealloc_raw_node_refs() result in few
 other places
To: Fedor Pchelkin <pchelkin@ispras.ru>, Richard Weinberger <richard@nod.at>
CC: David Woodhouse <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
	<stable@vger.kernel.org>
References: <20250325163215.287311-1-pchelkin@ispras.ru>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <742d0485-66ec-94b3-4e97-481ffc33383e@huawei.com>
Date: Wed, 26 Mar 2025 10:50:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250325163215.287311-1-pchelkin@ispras.ru>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_195031_345069_02CBA200 
X-CRM114-Status: GOOD (  16.56  )
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

1NogMjAyNS8zLzI2IDA6MzIsIEZlZG9yIFBjaGVsa2luINC0tcA6Cj4gRnV6emluZyBoaXQgYW5v
dGhlciBpbnZhbGlkIHBvaW50ZXIgZGVyZWZlcmVuY2UgZHVlIHRvIHRoZSBsYWNrIG9mCj4gY2hl
Y2tpbmcgd2hldGhlciBqZmZzMl9wcmVhbGxvY19yYXdfbm9kZV9yZWZzKCkgY29tcGxldGVkIHN1
Y2Nlc3NmdWxseS4KPiBTdWJzZXF1ZW50IGxvZ2ljIGltcGxpZXMgdGhhdCB0aGUgbm9kZSByZWZz
IGhhdmUgYmVlbiBhbGxvY2F0ZWQuCj4gCj4gSGFuZGxlIHRoYXQuIFRoZSBjb2RlIGlzIHJlYWR5
IGZvciBwcm9wYWdhdGluZyB0aGUgZXJyb3IgdXB3YXJkcy4KPiAKPiBLQVNBTjogbnVsbC1wdHIt
ZGVyZWYgaW4gcmFuZ2UgWzB4MDAwMDAwMDAwMDAwMDAwOC0weDAwMDAwMDAwMDAwMDAwMGZdCj4g
Q1BVOiAxIFBJRDogNTgzNSBDb21tOiBzeXotZXhlY3V0b3IxNDUgTm90IHRhaW50ZWQgNS4xMC4y
MzQtc3l6a2FsbGVyICMwCj4gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZY
ICsgUElJWCwgMTk5NiksIEJJT1MgMS4xMi4wLTEgMDQvMDEvMjAxNAo+IFJJUDogMDAxMDpqZmZz
Ml9saW5rX25vZGVfcmVmKzB4YWMvMHg2OTAgZnMvamZmczIvbm9kZWxpc3QuYzo2MDAKPiBDYWxs
IFRyYWNlOgo+ICAgamZmczJfbWFya19lcmFzZWRfYmxvY2sgZnMvamZmczIvZXJhc2UuYzo0NjAg
W2lubGluZV0KPiAgIGpmZnMyX2VyYXNlX3BlbmRpbmdfYmxvY2tzKzB4Njg4LzB4MTg2MCBmcy9q
ZmZzMi9lcmFzZS5jOjExOAo+ICAgamZmczJfZ2FyYmFnZV9jb2xsZWN0X3Bhc3MrMHg2MzgvMHgx
YTAwIGZzL2pmZnMyL2djLmM6MjUzCj4gICBqZmZzMl9yZXNlcnZlX3NwYWNlKzB4M2Y0LzB4YWQw
IGZzL2pmZnMyL25vZGVtZ210LmM6MTY3Cj4gICBqZmZzMl93cml0ZV9pbm9kZV9yYW5nZSsweDI0
Ni8weGI1MCBmcy9qZmZzMi93cml0ZS5jOjM2Mgo+ICAgamZmczJfd3JpdGVfZW5kKzB4NzEyLzB4
MTExMCBmcy9qZmZzMi9maWxlLmM6MzAyCj4gICBnZW5lcmljX3BlcmZvcm1fd3JpdGUrMHgyYzIv
MHg1MDAgbW0vZmlsZW1hcC5jOjMzNDcKPiAgIF9fZ2VuZXJpY19maWxlX3dyaXRlX2l0ZXIrMHgy
NTIvMHg2MTAgbW0vZmlsZW1hcC5jOjM0NjUKPiAgIGdlbmVyaWNfZmlsZV93cml0ZV9pdGVyKzB4
ZGIvMHgyMzAgbW0vZmlsZW1hcC5jOjM0OTcKPiAgIGNhbGxfd3JpdGVfaXRlciBpbmNsdWRlL2xp
bnV4L2ZzLmg6MjAzOSBbaW5saW5lXQo+ICAgZG9faXRlcl9yZWFkdl93cml0ZXYrMHg0NmQvMHg3
NTAgZnMvcmVhZF93cml0ZS5jOjc0MAo+ICAgZG9faXRlcl93cml0ZSsweDE4Yy8weDcxMCBmcy9y
ZWFkX3dyaXRlLmM6ODY2Cj4gICB2ZnNfd3JpdGV2KzB4MWRiLzB4NmEwIGZzL3JlYWRfd3JpdGUu
Yzo5MzkKPiAgIGRvX3B3cml0ZXYgZnMvcmVhZF93cml0ZS5jOjEwMzYgW2lubGluZV0KPiAgIF9f
ZG9fc3lzX3B3cml0ZXYgZnMvcmVhZF93cml0ZS5jOjEwODMgW2lubGluZV0KPiAgIF9fc2Vfc3lz
X3B3cml0ZXYgZnMvcmVhZF93cml0ZS5jOjEwNzggW2lubGluZV0KPiAgIF9feDY0X3N5c19wd3Jp
dGV2KzB4MjM1LzB4MzEwIGZzL3JlYWRfd3JpdGUuYzoxMDc4Cj4gICBkb19zeXNjYWxsXzY0KzB4
MzAvMHg0MCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo0Ngo+ICAgZW50cnlfU1lTQ0FMTF82NF9h
ZnRlcl9od2ZyYW1lKzB4NjcvMHhkMQo+IAo+IEZvdW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBD
ZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU3l6a2FsbGVyLgo+IAo+IEZpeGVzOiAyZjc4
NTQwMmYzOWIgKCJbSkZGUzJdIFJlZHVjZSB2aXNpYmlsaXR5IG9mIHJhd19ub2RlX3JlZiB0byB1
cHBlciBsYXllcnMgb2YgSkZGUzIgY29kZS4iKQo+IEZpeGVzOiBmNTYwOTI4YmFhNjAgKCJbSkZG
UzJdIEFsbG9jYXRlIG5vZGVfcmVmIGZvciB3YXN0ZWQgc3BhY2Ugd2hlbiBza2lwcGluZyB0byBw
YWdlIGJvdW5kYXJ5IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IEZlZG9yIFBjaGVsa2luIDxwY2hlbGtpbkBpc3ByYXMucnU+Cj4gLS0tCj4gCj4gU2ltaWxh
ciB0byBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNTAzMDcxNjM0MDkuMTM0
OTEtMi1hLnNhZG92bmlrb3ZAaXNwcmFzLnJ1Lwo+IGJ1dCB0b3VjaGVzIHR3byByZW1haW5pbmcg
cGxhY2VzLgo+IAo+ICAgZnMvamZmczIvZXJhc2UuYyB8IDQgKysrLQo+ICAgZnMvamZmczIvc2Nh
bi5jICB8IDQgKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2Vp
LmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZnMvamZmczIvZXJhc2UuYyBiL2ZzL2pmZnMyL2VyYXNl
LmMKPiBpbmRleCBlZjNhMWUxYjZjYjAuLmZkYTlmNGQ2MDkzZiAxMDA2NDQKPiAtLS0gYS9mcy9q
ZmZzMi9lcmFzZS5jCj4gKysrIGIvZnMvamZmczIvZXJhc2UuYwo+IEBAIC00MjUsNyArNDI1LDkg
QEAgc3RhdGljIHZvaWQgamZmczJfbWFya19lcmFzZWRfYmxvY2soc3RydWN0IGpmZnMyX3NiX2lu
Zm8gKmMsIHN0cnVjdCBqZmZzMl9lcmFzZWIKPiAgIAkJCS50b3RsZW4gPQljcHVfdG9famUzMihj
LT5jbGVhbm1hcmtlcl9zaXplKQo+ICAgCQl9Owo+ICAgCj4gLQkJamZmczJfcHJlYWxsb2NfcmF3
X25vZGVfcmVmcyhjLCBqZWIsIDEpOwo+ICsJCXJldCA9IGpmZnMyX3ByZWFsbG9jX3Jhd19ub2Rl
X3JlZnMoYywgamViLCAxKTsKPiArCQlpZiAocmV0KQo+ICsJCQlnb3RvIGZpbGViYWQ7Cj4gICAK
PiAgIAkJbWFya2VyLmhkcl9jcmMgPSBjcHVfdG9famUzMihjcmMzMigwLCAmbWFya2VyLCBzaXpl
b2Yoc3RydWN0IGpmZnMyX3Vua25vd25fbm9kZSktNCkpOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2Zz
L2pmZnMyL3NjYW4uYyBiL2ZzL2pmZnMyL3NjYW4uYwo+IGluZGV4IDI5NjcxZTMzYTE3MS4uNjI4
NzljMjE4ZDRiIDEwMDY0NAo+IC0tLSBhL2ZzL2pmZnMyL3NjYW4uYwo+ICsrKyBiL2ZzL2pmZnMy
L3NjYW4uYwo+IEBAIC0yNTYsNyArMjU2LDkgQEAgaW50IGpmZnMyX3NjYW5fbWVkaXVtKHN0cnVj
dCBqZmZzMl9zYl9pbmZvICpjKQo+ICAgCj4gICAJCWpmZnMyX2RiZygxLCAiJXMoKTogU2tpcHBp
bmcgJWQgYnl0ZXMgaW4gbmV4dGJsb2NrIHRvIGVuc3VyZSBwYWdlIGFsaWdubWVudFxuIiwKPiAg
IAkJCSAgX19mdW5jX18sIHNraXApOwo+IC0JCWpmZnMyX3ByZWFsbG9jX3Jhd19ub2RlX3JlZnMo
YywgYy0+bmV4dGJsb2NrLCAxKTsKPiArCQlyZXQgPSBqZmZzMl9wcmVhbGxvY19yYXdfbm9kZV9y
ZWZzKGMsIGMtPm5leHRibG9jaywgMSk7Cj4gKwkJaWYgKHJldCkKPiArCQkJZ290byBvdXQ7Cj4g
ICAJCWpmZnMyX3NjYW5fZGlydHlfc3BhY2UoYywgYy0+bmV4dGJsb2NrLCBza2lwKTsKPiAgIAl9
Cj4gICAjZW5kaWYKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
