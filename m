Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CFDC4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgcJ0Kdn4ApZT6IFiGhSTpsljG+6UPDgccjxYTO5+pw=; b=GJcGUUTK4YrIrtB6BLCSkckphp
	ubc/+uti9ylBU1EkV3WaTPv2K6a+SyC3lO2zJrpCbI+hZQSMZx7U6CzkRZnBkRVJ7Hp4Byc9bYkEc
	X+/FcZ6upnfIRGTaMkIy1QVwxF2dMBcftqWihJp/hDUDNfTll0cd+/DN1wBpQBeHHqhxUySCb2hZO
	quk30zcVQfHqbfRyCGmp+e1BezIT5Rk+DmlQm3rr1jUEchLFNZxBCRiVT0JqqN3Dj6OYKRPnPtnQS
	jt/2wsvsujZplFnwOYEN9mDiF/tMYIDXeRuTf6HES456oU+7N3jw+BX5Y8HLOI+/SEbKSs/2+m6nZ
	8PLSuItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARJP-006j8E-2Q;
	Tue, 05 Dec 2023 09:01:51 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARJM-006j6v-20
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 09:01:50 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SkvZ81rQVz1Q67l;
	Tue,  5 Dec 2023 16:57:52 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 17:01:37 +0800
Subject: Re: [PATCH] ubi: don't decrease ubi->ref_count on detach error
To: Ryder W <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>
References: <MEYP282MB31647F3434E6BD0178F32CDEBF85A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f7e5075e-232c-7e37-348d-71300b10dac8@huawei.com>
Date: Tue, 5 Dec 2023 17:01:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB31647F3434E6BD0178F32CDEBF85A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_010148_862225_CBFD4F2B 
X-CRM114-Status: GOOD (  11.04  )
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

1NogMjAyMy8xMi81IDE2OjExLCBSeWRlciBXINC0tcA6Cj4+PiBGaXhlczogY2RmYTc4OGFjZDEz
ICgiVUJJOiBwcmVwYXJlIGF0dGFjaCBhbmQgZGV0YWNoIGZ1bmN0aW9ucyIpCj4+PiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbCBhdCBtYWtyb3RvcGlhLm9yZz4KPj4+IC0tLQo+
Pj4gICBkcml2ZXJzL210ZC91YmkvYnVpbGQuYyB8IDYgKysrLS0tCj4+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPj4+IGlu
ZGV4IDdkNGZmMTE5M2RiNmYuLmY0Nzk4N2VlOWEzMWIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJz
L210ZC91YmkvYnVpbGQuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPj4+IEBA
IC0xMDk5LDE2ICsxMDk5LDE2IEBAIGludCB1YmlfZGV0YWNoX210ZF9kZXYoaW50IHViaV9udW0s
IGludCBhbnl3YXkpCj4+PiAgIAo+Pj4gICAJc3Bpbl9sb2NrKCZ1YmlfZGV2aWNlc19sb2NrKTsK
Pj4+ICAgCXB1dF9kZXZpY2UoJnViaS0+ZGV2KTsKPj4+IC0JdWJpLT5yZWZfY291bnQgLT0gMTsK
Pj4+IC0JaWYgKHViaS0+cmVmX2NvdW50KSB7Cj4+PiArCWlmICh1YmktPnJlZl9jb3VudCA+IDEp
IHsKPj4+ICAgCQlpZiAoIWFueXdheSkgewo+Pj4gICAJCQlzcGluX3VubG9jaygmdWJpX2Rldmlj
ZXNfbG9jayk7Cj4+PiAgIAkJCXJldHVybiAtRUJVU1k7Cj4+PiAgIAkJfQo+Pj4gICAJCS8qIFRo
aXMgbWF5IG9ubHkgaGFwcGVuIGlmIHRoZXJlIGlzIGEgYnVnICovCj4+PiAgIAkJdWJpX2Vycih1
YmksICIlcyByZWZlcmVuY2UgY291bnQgJWQsIGRlc3Ryb3kgYW55d2F5IiwKPj4+IC0JCQl1Ymkt
PnViaV9uYW1lLCB1YmktPnJlZl9jb3VudCk7Cj4+PiArCQkJdWJpLT51YmlfbmFtZSwgdWJpLT5y
ZWZfY291bnQgLSAxKTsKPj4+ICAgCX0KPj4+ICsJdWJpLT5yZWZfY291bnQgLT0gMTsKPj4+ICAg
CXViaV9kZXZpY2VzW3ViaV9udW1dID0gTlVMTDsKPj4+ICAgCXNwaW5fdW5sb2NrKCZ1YmlfZGV2
aWNlc19sb2NrKTsKPiAKPiBJbiB0aGUgbGFzdCBjb2RlIG9mIHViaV9kZXRhY2hfbXRkX2Rldiwg
dGhlIGxpbmUgInViaS0+cmVmX2NvdW50IC09IDEiIGFmdGVyIHRoZSBsaW5lICJwdXRfZGV2aWNl
KCZ1YmktPmRldikiIGlzIGp1c3QgdG8gZGVjcmVhc2UgdWJpLT5yZWZfY291bnQsIHdoaWNoIGlz
IGluY3JlYXNlZCBmcm9tIGNhbGxpbmcgcHV0X2RldmljZS4gSSBkb24ndCB1bmRlcnN0YW5kIHdo
eSBpdCBzaG91bGQgYmUgbW92ZWQgYWZ0ZXIgdGhlIHNhbml0eSBjaGVjayBvZiB1YmktPnJlZl9j
b3VudC4gSXQgbWF5IGludHJvZHVjZSBzb21lIG1vcmUgY3JpdGljYWwgYnVnLgo+IAo+CgpUaGFu
a3MgZm9yIHJlbWluZGluZywgeW91IGFyZSByaWdodC4gSSB0aGluayBJIG1pc3NlZCB0aGUgY29k
ZSBvZiAKJ3ViaS0+cmVmX2NvdW50JyBpbmNyZWFzaW5nIGluIHViaV9nZXRfZGV2aWNlLCBzbyBk
ZWNyZWFzaW5nIHRoZSAKJ3ViaS0+cmVmX2NvdW50JyB1bmNvbmRpdGlvbmFsbHkgaXMgcmlnaHQu
IEluIG1vc3QgY2FzZXMsIHRoZSAKJ3ViaS0+cmVmX2NvdW50JyBpcyB6ZXJvKHVubGVzcyB1Ymlm
cyBpcyBtb3VudGVkKS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
