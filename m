Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04304CFD35C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDRrEsXUK7NKQSsYvDPriLtyFFsbrjDTmhqtmH8HBU0=; b=f9X3yRyiZ+6xvtuYG6Qr+AsLhG
	NtgxVYjPevc+g6xRTZWUOcQg5o8ZyxUH6T9/xmPhu1QmpDXp2Ve3/SSz56/rdPvrVcSOWNujURla0
	UgtxXigeYkPJFNgv2de0GiVBWu43ECmrRB9tDMHIEv4A0elDDeKjSaH2bt4WqUt/Rv98Qch2GlAdg
	G473dmw8EUBFdya84icqVshiIwrxU8orJzhxhUJHngZVKhrdWxw7m6yZK0Nw0UY4F7OIoubDPhvgW
	iVhqSaorB023ex0KPSJ162sXUNNaM/TuGdJ0JrPf2AoQJNe7bv6J8O14VrnhT6vRiUA+ZjE4WabhE
	TOw7qdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szELe-0000000GD3o-30CS;
	Fri, 11 Oct 2024 12:02:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szELa-0000000GD1p-1YFf
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:02:20 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XQ4v241GHzpWct;
	Fri, 11 Oct 2024 20:00:14 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E764E14037C;
	Fri, 11 Oct 2024 20:02:13 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 11 Oct 2024 20:02:13 +0800
Subject: Re: [PATCH v2 02/10] ubi: Expose mean erase counter for fastmap in
 sysfs
To: Rickard Andersson <rickard.andersson@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <kernel@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
 <20241011092134.2909496-2-rickard.andersson@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bc8f4512-1f76-82c6-b9b5-b307c713fa78@huawei.com>
Date: Fri, 11 Oct 2024 20:02:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241011092134.2909496-2-rickard.andersson@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_050218_702831_6D583C26 
X-CRM114-Status: GOOD (  13.63  )
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

1NogMjAyNC8xMC8xMSAxNzoyMSwgUmlja2FyZCBBbmRlcnNzb24g0LS1wDoKPiBTaW5jZSB0aGUg
ZmFzdG1hcCBhcmVhIGhhcyBpdHMgb3duIHdlYXIgbGV2ZWxsaW5nIGl0IGlzIHZhbHVhYmxlIHRv
Cj4gcHJvdmlkZSBhIG1lYW4gdmFsdWUgZm9yIHRoYXQgYXJlYS4gVGhpcyB2YWx1ZSBjYW4gYmUg
dXNlZCBpbiBvcmRlcgo+IHRvIGVzdGltYXRlIGxpZmUgZXhwZWN0YW5jeSBvZiB0aGUgZmxhc2gu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUmlja2FyZCBBbmRlcnNzb24gPHJpY2thcmQuYW5kZXJzc29u
QGF4aXMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCAxMSArKysrKysr
KysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKClJldmlld2VkLWJ5
OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC91YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gaW5kZXgg
ZmEzOGM0MzRlNDQ3Li4zNjMzYzc0M2U3ZDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJp
L2J1aWxkLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBAIC0xMzMsNiArMTMz
LDEwIEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbWF4X2VjID0KPiAgIAlf
X0FUVFIobWF4X2VjLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3csIE5VTEwpOwo+ICAgc3Rh
dGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9tZWFuX2VjID0KPiAgIAlfX0FUVFIobWVh
bl9lYywgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKPiArI2lmZGVmIENPTkZJ
R19NVERfVUJJX0ZBU1RNQVAKPiArc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9t
ZWFuX2VjX2Zhc3RtYXAgPQo+ICsJX19BVFRSKG1lYW5fZWNfZmFzdG1hcCwgU19JUlVHTywgZGV2
X2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKPiArI2VuZGlmCj4gICBzdGF0aWMgc3RydWN0IGRldmlj
ZV9hdHRyaWJ1dGUgZGV2X3Jlc2VydmVkX2Zvcl9iYWQgPQo+ICAgCV9fQVRUUihyZXNlcnZlZF9m
b3JfYmFkLCBTX0lSVUdPLCBkZXZfYXR0cmlidXRlX3Nob3csIE5VTEwpOwo+ICAgc3RhdGljIHN0
cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl9iYWRfcGViX2NvdW50ID0KPiBAQCAtNDEzLDYgKzQx
NywxMCBAQCBzdGF0aWMgc3NpemVfdCBkZXZfYXR0cmlidXRlX3Nob3coc3RydWN0IGRldmljZSAq
ZGV2LAo+ICAgCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmktPm1heF9lYyk7Cj4gICAJ
ZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21lYW5fZWMpCj4gICAJCXJldCA9IHNwcmludGYoYnVmLCAi
JWRcbiIsIHViaV9jYWxjX21lYW5fZWModWJpLCAwLCB1YmktPnBlYl9jb3VudCkpOwo+ICsjaWZk
ZWYgQ09ORklHX01URF9VQklfRkFTVE1BUAo+ICsJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X21lYW5f
ZWNfZmFzdG1hcCkKPiArCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmlfY2FsY19tZWFu
X2VjKHViaSwgMCwgVUJJX0ZNX01BWF9TVEFSVCkpOwo+ICsjZW5kaWYKPiAgIAllbHNlIGlmIChh
dHRyID09ICZkZXZfcmVzZXJ2ZWRfZm9yX2JhZCkKPiAgIAkJcmV0ID0gc3ByaW50ZihidWYsICIl
ZFxuIiwgdWJpLT5iZWJfcnN2ZF9wZWJzKTsKPiAgIAllbHNlIGlmIChhdHRyID09ICZkZXZfYmFk
X3BlYl9jb3VudCkKPiBAQCAtNDQwLDYgKzQ0OCw5IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRl
ICp1YmlfZGV2X2F0dHJzW10gPSB7Cj4gICAJJmRldl92b2x1bWVzX2NvdW50LmF0dHIsCj4gICAJ
JmRldl9tYXhfZWMuYXR0ciwKPiAgIAkmZGV2X21lYW5fZWMuYXR0ciwKPiArI2lmZGVmIENPTkZJ
R19NVERfVUJJX0ZBU1RNQVAKPiArCSZkZXZfbWVhbl9lY19mYXN0bWFwLmF0dHIsCj4gKyNlbmRp
Zgo+ICAgCSZkZXZfcmVzZXJ2ZWRfZm9yX2JhZC5hdHRyLAo+ICAgCSZkZXZfYmFkX3BlYl9jb3Vu
dC5hdHRyLAo+ICAgCSZkZXZfbWF4X3ZvbF9jb3VudC5hdHRyLAo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
