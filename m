Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E324C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 May 2022 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsvq9TBI9ApHCvN4fng89wyid7Y60u2PyrR17Of4L58=; b=wZc8LbwOO0Vqjv
	kLyXwQB2cFmu69xQegP3oCuFJe7NsyLfIW6o5EZK8gLfhv/DhXAXKL8DDQyBd3FG3DInjCi4nrD/I
	sfWJfgssut7CzK9svKDKYTrurUG3nuoJ4L0NCIA47IHWmWY1r2HIjhnUOEUDtIEMVRKvAmvZmCZhU
	bdYVPgOfwEHRu51+EtaGXyYo3mGQU4FxBmL31Q45alovJvXRfsCV1CktnITM+xQ5qu097fPikpWEj
	hOlYWoMi8TNI9aYd/6B0xhq3BV8qSIp5o22k+YGKVVwLaNKUJ4eReAEagn4NXAcALX+/WOR232/Df
	Jt0KCBsG5vRy1THBAliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns67w-00Dqhl-TE; Fri, 20 May 2022 17:09:24 +0000
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns67t-00DqdU-TL
 for linux-mtd@lists.infradead.org; Fri, 20 May 2022 17:09:23 +0000
Received: from [192.168.1.18] ([86.243.180.246]) by smtp.orange.fr with ESMTPA
 id s67knGiLCm7vss67kn9UzI; Fri, 20 May 2022 19:09:16 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 20 May 2022 19:09:16 +0200
X-ME-IP: 86.243.180.246
Message-ID: <2c788d15-e771-377a-2dd2-796c86cf6f8a@wanadoo.fr>
Date: Fri, 20 May 2022 19:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] mtd: rawnand: cafe: fix drivers probe/remove methods
Content-Language: en-US
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Peng Wu <wupeng58@huawei.com>, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, liwei391@huawei.com,
 Kernel Janitors <kernel-janitors@vger.kernel.org>
References: <20220520084425.116686-1-wupeng58@huawei.com>
 <7b1b26e4-cc8e-3375-788c-56b5b548367d@wanadoo.fr>
In-Reply-To: <7b1b26e4-cc8e-3375-788c-56b5b548367d@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_100922_122439_1874659F 
X-CRM114-Status: GOOD (  19.94  )
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

