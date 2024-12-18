Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32656E77184
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 01:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei+EoZkj0G4ijOPwf//Kh6xlvvQvrcLOgtxKeS/mmzc=; b=l0VOnawIenKJ8cA7qF6kqosMNq
	IdKitMc6pTY8EOhtWzvj2FAaYO82JRz3FeavOz/PwZ8BIrziq5cQq08AEFJTNXCu0v+UKA3Usdp3x
	odTVfaH1ZfLrqImKt7FIDLLXfOjHb2Jdm2/dKezz1puGYuuOZ/wvxB3g6exxiSrnv6/Cw1i9Di8T+
	Wk0a+nXPwNLmYovfjsEa6hZvJqJl/kJoaq3QERMB+Kv5AcKNtFFqUT+blK2XBjCv05ovhOKWDE5bj
	NPH+Kb6m549Cqbalt00GCDAJYtmiPN78Cuti6J34NPHWL+DKbxprBMggWdrpblXNoL/t+o9Su0qNz
	kCcvIHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNitt-0000000FIwb-3FdG;
	Wed, 18 Dec 2024 01:30:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNitr-0000000FIw5-0qMz
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 01:30:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YCbdb4dKDz1V6F5
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 09:27:31 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id CDA5B18007C
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 09:30:45 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Dec 2024 09:30:45 +0800
Subject: Re: [PATCH mtd-utils] misc-utils: Fix integer overflow in docfdisk.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241217124422.245489-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4698a856-77a6-555e-7b9f-82e7247e2a5c@huawei.com>
Date: Wed, 18 Dec 2024 09:30:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241217124422.245489-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_173055_403006_4212428F 
X-CRM114-Status: GOOD (  13.05  )
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

1NogMjAyNC8xMi8xNyAyMDo0NCwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBQb3NzaWJsZSBpbnRlZ2VyIHVuZGVyZmxvdzogbGVmdCBvcGVy
YW5kIGlzIHRhaW50ZWQuIEFuIGludGVnZXIgdW5kZXJmbG93IG1heSBvY2N1ciBkdWUgdG8gYXJp
dGhtZXRpYyBvcGVyYXRpb24gKHN1YnRyYWN0aW9uKSBiZXR3ZWVuIHZhcmlhYmxlICdibG9jaycg
YW5kIHZhbHVlICcxJywgd2hlbiAnYmxvY2snIGlzIHRhaW50ZWQgeyBbLTIxNDc0ODM2NDgsIDIx
NDc0ODM2NDddIH0KPiAKPiBDb3JyZWN0aW9ucyBleHBsYWluZWQ6Cj4gQWRkZWQgdGhlIGJsb2Nr
IDw9IDAgY2hlY2ssIHdoaWNoIHByZXZlbnRzIGludGVnZXIgdW5kZXJmbG93IHdoZW4gY2FsY3Vs
YXRpbmcgYmxvY2sgLSAxIGFuZCBlbnN1cmVzIHRoYXQgYmxvY2sgaXMgYWx3YXlzIHBvc2l0aXZl
Lgo+IAo+IFRyaWdnZXJzIGZvdW5kIGJ5IHN0YXRpYyBhbmFseXplciBTdmFjZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8YW50LnYubW9yeWFrb3ZAZ21haWwuY29tPgo+IAo+
IC0tLQo+ICAgbWlzYy11dGlscy9kb2NmZGlzay5jIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL21pc2MtdXRpbHMvZG9jZmRpc2su
YyBiL21pc2MtdXRpbHMvZG9jZmRpc2suYwo+IGluZGV4IDQ4NmNlMjkuLmU0NzNjZWIgMTAwNjQ0
Cj4gLS0tIGEvbWlzYy11dGlscy9kb2NmZGlzay5jCj4gKysrIGIvbWlzYy11dGlscy9kb2NmZGlz
ay5jCj4gQEAgLTI1NSw2ICsyNTUsMTAgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQo+ICAgCQlpcC0+Zmlyc3RVbml0ID0gY3B1X3RvX2xlMzIoYmxvY2spOwo+ICAgCQlpZiAoIW5i
bG9ja3NbaV0pCj4gICAJCQluYmxvY2tzW2ldID0gdG90YmxvY2tzIC0gYmxvY2s7Cj4gKwkJaWYg
KGJsb2NrIDw9IDApIHsKPiArCQkJZnByaW50ZihzdGRlcnIsICJFcnJvcjogSW52YWxpZCBibG9j
ayB2YWx1ZSAoJWQpLiBCbG9jayBtdXN0IGJlIGdyZWF0ZXIgdGhhbiAwLlxuIiwgYmxvY2spOwo+
ICsJCQlyZXR1cm4gLTE7Cj4gKwkJfQoKSW4gdGhlIHByZXZpb3VzIGNvZGUsICdibG9jaycgaXMg
YWxyZWFkeSBpbml0aWFsaXplZCBhczoKICBibG9jayA9IG1ob2ZmcyAvIHVuaXRzaXplOwogIGJs
b2NrKys7ClNvIEkgZG9uJ3QgdGhpbmsgdW5kZXJmbG93IGNvdWxkIGhhcHBlbi4KPiAgIAkJaXAt
PnZpcnR1YWxVbml0cyA9IGNwdV90b19sZTMyKG5ibG9ja3NbaV0pOwo+ICAgCQlibG9jayArPSBu
YmxvY2tzW2ldOwo+ICAgCQlpcC0+bGFzdFVuaXQgPSBjcHVfdG9fbGUzMihibG9jay0xKTsKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
