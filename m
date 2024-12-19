Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE3E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1R6WbozMO3HpQW7cahD9Y/8SQ+bvm9VunQ4sqU17/D4=; b=jgBoK7kLflvTKk7Kwkoig5WxOi
	KBpOFZ9+PJU3OBTOgbX5D5aOabXyz3c2TkSrjAoEzPSp5lmC/Q98s7/wv2m13W7a0iT5JkYpVKqpa
	iTeWxDs3RiPdCrhaGCOoPWUfRefPKzzEkd8Ui/q6gpxr3N5zd2/2wlR1E02IyZn2BTieGMUhs3YJj
	kMwFVD9qHBeKlAx1VrfPT0/SKPOyeUFEMvXSwqFWGKVpNwGrzbGfzdh7q+zDBI6kZfB/9CiSuG7Zv
	eTLoHkYtmuEuOoAQTJk9msakSAmONLRbLYPiWnWVMVN6GgT0o3PwFYq2BVxRBBJp2Z+o6706c/c/I
	MMyDTHYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGai-00000001wcf-107c;
	Thu, 19 Dec 2024 13:29:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGaf-00000001wbA-08Nw
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 13:29:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YDWbQ627wz1JF4n
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 21:28:50 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B3AD2140138
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 21:29:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Dec 2024 21:29:13 +0800
Subject: Re: [PATCH mtd-utils] jffsX-utils: fix integer overflow in
 jffs2dump.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241219124932.705660-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5ffa14bf-e9ea-284f-9916-f97cb086481c@huawei.com>
Date: Thu, 19 Dec 2024 21:29:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241219124932.705660-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052921_242312_57FF6DBA 
X-CRM114-Status: GOOD (  18.70  )
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

