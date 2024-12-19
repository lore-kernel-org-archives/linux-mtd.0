Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9677CE7718A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 03:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/8gXW+rZTkxgDtF0FN5P7oRHbr2YFAZgia5vAcbrFo=; b=TKFj2Nh7nMLTdFtsRSg0g6icl5
	Xm6vAELRmLbHWrBc5ttiZfGyTwFmB9jt5uzTglNUy34mRfIvT4wIWA+ycRFlu9iO5r6A13lNlcsYu
	dq8B8TjxO+k/GBZ9kRBvQuSAsOKno7Mk7xRWeL+FYxZYqqb0+KHEYbrHva/mTgk1O/43DA2d4FcGR
	OwtyGdPL2sfJf/yARr2Hdl5y8mB9Sw1O3Y0R0A5kuj4uQui1yMjflYcRs1bBFmrv6lgvLTLtnsXzg
	uc6Uqmcjelu9ozpGlHpRk3M1hN2dZ7XjEUQyZAwOQ0asJtmhADfb+6W132TsosyOUSNk+Q3qT/F+S
	5n5TX+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO7gR-00000000kKw-3NsJ;
	Thu, 19 Dec 2024 03:58:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO7gP-00000000kKN-1nDt
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 03:58:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YDGsx5VmpzFrS8
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 11:55:33 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 503EE1800D9
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 11:58:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Dec 2024 11:58:29 +0800
Subject: Re: [PATCH mtd-utils] misc-utils: fix integer overflow in ftl_check.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241218103455.480067-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3ac32f39-a28c-228e-2cb7-1d8ad5ef1cd6@huawei.com>
Date: Thu, 19 Dec 2024 11:58:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241218103455.480067-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_195841_673568_4AD8DF98 
X-CRM114-Status: GOOD (  17.58  )
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

1NogMjAyNC8xMi8xOCAxODozNCwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBBbiBpbnRlZ2VyIG92ZXJmbG93IG1heSBvY2N1ciBkdWUgdG8g
YXJpdGhtZXRpYyBvcGVyYXRpb24gKG11bHRpcGxpY2F0aW9uKSBiZXR3ZWVuIHZhcmlhYmxlICdu
YmFtJyBhbmQgdmFsdWUgJzQnIG9mICdzaXplb2YodV9pbnQpJywgd2hlbiAnbmJhbScgaXMgaW4g
cmFuZ2UKPiAKPiBDb3JyZWN0aW9ucyBleHBsYWluZWQ6Cj4gQXZvaWQgYXJpdGhtZXRpYyBvdmVy
ZmxvdyB0aGF0IGNvdWxkIGNhdXNlIGFuIGluY29ycmVjdCBhbW91bnQgb2YgbWVtb3J5IHRvIGJl
IGFsbG9jYXRlZC4KPiBIYW5kbGUgbWVtb3J5IGFsbG9jYXRpb24gZXJyb3JzIChtYWxsb2MpLgo+
IFRoZSBjb2RlIGlzIHJvYnVzdCBhbmQgc2FmZSBmb3IgbGFyZ2UgbmJhbSB2YWx1ZXMuCj4gCj4g
VHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFudG9uIE1vcnlha292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+Cj4gCj4gLS0tCj4g
ICBtaXNjLXV0aWxzL2Z0bF9jaGVjay5jIHwgOSArKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbWlzYy11dGlscy9mdGxfY2hlY2su
YyBiL21pc2MtdXRpbHMvZnRsX2NoZWNrLmMKPiBpbmRleCA1YjJkYWU1Li5mZTQzYTI0IDEwMDY0
NAo+IC0tLSBhL21pc2MtdXRpbHMvZnRsX2NoZWNrLmMKPiArKysgYi9taXNjLXV0aWxzL2Z0bF9j
aGVjay5jCj4gQEAgLTEyMCw4ICsxMjAsMTcgQEAgc3RhdGljIHZvaWQgY2hlY2tfcGFydGl0aW9u
KGludCBmZCkKPiAgIAo+ICAgCS8qIENyZWF0ZSBiYXNpYyBibG9jayBhbGxvY2F0aW9uIHRhYmxl
IGZvciBjb250cm9sIGJsb2NrcyAqLwo+ICAgCW5iYW0gPSAobXRkLmVyYXNlc2l6ZSA+PiBoZHIu
QmxvY2tTaXplKTsKVGhlICdtdGQuZXJhc2VzaXplJyB3b24ndCBiZSBhIGxhcmdlIG51bWJlciBp
biBmYWN0LCBzbyBJIHRoaW5rIHRoZSAKb3ZlcmZsb3cgY2hlY2tpbmcgaXMgbm90IHJlYWxseSBu
ZWVkZWQuCj4gKwlpZiAobmJhbSA+IFNJWkVfTUFYIC8gc2l6ZW9mKHVfaW50KSkgewo+ICsJCWZw
cmludGYoc3RkZXJyLCAiRXJyb3I6IG5iYW0gdmFsdWUgdG9vIGxhcmdlLCBwb3RlbnRpYWwgb3Zl
cmZsb3cgZGV0ZWN0ZWQuXG4iKTsKPiArCQlmcmVlKGJhbSk7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+
ICAgCWJhbSA9IG1hbGxvYyhuYmFtICogc2l6ZW9mKHVfaW50KSk7Cj4gICAKPiArCWlmICghYmFt
KSB7Cj4gKwkJcGVycm9yKCJtYWxsb2MgZmFpbGVkIik7Cj4gKwkJcmV0dXJuOwo+ICsJfQoKSSdt
IGZpbmUgd2l0aCB0aGUgY2hlY2sgb2YgJ2JhbScsIGp1c3QgcHV0IHRoZSBibGFuayBsaW5lKGlu
IGZyb250IG9mIAonaWYgKCFiYW0pJykgYmVmb3JlIHRoZSBmb3ItbG9vcC4KPiAgIAlmb3IgKGkg
PSAwOyBpIDwgbGUxNl90b19jcHUoaGRyLk51bUVyYXNlVW5pdHMpOyBpKyspIHsKPiAgIAkJaWYg
KGxzZWVrKGZkLCAoaSA8PCBoZHIuRXJhc2VVbml0U2l6ZSksIFNFRUtfU0VUKSA9PSAtMSkgewo+
ICAgCQkJcGVycm9yKCJzZWVrIGZhaWxlZCIpOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
