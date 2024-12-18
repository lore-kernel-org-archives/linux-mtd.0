Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2DCE77184
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 02:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrUqxM1kmZlumoPK1s4dTWYC+cmNpvTau9YrGgwDkFQ=; b=4DXt0jKtSmkZEWYHerlWsFEKpc
	yRz8uY3TUzQ2reiYDCPuzdCH8MvV0t+sEx89fPBubFgRySE1F9tqYyTg+DQ962kdpPbGK/kEbGVmT
	7VmPkiajKCeIbnYbVznNHs4I4fsbRdUuJg1ulBYxqYXbartNtcLibAYp6BGwQS93fOCmNatFnoo6y
	+wx23/WlTx8c75GYm/4SMPNntqQMDhaCtfG9SpfuAtkrkZlbH4MZC7NiyPFhJIDUBOViej0lTdFWN
	KHqLH5l7ofWCl7SK4ZfDnY2zJCXK5xT4X4OkEwbQxm01lRkHzyJzwOXvvXtWlOkF8VLSRX5DwJTy4
	CeP0eLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNk9E-0000000FQuq-0XI5;
	Wed, 18 Dec 2024 02:50:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNk9A-0000000FQuH-3Xvh
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 02:50:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YCdPq1DRKz1V6fv
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 10:47:27 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 69B8E1800D9
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 10:50:41 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Dec 2024 10:50:40 +0800
Subject: Re: [PATCH mtd-utils] nand-utils: Fix integer overflow in
 nandflipbits.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241217163653.298586-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <d9ca5f92-cf0c-ff53-7609-7ba10886b6ef@huawei.com>
Date: Wed, 18 Dec 2024 10:50:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241217163653.298586-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_185049_045884_9A4F4BFE 
X-CRM114-Status: GOOD (  15.05  )
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

5ZyoIDIwMjQvMTIvMTggMDozNiwgQW50b24gTW9yeWFrb3Yg5YaZ6YGTOgo+IFJlcG9ydCBvZiB0
aGUgc3RhdGljIGFuYWx5emVyOgo+IFRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGljIGV4cHJlc3Np
b24gJ3BhZ2UgKiAobXRkLm1pbl9pb19zaXplICsgbXRkLm9vYl9zaXplKScgaXMgYSBzdWJqZWN0
IHRvIG92ZXJmbG93IGJlY2F1c2UgaXRzIG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdl
ciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZvcm1pbmcgYXJpdGhtZXRpYwo+IAo+IENvcnJlY3Rpb25z
IGV4cGxhaW5lZDoKPiBDYXN0aW5nIGJpdF90b19mbGlwLT5ibG9jayB0byB1bnNpZ25lZCBsb25n
IGxvbmcgZXhwYW5kcyB0aGUgcmFuZ2Ugb2YgdmFsdWVzIOKAi+KAi2FuZCBhbGxvd3MgdGhlIHJl
c3VsdCBvZiB0aGUgbXVsdGlwbGljYXRpb24gdG8gYmUgY2FsY3VsYXRlZCBpbiBhIHdpZGVyIGRh
dGEgdHlwZS4KPiBUaGUgYXJpdGhtZXRpYyBpcyBwZXJmb3JtZWQgaW4gYSBzYWZlIHJhbmdlLCBw
cmV2ZW50aW5nIG92ZXJmbG93Lgo+IFN1bSArIGJsa29mZnMgaXMgbm93IGFsc28gc2FmZSwgc2lu
Y2UgdGhlIHJlc3VsdCBvZiB0aGUgZXhwcmVzc2lvbiBpcyBhbHJlYWR5IGNhbGN1bGF0ZWQgaW4g
dW5zaWduZWQgbG9uZyBsb25nLgo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0YXRpYyBhbmFseXpl
ciBTdmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9yeWFr
b3ZAZ21haWwuY29tPgo+IAo+IC0tLQo+ICAgbmFuZC11dGlscy9uYW5kZmxpcGJpdHMuYyB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9uYW5kLXV0aWxzL25hbmRmbGlwYml0cy5jIGIvbmFuZC11dGlscy9uYW5k
ZmxpcGJpdHMuYwo+IGluZGV4IGVmNjYzYzYuLmM0NjQyZmUgMTAwNjQ0Cj4gLS0tIGEvbmFuZC11
dGlscy9uYW5kZmxpcGJpdHMuYwo+ICsrKyBiL25hbmQtdXRpbHMvbmFuZGZsaXBiaXRzLmMKPiBA
QCAtMjEzLDcgKzIxMyw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgIAkJ
Yml0c190b19mbGlwW2ldLmJsb2NrID0gYml0c190b19mbGlwW2ldLm9mZnNldCAvIGJsa2xlbjsK
PiAgIAkJYml0c190b19mbGlwW2ldLm9mZnNldCAlPSBibGtsZW47Cj4gICAJCXBhZ2UgPSBiaXRz
X3RvX2ZsaXBbaV0ub2Zmc2V0IC8gcGFnZWxlbjsKPiAtCQliaXRzX3RvX2ZsaXBbaV0ub2Zmc2V0
ID0gKHBhZ2UgKgo+ICsJCWJpdHNfdG9fZmxpcFtpXS5vZmZzZXQgPSAoKHVuc2lnbmVkIGxvbmcg
bG9uZylwYWdlICoKPiAgIAkJCQkJICAobXRkLm1pbl9pb19zaXplICsgbXRkLm9vYl9zaXplKSkg
Kwo+ICAgCQkJCQkgKGJpdHNfdG9fZmxpcFtpXS5vZmZzZXQgJSBwYWdlbGVuKTsKCkkgdGhpbmsg
dGhlICdiaXRzX3RvX2ZsaXBbaV0ub2Zmc2V0JyBpcyBsaW1pdGVkIHNtYWxsZXIgdGhhbiAKJ210
ZC5lYl9zaXplJyBieSB0aGUgY29kZToKICBiaXRzX3RvX2ZsaXBbaV0ub2Zmc2V0ICU9IGJsa2xl
bjsKICBwYWdlID0gYml0c190b19mbGlwW2ldLm9mZnNldCAvIHBhZ2VsZW47ClNvLCBJIGRvbid0
IHRoaW5rIGFuIG92ZXJmbG93IGNvdWxkIGhhcHBlbiBoZXJlLgo+ICAgCX0KPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
