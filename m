Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1024CCFA13
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFzEXLWqiVwCv5JUwVbKfEzY0dP8lRJTOdkZjJvuyWI=; b=Yy6jr5WF0A8g5FHQYReIjANf/L
	Fmli/1I22CLI5+I+ZksQFcDoy6PhDWgFHziQgo/yWAsy3Qvhhk/Vt+mz++zymkI7jYSbFPhudHAkf
	Bc0bG4JMhUE7ES8N94RoOSCrxRV6+ZidFsKnft4H5DJsp0TMMTKrf05Tt34np8yuoqhu1DdtqasjU
	0cLYjXB8TAXklL+zC52DfbL4fSzHH8ON+Yrl1PMFicy2/jHSuSfdSpgkoGT2tbVFFja9NKc6O/Ajy
	pk5FaB5pgp4zz2bjPuTyoF8HFUUB0jTxr6QWGKWbwEO3ZrGMQiOdPiQwXhVbamqT1YqMOJJUhFIah
	D4P+0osA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmQs-00000008Bg4-47T4;
	Thu, 26 Sep 2024 11:13:14 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stmQo-00000008BdT-424U
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 11:13:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XDrY74Sk8zFqqd;
	Thu, 26 Sep 2024 19:12:43 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 409D7140390;
	Thu, 26 Sep 2024 19:13:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 19:13:05 +0800
Subject: Re: [PATCH 2/2] ubifs: Reduce kfree() calls in ubifs_purge_xattrs()
To: Markus Elfring <Markus.Elfring@web.de>, <linux-mtd@lists.infradead.org>,
	Richard Weinberger <richard@nod.at>
CC: LKML <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <ff787fb9-a9fc-4798-8460-3ec310e6cd9f@web.de>
 <fc35a4b0-9a41-4f14-9558-99fc0b7e2ad8@web.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2012c8b6-b960-d597-481d-5f051686ffe1@huawei.com>
Date: Thu, 26 Sep 2024 19:13:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fc35a4b0-9a41-4f14-9558-99fc0b7e2ad8@web.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_041311_290194_57210E2F 
X-CRM114-Status: GOOD (  13.99  )
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

5ZyoIDIwMjQvOS8yNiAxNzo1MCwgTWFya3VzIEVsZnJpbmcg5YaZ6YGTOgo+IEZyb206IE1hcmt1
cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBUaHUsIDI2
IFNlcCAyMDI0IDExOjI4OjQ4ICswMjAwCj4gCj4gTW92ZSBhIHBhaXIgb2Yga2ZyZWUoKSBjYWxs
cyBiZWhpbmQgdGhlIGxhYmVsIOKAnG91dF9lcnLigJ0KPiBzbyB0aGF0IHR3byBzdGF0ZW1lbnRz
IGNhbiBiZSBiZXR0ZXIgcmV1c2VkIGF0IHRoZSBlbmQgb2YKPiB0aGlzIGZ1bmN0aW9uIGltcGxl
bWVudGF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVz
ZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiAtLS0KPiAgIGZzL3ViaWZzL3hhdHRyLmMgfCA2ICsrLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
ClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRp
ZmYgLS1naXQgYS9mcy91Ymlmcy94YXR0ci5jIGIvZnMvdWJpZnMveGF0dHIuYwo+IGluZGV4IDc3
NTc5NTllOWYwOS4uYTUxNGRjNGRjNTM1IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3hhdHRyLmMK
PiArKysgYi9mcy91Ymlmcy94YXR0ci5jCj4gQEAgLTUzMiw4ICs1MzIsNiBAQCBpbnQgdWJpZnNf
cHVyZ2VfeGF0dHJzKHN0cnVjdCBpbm9kZSAqaG9zdCkKPiAgIAkJCXViaWZzX2VycihjLCAiZGVh
ZCBkaXJlY3RvcnkgZW50cnkgJyVzJywgZXJyb3IgJWQiLAo+ICAgCQkJCSAgeGVudC0+bmFtZSwg
ZXJyKTsKPiAgIAkJCXViaWZzX3JvX21vZGUoYywgZXJyKTsKPiAtCQkJa2ZyZWUocHhlbnQpOwo+
IC0JCQlrZnJlZSh4ZW50KTsKPiAgIAkJCWdvdG8gb3V0X2VycjsKPiAgIAkJfQo+IAo+IEBAIC01
NDMsOCArNTQxLDYgQEAgaW50IHViaWZzX3B1cmdlX3hhdHRycyhzdHJ1Y3QgaW5vZGUgKmhvc3Qp
Cj4gICAJCWVyciA9IHJlbW92ZV94YXR0cihjLCBob3N0LCB4aW5vLCAmbm0pOwo+ICAgCQlpcHV0
KHhpbm8pOwo+ICAgCQlpZiAoZXJyKSB7Cj4gLQkJCWtmcmVlKHB4ZW50KTsKPiAtCQkJa2ZyZWUo
eGVudCk7Cj4gICAJCQl1Ymlmc19lcnIoYywgImNhbm5vdCByZW1vdmUgeGF0dHIsIGVycm9yICVk
IiwgZXJyKTsKPiAgIAkJCWdvdG8gb3V0X2VycjsKPiAgIAkJfQo+IEBAIC01NjQsNiArNTYwLDgg
QEAgaW50IHViaWZzX3B1cmdlX3hhdHRycyhzdHJ1Y3QgaW5vZGUgKmhvc3QpCj4gICAJcmV0dXJu
IDA7Cj4gCj4gICBvdXRfZXJyOgo+ICsJa2ZyZWUocHhlbnQpOwo+ICsJa2ZyZWUoeGVudCk7Cj4g
ICAJdXBfd3JpdGUoJnViaWZzX2lub2RlKGhvc3QpLT54YXR0cl9zZW0pOwo+ICAgCXJldHVybiBl
cnI7Cj4gICB9Cj4gLS0KPiAyLjQ2LjEKPiAKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
