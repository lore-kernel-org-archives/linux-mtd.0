Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CCAD68BD0
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Nov 2024 02:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JqN/mebFZYj3uzzPk73BYnQYERF1XdTHARextNk6eQ=; b=F0QJIs2OAbcNFcM7bPpmgfs2JX
	SJRX4BNDwGGhNj/9IF9Te89UHHOs4lzlj5E7D+MXzfmzMcKVo3nEKZy06xb0ZutPyvQ2DHiKeU2FY
	9ldrl3DWzl/w0nSNd6TiEALVjKKL1gakP940pG0QNl/wcD3D9A0BbVKDaPmlb0+vNR8chZsNsUq81
	FyqQTdYNy3mLN6xirrPd/pHfNOGv3Jo88/M9V5of4IXI715UVub5dlo5BnWx2RM2jb253WFBaci9o
	cPSUqvCw25By7wuzuE7QTNdn1X8FqWy3Gdoy+sSC64GCoNnrwkiEewiN463m6VT7qig3j92QkkbvA
	bor3pSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC873-00000004l77-398Z;
	Sat, 16 Nov 2024 02:00:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC871-00000004l5P-0lrK
	for linux-mtd@lists.infradead.org;
	Sat, 16 Nov 2024 02:00:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xqxr85ZYxz10W33;
	Sat, 16 Nov 2024 09:58:32 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E48A2180087;
	Sat, 16 Nov 2024 10:00:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 16 Nov 2024 10:00:29 +0800
Subject: Re: [PATCH 1/2] ubifs: ubifs_jnl_write_inode: Only check once for the
 limitation of xattr count
To: Kees Bakker <kees@ijzerbout.nl>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240710022628.1227996-1-chengzhihao1@huawei.com>
 <20240710022628.1227996-2-chengzhihao1@huawei.com>
 <fdf9c621-cab1-4d0f-a6f7-93684fb20852@ijzerbout.nl>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <dcfd5b3f-77cb-f7f7-4ff3-f41576081cc9@huawei.com>
Date: Sat, 16 Nov 2024 10:00:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fdf9c621-cab1-4d0f-a6f7-93684fb20852@ijzerbout.nl>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_180035_411283_A52E852F 
X-CRM114-Status: GOOD (  15.03  )
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

5ZyoIDIwMjQvMTEvMTYgNjowMywgS2VlcyBCYWtrZXIg5YaZ6YGTOgo+IE9wIDEwLTA3LTIwMjQg
b20gMDQ6MjYgc2NocmVlZiBaaGloYW8gQ2hlbmc6Cj4+IE5vIG5lZWQgdG8gY2hlY2sgdGhlIGxp
bWl0YXRpb24gb2YgeGF0dHIgY291bnQgZXZlcnkgdGltZSBpbiBmdW5jdGlvbgo+PiB1Ymlmc19q
bmxfd3JpdGVfaW5vZGUoKSwgYmVjYXVzZSB0aGUgJ3VpLT54YXR0cl9jbnQnIHdvbid0IGJlIG1v
ZGlmaWVkCj4+IGJ5IG90aGVycyBpbiB0aGUgaW5vZGUgZXZpY3RpbmcgcHJvY2Vzcy4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPj4g
LS0tCj4+IMKgIGZzL3ViaWZzL2pvdXJuYWwuYyB8IDE0ICsrKysrKysrLS0tLS0tCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9mcy91Ymlmcy9qb3VybmFsLmMgYi9mcy91Ymlmcy9qb3VybmFsLmMKPj4gaW5kZXgg
NGEzNWY5ZThmNjY4Li5hNWM3YzQ5OWNjMjkgMTAwNjQ0Cj4+IC0tLSBhL2ZzL3ViaWZzL2pvdXJu
YWwuYwo+PiArKysgYi9mcy91Ymlmcy9qb3VybmFsLmMKPj4gQEAgLTk4MSw2ICs5ODEsMTQgQEAg
aW50IHViaWZzX2pubF93cml0ZV9pbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgCj4+IGNvbnN0
IHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+IMKgwqDCoMKgwqAgZGJnX2pubCgiaW5vICVsdSwgbmxp
bmsgJXUiLCBpbm9kZS0+aV9pbm8sIGlub2RlLT5pX25saW5rKTsKPj4gK8KgwqDCoCBpZiAoa2ls
bF94YXR0cnMpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICh1aS0+eGF0dHJfY250ID4gdWJpZnNf
eGF0dHJfbWF4X2NudChjKSkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlmc19lcnIo
YywgIkNhbm5vdCBkZWxldGUgaW5vZGUsIGl0IGhhcyB0b28gbXVjaCAKPj4geGF0dHJzISIpOwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1Ymlmc19yb19tb2RlKGMsIGVycik7Cj4gVGhlIGZ1
bmN0aW9uIHViaWZzX3JvX21vZGUgaXMgY2FsbGVkIHdpdGggYW4gdW5pbml0aWFsaXplZCBgZXJy
YC4KPiBDYW4geW91IHBsZWFzZSBsb29rIGF0IHRoaXMgYWdhaW4/CgpIaSBLZWVzLCB0aGFua3Mg
Zm9yIHJlbWluZGluZy4gTmF0aGFuIGhhcyBzZW50IGEgcGF0Y2ggdG8gZml4IGl0LgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvYjU2MGY0MTMtNzBmMS04ZWJiLTc0MDMtMzQ1OTE2
NThjYTg2QGh1YXdlaS5jb20vVC8jdAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVQRVJNOwo+PiArwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDC
oMKgIC8qCj4+IMKgwqDCoMKgwqDCoCAqIElmIHRoZSBpbm9kZSBpcyBiZWluZyBkZWxldGVkLCBk
byBub3Qgd3JpdGUgdGhlIGF0dGFjaGVkIAo+PiBkYXRhLiBObwo+PiDCoMKgwqDCoMKgwqAgKiBu
ZWVkIHRvIHN5bmNocm9uaXplIHRoZSB3cml0ZS1idWZmZXIgZWl0aGVyLgo+PiBbLi4uXQo+IC4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
