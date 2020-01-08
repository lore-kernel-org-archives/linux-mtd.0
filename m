Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C225C00523
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 08:16:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F71D21569
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 08:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XL1jVugb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F71D21569
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nx7swaH6qcoEafkKNQ/1frYltpwqLgnEWko6EehVwVI=; b=XL1jVugbzrR383
	YgdEOf4ocGyAH7U0FMsLQ6UBZVLaoK0EycWfS3pRSfAFR2kIMhDRwZW8mWrsmgowDFiq6Hg/3ljbK
	W7yj3psTGDDqUdTW6KpCdvtiooKR1Sq/acaKlUHTZv87ODEl5MNs2KI2c5EXD4qkbYWQPp3Ybm7oz
	yfPt8S8zR1eWcmKIYVQT1ILVR+9MgaJXitUvwjaldji3BPoqPU2ZuJdWYNu5qD0Xob26pzZbGwA3o
	p8nudz0NX0VrPVb/UtZ3rpgmAHXC6eFZHuZVF08N5cGeFMuEus/vrDjHvG383i4ifEhjQvlhUNCHX
	epXoAhSz5JMP/kO2jgOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6VL-0001uh-GW; Wed, 08 Jan 2020 08:15:51 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6VE-0001t8-05
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 08:15:45 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id CB699240010;
 Wed,  8 Jan 2020 08:15:29 +0000 (UTC)
Date: Wed, 8 Jan 2020 09:15:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: sm_ftl: fix NULL pointer warning
Message-ID: <20200108091528.2c89d97f@xps13>
In-Reply-To: <20200107212509.4004137-1-arnd@arndb.de>
References: <20200107212509.4004137-1-arnd@arndb.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_001544_178352_3B471B63 
X-CRM114-Status: GOOD (  15.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, Wenwen Wang <wenwen@cs.uga.edu>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCkFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlIG9uIFR1ZSwgIDcg
SmFuIDIwMjAgMjI6MjQ6NTIgKzAxMDA6Cgo+IFdpdGggZ2NjIC1PMywgd2UgZ2V0IGEgbmV3IHdh
cm5pbmc6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmg6MjgsCj4gICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvbXRkL3NtX2Z0
bC5jOjg6Cj4gSW4gZnVuY3Rpb24gJ21lbXNldCcsCj4gICAgIGlubGluZWQgZnJvbSAnc21fcmVh
ZF9zZWN0b3IuY29uc3Rwcm9wJyBhdCBkcml2ZXJzL210ZC9zbV9mdGwuYzoyNTA6MzoKPiBpbmNs
dWRlL2xpbnV4L3N0cmluZy5oOjQxMTo5OiBlcnJvcjogYXJndW1lbnQgMSBudWxsIHdoZXJlIG5v
bi1udWxsIGV4cGVjdGVkIFstV2Vycm9yPW5vbm51bGxdCj4gICByZXR1cm4gX19idWlsdGluX21l
bXNldChwLCBjLCBzaXplKTsKPiAKPiBGcm9tIGFsbCBJIGNhbiB0ZWxsLCB0aGlzIGNhbm5vdCBo
YXBwZW4gKHRoZSBmdW5jdGlvbiBpcyBjYWxsZWQKPiBlaXRoZXIgd2l0aCBhIE5VTEwgYnVmZmVy
IG9yIHdpdGggYSAtMSBibG9jayBudW1iZXIgYnV0IG5vdCBib3RoKSwKPiBidXQgYWRkaW5nIGEg
Y2hlY2sgbWFrZXMgaXQgbW9yZSByb2J1c3QgYW5kIGF2b2lkcyB0aGUgd2FybmluZy4KPiAKPiBG
aXhlczogbW10b20gKCJpbml0L0tjb25maWc6IGVuYWJsZSAtTzMgZm9yIGFsbCBhcmNoZXMiKQo+
IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL3NtX2Z0bC5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zbV9mdGwu
YyBiL2RyaXZlcnMvbXRkL3NtX2Z0bC5jCj4gaW5kZXggNDc0NGJmOTRhZDlhLi5iOWYyNzI0MDhj
NGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc21fZnRsLmMKPiArKysgYi9kcml2ZXJzL210
ZC9zbV9mdGwuYwo+IEBAIC0yNDcsNyArMjQ3LDggQEAgc3RhdGljIGludCBzbV9yZWFkX3NlY3Rv
cihzdHJ1Y3Qgc21fZnRsICpmdGwsCj4gIAo+ICAJLyogRlRMIGNhbiBjb250YWluIC0xIGVudHJp
ZXMgdGhhdCBhcmUgYnkgZGVmYXVsdCBmaWxsZWQgd2l0aCBiaXRzICovCj4gIAlpZiAoYmxvY2sg
PT0gLTEpIHsKPiAtCQltZW1zZXQoYnVmZmVyLCAweEZGLCBTTV9TRUNUT1JfU0laRSk7Cj4gKwkJ
aWYgKGJ1ZmZlcikKPiArCQkJbWVtc2V0KGJ1ZmZlciwgMHhGRiwgU01fU0VDVE9SX1NJWkUpOwo+
ICAJCXJldHVybiAwOwo+ICAJfQo+ICAKCldoYXQgYWJvdXQgYSBzaW1wbGVyIGZvcm06CgogICAg
ICAgIGlmIChidWZmZXIgJiYgYmxvY2sgPT0gLTEpIHsgLi4uCgpJbnN0ZWFkIG9mIGFuIGFkZGl0
aW9uYWwgaW5kZW50YXRpb24gbGV2ZWw/IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
