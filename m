Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0361E7717D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2024 01:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmxKSMQuE4wGexxP35D6gaJu+MBTou5a4KW2wzBWxgA=; b=MraOtVRlEUCy0nHxWhAjDSI7w8
	rexjMsknN6//kMnMuQ0DTd4NauOUKjNmIfY8Aw1T2dnhdH4EUTRprvTLhFQGLnsasiVjm9Pv+uvSn
	ovl68EfLPGx1C2zgkWbPY7ZtEISabj2fB7bxUY4qprAue0yzy4v9Urx/tibMe8Zn9wxU+4ik5mh8m
	6p2yGEoxpI+almoqKCCCRqjU3nHHfJpybzZ7xpUcVl+ZuFI/vbH4tLTeW6FZXhtowIFUM8YFvpMYL
	hCC3tiw+TELI/njS1q2r3uljTtxhjH4CTh/R/8m0qOGFyNwLVg+lxzRs2FTZT6rkXccbJsn9H3ROv
	/0da/yBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKolx-00000009myR-0Hnv;
	Tue, 10 Dec 2024 01:10:45 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKolt-00000009mxm-3vuq
	for linux-mtd@lists.infradead.org;
	Tue, 10 Dec 2024 01:10:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y6gbl64b3z21mGR;
	Tue, 10 Dec 2024 09:08:51 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3334514010C;
	Tue, 10 Dec 2024 09:10:35 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Dec 2024 09:10:34 +0800
Subject: Re: [PATCH v2] ubifs: ubifs_dump_leb: remove return from end of void
 function
To: Pintu Kumar <quic_pintu@quicinc.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>
References: <20241209162104.15331-1-quic_pintu@quicinc.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <17a995ba-5088-7a67-2e84-e0d7633c95f0@huawei.com>
Date: Tue, 10 Dec 2024 09:10:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241209162104.15331-1-quic_pintu@quicinc.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_171042_122693_B1874F85 
X-CRM114-Status: GOOD (  12.07  )
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

1NogMjAyNC8xMi8xMCAwOjIxLCBQaW50dSBLdW1hciDQtLXAOgo+IE5vdGljZWQgdGhhdCB0aGVy
ZSBpcyBhIHVzZWxlc3MgcmV0dXJuIHN0YXRlbWVudCBhdCB0aGUgZW5kIG9mIHZvaWQKPiBmdW5j
dGlvbiB1Ymlmc19kdW1wX2xlYigpLgo+IEp1c3QgcmVtb3ZlZCBpdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQaW50dSBLdW1hciA8cXVpY19waW50dUBxdWljaW5jLmNvbT4KPiAKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IC0tLQo+IENoYW5nZXMg
aW4gVjI6Cj4gQ2hhbmdlIGNvbW1pdCB0aXRsZSBhcyBzdWdnZXN0ZWQgYnkgWmhpaGFvIENoZW5n
Lgo+IFYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvZTQzZGE5MjMtMDE4NC1kNDFlLWEy
NzMtYTAyODQ4ZjNiNjcxQGh1YXdlaS5jb20vCj4gLS0tCj4gICBmcy91Ymlmcy9kZWJ1Zy5jIHwg
MSAtCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9m
cy91Ymlmcy9kZWJ1Zy5jIGIvZnMvdWJpZnMvZGVidWcuYwo+IGluZGV4IDVjYzY5YmVhYTYyZS4u
OTg3ZWI1YjY3ODJhIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2RlYnVnLmMKPiArKysgYi9mcy91
Ymlmcy9kZWJ1Zy5jCj4gQEAgLTg2Myw3ICs4NjMsNiBAQCB2b2lkIHViaWZzX2R1bXBfbGViKGNv
bnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSkKPiAgIAo+ICAgb3V0Ogo+ICAgCXZm
cmVlKGJ1Zik7Cj4gLQlyZXR1cm47Cj4gICB9Cj4gICAKPiAgIHZvaWQgdWJpZnNfZHVtcF96bm9k
ZShjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYywKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
