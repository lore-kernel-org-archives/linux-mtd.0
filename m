Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B16C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 May 2022 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUF8XCWDwuIPLgsHAk9Smsip81I4QLxKQnmkKSH6yAE=; b=n0/nDofPpHGghM
	MT4fKVgTEg73WX4Lx8zAU5DMMW4vFaHiPk7vc5xWHAXAhsksRNU0aLTLQCn5X+KGJzj+KsvPntpqK
	XWOwmwfWUGNYSd/V6de68NFHKjW0cJ1m8QNlNBu6eT4js2SnWohU4bHh1cUQORrn6xXs0JGq9Gg9X
	7obSpIaaxBiE3/AHR5NHK6zXAfwnwiCTN1VRijvvYI7jpuCG18If3ggJvDtdS/OBSkJu52fRo/bEo
	dzPZe4a4kvkwa/WQym1asJTSkiUcoJB8oWsPPipBuFPoAkTtu6TMwjFlX0NLgDrKnq3GSWht810nF
	L3cQo99Df2QGGLyRKCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns5sO-00Donq-KR; Fri, 20 May 2022 16:53:20 +0000
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns5sM-00DonH-AD
 for linux-mtd@lists.infradead.org; Fri, 20 May 2022 16:53:19 +0000
Received: from [192.168.1.18] ([86.243.180.246]) by smtp.orange.fr with ESMTPA
 id s5sEnGEDBYaC7s5sEnOR8j; Fri, 20 May 2022 18:53:16 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 20 May 2022 18:53:16 +0200
X-ME-IP: 86.243.180.246
Message-ID: <7b1b26e4-cc8e-3375-788c-56b5b548367d@wanadoo.fr>
Date: Fri, 20 May 2022 18:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] mtd: rawnand: cafe: fix drivers probe/remove methods
Content-Language: en-GB
To: Peng Wu <wupeng58@huawei.com>, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, liwei391@huawei.com,
 Kernel Janitors <kernel-janitors@vger.kernel.org>
References: <20220520084425.116686-1-wupeng58@huawei.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220520084425.116686-1-wupeng58@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_095318_533369_49F8D59B 
X-CRM114-Status: GOOD (  19.59  )
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

TGUgMjAvMDUvMjAyMiDDoCAxMDo0NCwgUGVuZyBXdSBhIMOpY3JpdMKgOgo+IERyaXZlciBzaG91
bGQgY2FsbCBwY2lfZGlzYWJsZV9kZXZpY2UoKSBpZiBpdCByZXR1cm5zIGZyb20KPiBjYWZlX25h
bmRfcHJvYmUoKSB3aXRoIGVycm9yLgo+IAo+IE1lYW53aGlsZSwgdGhlIGRyaXZlciBjYWxscyBw
Y2lfZW5hYmxlX2RldmljZSgpIGluCj4gY2FmZV9uYW5kX3Byb2JlKCksIGJ1dCBuZXZlciBjYWxs
cyBwY2lfZGlzYWJsZV9kZXZpY2UoKQo+IGR1cmluZyByZW1vdmFsLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBlbmcgV3UgPHd1cGVuZzU4QGh1YXdlaS5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBmaXggdGhl
IHN1YmplY3QgcHJlZml4IHdpdGggIm10ZDogcmFud25hbmQ6IGNhZmU6Igo+IC0tLQo+ICAgZHJp
dmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgfCA5ICsrKysrKystLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9j
YWZlX25hbmQuYwo+IGluZGV4IDlkYmYwMzE3MTZhNi4uYWYxMTllMzc2MzUyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZmVfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvY2FmZV9uYW5kLmMKPiBAQCAtNjc5LDggKzY3OSwxMCBAQCBzdGF0aWMgaW50IGNh
ZmVfbmFuZF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgIAlwY2lfc2V0X21hc3Rlcihw
ZGV2KTsKPiAgIAo+ICAgCWNhZmUgPSBremFsbG9jKHNpemVvZigqY2FmZSksIEdGUF9LRVJORUwp
Owo+IC0JaWYgKCFjYWZlKQo+IC0JCXJldHVybiAgLUVOT01FTTsKPiArCWlmICghY2FmZSkgewo+
ICsJCWVyciA9IC1FTk9NRU07Cj4gKwkJZ290byBvdXRfZGlzYWJsZV9kZXZpY2U7Cj4gKwl9Cj4g
ICAKPiAgIAltdGQgPSBuYW5kX3RvX210ZCgmY2FmZS0+bmFuZCk7Cj4gICAJbXRkLT5kZXYucGFy
ZW50ID0gJnBkZXYtPmRldjsKPiBAQCAtODAxLDYgKzgwMyw4IEBAIHN0YXRpYyBpbnQgY2FmZV9u
YW5kX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAgCXBjaV9pb3VubWFwKHBkZXYsIGNh
ZmUtPm1taW8pOwo+ICAgIG91dF9mcmVlX210ZDoKPiAgIAlrZnJlZShjYWZlKTsKPiArIG91dF9k
aXNhYmxlX2RldmljZToKPiArCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPiAgICBvdXQ6Cj4g
ICAJcmV0dXJuIGVycjsKPiAgIH0KPiBAQCAtODIyLDYgKzgyNiw3IEBAIHN0YXRpYyB2b2lkIGNh
ZmVfbmFuZF9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gICAJcGNpX2lvdW5tYXAocGRl
diwgY2FmZS0+bW1pbyk7Cj4gICAJZG1hX2ZyZWVfY29oZXJlbnQoJmNhZmUtPnBkZXYtPmRldiwg
MjExMiwgY2FmZS0+ZG1hYnVmLCBjYWZlLT5kbWFhZGRyKTsKCkhpLAoKTm90IHJlbGF0ZWQgdG8g
dGhpcyBwYXRjaCAsIGJ1dCBJIHdvbmRlciBpZiB0aGlzIGRtYV9mcmVlX2NvaGVyZW50KCkgaXMg
Cm5lZWRlZC4KSXQgaXMgYWxyZWFkeSBwYXJ0IG9mIGNhZmVfbmFuZF9kZXRhY2hfY2hpcCgpIHdo
aWNoIGlzIGEgLmRldGFjaF9jaGlwKCkgCmZ1bmN0aW9uLgoKSXMgdGhpcyAuZGV0YWNoX2NoaXAo
KSBmdW5jdGlvbiBhbHJlYWR5IGNhbGxlZCAoYnkgbmFuZF9jbGVhbnVwKCkpIApzb21ld2hlcmUg
aW4gdGhlIHJlbW92YWwgcHJvY2Vzcz8KCkNKCgoKPiAgIAlrZnJlZShjYWZlKTsKPiArCXBjaV9k
aXNhYmxlX2RldmljZShwZGV2KTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
Y2lfZGV2aWNlX2lkIGNhZmVfbmFuZF90YmxbXSA9IHsKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
