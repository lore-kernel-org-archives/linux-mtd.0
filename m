Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271ADCD6E68
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2026 04:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBgazIajK3NrQFUxpWfYcPwZOlcUFPvVRLsdtenGajs=; b=nm8CIZzRGvHHH0eU+9F1Ft3j3L
	KXJ5S2VyeKe44v8SuunF5ycQEvewjFwBESlXskkh1umcpeXhMnv+lESESdqd0O73gKNLKbMwpGw2q
	TFJq7I2otvIqKfgBBuWIbjStvx0RFHzI/yJ15hXlyyARNk/XEwhLxGm21yrYHwCwIekUUpeQZKKCs
	J+dOoxMPSFlC09a7e/NZGRlitKRbg/+xpilJVcXA0ll/uxYkKyhv4axcLU6qdNKnd6IBnpDd3OOVG
	yrdyXxX/XyDNo2jfbbK2AoGcUapDUPCJnVW+9QkYcyu/zG0FeU2xBMPAgIzHK4IOa/Bd35p8rLIms
	jlISg9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV094-0000000G9gY-0DHH;
	Thu, 04 Jun 2026 04:57:30 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV08z-0000000G9g4-1U37
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jun 2026 04:57:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Xt7Z8CvQocZHukF3FuazunMW/XtCXwhPn+4S63Rq0Is=;
	b=qRLv0QnStW5doqaevPiVWY+j8PxgoCe2UQC+iVagy00ZbNkfc8Wj/kaEneoNLFr/ByDIgPjfE
	TTnaVsMkchP1DyS76HSO5vcUAA5sIHcF2uN14MhbY+wgXcX6eQQP8uaWTokb5rZEZfNW+84Wmmd
	yBOZws9M1WqtglSWgxnkIAc=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gWBtK3rZcz1prKB;
	Thu,  4 Jun 2026 12:49:13 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7794240569;
	Thu,  4 Jun 2026 12:57:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 4 Jun 2026 12:57:05 +0800
Subject: Re: [PATCH 1/1] ubifs: fix slab-out-of-bounds in pack_inode via xattr
To: Ren Wei <n05ec@lzu.edu.cn>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <yuantan098@gmail.com>, <yifanwucs@gmail.com>,
	<tomapufckgml@gmail.com>, <bird@lzu.edu.cn>, <rakukuip@gmail.com>
References: <cover.1780496711.git.rakukuip@gmail.com>
 <28e06b0bb4babfb7138beb31efa2c6bb1400ea36.1780496711.git.rakukuip@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <838ee423-c57d-51a1-0524-6e0d585a2a29@huawei.com>
Date: Thu, 4 Jun 2026 12:57:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <28e06b0bb4babfb7138beb31efa2c6bb1400ea36.1780496711.git.rakukuip@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_215726_056019_99498B13 
X-CRM114-Status: GOOD (  22.75  )
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