5ZyoIDIwMjQvMTIvMTkgMjA6NDksIEFudG9uIE1vcnlha292IOWGmemBkzoKPiBSZXBvcnQgb2Yg
dGhlIHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNz
aW9uICdkYXRzaXplICsgb29ic2l6ZScgaXMgYSBzdWJqZWN0IHRvIG92ZXJmbG93IGJlY2F1c2Ug
aXRzIG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5cGUgYmVmb3JlIHBl
cmZvcm1pbmcgYXJpdGhtZXRpYwo+IAo+IENvcnJlY3Rpb25zIGV4cGxhaW5lZDoKPiBGaXhlZCBw
b3RlbnRpYWwgb3ZlcmZsb3cgaW4gYXJpdGhtZXRpYyBvcGVyYXRpb24gZGF0c2l6ZSArIG9vYnNp
emUKPiBieSBjYXN0aW5nIG9wZXJhbmRzIHRvIHVuc2lnbmVkIGxvbmcgbG9uZyB0byBlbnN1cmUg
c2FmZSBjb21wdXRhdGlvbi4KPiBBbmQgYWxzbyBhZGRlZCBhIGNoZWNrIGkgdGhpbmsgeW91IGNh
biBqdXN0IGFkZAo+IGlmIChkYXRzaXplIDwgMCB8fCBvb2JzaXplIDwgMCkgZXhjbHVkaW5nIG5l
Z2F0aXZlIHZhbHVlcyDigIvigItmb3IgZGF0c2l6ZSBhbmQgb29ic2l6ZQo+IAo+IC0tLQo+ICAg
amZmc1gtdXRpbHMvamZmczJkdW1wLmMgfCA3ICsrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKCkhvdyBhYm91dCB0aGlzOgpkaWZmIC0t
Z2l0IGEvamZmc1gtdXRpbHMvamZmczJkdW1wLmMgYi9qZmZzWC11dGlscy9qZmZzMmR1bXAuYwpp
bmRleCAzMDQ1NWVhLi40YmM4N2M1IDEwMDY0NAotLS0gYS9qZmZzWC11dGlscy9qZmZzMmR1bXAu
YworKysgYi9qZmZzWC11dGlscy9qZmZzMmR1bXAuYwpAQCAtNzcyLDYgKzc3MiwxNCBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgICAgICAgICAgICAgICAgZXhpdChFWElUX0ZB
SUxVUkUpOwogICAgICAgICB9CgorICAgICAgIGlmIChkYXRzaXplIDwgMCB8fCBvb2JzaXplIDwg
MCB8fCBkYXRzaXplID4gaW1nbGVuIHx8CisgICAgICAgICAgIChsb25nKWRhdHNpemUgKyBvb2Jz
aXplIDwgMCkgeworICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJFcnJvcjogaW52YWxp
ZCBkYXRzaXplL29vYnNpemUuXG4iKTsKKyAgICAgICAgICAgICAgIGZyZWUoZGF0YSk7CisgICAg
ICAgICAgICAgICBjbG9zZSAoZmQpOworICAgICAgICAgICAgICAgZXhpdChFWElUX0ZBSUxVUkUp
OworICAgICAgIH0KKwogICAgICAgICBpZiAoZGF0c2l6ZSAmJiBvb2JzaXplKSB7CiAgICAgICAg
ICAgICAgICAgaW50ICBpZHggPSAwOwogICAgICAgICAgICAgICAgIGxvbmcgbGVuID0gaW1nbGVu
OwpAQCAtNzgzLDcgKzc5MSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlYWRfbm9jaGVjayAoZmQsIG9vYiwgb29ic2l6ZSk7CiAg
ICAgICAgICAgICAgICAgICAgICAgICBpZHggKz0gZGF0c2l6ZTsKICAgICAgICAgICAgICAgICAg
ICAgICAgIGltZ2xlbiAtPSBvb2JzaXplOwotICAgICAgICAgICAgICAgICAgICAgICBsZW4gLT0g
ZGF0c2l6ZSArIG9vYnNpemU7CisgICAgICAgICAgICAgICAgICAgICAgIGxlbiAtPSAobG9uZylk
YXRzaXplICsgb29ic2l6ZTsKICAgICAgICAgICAgICAgICB9CgogICAgICAgICB9IGVsc2UgewoK
PiBkaWZmIC0tZ2l0IGEvamZmc1gtdXRpbHMvamZmczJkdW1wLmMgYi9qZmZzWC11dGlscy9qZmZz
MmR1bXAuYwo+IGluZGV4IDMwNDU1ZWEuLmJlZThjNTkgMTAwNjQ0Cj4gLS0tIGEvamZmc1gtdXRp
bHMvamZmczJkdW1wLmMKPiArKysgYi9qZmZzWC11dGlscy9qZmZzMmR1bXAuYwo+IEBAIC03NzIs
NiArNzcyLDExIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgIAkJZXhpdChF
WElUX0ZBSUxVUkUpOwo+ICAgCX0KPiAgIAo+ICsJaWYgKGRhdHNpemUgPCAwIHx8IG9vYnNpemUg
PCAwKSB7Cj4gKwkJZnByaW50ZihzdGRlcnIsICJFcnJvcjogZGF0c2l6ZSBhbmQgb29ic2l6ZSBt
dXN0IGJlIG5vbi1uZWdhdGl2ZS5cbiIpOwo+ICsJCXJldHVybiAtMTsKPiArCX0KPiArCj4gICAJ
aWYgKGRhdHNpemUgJiYgb29ic2l6ZSkgewo+ICAgCQlpbnQgIGlkeCA9IDA7Cj4gICAJCWxvbmcg
bGVuID0gaW1nbGVuOwo+IEBAIC03ODMsNyArNzg4LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQo+ICAgCQkJcmVhZF9ub2NoZWNrIChmZCwgb29iLCBvb2JzaXplKTsKPiAgIAkJ
CWlkeCArPSBkYXRzaXplOwo+ICAgCQkJaW1nbGVuIC09IG9vYnNpemU7Cj4gLQkJCWxlbiAtPSBk
YXRzaXplICsgb29ic2l6ZTsKPiArCQkJbGVuIC09ICh1bnNpZ25lZCBsb25nIGxvbmcpZGF0c2l6
ZSArICh1bnNpZ25lZCBsb25nIGxvbmcpb29ic2l6ZTsKPiAgIAkJfQo+ICAgCj4gICAJfSBlbHNl
IHsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
