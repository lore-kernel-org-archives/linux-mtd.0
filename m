Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A362C021A0
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Feb 2025 05:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHSG3BuZlUGntAZZvEHgbNVc/zxCWhFzi2t9r8dfRWs=; b=myeybQSGo38H6YdLQwTOHcuLNC
	6CAY9dUmdhpCq5GdKv9p2KZ1+rWSCg1LP7MDgV7FnL6R2DtWKmfY0qUKUNiJRy9RAEisaUTlv4inB
	NcYcSYPiw6yFHmFWckDpqxiUoArGW+r6/hYA3cYlbRnvDCgqnaVniDjSot8CQmR2PWeqJFP79H1fJ
	RkxFot6FIw4QAaEeYNA5/fTQ1MtjOoSHKfRBRsZNtLZZzvlIGXKf9UIhhjVeTNzrDT3fqGiCXbbts
	nkME1l0aFyUO/PqC/nqJHgs86c8gbfjXGmPoS2mVehqXz2wCeYnlAB1p6oEv38bdyqXxLy1jtf20c
	D08T9yNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjAcn-0000000H2dh-2sbX;
	Sat, 15 Feb 2025 05:21:57 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjAck-0000000H2co-2BIS
	for linux-mtd@lists.infradead.org;
	Sat, 15 Feb 2025 05:21:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yvy1247snz1JL5J;
	Sat, 15 Feb 2025 13:20:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A40B21401E9;
	Sat, 15 Feb 2025 13:21:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 15 Feb 2025 13:21:47 +0800
Subject: Re: [RFC] UBI statistics and bitrot interface
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Ashley Herron <herroash@amazon.com>, <richard@nod.at>
CC: <alex@nextthing.co>, <boris.brezillon@free-electrons.com>,
	<linux-mtd@lists.infradead.org>, <rdlee@amazon.com>
References: <574215219.28176795.1739397523614.JavaMail.zimbra@nod.at>
 <20250214160419.18583-1-herroash@amazon.com>
 <4e774297-22e6-d175-e46f-3806cf511f45@huawei.com>
Message-ID: <a33dd13d-93ec-cdfe-8cc3-109522a666e1@huawei.com>
Date: Sat, 15 Feb 2025 13:21:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4e774297-22e6-d175-e46f-3806cf511f45@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_212154_745766_06887F56 
X-CRM114-Status: GOOD (  14.24  )
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

