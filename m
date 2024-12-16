Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DDDE7716A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 01:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NGjVUuTnspxkmYzhS3y7h29KOzEZTaa7NnkgdgktxA=; b=19C9eDmIBpuG3+loGHOcdUqsDK
	DuYILDzZa/SHNYuH/ZdlXTo0NhTZSe9+B20aCEEPUcNfcnqbgg/S2sxXO1JJzMpG5VI1E6tDVgFp+
	ST5PX3ptlv/3c+5gusX7kaKO/85NCX0oOvYCVrqUr/lttzoKFJ9HOOf3g786ZcJBjnkQZ7QP+mKYL
	zLR4VWy/IX214+yVROfARAybHV4LDh4D+EHz+8YMUdcCb8gE/CjggIjkesdtDDq5xIgrNUEtv3915
	7kF9PAqiej8iXpc4jhLUZ92Nq5UKgvy/RkcKuWYI7dJAXI+E+S/5zSlZtSinH7iL7qGwe1bpV9L8g
	CDAHI26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMznQ-00000008kGj-2fsZ;
	Mon, 16 Dec 2024 01:21:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMznM-00000008kFd-46L4
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 01:21:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YBMXF2VfXzhZVZ
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 09:18:37 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id EC05F1800E2
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 09:21:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 16 Dec 2024 09:21:06 +0800
Subject: Re: [PATCH mtd-utils] ffsX-utils: Fix integer overflow in jffs2dump.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241214133453.102014-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <00adc50a-4233-4c7e-50ce-c05854dc6bee@huawei.com>
Date: Mon, 16 Dec 2024 09:21:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241214133453.102014-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_172114_118977_37C12AAA 
X-CRM114-Status: GOOD (  14.66  )
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

1NogMjAyNC8xMi8xNCAyMTozNCwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBQb2ludGVyICdwYXRoJywgcmV0dXJuZWQgZnJvbSBmdW5jdGlv
biAneHN0cmR1cCcgYXQgamZmczJyZWFkZXIuYzo2OTAsIG1heSBiZSBOVUxMIGFuZCBpcyBkZXJl
ZmVyZW5jZWQgYXQgamZmczJyZWFkZXIuYzo2OTIuCj4gCj4gQ29ycmVjdGlvbnMgZXhwbGFpbmVk
Ogo+IEFmdGVyIGNhbGxpbmcgeHN0cmR1cChwKSwgYSBwYXRoID09IE5VTEwgY2hlY2sgaGFzIGJl
ZW4gYWRkZWQuIFRoaXMgcHJldmVudHMgYSBwb3NzaWJsZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2UgaW4gdGhlIGV2ZW50IG9mIGEgbWVtb3J5IGFsbG9jYXRpb24gZXJyb3IuCj4gCj4gVHJpZ2dl
cnMgZm91bmQgYnkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFu
dG9uIE1vcnlha292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+Cj4gCj4gLS0tCj4gICBqZmZz
WC11dGlscy9qZmZzMnJlYWRlci5jIHwgNSArKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9qZmZzWC11dGlscy9qZmZzMnJlYWRlci5jIGIv
amZmc1gtdXRpbHMvamZmczJyZWFkZXIuYwo+IGluZGV4IDg3YTIxNjcuLmY3NzY0NjYgMTAwNjQ0
Cj4gLS0tIGEvamZmc1gtdXRpbHMvamZmczJyZWFkZXIuYwo+ICsrKyBiL2pmZnNYLXV0aWxzL2pm
ZnMycmVhZGVyLmMKPiBAQCAtNjk0LDYgKzY5NCwxMSBAQCBzdGF0aWMgc3RydWN0IGpmZnMyX3Jh
d19kaXJlbnQgKnJlc29sdmVwYXRoMChjaGFyICpvLCBzaXplX3Qgc2l6ZSwgdWludDMyX3QgaW5v
LAo+ICAgCj4gICAJcHAgPSBwYXRoID0geHN0cmR1cChwKTsKPiAgIAo+ICsJaWYocGF0aCA9PSBO
VUxMKXsKPiArCQkqaW5vcyA9IDA7Cj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwl9Cj4gKwoKSGkgQW50
b24sIHBsZWFzZSBkbyBzb21lIG1hbnVhbCBhbmFseXNpcyBiZWZvcmUgc2VuZGluZyB0aGVzZSBw
YXRjaGVzIApzY2FubmVkIGJ5IHN0YXRpYyBhbmFseXplci4gQWNjb3JkaW5nIHRvIHRoZSByZWFs
aXphdGlvbiBvZiAneHN0cmR1cCgpJywgCnRoZSBwcm9ncmFtIHdpbGwgZXhpdCBpZiBhIGZhaWx1
cmUgbWVtb3J5IGFsbGNhdGlvbiBvY2N1cnMuCj4gICAJaWYgKCpwYXRoID09ICcvJykgewo+ICAg
CQlwYXRoKys7Cj4gICAJCWlubyA9IDE7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
