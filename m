Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3114CA0EC1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsIuMLyUKwBJ7ZJPMNtPNzenqCFqrG0yE6pyRLD0DoI=; b=3ZoQ1BrYntQGolT3hx6pTX7hNu
	GUgntCOR8yZ2CmIf1x3BetnPUwfrOAbaH9mx8uy9hwIuqDcpiI6K4rXwTU1Cx/aDBFn9fa0F/qvuK
	6Mnf3W/yG31DtGUkOdn/xiEVowCwXubK7CuK475Y1jEBponsodsPg3CJDg/JhTYlOyBCPtmuwUiUB
	lIXodXTbymt58G4d4f13Wzt22HuNevBAqEMuIU4ljwgd4MPz7LzwdoB3pw73uHcytDY+dmzT7XKZ3
	BBV9SjZeTxeQ0q7hLYNPRiXUU2ZPrcsNEetulZ8LkxcRxNdjVD77Lf+TTnt+iPTUC5IvaQoGSZPQQ
	nQIl/FxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQpV-00000007Xw7-0otj;
	Mon, 11 Aug 2025 11:36:41 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQV8-00000007Tj9-17gE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 11:15:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c0sRB37fQz13Mbt;
	Mon, 11 Aug 2025 19:12:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 21EAB1402C7;
	Mon, 11 Aug 2025 19:15:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 Aug 2025 19:15:27 +0800
Subject: Re: [PATCH] ubifs: Remove unnecessary variable assignments
To: Xichao Zhao <zhao.xichao@vivo.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250811100949.431764-1-zhao.xichao@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <b93c0677-f26b-b8da-bd70-7cec43bd8d00@huawei.com>
Date: Mon, 11 Aug 2025 19:15:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250811100949.431764-1-zhao.xichao@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_041538_621582_7086C5D7 
X-CRM114-Status: GOOD (  17.56  )
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

