Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C826E7717F
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 02:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4iA2BVcxDn6os3OLDVa/JuvvXwswlvzVUXG//mwOFk=; b=fVDegLo1+77mbAz+g0a41ZSyVt
	Sy6SwSF4YXfRY5+baTYeney/rqdT8L01CtZm3f8/KzZLLzLdyO/zs5XYKPF3Le822H+cO8FXmDuTL
	D92pxZJPkziTxhfGX221+A16wuY2PJVGpdE1tQ3KeogK1E5I72wSFDEuNcjFqWr8uCxXscBOfdr0y
	7K5WjwF3K3S/dLdBIUi8cuMPmfZTLN8eUqCeCg0lY4tEk1VbTn+TXrmcYBfzUql8nlLSm8IptVanb
	V7QcEJAtpLs4Fl8d8zGdaOie6AF8esYgp8fLoLjumCZA+ykoNT/kNY3MgHSCPpOKqPAEVg9sS8o04
	MjCXZC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMINN-00000005bGN-16by;
	Sat, 14 Dec 2024 02:59:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMINK-00000005bFS-0Xfw
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 02:59:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Y99nz6vs4zyNR6
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 10:56:23 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CD2A1800CE
	for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 10:59:18 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Dec 2024 10:59:17 +0800
Subject: Re: [PATCH mtd-utils] nand-utils: Fix integer overflow in
 nandflipbits.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241213131919.100987-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f8f360cb-da91-a44e-cf2f-7955ee33d3d4@huawei.com>
Date: Sat, 14 Dec 2024 10:59:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241213131919.100987-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_185926_321278_B26BA364 
X-CRM114-Status: GOOD (  13.41  )
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

1NogMjAyNC8xMi8xMyAyMToxOSwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdiaXRfdG9fZmxpcC0+YmxvY2sgKiBtdGQuZWJfc2l6ZSArIGJsa29mZnMnIGlzIGEgc3ViamVj
dCB0byBvdmVyZmxvdyBiZWNhdXNlIGl0cyBvcGVyYW5kcyBhcmUgbm90IGNhc3QgdG8gYSBsYXJn
ZXIgZGF0YSB0eXBlIGJlZm9yZSBwZXJmb3JtaW5nIGFyaXRoJAo+IAo+IENvcnJlY3Rpb25zIGV4
cGxhaW5lZDoKPiBQcmV2ZW50IGFyaXRobWV0aWMgb3ZlcmZsb3cgaW4gT09CIHJlYWQgb3BlcmF0
aW9uCj4gUmVzb2x2ZWQgYW4gaXNzdWUgd2hlcmUgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBvZmZz
ZXQgaW4gdGhlIE9PQiByZWFkIG9wZXJhdGlvbiBjb3VsZCBvdmVyZmxvdyBkdWUgdG8gb3BlcmFu
ZHMgbm90IGJlaW5nIGNhc3QgdG8gYSBsYXJnZXIgZGF0YSB0eXBlLiBTcGVjaWZpY2FsbHksIHRo
ZSBtdWx0aXBsaWNhdGlvbiBvZiBiaSQKPiAKPiBUcmlnZ2VycyBmb3VuZCBieSBzdGF0aWMgYW5h
bHl6ZXIgU3ZhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50b24gTW9yeWFrb3YgPGFudC52Lm1v
cnlha292QGdtYWlsLmNvbT4KPiAKPiAtLS0KPiAgIG5hbmQtdXRpbHMvbmFuZGZsaXBiaXRzLmMg
fCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvbmFuZC11dGlscy9uYW5kZmxpcGJpdHMuYyBiL25hbmQtdXRpbHMv
bmFuZGZsaXBiaXRzLmMKPiBpbmRleCA3MDY2NDA4Li5lZjY2M2M2IDEwMDY0NAo+IC0tLSBhL25h
bmQtdXRpbHMvbmFuZGZsaXBiaXRzLmMKPiArKysgYi9uYW5kLXV0aWxzL25hbmRmbGlwYml0cy5j
Cj4gQEAgLTI1MSw3ICsyNTEsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4g
ICAJCQlidWZvZmZzICs9IG10ZC5taW5faW9fc2l6ZTsKPiAgIAo+ICAgCQkJcmV0ID0gbXRkX3Jl
YWRfb29iKG10ZF9kZXNjLCAmbXRkLCBmZCwKPiAtCQkJCQkgICBiaXRfdG9fZmxpcC0+YmxvY2sg
KiBtdGQuZWJfc2l6ZSArCj4gKwkJCQkJICAgKHVuc2lnbmVkIGxvbmcgbG9uZyliaXRfdG9fZmxp
cC0+YmxvY2sgKiAobG9uZyBsb25nKW10ZC5lYl9zaXplICsKCkhpLCBBbnRvbi4gQ2hhbmdlIGl0
IGxpa2U6Cih1bnNpZ25lZCBsb25nIGxvbmcpYml0X3RvX2ZsaXAtPmJsb2NrICogbXRkLmViX3Np
emUgKyBibGtvZmZzCj4gICAJCQkJCSAgIGJsa29mZnMsCj4gICAJCQkJCSAgIG10ZC5vb2Jfc2l6
ZSwgYnVmZmVyICsgYnVmb2Zmcyk7Cj4gICAJCQlpZiAocmV0KSB7Cj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
