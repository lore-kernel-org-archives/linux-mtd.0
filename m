Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FCAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:03:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B77560C3D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B77560C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BZwJhtn+1T6jd7NRkr/Nr1B38LAm7K2UiTt7ed2gwY8=; b=Od7cnY9Jon+ATvUXGDGs2dnDf
	JJJhmgCH3mqtwqDIQWUnKl5mC8mvAaJAw9vE74RAYsPRuptM7oSODeWWZwK7BkbWOE01Ij/SXemtX
	BWJrfj6xsVMrWTncsGQrLAR5Tq/aHpRTl3RcA3tROUBssUhfdV40w376nfFGC0UGcGb8M/1UFBhve
	3uXB7350dc0hsh0S5jgDS5ASy/w3/IY6oO5ozXNsBaMoUwLXWqH9SOKVaUHTnTVKjUu3i4+RF1gpn
	OMsstkokJ6NHbZHdr0xsxF8lh6Gaf9ET6QQEbXSqNFtM32BFDKy0q/o85TNc1Rj7lg/PsprcdY/PO
	wAu9/CjOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ajB-0001Jc-Rp; Mon, 01 Feb 2021 15:02:57 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6aj8-0001Ir-VR
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 15:02:55 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E48E120016;
 Mon,  1 Feb 2021 15:02:48 +0000 (UTC)
Date: Mon, 1 Feb 2021 16:02:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: zhengxunli <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH 3/3] spi: mxic: add maximum speed of spi host
Message-ID: <20210201160247.1c83719c@xps13>
In-Reply-To: <1611908018-29937-4-git-send-email-zhengxunli@mxic.com.tw>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
 <1611908018-29937-4-git-send-email-zhengxunli@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_100255_212576_9EEE4398 
