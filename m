Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699ADE7717D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2024 01:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smZD6ZB7muNAvQS11VhR7sVm+8Qnc24l8YYJPebEeSs=; b=qkEfUV8BBpVWrx2eDV/B/fpdas
	LrfEh9uCHeuBwMWgzEFzZCktjZr83sVVYWTB+s9+iUOwFDsS02T4iYL425d7f/R3I8FpNcRxEYpYm
	gao6+/C5vD92SVeNc//qBCko/TTjkdIo4kRF0S2RzqixJu9j0mK1l9bT+xG/FJD5y+/UhWVwjRzY7
	fDBmoDw+AvDGWxYlIe9IJ3dxFh8AE4M0qK6fImsOSVvoQIs4M09l59UyHRglmYb68O1UB1bS86ZTZ
	7bHmuu0t45UGqV8OwfEDMZ5FpuUy34VUJsS6bNea0nh1JYWEyl5279TVjBivb8YOs+AIFa10wcNAY
	GNbG66YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKotp-00000009nub-18ZP;
	Tue, 10 Dec 2024 01:18:53 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKotI-00000009nn6-34Ml
	for linux-mtd@lists.infradead.org;
	Tue, 10 Dec 2024 01:18:21 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y6gmf5j30z21mvv
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2024 09:16:34 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 299821802E8
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2024 09:18:18 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Dec 2024 09:18:17 +0800
Subject: Re: [PATCH mtd-utils] ubi-utils: ubirsvol: Fix integer overflow in
 ubirsvol.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241210000726.798402-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7d6a26b0-e40e-190e-059b-5459bf65d685@huawei.com>
Date: Tue, 10 Dec 2024 09:18:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241210000726.798402-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_171820_917993_267C90BC 
X-CRM114-Status: GOOD (  13.77  )
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

5ZyoIDIwMjQvMTIvMTAgODowNywgQW50b24gTW9yeWFrb3Yg5YaZ6YGTOgo+IFJlcG9ydCBvZiB0
aGUgc3RhdGljIGFuYWx5emVyOgo+IFRoZSB2YWx1ZSBvZiBhbiBhcml0aG1ldGljIGV4cHJlc3Np
b24gJ3ZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzJyBpcyBhIHN1YmplY3QgdG8gb3ZlcmZs
b3cgYmVjYXVzZSBpdHMgb3BlcmFuZHMgYXJlIG5vdCBjYXN0IHRvIGEgbGFyZ2VyIGRhdGEgdHlw
ZSBiZWZvcmUgcGVyZm9ybWluZyBhcml0aG1ldGljCj4gCj4gQ29ycmVjdGlvbnMgZXhwbGFpbmVk
Ogo+IFRoZSBmaXggZW5zdXJlcyB2YWx1ZXMg4oCL4oCLYXJlIGNoZWNrZWQgYmVmb3JlIG11bHRp
cGxpY2F0aW9uLgo+IEFkZGVkIGNhc3Rpbmcgdm9sX2luZm8ubGViX3NpemUgdG8gbG9uZyBsb25n
Cj4gCj4gVHJpZ2dlcnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFudG9uIE1vcnlha292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+Cj4gCj4g
LS0tCj4gICB1YmktdXRpbHMvdWJpcnN2b2wuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8
Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL3ViaS11dGlscy91Ymly
c3ZvbC5jIGIvdWJpLXV0aWxzL3ViaXJzdm9sLmMKPiBpbmRleCAwODU0YWJjLi43M2QyZjY4IDEw
MDY0NAo+IC0tLSBhL3ViaS11dGlscy91Ymlyc3ZvbC5jCj4gKysrIGIvdWJpLXV0aWxzL3ViaXJz
dm9sLmMKPiBAQCAtMjMxLDcgKzIzMSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICogY29u
c3QgYXJndltdKQo+ICAgCX0KPiAgIAo+ICAgCWlmIChhcmdzLmxlYnMgIT0gLTEpCj4gLQkJYXJn
cy5ieXRlcyA9IHZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzOwo+ICsJCWFyZ3MuYnl0ZXMg
PSAobG9uZyBsb25nKXZvbF9pbmZvLmxlYl9zaXplICogYXJncy5sZWJzOwo+ICAgCj4gICAJZXJy
ID0gdWJpX3Jzdm9sKGxpYnViaSwgYXJncy5ub2RlLCBhcmdzLnZvbF9pZCwgYXJncy5ieXRlcyk7
Cj4gICAJaWYgKGVycikgewo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
