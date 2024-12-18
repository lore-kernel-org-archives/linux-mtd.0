Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C8E77184
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 02:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwoEFMB+DGLfIpgEy6d+iYM1L/CHNwYURlabmISnTvY=; b=cw+22MWVbrmc1mcprdrRLwhrU8
	XRtu9AKtCdXsMK+fjSwYMlDAcewIl4/vSXfEuOxMbVVWy/RFZdLwGo86UjoHbBn+hXFJH0RXyd66+
	DP6iDmviyNqBD1vT9F+bkgb3QgJKD0K6xvHl3wBO7IJ+YYaDQW0P9wwjt1/H4F0duyBDcvPaceTJD
	/cKQl/JTsjcpRe0F1mtJNglDXiGtc5tGI/6RltjR7sbfGDSdVtEwsOx7k57vUJv8xUINmny4+Ze0D
	f2ffKeKL14cKEYVg5Eqe976eQnc3VxsXy2o0foHPZLnks0nFE/ilWVWXO+nr8hWx95v+71J85+9ar
	wuLVA5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNjjz-0000000FO05-3x6R;
	Wed, 18 Dec 2024 02:24:47 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNjjw-0000000FNzF-1OLW
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 02:24:46 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YCcrR4HtVz2DbwC
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 10:21:59 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D373D1400D4
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 10:24:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Dec 2024 10:24:33 +0800
Subject: Re: [PATCH mtd-utils] ubi-utils: FIX DIVISION BY ZERO in ubinize.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241217140006.268082-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c376dd50-e92f-3658-df09-a8e6e6ba45f7@huawei.com>
Date: Wed, 18 Dec 2024 10:24:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241217140006.268082-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_182444_678014_C78A0474 
X-CRM114-Status: GOOD (  21.44  )
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

