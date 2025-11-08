Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB4ACCF9F8
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Nov 2025 03:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nc/yj5u5RJ+LIOpl8H8fpPYdW/fWZNJndmAG46nsAKI=; b=x2lcIQICkgoPkfZpueKtxrzf4B
	10lU9gBjP8McEbGNWWNbvomvRqwEfGY0GxItKZ/qHOQS+bH4WJ+nOyeiw1YazHCJp6C4ZPIuXJ8ZQ
	o6UNE5qQviz8NWFopFgub9jw4FyE11r4NiSIPm1jenmSYo29/hQ/ayeUVPdn5nW7gabHbvdxnCd34
	cKpnvEXiEjbWCSV1nFlZqWF9u0iM7Qsfyt3Pg2EnM1EgpB2x57fIWVHBAljAJ9orxqpNKzEF+6Fpq
	Nrms1wAXGsScVWAdp0JkJ6kFcgfdQzxC4XjM7v5qtOWWnaha0jh4/7SHG5if0QLBe7hwMAXB5x+8Z
	WG1yUprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZF9-00000002EvM-1Ojn;
	Sat, 08 Nov 2025 03:03:59 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZF5-00000002EsO-1E7W
	for linux-mtd@lists.infradead.org;
	Sat, 08 Nov 2025 03:03:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aeOxMzJ+i3IvySd7PiH9VVEq2pkYuGK1IybeIZufS9s=;
	b=g6Kcxc39M5z0HarPRlDQvDmT5RWQ7Oy5k6O+0cs6isVoOs5A04mX+zNuHttY3AFR6BCr7lVur
	pDJJhKYH2Nq2PZXMbgUmWx8z6/tpHeznO66HSGBhbx3J//OxLYa+qXgn69nW+pp5JTp6kAYv4bH
	sE80RxNBvs+1fEMD7bdtgKs=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4d3LLh1fn9zpStp;
	Sat,  8 Nov 2025 11:02:04 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A4412180493;
	Sat,  8 Nov 2025 11:03:39 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 8 Nov 2025 11:03:38 +0800
Subject: Re: UBIFS errors since Linux 5.15
To: Eddie James <eajames@linux.ibm.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, <sethjenkins@google.com>,
	<adobriyan@gmail.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <183bacc4-3e27-59a7-ceb5-0bcac7d566e9@huawei.com>
Date: Sat, 8 Nov 2025 11:03:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_190355_901088_B2402863 
X-CRM114-Status: GOOD (  12.93  )
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

5ZyoIDIwMjUvMTEvOCAxOjM4LCBFZGRpZSBKYW1lcyDlhpnpgZM6Cj4gCj4gSGVsbG8sCj4gCj4g
V2UgYXJlIHVwZGF0aW5nIHNvbWUgQk1DIChBc3BlZWQgQVNUMjYwMCwgQVJNMzIpIHN5c3RlbXMg
dGhhdCB3ZXJlIG9uIAo+IExpbnV4IDUuNCBidXQgb2JzZXJ2ZSBjb25zaXN0ZW50IFVCSUZTIGVy
cm9ycyB3aXRoIExpbnV4IDUuMTUgYW5kIGxhdGVyLiAKPiBUaGUgZXJyb3JzIHNlZW0gdG8gdmFy
eTsgdGhlcmUgaXMgYSBzYW1wbGluZyBiZWxvdy4KPiAKPiAKPiBXZSBwZXJmb3JtZWQgYSBnaXQg
YmlzZWN0IGFuZCBjYW1lIHVwIHdpdGggdGhlIGZvbGxvd2luZyBjb21taXQsIHdoaWNoIAo+IG9m
IGNvdXJzZSBpcyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byBVQklGUy4gUmV2ZXJ0aW5nIGl0IGRv
ZXMgcHJldmVudCAKPiB0aGUgaXNzdWUuLi4gRG9lcyBhbnlvbmUgaGF2ZSBhbnkgc3VnZ2VzdGlv
bnM/Cj4gCj4gY29tbWl0IDMzZmM5ZTI2YjdjYjM5ZjBkNDIxOWM4NzVhMjQ1MTgwMjI0OWMyMjUK
Wy4uLl0KPiBbwqAgwqAgOC4xODA0ODZdIFVCSUZTIGVycm9yICh1YmkwOjIgcGlkIDY2KTogdWJp
ZnNfY2hlY2tfbm9kZTogYmFkIG1hZ2ljIAo+IDB4MTAxODMxLCBleHBlY3RlZCAweDYxMDE4MzEK
CkhpLCBsb29rIGhlcmUsIHRoZSBtYWdpYyBudW1iZXIgMHgxMDE4MzEgdnMgMHg2MTAxODMxLCB0
aGUgZGlmZmVyZW5jZSBpcyAKdGhlIGhpZ2hlc3QgYml0KDAgdnMgNlswMTEwXSkKPiBbwqAgwqAg
OC4xODk1NzhdIFVCSUZTIGVycm9yICh1YmkwOjIgcGlkIDY2KTogdWJpZnNfY2hlY2tfbm9kZTog
YmFkIG5vZGUgCj4gYXQgTEVCIDE3OjY0NjY0CgpbLi4uXQo+IFsgMzczOS42Nzg5NjhdIFVCSUZT
IGVycm9yICh1YmkwOjIgcGlkIDEzKTogdWJpZnNfY2hlY2tfbm9kZTogYmFkIENSQzogCj4gY2Fs
Y3VsYXRlZCAweDkxNzlhZjI5LCByZWFkIDB4YTc2MGY0ZjUKClsuLi5dCj4gWzEwNDEyLjcyMzEx
MV0gVUJJRlMgZXJyb3IgKHViaTA6MiBwaWQgMjk3KTogdWJpZnNfY2hlY2tfbm9kZTogYmFkIG1h
Z2ljIAo+IDB4NjEwMDgzMCwgZXhwZWN0ZWQgMHg2MTAxODMxCgphbmQgdGhlcmUsIG1hZ2ljIG51
bWJlciAweDYxMDA4MzAgdnMgMHg2MTAxODMxLCB0aGUgZGlmZmVyZW5jZSBpcyBsb3dlc3QgCmJp
dCgwIHZzIDEpLgoKU28sIEkgZ3Vlc3MgdGhlIGNyYyBlcnJvciBpcyBjYXVzZWQgYnkgdGhlIHNp
bWlsYXIgcmVhc29uLCBtYXliZSB0aGVyZSAKaXMgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlIG5h
bmQgZHJpdmVyIG9yIGZsYXNoPyBBY2NvcmRpbmcgdG8gdGhlIAp2ZXJzaW9uIGluZm9ybWF0aW9u
KDUuMTUsIGFuZCB0aGUgdW5yZWxhdGVkIGNvbW1pdCAzM2ZjOWUyNmI3Y2IzKSwgaXMgaXQgCnBv
c3NpYmxlIHRoYXQgdGhlcmUgaXMgYSBjb21wYXRpYmlsaXR5IGlzc3VlIGJldHdlZW4geW91ciBu
YW5kKGJzcCkgCmRyaXZlciB3aXRoIGtlcm5lbCBuYW5kIGNvbW1vbiBsYXllcih3aGljaCBmcm9t
IGRpZmZlcmVudCB2ZXJzaW9ucyk/Cgo+IFsxMDQxMi43MzI0MzZdIFVCSUZTIGVycm9yICh1Ymkw
OjIgcGlkIDI5Nyk6IHViaWZzX2NoZWNrX25vZGU6IGJhZCBub2RlIAo+IGF0IExFQiAxMzo2MDI0
OAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
