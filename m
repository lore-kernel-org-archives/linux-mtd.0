Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A2BC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTNCM2cQW6CXT0wiz9+EuF8P1idrhuThU17M7/EaQfY=; b=0gWPkS1oU5CeDO
	GiPYRpEHAGHFSaWnUSn92mvfu2YV32cE+CihT0DBV9Pk1Kuq88BTfT6yCtzmRqcxuYKAlO5PZvmW7
	Avt9BjEf+chsqOTb+WUIFObY4UfXJDcITKzEBv+5sNKUZHFK/xWL5KIYTghdqrZCzQgTBPqPEJtZI
	hJhe+HUWEUCWgnwGUW6DE9SMPpyp0e8Bo0L292jbF+LxifsVyh3JKIs7qEpIt+59AFG7nSU9EthxD
	MVoER4h1rf97Z0q9IndOSnGfT4ORm1fpMmzy8LBg/+RncJVybKz+D7ZZ5GZ9dqlrUUCg1mA6f5Dmy
	20brmqaVKdHOs1//VnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neAcE-00C3wK-7y; Tue, 12 Apr 2022 07:07:06 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neAcA-00C3ot-VA
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 07:07:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D03D2100006;
 Tue, 12 Apr 2022 07:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649747213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHE9xZlRw6yCvZ9NF+G39h3IwPXo9JEMBwpXiVM9BZY=;
 b=pop483FddIsrAJGnsnh4fpMhHQtW9fV5e+RCouMqROZqVSvYzfxHBAg/OdfnS6aIQJPDL6
 Xa8gFv8mzozSV0dnTOAn/eKoVLCEAuf34G2l+3xQsuQPvxb2EJYhpjqD2yQKN+HBB2/XDz
 BEcUjiLn3nvM6XkRdIHOBmnjCdH8J2lJ/3jL3c4kRweGp8ZWuKOto11K4N5ZN2cnJnuJsf
 lip2hfwR/6V6rcfKo9PhxpU3G7o/S/5cotLqIAwMNKMo89eRFLwl5tBInVnQlUtACV017C
 j0cEVktrqX1+sHtiCaIBbUg2ZuJqN0+EV3LqRQVZlUWkctqlRo9GvuicB4L5Og==
Date: Tue, 12 Apr 2022 09:06:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <p.yadav@ti.com>, Paul Cercueil
 <paul@crapouillou.net>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bastian Hecht <hechtb@googlemail.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Guennadi Liakhovetski
 <g.liakhovetski@gmx.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Message-ID: <20220412090649.33bb3f8b@xps13>
In-Reply-To: <20220412063703.8537-1-linmq006@gmail.com>
References: <202204121253.NcZifMQi-lkp@intel.com>
 <20220412063703.8537-1-linmq006@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_000703_202115_4FEC4FEA 
X-CRM114-Status: GOOD (  19.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlhb3FpYW4sCgpsaW5tcTAwNkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxMiBBcHIgMjAy
MiAwNjozNjo1MiArMDAwMDoKCj4gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkgcmV0dXJu
cyB1bnNpZ25lZCBsb25nIG5vdCBpbnQuCj4gSXQgcmV0dXJucyAwIGlmIHRpbWVkIG91dCwgYW5k
IHBvc2l0aXZlIGlmIGNvbXBsZXRlZC4KPiBUaGUgY2hlY2sgZm9yIDw9IDAgaXMgYW1iaWd1b3Vz
IGFuZCBzaG91bGQgYmUgPT0gMCBoZXJlCj4gaW5kaWNhdGluZyB0aW1lb3V0IHdoaWNoIGlzIHRo
ZSBvbmx5IGVycm9yIGNhc2UuCj4gCj4gRml4ZXM6IDgzNzM4ZDg3ZTNhMCAoIm10ZDogc2hfZmxj
dGw6IEFkZCBETUEgY2FwYWJpbHR5IikKPiBTaWduZWQtb2ZmLWJ5OiBNaWFvcWlhbiBMaW4gPGxp
bm1xMDA2QGdtYWlsLmNvbT4KPiAtLS0KPiBjaGFuZ2UgaW4gdjI6Cj4gLSBpbml0aWFsaXplIHJl
dCB0byAxLgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jIHwgOCArKysr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYwo+IGluZGV4IGI4NWI5YzZmY2M0Mi4uMjM3MzI1MWY1
ODViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jCj4gQEAgLTM4NCw3ICszODQsOCBAQCBz
dGF0aWMgaW50IGZsY3RsX2RtYV9maWZvMF90cmFuc2ZlcihzdHJ1Y3Qgc2hfZmxjdGwgKmZsY3Rs
LCB1bnNpZ25lZCBsb25nICpidWYsCj4gIAlkbWFfYWRkcl90IGRtYV9hZGRyOwo+ICAJZG1hX2Nv
b2tpZV90IGNvb2tpZTsKPiAgCXVpbnQzMl90IHJlZzsKPiAtCWludCByZXQ7Cj4gKwlpbnQgcmV0
ID0gMTsKCkRvZXMgbm90IGxvb2sgcmlnaHQuIEkga25vdyB0aGlzIGZ1bmN0aW9uIHJldHVybnMg
PiAwIG9uIHBvc2l0aXZlCm91dGNvbWVzIGJ1dCB0aGlzIGRvZXMgbm90IG1ha2UgYW55IHNlbnNl
IGluIHRoZSBmaXJzdCBwbGFjZS4KClRoaXMgZnVuY3Rpb24gaXMgc3RhdGljIGFuZCBvbmx5IGNh
bGxlZCB0d2ljZSwgcGxlYXNlIHR1cm4gaXQgaW50bwpzb21ldGhpbmcgbGlrZToKCmlmIChkbWFf
Zmlmb190cmFuc2ZlcigpKQoJZXJyb3IKZWxzZQoJb2sKCj4gKwl1bnNpZ25lZCBsb25nIHRpbWVf
bGVmdDsKPiAgCj4gIAlpZiAoZGlyID09IERNQV9GUk9NX0RFVklDRSkgewo+ICAJCWNoYW4gPSBm
bGN0bC0+Y2hhbl9maWZvMF9yeDsKPiBAQCAtNDI1LDEzICs0MjYsMTQgQEAgc3RhdGljIGludCBm
bGN0bF9kbWFfZmlmbzBfdHJhbnNmZXIoc3RydWN0IHNoX2ZsY3RsICpmbGN0bCwgdW5zaWduZWQg
bG9uZyAqYnVmLAo+ICAJCWdvdG8gb3V0Owo+ICAJfQo+ICAKPiAtCXJldCA9Cj4gKwl0aW1lX2xl
ZnQgPQo+ICAJd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZmbGN0bC0+ZG1hX2NvbXBsZXRl
LAo+ICAJCQkJbXNlY3NfdG9famlmZmllcygzMDAwKSk7Cj4gIAo+IC0JaWYgKHJldCA8PSAwKSB7
Cj4gKwlpZiAodGltZV9sZWZ0ID09IDApIHsKPiAgCQlkbWFlbmdpbmVfdGVybWluYXRlX2FsbChj
aGFuKTsKPiAgCQlkZXZfZXJyKCZmbGN0bC0+cGRldi0+ZGV2LCAid2FpdF9mb3JfY29tcGxldGlv
bl90aW1lb3V0XG4iKTsKPiArCQlyZXQgPSAtRVRJTUVET1VUOwo+ICAJfQo+ICAKPiAgb3V0OgoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
