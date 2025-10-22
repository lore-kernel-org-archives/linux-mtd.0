Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80668CCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRHGV3f7DMW9VYDfWmOwVO82pCuXBL0pHJuj5PIOylg=; b=CfEG3WjRZPAzLuCg7e8k5xJmBd
	1iIWhfn7Yoz9mj1f/qx9DZiFzgqmxC38mhfqVH4R/3naB9Ng4Y9fW7/GCCt9TY0Tq7k9CogSQvKvA
	O53llGSxAPPbBUthPljBrrvg6VLymCCKRZ0qLLHaQQnEhHXFaPKMSWsoJGF5px7okOy+1Sou0Qsbx
	MCPp2CoIzFthgMthDsKfLXdcOA8XeJgtzCZP1GCMLVMFTS3lVQMtT7SXeHsUjXLXGlqKjut/tJirh
	MrQKfV8SsjQPAQvxzN1ONLch+ochFnkOGWdhVkA7GuQ50TV1uMSYyT8pl4Qeg2K+9nkVA5jyhHvRU
	dvyRQhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTzH-000000022U2-3glb;
	Wed, 22 Oct 2025 08:14:27 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTzE-000000022S2-2M3T
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 08:14:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sNQMxguYxRy5VmNUSveNNzxqqUyeH9podY9lGnXUEKo=;
	b=6vAg3qhUDJ5RoF9ZrHjqd6OTnzE5kTGTK1P8PScxd7qM1jpEVufX1BeZjGuK6rFT2ptBe5o1N
	b1ukOcwKnq+sinNo39BtsoOHDTNy8ZFWy5DEG5d+d9LO88pFxPfTGjPv086xVgazz6EEMdcX+1O
	fsgwCaQi0Kt7Tz+YYrT6EoE=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4cs24F6SgGz1prPw;
	Wed, 22 Oct 2025 16:13:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id CF19D1401F4;
	Wed, 22 Oct 2025 16:14:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 16:14:14 +0800
Subject: Re: [PATCH] ubifs: using vmalloc_array() to handle the code
To: tanze <tanze@kylinos.cn>, <richard@nod.at>, <hengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251022080200.526003-1-tanze@kylinos.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e345c2fa-3151-d8b6-6cd2-b0afd5e13d86@huawei.com>
Date: Wed, 22 Oct 2025 16:14:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20251022080200.526003-1-tanze@kylinos.cn>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_011425_143127_05C8AEE7 
X-CRM114-Status: GOOD (  12.15  )
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

1NogMjAyNS8xMC8yMiAxNjowMiwgdGFuemUg0LS1wDoKPiBDaGFuZ2UgYXJyYXlfc2l6ZSgpIHRv
IHZtYWxsb2NfYXJyYXkoKSwgRHVlIHRvIHZtYWxsb2NfYXJyYXkoKQo+IGlzIG9wdGltaXplZCBi
ZXR0ZXIsdXNlcyBmZXdlciBpbnN0cnVjdGlvbnMsIGFuZCBoYW5kbGVzCj4gb3ZlcmZsb3cgbW9y
ZSBjb25jaXNlbHkKPiAKPiBTaWduZWQtb2ZmLWJ5OiB0YW56ZSA8dGFuemVAa3lsaW5vcy5jbj4K
PiAtLS0KPiAgIGZzL3ViaWZzL2xwdC5jIHwgMTIgKysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3ZWQtYnk6IFpo
aWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL2xwdC5jIGIvZnMvdWJpZnMvbHB0LmMKPiBpbmRleCA0NDFkMGJlY2E0Y2YuLmRkZTBhYTMy
ODdmNCAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9scHQuYwo+ICsrKyBiL2ZzL3ViaWZzL2xwdC5j
Cj4gQEAgLTYyOCw4ICs2MjgsOCBAQCBpbnQgdWJpZnNfY3JlYXRlX2RmbHRfbHB0KHN0cnVjdCB1
Ymlmc19pbmZvICpjLCBpbnQgKm1haW5fbGVicywgaW50IGxwdF9maXJzdCwKPiAgIAlwbm9kZSA9
IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCB1Ymlmc19wbm9kZSksIEdGUF9LRVJORUwpOwo+ICAgCW5u
b2RlID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHViaWZzX25ub2RlKSwgR0ZQX0tFUk5FTCk7Cj4g
ICAJYnVmID0gdm1hbGxvYyhjLT5sZWJfc2l6ZSk7Cj4gLQlsdGFiID0gdm1hbGxvYyhhcnJheV9z
aXplKHNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcyksCj4gLQkJCQkgIGMtPmxwdF9sZWJz
KSk7Cj4gKwlsdGFiID0gdm1hbGxvY19hcnJheShjLT5scHRfbGVicywKPiArCQkJICAgICBzaXpl
b2Yoc3RydWN0IHViaWZzX2xwdF9scHJvcHMpKTsKPiAgIAlpZiAoIXBub2RlIHx8ICFubm9kZSB8
fCAhYnVmIHx8ICFsdGFiIHx8ICFsc2F2ZSkgewo+ICAgCQllcnIgPSAtRU5PTUVNOwo+ICAgCQln
b3RvIG91dDsKPiBAQCAtMTc3Nyw4ICsxNzc3LDggQEAgc3RhdGljIGludCBscHRfaW5pdF9yZChz
dHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAgIHsKPiAgIAlpbnQgZXJyLCBpOwo+ICAgCj4gLQljLT5s
dGFiID0gdm1hbGxvYyhhcnJheV9zaXplKHNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcyks
Cj4gLQkJCQkgICAgIGMtPmxwdF9sZWJzKSk7Cj4gKwljLT5sdGFiID0gdm1hbGxvY19hcnJheShj
LT5scHRfbGVicywKPiArCQkJCXNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcykpOwo+ICAg
CWlmICghYy0+bHRhYikKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiBAQCAtMTg0Niw4ICsx
ODQ2LDggQEAgc3RhdGljIGludCBscHRfaW5pdF93cihzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiAg
IHsKPiAgIAlpbnQgZXJyLCBpOwo+ICAgCj4gLQljLT5sdGFiX2NtdCA9IHZtYWxsb2MoYXJyYXlf
c2l6ZShzaXplb2Yoc3RydWN0IHViaWZzX2xwdF9scHJvcHMpLAo+IC0JCQkJCSBjLT5scHRfbGVi
cykpOwo+ICsJYy0+bHRhYl9jbXQgPSB2bWFsbG9jX2FycmF5KGMtPmxwdF9sZWJzLAo+ICsJCQkJ
ICAgIHNpemVvZihzdHJ1Y3QgdWJpZnNfbHB0X2xwcm9wcykpOwo+ICAgCWlmICghYy0+bHRhYl9j
bXQpCj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
