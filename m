Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E110C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:40:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0EFB64E90
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0EFB64E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y8kwFEoslCRXhMxiq/WkRz3COcISZY5bgYHsshA1hiU=; b=Ume717B7GIlvHIDJFIyc28umK
	qHorh3q15Zt6XMAV8PwFsTjz8PRxZidmDV88z/HI+Y8IL6MB8bJfudreufHcw11pBrZJp7npOtC60
	pSa9+HlKshOPiVWh71ux5jJ+ArnSfGLWrd6BH6Myop/fg/kO8St+DW3K6pPE9OH0bXv6lW7rx0Egs
	Shkdhy7nwglZKXYkuKlJv1YhfIhMQBi+3KxGQTba9jdbG8j8CJZ0bDBTI/au+1eO2nWv6StIOUbax
	QN59EPMtz0YOy0yInv/1ZYcphqtl3BA2nWlpEfUdZqzIEnGZ2pbvpaYKkuA0O5M4BbwXkpmtl8BjE
	6IY5VsndQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSeO-005Apv-Vl; Wed, 03 Mar 2021 14:38:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS9W-0053fN-JX
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=qnXOQ5ytF6H3DAcn38+gzkreo/yPzpK1dKm830mOOPc=; b=StSa+/w2tbCmRqPDoBYcGC7u3Y
 4XwvLG+9xQB1+oDfG8Ylm0rq5sAnu1F5it+oUrE6BWO9SgpuqaKtMbRSkG+pL/+/88ZWCrMWdxAWq
 MKeMfg5i7E+HoUQr14fpIngzDrg34YrD3ZG8LtFkWycjLzFGmBw54ppepgNA68+gkxMzw+egN/wv3
 TcEMmf9oU6zipOlOJfdoyErBGg1ay95G+ADIFGPkJBOLyyfYJSY1AzZCjjqWr3+4XXZQZkBaXrBUz
 qMxGNJDg3MyoN0gIARdBJZqXCeEGklURpHwVWyCHubhcw9pPNYm3eWBxZiju5kwBYOqFmqAttUWNo
 jvxIaiqg==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHMy7-001rMR-V1
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 08:34:57 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 31F1C1BF206;
 Wed,  3 Mar 2021 08:34:28 +0000 (UTC)
Date: Wed, 3 Mar 2021 09:34:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
 lkp@intel.com, kbuild-all@lists.01.org, linux-mtd@lists.infradead.org
Subject: Re: [mtd:nand/next 12/20] drivers/mtd/nand/raw/nand_base.c:1466
 nand_prog_page_op() warn: impossible condition '(status < 0) => (0-255 <
 0)'
Message-ID: <20210303093427.0b701dfe@xps13>
In-Reply-To: <20210303064013.GK5549@pengutronix.de>
References: <20210303055441.GZ2087@kadam>
 <20210303064013.GK5549@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_083457_491260_2C372357 
