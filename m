Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B3FC4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAqp7Y5PAciFDwHH4l/10mBR7xNGDmvCBARP4FM/eZo=; b=diK3beZ9uwin0zgCGq4dqYR4De
	40ep3Bt+0dI9aoX/fxqYlOJ3aL44gMog+rvqQhpXRJ20gSTVPSwPA3wntnny6y94hQHByr9iMcK8l
	yIibydK2jFQYcVHB0bbJ2bThokyjeHsYa53JK8b5NS7a8b2tVMBVQ46Dz4zVvlOj3MrNLwYyCaRuH
	RlU2Y8Xdhyadj+7pL+jcWCXLmDY2gTeM4DqSVAkvPZ5cnBQurlFsVCttwBIshKZJrqEXmg1KeMDiH
	b3zoBAmZPSVGz3OUTnIyk5YISV1fiC+f4i9yfqDBcUCvRHctZke7wOy7KUAbQZwiOSFOrXTbY8DqW
	JxW/iwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRoe4-00AqF7-1c;
	Mon, 22 Jan 2024 07:23:00 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRoe0-00AqDa-2p
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 07:22:58 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TJM963ctRz1Q895;
	Mon, 22 Jan 2024 15:21:46 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 61B11140499;
	Mon, 22 Jan 2024 15:22:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 15:22:45 +0800
Subject: Re: [PATCH 01/15] ubifs: Set page uptodate in the correct place
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <stable@vger.kernel.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-2-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5ad7b6ed-664b-7426-c557-1495711a6100@huawei.com>
Date: Mon, 22 Jan 2024 15:22:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-2-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_232257_102484_2AD2B786 
X-CRM114-Status: GOOD (  17.32  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gUGFnZSBj
YWNoZSByZWFkcyBhcmUgbG9ja2xlc3MsIHNvIHNldHRpbmcgdGhlIGZyZXNobHkgYWxsb2NhdGVk
IHBhZ2UKPiB1cHRvZGF0ZSBiZWZvcmUgd2UndmUgb3ZlcndyaXR0ZW4gaXQgd2l0aCB0aGUgZGF0
YSBpdCdzIHN1cHBvc2VkIHRvIGhhdmUKPiBpbiBpdCB3aWxsIGFsbG93IGEgc2ltdWx0YW5lb3Vz
IHJlYWRlciB0byBzZWUgb2xkIGRhdGEuICBNb3ZlIHRoZSBjYWxsCj4gdG8gU2V0UGFnZVVwdG9k
YXRlIGludG8gdWJpZnNfd3JpdGVfZW5kKCksIHdoaWNoIGlzIGFmdGVyIHdlIGNvcGllZCB0aGUK
PiBuZXcgZGF0YSBpbnRvIHRoZSBwYWdlLgo+IAo+IEZpeGVzOiAxZTUxNzY0YTNjMmEgKCJVQklG
UzogYWRkIG5ldyBmbGFzaCBmaWxlIHN5c3RlbSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4KPiAtLS0KPiAgIGZzL3ViaWZzL2ZpbGUuYyB8IDYgKysrLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9mcy91Ymlmcy9maWxlLmMgYi9mcy91Ymlmcy9maWxlLmMKPiBpbmRleCA1MDI5ZWIzMzkwYTUu
LjQwYTliMDNlZjgyMSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9maWxlLmMKPiArKysgYi9mcy91
Ymlmcy9maWxlLmMKPiBAQCAtNDYzLDkgKzQ2Myw2IEBAIHN0YXRpYyBpbnQgdWJpZnNfd3JpdGVf
YmVnaW4oc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+
ICAgCQkJCXJldHVybiBlcnI7Cj4gICAJCQl9Cj4gICAJCX0KPiAtCj4gLQkJU2V0UGFnZVVwdG9k
YXRlKHBhZ2UpOwo+IC0JCUNsZWFyUGFnZUVycm9yKHBhZ2UpOwo+ICAgCX0KClRoaXMgc29sdXRp
b24gbG9va3MgZ29vZCB0byBtZSwgYW5kIEkgdGhpbmsgJ1NldFBhZ2VVcHRvZGF0ZScgc2hvdWxk
IGJlIApyZW1vdmVkIGZyb20gd3JpdGVfYmVnaW5fc2xvdyhzbG93IHBhdGgpIHRvby4KCj4gICAK
PiAgIAllcnIgPSBhbGxvY2F0ZV9idWRnZXQoYywgcGFnZSwgdWksIGFwcGVuZGluZyk7Cj4gQEAg
LTU2OSw2ICs1NjYsOSBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlX2VuZChzdHJ1Y3QgZmlsZSAq
ZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJCWdvdG8gb3V0Owo+ICAg
CX0KPiAgIAo+ICsJaWYgKGxlbiA9PSBQQUdFX1NJWkUpCj4gKwkJU2V0UGFnZVVwdG9kYXRlKHBh
Z2UpOwo+ICsKPiAgIAlpZiAoIVBhZ2VQcml2YXRlKHBhZ2UpKSB7Cj4gICAJCWF0dGFjaF9wYWdl
X3ByaXZhdGUocGFnZSwgKHZvaWQgKikxKTsKPiAgIAkJYXRvbWljX2xvbmdfaW5jKCZjLT5kaXJ0
eV9wZ19jbnQpOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