1NogMjAyNi82LzQgMDozNywgUmVuIFdlaSDQtLXAOgo+IEZyb206IEx1eGlhbyBYdSA8cmFrdWt1
aXBAZ21haWwuY29tPgo+IAo+IEFuIGlzc3VlIGluIGZzL3ViaWZzL2pvdXJuYWwuYyB3YXMgZm91
bmQgd2hlcmUgYSBtYWxpY2lvdXMgb3IgY29ycnVwdGVkCj4gdWJpZnMgaW1hZ2UgY291bGQgdHJp
Z2dlciBhIHNsYWItb3V0LW9mLWJvdW5kcyB3cml0ZSBpbiBwYWNrX2lub2RlKCkuCj4gCj4gV2hl
biBhbiBpbm9kZSB3aXRoIGV4dGVuZGVkIGF0dHJpYnV0ZXMgKHhhdHRycykgaXMgYmVpbmcgZXZp
Y3RlZCBvcgo+IGRlbGV0ZWQgKGkuZS4sICdsYXN0X3JlZmVyZW5jZScgYW5kICdraWxsX3hhdHRy
cycgYXJlIHRydWUpLAo+IHViaWZzX2pubF93cml0ZV9pbm9kZSgpIGNhbGN1bGF0ZXMgdGhlIGFs
bG9jYXRpb24gc2l6ZSAnd3JpdGVfbGVuJwo+IGJhc2VkIG9uICd1aS0+eGF0dHJfY250JyBmcm9t
IHRoZSBkaXNrLgo+IAo+IEhvd2V2ZXIsIGlmICd1aS0+eGF0dHJfY250JyBpcyBtYWxpY2lvdXNs
eSB0YW1wZXJlZCB3aXRoIG9yIGNvcnJ1cHRlZAo+IHRvIGJlIHNtYWxsZXIgdGhhbiB0aGUgYWN0
dWFsIG51bWJlciBvZiB4YXR0ciBlbnRyaWVzIHN0b3JlZCBpbiB0aGUKPiBUTkMgKFRyZWUgTm9k
ZSBDYWNoZSksIGttYWxsb2MoKSB3aWxsIGFsbG9jYXRlIGFuIHVuZGVyc2l6ZWQgYnVmZmVyLgo+
IFRoZSBzdWJzZXF1ZW50ICd3aGlsZSAoMSknIGxvb3AgY29udGludWVzIHRvIGl0ZXJhdGUgdGhy
b3VnaCBhbGwgYWN0dWFsCj4geGF0dHIgZW50cmllcyB2aWEgdWJpZnNfdG5jX25leHRfZW50KCks
IGFkdmFuY2luZyB0aGUgJ2lubycgcG9pbnRlcgo+IGFuZCBpbnZva2luZyBwYWNrX2lub2RlKCkg
Zm9yIGVhY2ggZW50cnkuIFRoaXMgbWlzbWF0Y2ggbGVhZHMgdG8gYW4KPiBvdXQtb2YtYm91bmRz
IG1lbW9yeSB3cml0ZSwgY29ycnVwdGluZyB0aGUgc2xhYiByZWR6b25lIGFuZCB0cmlnZ2VyaW5n
Cj4gYSBLQVNBTiBwYW5pYy4KPiAKPiBGaXggdGhpcyBieSBpbnRyb2R1Y2luZyBhIHN0cmljdCBj
b3VudGVyICd4YXR0cnNfZGVsZXRlZCcgd2l0aGluIHRoZQo+IGRlbGV0aW9uIGxvb3AuIFRoZSBs
b29wIGlzIGFib3J0ZWQgd2l0aCAtRVVDTEVBTiBpZiB0aGUgbnVtYmVyIG9mCj4gcHJvY2Vzc2Vk
IHhhdHRycyBleGNlZWRzICd1aS0+eGF0dHJfY250JywgcHJldmVudGluZyAnaW5vJyBmcm9tCj4g
b3ZlcmZsb3dpbmcgdGhlIGFsbG9jYXRlZCBrbWFsbG9jIGJ1ZmZlci4KPiAKPiBUaGUgYnVnIGlz
IHJlYWNoYWJsZSBieSBhIG5vbi1yb290IHVzZXIgdmlhIHVzZXIgYW5kIG5ldCBuYW1lc3BhY2Uu
Cj4gCj4gRml4ZXM6IDc5NTljZjNhNzUwNiAoInViaWZzOiBqb3VybmFsOiBIYW5kbGUgeGF0dHJz
IGxpa2UgZmlsZXMiKQo+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+IFJlcG9ydGVkLWJ5OiBZdWFu
IFRhbiA8eXVhbnRhbjA5OEBnbWFpbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IFlpZmFuIFd1IDx5aWZh
bnd1Y3NAZ21haWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBKdWVmZWkgUHUgPHRvbWFwdWZja2dtbEBn
bWFpbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IFhpbiBMaXUgPGJpcmRAbHp1LmVkdS5jbj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdXhpYW8gWHUgPHJha3VrdWlwQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBSZW4gV2VpIDxuMDVlY0BsenUuZWR1LmNuPgo+IC0tLQo+ICAgZnMvdWJpZnMvam91cm5hbC5j
IHwgOSArKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAKCkhp
IEx1eGlhbywKRWFjaCBtZXRhZGF0YShpbm9kZS9kZW50cnkpIGVudHJ5IHdpbGwgY2hlY2tlZCB3
aXRoIGNyYyB3aGlsZSBsb2FkaW5nIApmcm9tIGZsYXNoKHNlZSB1Ymlmc19yZWFkX25vZGUtPnVi
aWZzX2NoZWNrX25vZGUpLCBJIGRvbid0IHRoaW5rIApjb3JydXB0ZWQgaW1hZ2Ugd2lsbCB0cmln
Z2VyIHRoZSBwcm9ibGVtLCBiZWNhdXNlIAp1Ymlmc19sb29rdXAtPnViaWZzX2lnZXQgd2lsbCBm
YWlsIGFmdGVyIGRldGVjdGluZyBjcmMgZXJyb3IuIFVubGVzcyAKc29tZW9uZSBtYW51YWxseSBp
bmplY3Qgd29uZyBudW1iZXIgaW50byAndWktPnhhdHRyX2NudCcgZmllbGVkIGFuZCAKdXBkYXRl
IHRoZSB3aG9sZSBpbm8gbm9kZSBjcmMsIGFuZCBJIGRvbid0IHRoaW5rIGl0IGlzIGEgcmVhbCBw
cm9ibGVtIApuZWVkIHRvIGJlIGZpeGVkLiBJbiB0aGF0IGluamVjdGlvbiBtZXRob2QsIG5vIG9u
ZSBmaWxlc3lzdGVtIGlzIG9rYXkuClRoZSBiaXRmbGlwcyBoYXBwZW4gYm90aCBpbiBub2RlIGZp
ZWxkKGVnLiB4YXR0cl9jbnQpIGFuZCBjcmMgZmllbGQgaXMgCmFuIGFsbW9zdCBpbXBvc3NpYmxl
IHRoaW5nLgo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9qb3VybmFsLmMgYi9mcy91Ymlmcy9qb3Vy
bmFsLmMKPiBpbmRleCBkMDI1MDk5MjBiYWYuLjc4ZmU5ZDJhMzE3OCAxMDA2NDQKPiAtLS0gYS9m
cy91Ymlmcy9qb3VybmFsLmMKPiArKysgYi9mcy91Ymlmcy9qb3VybmFsLmMKPiBAQCAtODgwLDYg
Kzg4MCw3IEBAIGludCB1Ymlmc19qbmxfd3JpdGVfaW5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMs
IGNvbnN0IHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4gICAJCXN0cnVjdCBmc2NyeXB0X25hbWUgbm0g
PSB7MH07Cj4gICAJCXN0cnVjdCBpbm9kZSAqeGlubzsKPiAgIAkJc3RydWN0IHViaWZzX2RlbnRf
bm9kZSAqeGVudCwgKnB4ZW50ID0gTlVMTDsKPiArCQlpbnQgeGF0dHJzX2RlbGV0ZWQgPSAwOwo+
ICAgCj4gICAJCWlmICh1aS0+eGF0dHJfY250ID4gdWJpZnNfeGF0dHJfbWF4X2NudChjKSkgewo+
ICAgCQkJZXJyID0gLUVQRVJNOwo+IEBAIC04OTksNiArOTAwLDE0IEBAIGludCB1Ymlmc19qbmxf
d3JpdGVfaW5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAqaW5v
ZGUpCj4gICAJCQkJZ290byBvdXRfcmVsZWFzZTsKPiAgIAkJCX0KPiAgIAo+ICsJCQlpZiAoeGF0
dHJzX2RlbGV0ZWQgPj0gdWktPnhhdHRyX2NudCkgewo+ICsJCQkJa2ZyZWUocHhlbnQpOwo+ICsJ
CQkJa2ZyZWUoeGVudCk7Cj4gKwkJCQllcnIgPSAtRVVDTEVBTjsKPiArCQkJCXViaWZzX2Vycihj
LCAieGF0dHIgY291bnQgbWlzbWF0Y2ggZm9yIGlubyAlbHUiLCBpbm9kZS0+aV9pbm8pOwo+ICsJ
CQkJZ290byBvdXRfcmVsZWFzZTsKPiArCQkJfQo+ICsKPiAgIAkJCWZuYW1lX25hbWUoJm5tKSA9
IHhlbnQtPm5hbWU7Cj4gICAJCQlmbmFtZV9sZW4oJm5tKSA9IGxlMTZfdG9fY3B1KHhlbnQtPm5s
ZW4pOwo+ICAgCj4gQEAgLTkxNyw2ICs5MjYsNyBAQCBpbnQgdWJpZnNfam5sX3dyaXRlX2lub2Rl
KHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ICAgCQkJ
Y2xlYXJfbmxpbmsoeGlubyk7Cj4gICAJCQlwYWNrX2lub2RlKGMsIGlubywgeGlubywgMCk7Cj4g
ICAJCQlpbm8gPSAodm9pZCAqKWlubyArIFVCSUZTX0lOT19OT0RFX1NaOwo+ICsJCQl4YXR0cnNf
ZGVsZXRlZCsrOwo+ICAgCQkJaXB1dCh4aW5vKTsKPiAgIAo+ICAgCQkJa2ZyZWUocHhlbnQpOwo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
