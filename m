Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B8BE77184
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2024 01:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHYflWIYti3KebAheQcoSkj6o+YwRHzIPNgQaOwEgv4=; b=eaQgL9m/3W1s7I9jrTDBYgzlxG
	CJtA0Sxf0+4TG9xH2lyrDxU4X1DWfJFQrZw2qijrjnLwbjP+o4XIQCkCiJ4fw+PytXBLZSlaAK89P
	HzVZePKR7gM7kmiMyg7TjXiHhEYrNr9/kae+4uBVpAyNWfWc6Jll24x3ZtJCQN5dLXy6PwKu3/tuQ
	lrA5nsMXac2hHH2Xfbq9Maug6fn8dyLf6e3ml/JkHcArRdLUkZ4petJ3YhmQoNl3A69X5KORNtuIm
	bBPx+KdgbTM1ioSFxzShHHke5j+7JUsFmOCA4O7Sko8TiYND4txjM8/6BUo8MSSOye8uigXC5hm/4
	W5m6wi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tORbC-00000003Yq1-2jqq;
	Fri, 20 Dec 2024 01:14:38 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORbA-00000003YpB-09Uj
	for linux-mtd@lists.infradead.org;
	Fri, 20 Dec 2024 01:14:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YDqFC4hhYz1JFfF
	for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2024 09:14:07 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 135F51400D3
	for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2024 09:14:32 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Dec 2024 09:14:31 +0800
Subject: Re: [PATCH mtd-utils] jffsX-utils: fix integer overflow in
 jffs2dump.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241219134612.711532-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <395627be-0d5c-469e-262a-1a7454be7fd8@huawei.com>
Date: Fri, 20 Dec 2024 09:14:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241219134612.711532-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_171436_246224_57196BA3 
X-CRM114-Status: GOOD (  15.38  )
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

1NogMjAyNC8xMi8xOSAyMTo0NiwgQW50b24gTW9yeWFrb3Yg0LS1wDoKPiBSZXBvcnQgb2YgdGhl
IHN0YXRpYyBhbmFseXplcjoKPiBUaGUgdmFsdWUgb2YgYW4gYXJpdGhtZXRpYyBleHByZXNzaW9u
ICdkYXRzaXplICsgb29ic2l6ZScgaXMgYSBzdWJqZWN0IHRvIG92ZXJmbG93IGJlY2F1c2UgaXRz
IG9wZXJhbmRzIGFyZSBub3QgY2FzdCB0byBhIGxhcmdlciBkYXRhIHR5cGUgYmVmb3JlIHBlcmZv
cm1pbmcgYXJpdGhtZXRpYy4KPiAKPiBDb3JyZWN0aW9ucyBleHBsYWluZWQ6Cj4gLSBBZGRlZCBh
IGNoZWNrIHRvIHZhbGlkYXRlIGRhdHNpemUgYW5kIG9vYnNpemUgdG8gZW5zdXJlIHRoZXkgYXJl
IG5vbi1uZWdhdGl2ZSBhbmQgd2l0aGluIGEgc2FmZSByYW5nZS4KPiAtIENhc3QgZGF0c2l6ZSBh
bmQgb29ic2l6ZSB0byBsb25nIGJlZm9yZSBwZXJmb3JtaW5nIGFyaXRobWV0aWMgdG8gcHJldmVu
dCBwb3RlbnRpYWwgaW50ZWdlciBvdmVyZmxvdy4KPiAKPiBUaGlzIGNoYW5nZSBlbnN1cmVzIHNh
ZmUgY29tcHV0YXRpb24gb2Ygb2Zmc2V0cyBhbmQgcHJldmVudHMgdW5kZWZpbmVkIGJlaGF2aW9y
IGNhdXNlZCBieSBvdmVyZmxvdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBNb3J5YWtvdiA8
YW50LnYubW9yeWFrb3ZAZ21haWwuY29tPgo+IC0tLQo+ICAgamZmc1gtdXRpbHMvamZmczJkdW1w
LmMgfCA5ICsrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9qZmZzWC11dGlscy9qZmZzMmR1bXAuYyBiL2pm
ZnNYLXV0aWxzL2pmZnMyZHVtcC5jCj4gaW5kZXggMzA0NTVlYS4uNWIwZTE0NCAxMDA2NDQKPiAt
LS0gYS9qZmZzWC11dGlscy9qZmZzMmR1bXAuYwo+ICsrKyBiL2pmZnNYLXV0aWxzL2pmZnMyZHVt
cC5jCj4gQEAgLTc3Miw2ICs3NzIsMTMgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQo+ICAgCQlleGl0KEVYSVRfRkFJTFVSRSk7Cj4gICAJfQo+ICAgCj4gKwlpZiAoZGF0c2l6ZSA8
IDAgIG9vYnNpemUgPCAwICBkYXRzaXplID4gaW1nbGVuIHx8IChsb25nKWRhdHNpemUgKyBvb2Jz
aXplIDwgMCkgewoKSXQgbWFrZXMgY29tcGlsaW5nIGZhaWxlZCwgcGxlYXNlIGRvIHRoZSBiYXNp
YyB0ZXN0cyBiZWZvcmUgc2VuZGluZyAKcGF0Y2hlcyBvdXQuCj4gKwkJZnByaW50ZihzdGRlcnIs
ICJFcnJvcjogaW52YWxpZCBkYXRzaXplL29vYnNpemUuXG4iKTsKPiArCQlmcmVlKGRhdGEpOwo+
ICsJCWNsb3NlIChmZCk7Cj4gKwkJZXhpdChFWElUX0ZBSUxVUkUpOwo+ICsJfQo+ICsKPiAgIAlp
ZiAoZGF0c2l6ZSAmJiBvb2JzaXplKSB7Cj4gICAJCWludCAgaWR4ID0gMDsKPiAgIAkJbG9uZyBs
ZW4gPSBpbWdsZW47Cj4gQEAgLTc4Myw3ICs3OTAsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCj4gICAJCQlyZWFkX25vY2hlY2sgKGZkLCBvb2IsIG9vYnNpemUpOwo+ICAgCQkJ
aWR4ICs9IGRhdHNpemU7Cj4gICAJCQlpbWdsZW4gLT0gb29ic2l6ZTsKPiAtCQkJbGVuIC09IGRh
dHNpemUgKyBvb2JzaXplOwo+ICsJCQlsZW4gLT0gKGxvbmcpZGF0c2l6ZSArIG9vYnNpemU7Cj4g
ICAJCX0KPiAgIAo+ICAgCX0gZWxzZSB7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
