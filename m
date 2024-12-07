Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB82E77173
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr2kcuWvHtAe0gRKxtM/qMw8Bh6GMnwMqBbqF9yo9fE=; b=N3nEAkN2RvvifwVwn6T7pC4/DM
	Z3FYUtazXX0CS/w98BGbOWDZq//Q+uzVZNFf1FhVbIjvQp8ID79HxQ/1/EBiPxFZIw7KA6uYdYqjB
	raTqTfMAyH90UfiWheK/Wxx02EliQ5sWm8ATRnmF70hZFTFcFLjw4AW/m1SCgchhpbTdDjitXW44O
	VonAUzSf73cIdkowI7ms1v+ng/1XlntQ37Oh2x9F5NgUMF3qfSNuAc2irSBcHN+wb35baTmwPl/0X
	YXoAoMu5ivyhz4wu5h89j/dTAGQaxxu7hdp+vW3gD9yL+GNRZCODdPtMUp3abs6L4LP3csExKj/kc
	DLdxHzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJkyw-00000003EZb-0lmH;
	Sat, 07 Dec 2024 02:55:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJkyt-00000003EYw-0omM
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 02:55:44 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y4t2v6lQPz11M1T;
	Sat,  7 Dec 2024 10:52:39 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 36F6E1800FD;
	Sat,  7 Dec 2024 10:55:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Dec 2024 10:55:39 +0800
Subject: Re: [PATCH] ubifs/debug: remove return from end of void function
To: Pintu Kumar <quic_pintu@quicinc.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>
References: <20241206125258.9212-1-quic_pintu@quicinc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <e43da923-0184-d41e-a273-a02848f3b671@huawei.com>
Date: Sat, 7 Dec 2024 10:55:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241206125258.9212-1-quic_pintu@quicinc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_185543_421108_A3505294 
X-CRM114-Status: GOOD (  11.16  )
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

1NogMjAyNC8xMi82IDIwOjUyLCBQaW50dSBLdW1hciDQtLXAOgo+IE5vdGljZWQgdGhhdCB0aGVy
ZSBpcyBhIHVzZWxlc3MgcmV0dXJuIHN0YXRlbWVudCBhdCB0aGUgZW5kIG9mIHZvaWQKPiBmdW5j
dGlvbiB1Ymlmc19kdW1wX2xlYigpLgo+IEp1c3QgcmVtb3ZlZCBpdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQaW50dSBLdW1hciA8cXVpY19waW50dUBxdWljaW5jLmNvbT4KPiAtLS0KPiAgIGZzL3Vi
aWZzL2RlYnVnLmMgfCAxIC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpIaSwg
UGludHUuIFRoZSB0aXRsZSBvZiB0aGUgcGF0Y2ggc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlICJ1
YmlmczogCnViaWZzX2R1bXBfbGViOiByZW1vdmUgcmV0dXJuIGF0IGVuZCBvZiB2b2lkIGZ1bmN0
aW9uIi4gU2VlIApEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdC4g
T3RoZXJ3aXNlLAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdl
aS5jb20+Cgo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9kZWJ1Zy5jIGIvZnMvdWJpZnMvZGVi
dWcuYwo+IGluZGV4IDVjYzY5YmVhYTYyZS4uOTg3ZWI1YjY3ODJhIDEwMDY0NAo+IC0tLSBhL2Zz
L3ViaWZzL2RlYnVnLmMKPiArKysgYi9mcy91Ymlmcy9kZWJ1Zy5jCj4gQEAgLTg2Myw3ICs4NjMs
NiBAQCB2b2lkIHViaWZzX2R1bXBfbGViKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQg
bG51bSkKPiAgIAo+ICAgb3V0Ogo+ICAgCXZmcmVlKGJ1Zik7Cj4gLQlyZXR1cm47Cj4gICB9Cj4g
ICAKPiAgIHZvaWQgdWJpZnNfZHVtcF96bm9kZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