X-CRM114-Status: GOOD (  19.61  )
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

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBXZWQsIDMgTWFyIDIwMjEgMDc6NDA6MTMKKzAxMDA6Cgo+IE9uIFdlZCwgTWFyIDAzLCAyMDIx
IGF0IDA4OjU0OjQyQU0gKzAzMDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gPiB0cmVlOiAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5n
aXQgbmFuZC9uZXh0Cj4gPiBoZWFkOiAgIDA5NWI0ZGFiZmYyYTkyOWNlZmQzMzAxMTBjNWM1Nzg5
NTYyMTMxODgKPiA+IGNvbW1pdDogMTk4NzdiMmM1ZGU4MDllNmY1NTNlMTU4YzI2M2I3YThiYjY1
MjIyZCBbMTIvMjBdIG10ZDogbmFuZDogZml4IGVycm9yIGhhbmRsaW5nIGluIG5hbmRfcHJvZ19w
YWdlX29wKCkgIzIKPiA+IGNvbmZpZzogeDg2XzY0LXJhbmRjb25maWctbTAwMS0yMDIxMDMwMiAo
YXR0YWNoZWQgYXMgLmNvbmZpZykKPiA+IGNvbXBpbGVyOiBnY2MtOSAoRGViaWFuIDkuMy4wLTE1
KSA5LjMuMAo+ID4gCj4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dp
bmcgdGFnIGFzIGFwcHJvcHJpYXRlCj4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Cj4gPiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPgo+ID4gCj4gPiBOZXcgc21hdGNoIHdhcm5pbmdzOgo+ID4gZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmM6MTQ2NiBuYW5kX3Byb2dfcGFnZV9vcCgpIHdhcm46
IGltcG9zc2libGUgY29uZGl0aW9uICcoc3RhdHVzIDwgMCkgPT4gKDAtMjU1IDwgMCknCj4gPiAK
PiA+IE9sZCBzbWF0Y2ggd2FybmluZ3M6Cj4gPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jh
c2UuYzo4NDIgbmFuZF9zZXR1cF9pbnRlcmZhY2UoKSB3YXJuOiBtaXNzaW5nIGVycm9yIGNvZGUg
J3JldCcKPiA+IAo+ID4gdmltICsxNDY2IGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5j
Cj4gPiAKPiA+IDk3ZDkwZGE4YTg4Njk0IGRyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMgICAg
IEJvcmlzIEJyZXppbGxvbiAyMDE3LTExLTMwICAxNDM3ICBpbnQgbmFuZF9wcm9nX3BhZ2Vfb3Ao
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IHBhZ2UsCj4gPiA5N2Q5MGRhOGE4
ODY5NCBkcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jICAgICBCb3JpcyBCcmV6aWxsb24gMjAx
Ny0xMS0zMCAgMTQzOCAgCQkgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0X2luX3BhZ2UsIGNvbnN0
IHZvaWQgKmJ1ZiwKPiA+IDk3ZDkwZGE4YTg4Njk0IGRyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNl
LmMgICAgIEJvcmlzIEJyZXppbGxvbiAyMDE3LTExLTMwICAxNDM5ICAJCSAgICAgIHVuc2lnbmVk
IGludCBsZW4pCj4gPiA5N2Q5MGRhOGE4ODY5NCBkcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5j
ICAgICBCb3JpcyBCcmV6aWxsb24gMjAxNy0xMS0zMCAgMTQ0MCAgewo+ID4gOTdkOTBkYThhODg2
OTQgZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYyAgICAgQm9yaXMgQnJlemlsbG9uIDIwMTct
MTEtMzAgIDE0NDEgIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+
ID4gMTk4NzdiMmM1ZGU4MDkgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgU2FzY2hh
IEhhdWVyICAgIDIwMjEtMDItMDUgIDE0NDIgIAl1OCBzdGF0dXM7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXgo+ID4gVGhpcyBuZWVkcyB0byBiZSBjaGFuZ2Vk
IHRvIGFuIGludCAgCj4gCj4gJnN0YXR1cyBpcyBwYXNzZWQgdG8gbmFuZF9zdGF0dXNfb3AoKSwg
c28gdGhpcyBnaXZlcyB1czoKPiAKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYzox
NDU3OjMwOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAyIG9mIOKAmG5hbmRfc3RhdHVzX29w4oCZ
IGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9p
bnRlci10eXBlc10KPiAKPiBJJ2QgcmF0aGVyIHN1Z2dlc3QgdGhlIGZvbGxvd2luZy4KPiAKPiBT
YXNjaGEKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gRnJvbSBlYTIxNmJlZTg2NjE4YTA0ZWE3NDNmYmRi
NTk4MzVjMjhlOTJjN2M5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IFNhc2NoYSBI
YXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiBEYXRlOiBXZWQsIDMgTWFyIDIwMjEgMDc6
MzI6MzUgKzAxMDAKPiBTdWJqZWN0OiBbUEFUQ0hdIGZpeHVwISBtdGQ6IG5hbmQ6IGZpeCBlcnJv
ciBoYW5kbGluZyBpbiBuYW5kX3Byb2dfcGFnZV9vcCgpCj4gICMyCj4gCj4gU2lnbmVkLW9mZi1i
eTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyB8IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFz
ZS5jCj4gaW5kZXggMGY2YmFiZWZhZWQyLi40ZjI2M2MyMmM4MGQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX2Jhc2UuYwo+IEBAIC0xNDYyLDkgKzE0NjIsMTAgQEAgaW50IG5hbmRfcHJvZ19wYWdl
X29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBwYWdlLAo+ICAJCQkJICAg
ICBwYWdlKTsKPiAgCQljaGlwLT5sZWdhY3kud3JpdGVfYnVmKGNoaXAsIGJ1ZiwgbGVuKTsKPiAg
CQljaGlwLT5sZWdhY3kuY21kZnVuYyhjaGlwLCBOQU5EX0NNRF9QQUdFUFJPRywgLTEsIC0xKTsK
PiAtCQlzdGF0dXMgPSBjaGlwLT5sZWdhY3kud2FpdGZ1bmMoY2hpcCk7Cj4gLQkJaWYgKHN0YXR1
cyA8IDApCj4gLQkJCXJldHVybiBzdGF0dXM7Cj4gKwkJcmV0ID0gY2hpcC0+bGVnYWN5LndhaXRm
dW5jKGNoaXApOwo+ICsJCWlmIChyZXQgPCAwKQo+ICsJCQlyZXR1cm4gcmV0Owo+ICsJCXN0YXR1
cyA9IHJldDsKClllcCwgTEdUTS4gSSBlZGl0ZWQgdGhlIGNvbW1pdCBhbmQgcHVzaGVkIC1mIG5h
bmQvbmV4dC4gRG9uJ3QgdGVsbApSaWNoYXJkIDstKQoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
