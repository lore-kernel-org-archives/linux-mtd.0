Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E80C00144
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Aug 2022 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9YZghX5NSKcYHsa5AvfUICdorEcjiXfStzSC88Ap18=; b=qSH+znsHF0hYh/
	16rz/qZ97oZlgZgbsLv1HO75abH6v7Xp210OPc2kXUI2ijl7BUQtFutuMUyy8i/PU6j0sJcj4DK6M
	9J6umxgR5vdq024sIL3IC7MCn5Ke8lVmKJ7BnX9z6/XmWIq70j23WWD1slK2+3a+XXKxBEX9fS1OO
	TOvnNNIYdZ8LhtoXPApCEsnDc+G+kkgUA+A+zikvG14eXV++qdr6N0VE4Jjcck9oDB2/22rmhy2D1
	n7j/MGPx8bdmgaX71N9GGY/mkR89bbIaECPuNzN7Su9dFDYzUMN9Q51c/O+eees7d0xR0Qt7E5/jU
	fNTqdiG6e74g0czm557g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIa7S-008vOD-8p; Mon, 01 Aug 2022 18:26:22 +0000
Received: from smtp-12.smtpout.orange.fr ([80.12.242.12] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIa7N-008vGi-Dc
	for linux-mtd@lists.infradead.org; Mon, 01 Aug 2022 18:26:20 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id Ia7Do2ZzH9qatIa7Docuu3; Mon, 01 Aug 2022 20:26:12 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 01 Aug 2022 20:26:12 +0200
X-ME-IP: 90.11.190.129
Message-ID: <dac8e781-5c2b-4ba1-34a7-d902ba060b29@wanadoo.fr>
Date: Mon, 1 Aug 2022 20:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: rawnand: denali: Fix a possible resource leak in
 denali_pci_probe
Content-Language: en-US
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangweiyang2@huawei.com
References: <20220801080315.1713934-1-gongruiqi1@huawei.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220801080315.1713934-1-gongruiqi1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_112617_739567_055E1F96 
X-CRM114-Status: GOOD (  17.76  )
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

TGUgMDEvMDgvMjAyMiDDoCAxMDowMywgR09ORywgUnVpcWkgYSDDqWNyaXTCoDoKPiBDYWxsIHBj
aV9yZWxlYXNlX3JlZ2lvbnMoKSB0byByZXRyaWV2ZSB0aGUgYWxsb2NhdGVkIHJlc291cmNlIHdo
ZW4KPiBkZXZtX2lvcmVtYXAoKSBvciBkZW5hbGlfaW5pdCgpIGZhaWxlZC4KPiAKCkhpLAp0aGlz
IGlzIG5vdCBjb3JyZWN0LgoKRmlyc3QsIHNob3VsZCB5b3UgYmUgcmlnaHQsIHlvdSBzaG91bGQg
YWxzbyB1cGRhdGUgdGhlIC5yZW1vdmUoKSAKZnVuY3Rpb24gdGhlIHNhbWUgd2F5LgoKU2Vjb25k
LCBhdCB0aGUgYmVnaW5uaW5nIHRoZXJlIGlzIHBjaW1fZW5hYmxlX2RldmljZSgpIGNhbGwuClRo
aXMgbG9va2VkIGxpa2UgbWFnaWMgdG8gbWUgd2hlbiBJIGZpcnN0IHNhdyBpdCwgYnV0IHRoaXMg
ZnVuY3Rpb24gCm1ha2VzIHNvbWUgcGNpXyBmdW5jdGlvbnMgd29yayBqdXN0IGFzIGl0IHRoZXkg
d2VyZSBwY2ltXyBmdW5jdGlvbnMuCgpTZWUgcGNpbV9lbmFibGVfZGV2aWNlKCkgKFsxXSksIGF0
IGxpbmUgMjEzMi4KV2hlbiBwY2ltX3JlbGVhc2UoKSAoWzJdKSBpcyBjYWxsZWQgYnkgdGhlIGZy
YW1ld29yaywgdGhlbiByZWdpb25zIGFyZSAKcmVsZWFzZWQgYXQgbGluZSAyMDc5CgpDSgoKWzFd
OiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS9zb3VyY2UvZHJpdmVycy9w
Y2kvcGNpLmMjTDIxMTgKWzJdOiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4x
OS9zb3VyY2UvZHJpdmVycy9wY2kvcGNpLmMjTDIwNzEKCj4gU2lnbmVkLW9mZi1ieTogR09ORywg
UnVpcWkgPGdvbmdydWlxaTFAaHVhd2VpLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2RlbmFsaV9wY2kuYyB8IDkgKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9kZW5hbGlfcGNpLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlfcGNpLmMK
PiBpbmRleCBkZTdlNzIyZDM4MjYuLjQwOTQzY2RhMDkxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9kZW5hbGlfcGNpLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9k
ZW5hbGlfcGNpLmMKPiBAQCAtNzQsMjEgKzc0LDIyIEBAIHN0YXRpYyBpbnQgZGVuYWxpX3BjaV9w
cm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQp
Cj4gICAJCXJldHVybiByZXQ7Cj4gICAJfQo+ICAgCj4gKwlyZXQgPSAtRU5PTUVNOwo+ICAgCWRl
bmFsaS0+cmVnID0gZGV2bV9pb3JlbWFwKGRlbmFsaS0+ZGV2LCBjc3JfYmFzZSwgY3NyX2xlbik7
Cj4gICAJaWYgKCFkZW5hbGktPnJlZykgewo+ICAgCQlkZXZfZXJyKCZkZXYtPmRldiwgIlNwZWN0
cmE6IFVuYWJsZSB0byByZW1hcCBtZW1vcnkgcmVnaW9uXG4iKTsKPiAtCQlyZXR1cm4gLUVOT01F
TTsKPiArCQlnb3RvIG91dF9yZWxlYXNlX3BjaTsKPiAgIAl9Cj4gICAKPiAgIAlkZW5hbGktPmhv
c3QgPSBkZXZtX2lvcmVtYXAoZGVuYWxpLT5kZXYsIG1lbV9iYXNlLCBtZW1fbGVuKTsKPiAgIAlp
ZiAoIWRlbmFsaS0+aG9zdCkgewo+ICAgCQlkZXZfZXJyKCZkZXYtPmRldiwgIlNwZWN0cmE6IGlv
cmVtYXAgZmFpbGVkISIpOwo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJCWdvdG8gb3V0X3JlbGVh
c2VfcGNpOwo+ICAgCX0KPiAgIAo+ICAgCXJldCA9IGRlbmFsaV9pbml0KGRlbmFsaSk7Cj4gICAJ
aWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8gb3V0X3JlbGVhc2VfcGNpOwo+ICAg
Cj4gICAJbnNlbHMgPSBkZW5hbGktPm5iYW5rczsKPiAgIAo+IEBAIC0xMTYsNiArMTE3LDggQEAg
c3RhdGljIGludCBkZW5hbGlfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPiAgIAo+ICAgb3V0X3JlbW92ZV9kZW5hbGk6Cj4gICAJ
ZGVuYWxpX3JlbW92ZShkZW5hbGkpOwo+ICtvdXRfcmVsZWFzZV9wY2k6Cj4gKwlwY2lfcmVsZWFz
ZV9yZWdpb25zKGRldik7Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAgIAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