CgpMZSAyMC8wNS8yMDIyIMOgIDE4OjUzLCBDaHJpc3RvcGhlIEpBSUxMRVQgYSDDqWNyaXTCoDoK
PiBMZSAyMC8wNS8yMDIyIMOgIDEwOjQ0LCBQZW5nIFd1IGEgw6ljcml0wqA6Cj4+IERyaXZlciBz
aG91bGQgY2FsbCBwY2lfZGlzYWJsZV9kZXZpY2UoKSBpZiBpdCByZXR1cm5zIGZyb20KPj4gY2Fm
ZV9uYW5kX3Byb2JlKCkgd2l0aCBlcnJvci4KPj4KPj4gTWVhbndoaWxlLCB0aGUgZHJpdmVyIGNh
bGxzIHBjaV9lbmFibGVfZGV2aWNlKCkgaW4KPj4gY2FmZV9uYW5kX3Byb2JlKCksIGJ1dCBuZXZl
ciBjYWxscyBwY2lfZGlzYWJsZV9kZXZpY2UoKQo+PiBkdXJpbmcgcmVtb3ZhbC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUGVuZyBXdSA8d3VwZW5nNThAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IHYyOgo+
PiAtIGZpeCB0aGUgc3ViamVjdCBwcmVmaXggd2l0aCAibXRkOiByYW53bmFuZDogY2FmZToiCj4+
IC0tLQo+PiDCoCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYyB8IDkgKysrKysrKy0t
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYyAKPj4gYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+PiBpbmRleCA5ZGJmMDMxNzE2YTYuLmFm
MTE5ZTM3NjM1MiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5k
LmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKPj4gQEAgLTY3OSw4
ICs2NzksMTAgQEAgc3RhdGljIGludCBjYWZlX25hbmRfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBk
ZXYsCj4+IMKgwqDCoMKgwqAgcGNpX3NldF9tYXN0ZXIocGRldik7Cj4+IMKgwqDCoMKgwqAgY2Fm
ZSA9IGt6YWxsb2Moc2l6ZW9mKCpjYWZlKSwgR0ZQX0tFUk5FTCk7Cj4+IC3CoMKgwqAgaWYgKCFj
YWZlKQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuwqAgLUVOT01FTTsKPj4gK8KgwqDCoCBpZiAo
IWNhZmUpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGVyciA9IC1FTk9NRU07Cj4+ICvCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dF9kaXNhYmxlX2RldmljZTsKPj4gK8KgwqDCoCB9Cj4+IMKgwqDCoMKgwqAg
bXRkID0gbmFuZF90b19tdGQoJmNhZmUtPm5hbmQpOwo+PiDCoMKgwqDCoMKgIG10ZC0+ZGV2LnBh
cmVudCA9ICZwZGV2LT5kZXY7Cj4+IEBAIC04MDEsNiArODAzLDggQEAgc3RhdGljIGludCBjYWZl
X25hbmRfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4+IMKgwqDCoMKgwqAgcGNpX2lvdW5t
YXAocGRldiwgY2FmZS0+bW1pbyk7Cj4+IMKgwqAgb3V0X2ZyZWVfbXRkOgo+PiDCoMKgwqDCoMKg
IGtmcmVlKGNhZmUpOwo+PiArIG91dF9kaXNhYmxlX2RldmljZToKPj4gK8KgwqDCoCBwY2lfZGlz
YWJsZV9kZXZpY2UocGRldik7Cj4+IMKgwqAgb3V0Ogo+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7
Cj4+IMKgIH0KPj4gQEAgLTgyMiw2ICs4MjYsNyBAQCBzdGF0aWMgdm9pZCBjYWZlX25hbmRfcmVt
b3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+PiDCoMKgwqDCoMKgIHBjaV9pb3VubWFwKHBkZXYs
IGNhZmUtPm1taW8pOwo+PiDCoMKgwqDCoMKgIGRtYV9mcmVlX2NvaGVyZW50KCZjYWZlLT5wZGV2
LT5kZXYsIDIxMTIsIGNhZmUtPmRtYWJ1ZiwgCj4+IGNhZmUtPmRtYWFkZHIpOwo+IAo+IEhpLAo+
IAo+IE5vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2ggLCBidXQgSSB3b25kZXIgaWYgdGhpcyBkbWFf
ZnJlZV9jb2hlcmVudCgpIGlzIAo+IG5lZWRlZC4KPiBJdCBpcyBhbHJlYWR5IHBhcnQgb2YgY2Fm
ZV9uYW5kX2RldGFjaF9jaGlwKCkgd2hpY2ggaXMgYSAuZGV0YWNoX2NoaXAoKSAKPiBmdW5jdGlv
bi4KPiAKPiBJcyB0aGlzIC5kZXRhY2hfY2hpcCgpIGZ1bmN0aW9uIGFscmVhZHkgY2FsbGVkIChi
eSBuYW5kX2NsZWFudXAoKSkgCj4gc29tZXdoZXJlIGluIHRoZSByZW1vdmFsIHByb2Nlc3M/Cj4g
CgpJbiBmYWN0IHRoZSAic29tZXdoZXJlIiBpcyBqdXN0IDMgbGluZXMgYWJvdmUgdGhlIGRtYV9m
cmVlX2NvaGVyZW50KCkgCmNhbGwuIFNvIEkgZGVmaW5pdGl2ZWx5IHRoaW5rIHRoYXQgdGhpcyBs
aW5lIHNob3VsZCBiZSBheGVkLgoKQ0oKCgo+IENKCj4gCj4gCj4+IMKgwqDCoMKgwqAga2ZyZWUo
Y2FmZSk7Cj4+ICvCoMKgwqAgcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOwo+PiDCoCB9Cj4+IMKg
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBjYWZlX25hbmRfdGJsW10gPSB7Cj4g
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