1NogMjAyNC8xMi8xNyAyMjowMCwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBWYXJpYWJsZSB2aS0+YWxpZ25tZW50LCB3aG9zZSBwb3NzaWJs
ZSB2YWx1ZSBzZXQgYWxsb3dzIGEgemVybyB2YWx1ZSBhdCB1YmluaXplLmM6Mzc1LCBpcyB1c2Vk
IGFzIGEgZGVub21pbmF0b3IgYXQgdWJpbml6ZS5jOjQxMC4KPiAKPiBJZiB5b3UgbG9vayBhdCB0
aGUgY29kZSBtb3JlIGNsb3NlbHksIGl0IHdpbGwgYmUgY2xlYXIgdGhhdCB0aGUgdmktPmFsaWdu
bWVudCBwYXJhbWV0ZXIgaXMgb2J0YWluZWQgZnJvbSBhbiBleHRlcm5hbCBmaWxlIHBhc3NlZCBh
cyBhIGNvbW1hbmQgbGluZSBhcmd1bWVudC4KPiAKPiBBIGNoZWNrIHdhcyBhbHNvIHBlcmZvcm1l
ZCBpZiB5b3UgcGFzcyBhIHRlc3QuaW5pIGZpbGUgb2YgdGhlIGZvbGxvd2luZyB0eXBlIHRvIHRo
ZSBpbnB1dDoKPiAKPiBbamZmczItdm9sdW1lXQo+IG1vZGU9dWJpCj4gaW1hZ2U9Li4vamZmczIu
aW1nCj4gdm9sX2lkPTEKPiB2b2xfc2l6ZT0zME1pQgo+IHZvbF90eXBlPWR5bmFtaWMKPiB2b2xf
bmFtZT1qZmZzMl92b2x1bWUKPiB2b2xfZmxhZ3M9YXV0b3Jlc2l6ZQo+IHZvbF9hbGlnbm1lbnQ9
MAo+IAo+IGFuZCBleGVjdXRlIHRoZSBjb21tYW5kOgo+IAo+IC4vdWJpbml6ZSAtbyB1YmkuaW1n
IC1wIDE2S2lCIC1tIDUxMiAtcyAyNTYgdGVzdC5pbmkKPiAKPiB3ZSB3aWxsIGdldCB0aGUgcmVz
dWx0Ogo+IAo+IEZsb2F0aW5nIHBvaW50IGV4Y2VwdGlvbiAoY29yZSBkdW1wZWQpCj4gCj4gQ29y
cmVjdGlvbnMgZXhwbGFpbmVkOgo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0YXRpYyBhbmFseXpl
ciBTdmFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9yeWFr
b3ZAZ21haWwuY29tPgo+IAo+IC0tLQo+ICAgdWJpLXV0aWxzL3ViaW5pemUuYyB8IDggKysrKysr
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
dWJpLXV0aWxzL3ViaW5pemUuYyBiL3ViaS11dGlscy91YmluaXplLmMKPiBpbmRleCBhYzhjMWU1
Li5hZmZmYWEwIDEwMDY0NAo+IC0tLSBhL3ViaS11dGlscy91YmluaXplLmMKPiArKysgYi91Ymkt
dXRpbHMvdWJpbml6ZS5jCj4gQEAgLTQwNiw2ICs0MDYsMTQgQEAgc3RhdGljIGludCByZWFkX3Nl
Y3Rpb24oY29uc3Qgc3RydWN0IHViaWdlbl9pbmZvICp1aSwgY29uc3QgY2hhciAqc25hbWUsCj4g
ICAJCX0KPiAgIAl9Cj4gICAKPiArCj4gKwkvKiBWYWxpZGF0ZSBhbGlnbm1lbnQgdG8gYXZvaWQg
ZGl2aXNpb24gYnkgemVybyAqLwo+ICsJaWYgKHZpLT5hbGlnbm1lbnQgPD0gMCkgewo+ICsJCWZw
cmludGYoc3RkZXJyLCAiRXJyb3I6IGFsaWdubWVudCB2YWx1ZSAoJWQpIGlzIGludmFsaWQuIEl0
IG11c3QgYmUgZ3JlYXRlciB0aGFuIDAuXG4iLCB2aS0+YWxpZ25tZW50KTsKPiArCQl2aS0+YWxp
Z25tZW50ID0gMTsgLyogU2V0IGEgc2FmZSBkZWZhdWx0IHZhbHVlICovCj4gKwkJZnByaW50Zihz
dGRlcnIsICJXYXJuaW5nOiBhbGlnbm1lbnQgc2V0IHRvIGRlZmF1bHQgdmFsdWUgKDEpLlxuIik7
Cj4gKwl9Cj4gKwoKSG93IGFib3V0IGNoYW5naW5nIGxpa2UgdGhpcz8KZGlmZiAtLWdpdCBhL3Vi
aS11dGlscy91YmluaXplLmMgYi91YmktdXRpbHMvdWJpbml6ZS5jCmluZGV4IGFjOGMxZTUuLjlj
OTUwYjEgMTAwNjQ0Ci0tLSBhL3ViaS11dGlscy91YmluaXplLmMKKysrIGIvdWJpLXV0aWxzL3Vi
aW5pemUuYwpAQCAtMzc1LDggKzM3NSw4IEBAIHN0YXRpYyBpbnQgcmVhZF9zZWN0aW9uKGNvbnN0
IHN0cnVjdCB1YmlnZW5faW5mbyAKKnVpLCBjb25zdCBjaGFyICpzbmFtZSwKICAgICAgICAgdmkt
PmFsaWdubWVudCA9IGluaXBhcnNlcl9nZXRpbnQoYXJncy5kaWN0LCBidWYsIC0xKTsKICAgICAg
ICAgaWYgKHZpLT5hbGlnbm1lbnQgPT0gLTEpCiAgICAgICAgICAgICAgICAgdmktPmFsaWdubWVu
dCA9IDE7Ci0gICAgICAgZWxzZSBpZiAodmktPmlkIDwgMCkKLSAgICAgICAgICAgICAgIHJldHVy
biBlcnJtc2coIm5lZ2F0aXZlIHZvbHVtZSBhbGlnbm1lbnQgJWQgaW4gc2VjdGlvbiAKXCIlc1wi
IiwKKyAgICAgICBlbHNlIGlmICh2aS0+YWxpZ25tZW50IDw9IDApCisgICAgICAgICAgICAgICBy
ZXR1cm4gZXJybXNnKCJub3QgcG9zaXRpdmUgdm9sdW1lIGFsaWdubWVudCAlZCBpbiAKc2VjdGlv
biBcIiVzXCIiLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmktPmFsaWdubWVudCwg
c25hbWUpOwoKICAgICAgICAgdmVyYm9zZShhcmdzLnZlcmJvc2UsICJ2b2x1bWUgYWxpZ25tZW50
OiAlZCIsIHZpLT5hbGlnbm1lbnQpOwoKSSBmaW5kIHRoYXQgdGhlICd2aS0+aWQnIGlzIG1pc3Nw
ZWxsZWQgYXMgJ3ZpLT5hbGlnbm1lbnQnLgo+ICAgCS8qIEluaXRpYWxpemUgdGhlIHJlc3Qgb2Yg
dGhlIHZvbHVtZSBpbmZvcm1hdGlvbiAqLwo+ICAgCXZpLT5kYXRhX3BhZCA9IHVpLT5sZWJfc2l6
ZSAlIHZpLT5hbGlnbm1lbnQ7Cj4gICAJdmktPnVzYWJsZV9sZWJfc2l6ZSA9IHVpLT5sZWJfc2l6
ZSAtIHZpLT5kYXRhX3BhZDsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