1NogMjAyNS8yLzE1IDEyOjU4LCBaaGloYW8gQ2hlbmcg0LS1wDoKPiDU2iAyMDI1LzIvMTUgMDow
NCwgQXNobGV5IEhlcnJvbiDQtLXAOgo+Pj4gSUlSQywgdGhpcyBwYXRjaGVzIGhhdmUgYmVlbiBw
YXJ0IG9mIG91ciBmYWlsZWQgYXBwcm9hY2ggdG8gc3VwcG9ydCBNTEMKPj4+IE5BTkQuIE9uZSBw
YXJ0IHdhcyBleHBvc2luZyBhIG1vcmUgb3IgbGVzcyBzb3BoaXN0aWNhdGVkIGludGVyZmFjZQo+
Pj4gdG8gdXNlcnNwYWNlIHN1Y2ggdGhhdCBhIE5BTkQgZmxhc2ggc3BlY2lmaWMgZGFlbW9uIGNh
biBmb3N0ZXIgdGhlIGNoaXAuCj4+Pgo+Pj4KPj4+IEFmdGVyIHNvbWUgaXRlcmF0aW9ucywgdWJp
aGVhbHRoZCB3YXMgYm9ybi4gQnV0IGl0IGRvZXMgbm90IHVzZSBhIAo+Pj4gc3RhdGlzdGljcwo+
Pj4gaW50ZXJmYWNlLgo+Pgo+PiBVbmZvcnR1bmF0ZWx5IHViaWhlYWx0aGQgd291bGRuJ3QgZml0
IHdoYXQgd2UgbmVlZC4KPj4KPj4+Cj4+PiBXaGF0IGtpbmQgb2YgbWV0cmljcyBhcmUgeW91IGxv
b2tpbmcgZm9yPwo+Pj4gTWF5YmUgc29tZSBlQlBGL3RyYWNpbmcgbWFnaWMgd2lsbCBhbHJlYWR5
IHNlcnZlIHlvdSBlbm91Z2ggZGF0YSBwb2ludHM/Cj4+Cj4+IFRoZSBnb2FsIGlzIHRvIGNhcHR1
cmUgc2ltaWxhciBkYXRhIGFzIGVNTUMgYW5kIFVGUyBkZXZpY2VzIHJlcG9ydCAKPj4gcmVnYXJk
aW5nCj4+IHRvdGFsIGJ5dGVzIHdyaXR0ZW4gdG8gdGhlIGJsb2NrIGRldmljZS4gU28gSSB3YW50
IHRvIGNhcHR1cmUgdG90YWwgCj4+IChwYXlsb2FkKQo+PiBieXRlcyB3cml0dGVuIGJ5IGNhbGxl
cnMgdG8gdGhlIFVCSSBsYXllciwgbm90IGluY2x1ZGluZyBVQkkgb3ZlcmhlYWQgCj4+IChoZWFk
ZXJzLAo+PiB3ZWFyIGxldmVsaW5nKS4gVGhpcyBpcyBmb3IgdGhlIHB1cnBvc2Ugb2YgbW9uaXRv
cmluZyBhbmQgaWRlbnRpZnlpbmcgYW55Cj4+IHBhdHRlcm4gb2YgZXhjZXNzaXZlIHdyaXRpbmcg
b24gZGV2aWNlcyBpbiBvcGVyYXRpb24gdGhhdCBtYXkgZWZmZWN0IGl0cwo+PiBsaWZldGltZS4g
Cj4gCj4+IFdlIG1heSB3YW50IHRvIG1vbml0b3IgdG90YWwgd3JpdGVzIHRvIGEgVUJJIGRldmlj
ZSBvdmVyIGEgMjQgaG91cgo+PiBwZXJpb2RzIG9yIGxlc3MsIHNvIG9ubHkgdXNpbmcgZXJhc2Ug
Y291bnRlciBtb25pdG9yaW5nIGRvZXNuJ3QgZ2l2ZSAKPj4gdXMgdGhlCj4+IGxldmVsIG9mIG1v
bml0b3Jpbmcgd2UgcmVxdWlyZS4gV2Ugd3JpdGUgdG8gc29tZSBVQkkgdm9sdW1lcyB1c2luZyBV
QklGUwo+PiBhbmQgb3RoZXJzIHVzaW5nIFVCSSBJTyBkaXJlY3RseS4gSSB3YXMgcGxhbm5pbmcg
dG8gYWRkIChvciByZXF1ZXN0IAo+PiB5b3UgYWRkKSBhCj4+IHdjICh3cml0ZSBjb3VudCkgdmFy
aWFibGUgdG8gdGhlIGN1cnJlbnQgc3RydWN0IHdpdGggZWMgYW5kIHJjIGluIHRoaXMgCj4+IHBh
dGNoc2V0Lgo+Pgo+IAo+IEkgdGhpbmsgZWJwZi90cmFjaW5nIHdpbGwgc2F0aXNmeSB5b3VyIHJl
cXVpcmVtZW50cyBieSBob29raW5nIGZ1bmN0aW9uIAo+IHViaV9lYmFfd3JpdGVfbGViKCkuCj4g
CgpGb2xsb3dpbmcgaXMgYW4gZXhhbXBsZSBjb2RlIHdyaXR0ZW4gaW4gYnBmLCB5b3UgY2FuIHJ1
biAnYnBmdHJhY2UgYS5idCcgCnRvIGdldCB0b3RhbCB3cml0dGVuIGJ5dGVzKGRhdGEgKyBtZXRh
IGRhdGFbdWJpZnNdKSBmb3IgZWFjaCB1YmkgZGV2aWNlOgoKMAoyMDQ4CjAKMjA0OAowCjIwNDgK
QHRvdGFsX2xlblswXTogMzY4NjQKCkB0b3RhbF9sZW5bMF06IDM2ODY0CgphLmJ0CnN0cnVjdCB1
YmlfZGV2aWNlIHsKCWNoYXIgcGFkWzB4MzQwXTsKCWludCB1YmlfbnVtOwp9OwoKa3Byb2JlOnVi
aV9lYmFfd3JpdGVfbGViCnsKCSR1YmlfbnVtID0gKChzdHJ1Y3QgdWJpX2RldmljZSAqKWFyZzAp
LT51YmlfbnVtOwoJJGxlbiA9IGFyZzU7CglwcmludCgkdWJpX251bSk7CglwcmludCgkbGVuKTsK
CUB0b3RhbF9sZW5bJHViaV9udW1dICs9ICRsZW47Cn0KCmk6czoxCnsKCXByaW50KEB0b3RhbF9s
ZW4pOwp9CgoKPj4gQ2hlZXJzLAo+PiBBc2hsZXkKPj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdAo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8KPj4gLgo+Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
