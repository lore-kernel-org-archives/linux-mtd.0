Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4DFC54E58
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0RgQBmGAO/1LXOdYxq1GfY+qXpr0dNI2MTQzwez/78=; b=TZMy+6u7qM54jlI6zcsU+7NUP2
	AQIrVvSI/HQ/neoRSrwwCDK3zsimKz8edmqRANIRFxmUnsWenUgzLWRnaIfUG+49dbJB83tTzpIub
	/L+kv9tdJDXKCB6tWruWhhXH1fRNlCt9kNbI1PbwKxgTd7ak5AP+syqRCopkrJQP2z434sB4w4cpU
	S53/nqwzV2SYJFCgmyzAzJNtZXUQX6Ls7TUdTMatLaIhnAHXxiS38YtYjUxdV8eKL6bus3xJ4mUHH
	9KOYcPr1WCCXgayO5z8oHSmQknYcrN4JZHuFcnN7SymzXHLpFwTl6HEaNcywCVjhGraa/LXVT2i1f
	5t1I19nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5bd-000000000UZ-3uI1;
	Fri, 15 Mar 2024 11:20:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5bZ-000000000RC-3SG1
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 11:20:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Tx1tT3VjvzwPFL;
	Fri, 15 Mar 2024 19:17:21 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id BE9941400CD;
	Fri, 15 Mar 2024 19:19:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 19:19:33 +0800
Subject: Re: [RFC PATCH] jffs2: fix recursive fs_reclaim deadlock
To: Qingfang Deng <dqfext@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240315075946.587679-1-dqfext@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ff19df82-3fd4-9098-667c-0502b2452334@huawei.com>
Date: Fri, 15 Mar 2024 19:19:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240315075946.587679-1-dqfext@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_042006_212582_E561EC00 
X-CRM114-Status: GOOD (  15.21  )
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