1NogMjAyNS84LzExIDE4OjA5LCBYaWNoYW8gWmhhbyDQtLXAOgo+IFdoZW4gYW4gZXJyb3Igb2Nj
dXJzLCB1Ymlmc19lcnIgaXMgdXNlZCB0byBkaXJlY3RseSBwcmludCB0aGUgZXJyb3IsCj4gYW5k
IGRpZmZlcmVudCBlcnJvcnMgaGF2ZSBkaWZmZXJlbnQgZm9ybWF0cyBmb3IgcHJpbnRpbmcuIFRo
ZXJlZm9yZSwKPiBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gdXNlICdlcnInIHRvIGxvY2F0ZSB0aGUg
ZXJyb3Igb2NjdXJyZW5jZS4KPiBUaHVzLCByZW1vdmUgdGhlIHJlbGV2YW50IGFzc2lnbm1lbnRz
IHRvICdlcnInLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpY2hhbyBaaGFvIDx6aGFvLnhpY2hhb0B2
aXZvLmNvbT4KPiAtLS0KPiAgIGZzL3ViaWZzL3RuY19taXNjLmMgfCA5ICstLS0tLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+IAoKUmV2aWV3
ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL3RuY19taXNjLmMgYi9mcy91Ymlmcy90bmNfbWlzYy5jCj4gaW5kZXggZDNm
OGE2YWExZjQ5Li4xMGIyMjJkYzZhNTMgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvdG5jX21pc2Mu
Ywo+ICsrKyBiL2ZzL3ViaWZzL3RuY19taXNjLmMKPiBAQCAtMzIxLDcgKzMyMSw2IEBAIHN0YXRp
YyBpbnQgcmVhZF96bm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX3picmFu
Y2ggKnp6YnIsCj4gICAJCQkgIGMtPmZhbm91dCwgem5vZGUtPmNoaWxkX2NudCk7Cj4gICAJCXVi
aWZzX2VycihjLCAibWF4IGxldmVscyAlZCwgem5vZGUgbGV2ZWwgJWQiLAo+ICAgCQkJICBVQklG
U19NQVhfTEVWRUxTLCB6bm9kZS0+bGV2ZWwpOwo+IC0JCWVyciA9IDE7Cj4gICAJCWdvdG8gb3V0
X2R1bXA7Cj4gICAJfQo+ICAgCj4gQEAgLTM0Miw3ICszNDEsNiBAQCBzdGF0aWMgaW50IHJlYWRf
em5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCB1Ymlmc196YnJhbmNoICp6emJyLAo+
ICAgCQkgICAgemJyLT5sbnVtID49IGMtPmxlYl9jbnQgfHwgemJyLT5vZmZzIDwgMCB8fAo+ICAg
CQkgICAgemJyLT5vZmZzICsgemJyLT5sZW4gPiBjLT5sZWJfc2l6ZSB8fCB6YnItPm9mZnMgJiA3
KSB7Cj4gICAJCQl1Ymlmc19lcnIoYywgImJhZCBicmFuY2ggJWQiLCBpKTsKPiAtCQkJZXJyID0g
MjsKPiAgIAkJCWdvdG8gb3V0X2R1bXA7Cj4gICAJCX0KPiAgIAo+IEBAIC0zNTUsNyArMzUzLDYg
QEAgc3RhdGljIGludCByZWFkX3pub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QgdWJp
ZnNfemJyYW5jaCAqenpiciwKPiAgIAkJZGVmYXVsdDoKPiAgIAkJCXViaWZzX2VycihjLCAiYmFk
IGtleSB0eXBlIGF0IHNsb3QgJWQ6ICVkIiwKPiAgIAkJCQkgIGksIGtleV90eXBlKGMsICZ6YnIt
PmtleSkpOwo+IC0JCQllcnIgPSAzOwo+ICAgCQkJZ290byBvdXRfZHVtcDsKPiAgIAkJfQo+ICAg
Cj4gQEAgLTM2OCw3ICszNjUsNiBAQCBzdGF0aWMgaW50IHJlYWRfem5vZGUoc3RydWN0IHViaWZz
X2luZm8gKmMsIHN0cnVjdCB1Ymlmc196YnJhbmNoICp6emJyLAo+ICAgCQkJCXViaWZzX2Vycihj
LCAiYmFkIHRhcmdldCBub2RlICh0eXBlICVkKSBsZW5ndGggKCVkKSIsCj4gICAJCQkJCSAgdHlw
ZSwgemJyLT5sZW4pOwo+ICAgCQkJCXViaWZzX2VycihjLCAiaGF2ZSB0byBiZSAlZCIsIGMtPnJh
bmdlc1t0eXBlXS5sZW4pOwo+IC0JCQkJZXJyID0gNDsKPiAgIAkJCQlnb3RvIG91dF9kdW1wOwo+
ICAgCQkJfQo+ICAgCQl9IGVsc2UgaWYgKHpici0+bGVuIDwgYy0+cmFuZ2VzW3R5cGVdLm1pbl9s
ZW4gfHwKPiBAQCAtMzc4LDcgKzM3NCw2IEBAIHN0YXRpYyBpbnQgcmVhZF96bm9kZShzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX3picmFuY2ggKnp6YnIsCj4gICAJCQl1Ymlmc19l
cnIoYywgImhhdmUgdG8gYmUgaW4gcmFuZ2Ugb2YgJWQtJWQiLAo+ICAgCQkJCSAgYy0+cmFuZ2Vz
W3R5cGVdLm1pbl9sZW4sCj4gICAJCQkJICBjLT5yYW5nZXNbdHlwZV0ubWF4X2xlbik7Cj4gLQkJ
CWVyciA9IDU7Cj4gICAJCQlnb3RvIG91dF9kdW1wOwo+ICAgCQl9Cj4gICAJfQo+IEBAIC0zOTYs
MTMgKzM5MSwxMSBAQCBzdGF0aWMgaW50IHJlYWRfem5vZGUoc3RydWN0IHViaWZzX2luZm8gKmMs
IHN0cnVjdCB1Ymlmc196YnJhbmNoICp6emJyLAo+ICAgCQljbXAgPSBrZXlzX2NtcChjLCBrZXkx
LCBrZXkyKTsKPiAgIAkJaWYgKGNtcCA+IDApIHsKPiAgIAkJCXViaWZzX2VycihjLCAiYmFkIGtl
eSBvcmRlciAoa2V5cyAlZCBhbmQgJWQpIiwgaSwgaSArIDEpOwo+IC0JCQllcnIgPSA2Owo+ICAg
CQkJZ290byBvdXRfZHVtcDsKPiAgIAkJfSBlbHNlIGlmIChjbXAgPT0gMCAmJiAhaXNfaGFzaF9r
ZXkoYywga2V5MSkpIHsKPiAgIAkJCS8qIFRoZXNlIGNhbiBvbmx5IGJlIGtleXMgd2l0aCBjb2xs
aWRpbmcgaGFzaCAqLwo+ICAgCQkJdWJpZnNfZXJyKGMsICJrZXlzICVkIGFuZCAlZCBhcmUgbm90
IGhhc2hlZCBidXQgZXF1aXZhbGVudCIsCj4gICAJCQkJICBpLCBpICsgMSk7Cj4gLQkJCWVyciA9
IDc7Cj4gICAJCQlnb3RvIG91dF9kdW1wOwo+ICAgCQl9Cj4gICAJfQo+IEBAIC00MTEsNyArNDA0
LDcgQEAgc3RhdGljIGludCByZWFkX3pub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3Qg
dWJpZnNfemJyYW5jaCAqenpiciwKPiAgIAlyZXR1cm4gMDsKPiAgIAo+ICAgb3V0X2R1bXA6Cj4g
LQl1Ymlmc19lcnIoYywgImJhZCBpbmRleGluZyBub2RlIGF0IExFQiAlZDolZCwgZXJyb3IgJWQi
LCBsbnVtLCBvZmZzLCBlcnIpOwo+ICsJdWJpZnNfZXJyKGMsICJiYWQgaW5kZXhpbmcgbm9kZSBh
dCBMRUIgJWQ6JWQiLCBsbnVtLCBvZmZzKTsKPiAgIAl1Ymlmc19kdW1wX25vZGUoYywgaWR4LCBj
LT5tYXhfaWR4X25vZGVfc3opOwo+ICAgCWtmcmVlKGlkeCk7Cj4gICAJcmV0dXJuIC1FSU5WQUw7
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