X-CRM114-Status: GOOD (  17.72  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgp6aGVuZ3h1bmxpIDx6aGVuZ3h1bmxpQG14aWMuY29tLnR3PiB3cm90ZSBvbiBGcmksIDI5
IEphbiAyMDIxIDE2OjEzOjM4CiswODAwOgoKPiBBZGQgdGhlIG1heGltdW0gc3BlZWQgb2YgdGhl
IGhvc3QgdG8gYXZvaWQgb3Zlci1zcGVlZAo+IG9wZXJhdGlvbiBvZiB0aGUgZGV2aWNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IHpoZW5neHVubGkgPHpoZW5neHVubGlAbXhpYy5jb20udHc+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLW14aWMudHh0IHwg
NCArKysrCj4gIGRyaXZlcnMvc3BpL3NwaS1teGljLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1t
eGljLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLW14aWMu
dHh0Cj4gaW5kZXggNTI5ZjJkYS4uZmY2OTM3YyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1teGljLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLW14aWMudHh0CgpCaW5kaW5nIGFuZCBkcml2
ZXIgY2hhbmdlcyBzaG91bGQgYmUgaW4gdHdvIHNlcGFyYXRlIGNvbW1pdHMuCgo+IEBAIC0xMyw2
ICsxMyw5IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gIC0gY2xvY2tzOiBzaG91bGQgY29udGFp
biAzIGVudHJpZXMgZm9yIHRoZSAicHNfY2xrIiwgInNlbmRfY2xrIiBhbmQKPiAgCSAgInNlbmRf
ZGx5X2NsayIgY2xvY2tzCj4gIAo+ICtSZWNvbW1lbmRlZCBwcm9wZXJ0aWVzOgo+ICstIHNwaS1t
YXgtZnJlcXVlbmN5OiBNYXhpbXVtIFNQSSBjbG9ja2luZyBzcGVlZCBvZiB0aGUgZGV2aWNlIGlu
IEh6LgoKSSBkb24ndCB0aGluayB0aGlzIHByb3BlcnR5IHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBj
b250cm9sbGVyIGJpbmRpbmcuCkl0IGlzIGEgcGVyIGRldmljZSBwcm9wZXJ0eSBhbmQgaXMgYWxy
ZWFkeSBwYXJzZWQgYnkgdGhlIGNvcmUgKHNlZQpvZl9zcGlfcGFyc2VfZHQoKSBpbiBzcGkuYyku
Cgo+ICsKPiAgRXhhbXBsZToKPiAgCj4gIAlzcGlANDNjMzAwMDAgewo+IEBAIC0yMSw2ICsyNCw3
IEBAIEV4YW1wbGU6Cj4gIAkJcmVnLW5hbWVzID0gInJlZ3MiLCAiZGlybWFwIjsKPiAgCQljbG9j
a3MgPSA8JmNsa3dpemFyZCAwPiwgPCZjbGt3aXphcmQgMT4sIDwmY2xrYyAxOD47Cj4gIAkJY2xv
Y2stbmFtZXMgPSAic2VuZF9jbGsiLCAic2VuZF9kbHlfY2xrIiwgInBzX2NsayI7Cj4gKwkJc3Bp
LW1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsKPiAgCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
PiAgCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3Nw
aS1teGljLmMgYi9kcml2ZXJzL3NwaS9zcGktbXhpYy5jCj4gaW5kZXggODIxMzI4YS4uNzc4NmQz
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbXhpYy5jCj4gKysrIGIvZHJpdmVycy9z
cGkvc3BpLW14aWMuYwo+IEBAIC0xMiw2ICsxMiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9pby5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3NwaS9zcGkuaD4KPiBAQCAtNTM2LDcgKzUzNyw5IEBAIHN0YXRpYyBpbnQgbXhpY19zcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICAJc3RydWN0IHNwaV9t
YXN0ZXIgKm1hc3RlcjsKPiAgCXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+ICsJc3RydWN0IGRldmlj
ZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwo+ICAJc3RydWN0IG14aWNfc3BpICpteGlj
Owo+ICsJdTMyIG1heF9mcmVxOwo+ICAJaW50IHJldDsKPiAgCj4gIAltYXN0ZXIgPSBkZXZtX3Nw
aV9hbGxvY19tYXN0ZXIoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCBteGljX3NwaSkpOwo+IEBA
IC01ODAsNiArNTgzLDEwIEBAIHN0YXRpYyBpbnQgbXhpY19zcGlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgCQkJU1BJX1JYX1FVQUQgfCBTUElfVFhfUVVBRCB8Cj4gIAkJ
CVNQSV9SWF9PQ1RBTCB8IFNQSV9UWF9PQ1RBTDsKPiAgCj4gKwlpZiAob2ZfcHJvcGVydHlfcmVh
ZF91MzIobnAsICJzcGktbWF4LWZyZXF1ZW5jeSIsCj4gKwkJCQkgJm1hc3Rlci0+bWF4X3NwZWVk
X2h6KSkKPiArCQltYXN0ZXItPm1heF9zcGVlZF9oeiA9IDI1MDAwMDAwOyAvKiAyNU1IeiAqLwoK
QXMgc2FpZCBiZWZvcmUsIHRoZXJlIGFyZSB0d28gbGltaXRhdGlvbnMgdG8gdGFrZSBpbnRvIGFj
Y291bnQ6CjEtIHlvdXIgY29udHJvbGxlciBtYXhpbXVtIHNwZWVkCjItIHlvdXIgZmxhc2ggbWF4
aW11bSBzcGVlZAoKKDEpIEkgZG9uJ3QgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBleHBvcnRlZCB0
aHJvdWdoIHRoZSBEVCwgdGhlIGRyaXZlcgogICAga25vd3MgaGlzIG93biBsaW1pdGF0aW9ucyBh
bmQgZW5mb3JjZXMgdGhlbS4KCigyKSBTaG91bGQgYmUgZWl0aGVyIGFkdmVydGlzZWQgYnkgdGhl
IERUIHRocm91Z2ggdGhlIHNwaS1tYXgtZnJlcXVlbmN5CiAgICBwcm9wZXJ0eSBvciBhZHZlcnRp
c2VkIHNvbWVob3cgYnkgdGhlIHZlbmRvciBkcml2ZXIgKG1hY3Jvbml4LmMpLgoKPiArCj4gIAlt
eGljX3NwaV9od19pbml0KG14aWMpOwo+ICAKPiAgCXJldCA9IHNwaV9yZWdpc3Rlcl9tYXN0ZXIo
bWFzdGVyKTsKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