1NogMjAyNC8zLzE1IDE1OjU5LCBRaW5nZmFuZyBEZW5nINC0tcA6Cj4gV2hlbiB0ZXN0aW5nIGpm
ZnMyIG9uIGEgbWVtb3J5LWNvbnN0cmFpbmVkIHN5c3RlbSwgbG9ja2RlcCBkZXRlY3RlZCBhCj4g
cG9zc2libGUgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5Lgo+IAo+IGtzd2FwZDAvMjY2IGlz
IHRyeWluZyB0byBhY3F1aXJlIGxvY2s6Cj4gZmZmZmZmODAyODY1ZTUwOCAoJmYtPnNlbSl7Ky4r
Ln0tezM6M30sIGF0OiBqZmZzMl9kb19jbGVhcl9pbm9kZSsweDQ0LzB4MjAwCj4gCj4gYnV0IHRh
c2sgaXMgYWxyZWFkeSBob2xkaW5nIGxvY2s6Cj4gZmZmZmZmZDAxMGU4NDNjMCAoZnNfcmVjbGFp
bSl7Ky4rLn0tezA6MH0sIGF0OiBfX2ZzX3JlY2xhaW1fYWNxdWlyZSsweDAvMHg0MAo+IAo+IHdo
aWNoIGxvY2sgYWxyZWFkeSBkZXBlbmRzIG9uIHRoZSBuZXcgbG9jay4KPiAKPiB0aGUgZXhpc3Rp
bmcgZGVwZW5kZW5jeSBjaGFpbiAoaW4gcmV2ZXJzZSBvcmRlcikgaXM6Cj4gCj4gLT4gIzEgKGZz
X3JlY2xhaW0peysuKy59LXswOjB9Ogo+ICAgICAgICAgbG9ja19hY3F1aXJlKzB4NmMvMHg5MAo+
ICAgICAgICAgZnNfcmVjbGFpbV9hY3F1aXJlKzB4N2MvMHhhMAo+ICAgICAgICAga21lbV9jYWNo
ZV9hbGxvYysweDVjLzB4NDAwCj4gICAgICAgICBqZmZzMl9hbGxvY19pbm9kZV9jYWNoZSsweDE4
LzB4MjAKPiAgICAgICAgIGpmZnMyX2RvX3JlYWRfaW5vZGUrMHgxZTAvMHgzMTAKPiAgICAgICAg
IGpmZnMyX2lnZXQrMHgxNTQvMHg1NDAKPiAgICAgICAgIGpmZnMyX2RvX2ZpbGxfc3VwZXIrMHgy
MTQvMHgzZjAKPiAgICAgICAgIGpmZnMyX2ZpbGxfc3VwZXIrMHgxMzgvMHgxODAKPiAgICAgICAg
IG10ZF9nZXRfc2IrMHhjYy8weDEyMAo+ICAgICAgICAgZ2V0X3RyZWVfbXRkKzB4MTY4LzB4NDAw
Cj4gICAgICAgICBqZmZzMl9nZXRfdHJlZSsweDE0LzB4MjAKPiAgICAgICAgIHZmc19nZXRfdHJl
ZSsweDQ4LzB4MTMwCj4gICAgICAgICBwYXRoX21vdW50KzB4YTY0LzB4MTJkMAo+ICAgICAgICAg
X19hcm02NF9zeXNfbW91bnQrMHgzNjgvMHgzZTAKPiAgICAgICAgIGRvX2VsMF9zdmMrMHhhMC8w
eDE0MAo+ICAgICAgICAgZWwwX3N2YysweDFjLzB4MzAKPiAgICAgICAgIGVsMF9zeW5jX2hhbmRs
ZXIrMHg5Yy8weDEyMAo+ICAgICAgICAgZWwwX3N5bmMrMHgxNDgvMHgxODAKPiAKPiAtPiAjMCAo
JmYtPnNlbSl7Ky4rLn0tezM6M306Cj4gICAgICAgICBfX2xvY2tfYWNxdWlyZSsweDE4Y2MvMHgy
YmIwCj4gICAgICAgICBsb2NrX2FjcXVpcmUucGFydC4wKzB4MTcwLzB4MmUwCj4gICAgICAgICBs
b2NrX2FjcXVpcmUrMHg2Yy8weDkwCj4gICAgICAgICBfX211dGV4X2xvY2srMHgxMGMvMHhhYTAK
PiAgICAgICAgIG11dGV4X2xvY2tfbmVzdGVkKzB4NTQvMHg4MAo+ICAgICAgICAgamZmczJfZG9f
Y2xlYXJfaW5vZGUrMHg0NC8weDIwMAo+ICAgICAgICAgamZmczJfZXZpY3RfaW5vZGUrMHg0NC8w
eDUwCj4gICAgICAgICBldmljdCsweDEyMC8weDI5MAo+ICAgICAgICAgZGlzcG9zZV9saXN0KzB4
ODgvMHhkMAo+ICAgICAgICAgcHJ1bmVfaWNhY2hlX3NiKzB4YTgvMHhkMAo+ICAgICAgICAgc3Vw
ZXJfY2FjaGVfc2NhbisweDFjNC8weDI0MAo+ICAgICAgICAgc2hyaW5rX3NsYWIuY29uc3Rwcm9w
LjArMHgyYTAvMHg3ZjAKPiAgICAgICAgIHNocmlua19ub2RlKzB4Mzk4LzB4OGUwCj4gICAgICAg
ICBiYWxhbmNlX3BnZGF0KzB4MjY4LzB4NTUwCj4gICAgICAgICBrc3dhcGQrMHgxNTQvMHg3YzAK
PiAgICAgICAgIGt0aHJlYWQrMHgxZjAvMHgyMDAKPiAgICAgICAgIHJldF9mcm9tX2ZvcmsrMHgx
MC8weDIwCj4gCkkgdGhpbmsgaXQncyBhIGZhbHNlIHBvc2l0aXZlIHdhcm5pbmcuIEpmZnMyIGlz
IHRyeWluZyB0byBnZXQgcm9vdCBpbm9kZSAKaW4gcHJvY2VzcyAnIzEnLCB3aGljaCBtZWFucyB0
aGF0IHRoZSBmaWxlc3lzdGVtIGlzIG5vdCBtb3VudGVkIAp5ZXQoQmVjYXVzZSBkX21ha2Vfcm9v
dCBpcyBhZnRlciBqZmZzMl9pZ2V0KHNiLDEpLCB0aGVyZSBpcyBubyB3YXkgdG8gCmFjY2VzcyBv
dGhlciBpbm9kZXMuKSwgc28gaXQgaXMgaW1wb3NzaWJsZSB0aGF0IGpmZnMyIGlub2RlIGlzIGJl
aW5nIApldmljdGVkIGluICcjMCcuCj4gb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhlbHAgdXMgZGVi
dWcgdGhpczoKPiAKPiAgIFBvc3NpYmxlIHVuc2FmZSBsb2NraW5nIHNjZW5hcmlvOgo+IAo+ICAg
ICAgICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgQ1BVMQo+ICAgICAgICAgLS0tLSAgICAgICAg
ICAgICAgICAgICAgLS0tLQo+ICAgIGxvY2soZnNfcmVjbGFpbSk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsb2NrKCZmLT5zZW0pOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbG9jayhmc19yZWNsYWltKTsKPiAgICBsb2NrKCZmLT5zZW0pOwo+IAo+ICAgKioq
IERFQURMT0NLICoqKgo+IAo+IDMgbG9ja3MgaGVsZCBieSBrc3dhcGQwLzI2NjoKPiAgICMwOiBm
ZmZmZmZkMDEwZTg0M2MwIChmc19yZWNsYWltKXsrLisufS17MDowfSwgYXQ6IF9fZnNfcmVjbGFp
bV9hY3F1aXJlKzB4MC8weDQwCj4gICAjMTogZmZmZmZmZDAxMGU2MmViMCAoc2hyaW5rZXJfcndz
ZW0peysrKyt9LXszOjN9LCBhdDogc2hyaW5rX3NsYWIuY29uc3Rwcm9wLjArMHg3OC8weDdmMAo+
ICAgIzI6IGZmZmZmZjgwMjI1MzQwZTAgKCZ0eXBlLT5zX3Vtb3VudF9rZXkjNDApey4rLit9LXsz
OjN9LCBhdDogc3VwZXJfY2FjaGVfc2NhbisweDNjLzB4MjQwCj4gCj4gSXQgdHVybnMgb3V0IGpm
ZnMyIHVzZXMgR0ZQX0tFUk5FTCBhcyB0aGUgbWVtb3J5IGFsbG9jYXRpb24gZmxhZ3MKPiB0aHJv
dWdob3V0IHRoZSBjb2RlLCBhbmQgY29tbW9ubHksIGluc2lkZSB0aGUgY3JpdGljYWwgc2VjdGlv
biBvZgo+IGpmZnMyX2lub2RlX2luZm86OnNlbS4gV2hlbiBydW5uaW5nIGxvdyBvbiBtZW1vcnks
IGFueSBhbGxvY2F0aW9uIHdpdGhpbgo+IHRoZSBjcml0aWNhbCBzZWN0aW9uIG1heSB0cmlnZ2Vy
IGEgZGlyZWN0IHJlY2xhaW0sIHdoaWNoIHJlY3Vyc2VzIGJhY2sKPiB0byBqZmZzMl9kb19jbGVh
cl9pbm9kZSgpLgo+IAo+IFJlcGxhY2UgR0ZQX0tFUk5FTCB3aXRoIEdGUF9OT0ZTIHRvIGF2b2lk
IHRoZSByZWN1cnNpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogUWluZ2ZhbmcgRGVuZyA8ZHFmZXh0
QGdtYWlsLmNvbT4KPiAtLS0KPiBYWFg6IFBvc3RpbmcgdGhpcyBhcyBSRkMsIGFzIEkgZG9uJ3Qg
a25vdyBpZiBhbGwgR0ZQX0tFUk5FTCBvY2N1cnJlbmNlcwo+IHNob3VsZCBiZSByZXBsYWNlZCwg
b3IgaWYgdGhpcyBpcyBqdXN0IGEgZmFsc2UgcG9zaXRpdmUuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
