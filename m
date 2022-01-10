Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F4AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbpQyTOVx3/OEs1wE1RjZFIAToZSymHJPU2MIbRwEiY=; b=Abs/VQJbh+J++T
	cnt6ZHF3F9M4+d3BEcEEZhYak9YjqHObv8quntHJA6zaVK8tunX90AePqXO+zzdfSQkGqAgX1XsGD
	yChDFGCmV+NP/9lKCX6bS4cOJhhodl5rmML/821e1K6iAdOAd92J93vrtZQo23AdRQdFR3gpI9cbY
	W4PuatJ2WRNZO6DYHN5yjjO8u6gMxyxPF7LbW9N4a5WCdMAQD+F5FAlBqQL0OZTkkmzMxodRWROxt
	daVpaXjwEUdVoyeHF9IDtUGvQGlqOXOqHmadSvfeMIQk1YhSgZEJ14/Mg7zUpStSDsDdm0N9Mw8Sa
	6WfNGX2qGd/emRjFfvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6pmi-009nGs-1x; Mon, 10 Jan 2022 08:12:08 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6pme-009nFC-KZ
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 08:12:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CEEFE60004;
 Mon, 10 Jan 2022 08:11:58 +0000 (UTC)
Date: Mon, 10 Jan 2022 09:11:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Andreas Noever
 <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>
Subject: Re: [PATCH v1 4/5] mtd: core: Drop duplicate NULL checks around
 nvmem_unregister()
Message-ID: <20220110091157.6396569e@xps13>
In-Reply-To: <20220104133843.44272-4-andriy.shevchenko@linux.intel.com>
References: <20220104133843.44272-1-andriy.shevchenko@linux.intel.com>
 <20220104133843.44272-4-andriy.shevchenko@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_001204_882952_3E15EBF1 
X-CRM114-Status: GOOD (  14.32  )
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

SGkgQW5keSwKCmFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZSBvbiBUdWUs
ICA0IEphbiAyMDIyIDE1OjM4OjQyCiswMjAwOgoKPiBTaW5jZSBudm1lbV91bnJlZ2lzdGVyKCkg
Y2hlY2tzIGZvciBOVUxMLCBubyBuZWVkIHRvIHJlcGVhdCBpbgo+IHRoZSBjYWxsZXIuIERyb3Ag
ZHVwbGljYXRlIE5VTEwgY2hlY2tzLgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8
YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9t
dGRjb3JlLmMgfCAxMyArKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNv
cmUuYyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDcwZjQ5MmRjZTE1OC4uMDEwZmZj
MzQ1MzJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL210ZGNvcmUuYwo+IEBAIC03NDIsOCArNzQyLDcgQEAgaW50IGRlbF9tdGRfZGV2aWNl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShtdGQt
PmRiZy5kZnNfZGlyKTsKPiAgCj4gIAkJLyogVHJ5IHRvIHJlbW92ZSB0aGUgTlZNRU0gcHJvdmlk
ZXIgKi8KPiAtCQlpZiAobXRkLT5udm1lbSkKPiAtCQkJbnZtZW1fdW5yZWdpc3RlcihtdGQtPm52
bWVtKTsKPiArCQludm1lbV91bnJlZ2lzdGVyKG10ZC0+bnZtZW0pOwo+ICAKPiAgCQlkZXZpY2Vf
dW5yZWdpc3RlcigmbXRkLT5kZXYpOwo+ICAKPiBAQCAtOTIxLDggKzkyMCw3IEBAIHN0YXRpYyBp
bnQgbXRkX290cF9udm1lbV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAlyZXR1cm4gMDsK
PiAgCj4gIGVycjoKPiAtCWlmIChtdGQtPm90cF91c2VyX252bWVtKQo+IC0JCW52bWVtX3VucmVn
aXN0ZXIobXRkLT5vdHBfdXNlcl9udm1lbSk7Cj4gKwludm1lbV91bnJlZ2lzdGVyKG10ZC0+b3Rw
X3VzZXJfbnZtZW0pOwo+ICAJcmV0dXJuIGVycjsKPiAgfQo+ICAKPiBAQCAtMTAyNiwxMSArMTAy
NCw4IEBAIGludCBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIp
Cj4gIAkJbWVtc2V0KCZtYXN0ZXItPnJlYm9vdF9ub3RpZmllciwgMCwgc2l6ZW9mKG1hc3Rlci0+
cmVib290X25vdGlmaWVyKSk7Cj4gIAl9Cj4gIAo+IC0JaWYgKG1hc3Rlci0+b3RwX3VzZXJfbnZt
ZW0pCj4gLQkJbnZtZW1fdW5yZWdpc3RlcihtYXN0ZXItPm90cF91c2VyX252bWVtKTsKPiAtCj4g
LQlpZiAobWFzdGVyLT5vdHBfZmFjdG9yeV9udm1lbSkKPiAtCQludm1lbV91bnJlZ2lzdGVyKG1h
c3Rlci0+b3RwX2ZhY3RvcnlfbnZtZW0pOwo+ICsJbnZtZW1fdW5yZWdpc3RlcihtYXN0ZXItPm90
cF91c2VyX252bWVtKTsKPiArCW52bWVtX3VucmVnaXN0ZXIobWFzdGVyLT5vdHBfZmFjdG9yeV9u
dm1lbSk7Cj4gIAo+ICAJZXJyID0gZGVsX210ZF9wYXJ0aXRpb25zKG1hc3Rlcik7Cj4gIAlpZiAo
ZXJyKQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
