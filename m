Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7656CE7716E
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 05:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tq8jHh+wzM8uwsl3lsxrcxmUAduJVfVyGTpZTYQ+NU=; b=iYI+F7uhvCUfJb2ZxRRfcOJH9v
	3f71Bw0e8geE/g7GUrupKKUkwQzZyy3jc7RNH5pEJJ4nlu3uaJaWnfLnqfXfcEHtreOfd3JJNPyP5
	nf/JKfW6GBN4GBS5Ad7TwVdcVCwkde0BeyPdo2m9+77iXlEv8b3A130CXr3uYDjvOabBIe1th7lgl
	AdExXWi6RCZ7hPe9GjBu3TbVbhgrXiBSP98BnGfMM4osBYTYPT2u+++ThZB8MW2Fv+7kvS3Y9JtzV
	v6ue6BEGGYhrN/lXD7jI3uavN1Nl4c5J+ykyutWEyYsXkUl7jIuKTgJ2o+vB1N+/opLOb775mDp/m
	sEsllrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJmwD-00000003Ppt-3eTm;
	Sat, 07 Dec 2024 05:01:05 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJmw9-00000003Pop-3Vo2
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 05:01:04 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Y4wvD117lz1yrM8
	for <linux-mtd@lists.infradead.org>; Sat,  7 Dec 2024 13:01:12 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id F32F2180042
	for <linux-mtd@lists.infradead.org>; Sat,  7 Dec 2024 13:00:55 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Dec 2024 13:00:55 +0800
Subject: Re: [PATCH] FIX: NO_CAST.INTEGER_OVERFLOW in ubirsvol.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241206123744.60649-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <dab0569c-97c0-4f57-5b01-7bc2fe47ec8c@huawei.com>
Date: Sat, 7 Dec 2024 13:00:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241206123744.60649-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_210102_089952_2B4ED56D 
X-CRM114-Status: GOOD (  16.88  )
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

5ZyoIDIwMjQvMTIvNiAyMDozNywgQW50b24gTW9yeWFrb3Yg5YaZ6YGTOgo+IFJlcG9ydCBvZiB0
aGUgc3RhdGljIGFuYWx5emVyOgo+IFRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGljIGV4cHJlc3Np
b24gJ3ZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzJyBpcyBhIHN1YmplY3QgdG8gb3ZlcmZs
b3cgYmVjYXVzZSBpdHMgb3BlcmFuZHMgYXJlIG5vdCBjYXN0IHRvIGEgbGFyZ2VyIGRhdGEgdHlw
ZSBiZWZvcmUgcGVyZm9ybWluZyBhcml0aG1ldGljCj4gCj4gQ29ycmVjdGlvbnMgZXhwbGFpbmVk
Ogo+IHRoZSBmaXggZW5zdXJlcyB2YWx1ZXMg4oCL4oCLYXJlIGNoZWNrZWQgYmVmb3JlIG11bHRp
cGxpY2F0aW9uLgo+IGFuIGV4Y2VwdGlvbiBjaGVjayBmb3IgdGhlIG5lZ2F0aXZpdHkgb2Ygdm9s
X2luZm8ubGViX3NpemUgYW5kIGFyZ3MubGVicyB3YXMgYWRkZWQsIGFzIHdlbGwgYXMgY2FzdGlu
ZyB2b2xfaW5mby5sZWJfc2l6ZSB0byB1aW50NjRfdAo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0
YXRpYyBhbmFseXplciBTdmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8
YW50LnYubW9yeWFrb3ZAZ21haWwuY29tPgo+IAo+IC0tLQo+ICAgdWJpLXV0aWxzL3ViaXJzdm9s
LmMgfCA2ICsrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCkhpIEFudG9uLiBQbGVhc2UgbWFrZSB0aGUgdGl0bGUgYmUgc29tZXRoaW5nIGxp
a2UgJ1tQQVRDSCBtdGQtdXRpbHNdIAp1YmktdXRpbHM6IHViaXJzdm9sOiBGaXggaW50ZWdlciBv
dmVyZmxvdyAuLi4nLgo+IAo+IGRpZmYgLS1naXQgYS91YmktdXRpbHMvdWJpcnN2b2wuYyBiL3Vi
aS11dGlscy91Ymlyc3ZvbC5jCj4gaW5kZXggMDg1NGFiYy4uODcyODZkNCAxMDA2NDQKPiAtLS0g
YS91YmktdXRpbHMvdWJpcnN2b2wuYwo+ICsrKyBiL3ViaS11dGlscy91Ymlyc3ZvbC5jCj4gQEAg
LTIzMCw4ICsyMzAsMTAgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiBjb25zdCBhcmd2W10p
Cj4gICAJCX0KPiAgIAl9Cj4gICAKPiAtCWlmIChhcmdzLmxlYnMgIT0gLTEpCj4gLQkJYXJncy5i
eXRlcyA9IHZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzOwo+ICsJaWYgKGFyZ3MubGVicyAh
PSAtMSl7Cj4gKwkJaWYodm9sX2luZm8ubGViX3NpemUgPiAwICYmIGFyZ3MubGVicyA+IDApCj4g
KwkJCWFyZ3MuYnl0ZXMgPSh1aW50NjRfdCl2b2xfaW5mby5sZWJfc2l6ZSAqIGFyZ3MubGViczsK
PiArCX0KClRoZSAnYXJncy5ieXRlcycgaXMgYSBsb25nIGxvbmcgdHlwZSB2YWx1ZSBhbmQgd2ls
bCBiZSBwYXJzZWQgYXMgczY0IGluIAppb2N0bChVQklfSU9DUlNWT0wpLCBzbyB3ZSBzaG91bGQg
Y29udmVydCB0aGUgdHlwZSBhcyAnbG9uZyBsb25nJyBvciAKJ2ludDY0X3QnLgpUaGUgJ3ZvbF9p
bmZvLmxlYl9zaXplJyBhbmQgJ2FyZ3MubGVicycgYXJlIGd1YXJhbnRlZWQgdG8gYmUgcG9zaXRp
dmUgCm51bWJlcnMgYnkgdWJpX2dldF92b2xfaW5mbzEoKSBhbmQgcGFyc2Vfb3B0KCksIHNvIHdl
IGNhbiB3cml0ZSB0aGlzIGxpa2U6CmlmIChhcmdzLmxlYnMgIT0gLTEpCglhcmdzLmJ5dGVzID0g
KGxvbmcgbG9uZyl2b2xfaW5mby5sZWJfc2l6ZSAqIGFyZ3MubGViczsKCj4gICAKPiAgIAllcnIg
PSB1YmlfcnN2b2wobGlidWJpLCBhcmdzLm5vZGUsIGFyZ3Mudm9sX2lkLCBhcmdzLmJ5dGVzKTsK
PiAgIAlpZiAoZXJyKSB7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
