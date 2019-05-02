Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C158C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050F6206DF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tizc1r7o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050F6206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPNRyz2M5luPzqSTjpjUIvhINgMIBnjQxsHwtEC5bq4=; b=Tizc1r7oiJk6ta
	kn5IrQxEoKfkGkVoese+j8k7ia+jV0135Hhlq/Sb50LcJOxAv9681enNDxTKE0bdjA0f73aeGnquZ
	SRiDYEE5D2hWeHTz5M891N4Styc+J5QXUvzOfGWx7Aab0GWmma0d59e/FkBGCyyfWllK8HhMs22u6
	0kc63aZTUs6DCblcaEb33t3Ncl2Eh0yLrO07BIcgfpMrLg2GUf+a4ttx0YvYWSABkGANoaS7Ls3OM
	+MxtSHWKQ6yzZr1gn2xH2XZwjiXdOZoD9cjCDI99ufB9vQ81GjQv6jY+TJNZJYpq6iKbwAJvRELbW
	FXAaDylZt6m2sOLooOfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCTM-00027t-QD; Thu, 02 May 2019 14:14:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCTF-00022d-Q0; Thu, 02 May 2019 14:13:59 +0000
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BC10960015;
 Thu,  2 May 2019 14:13:47 +0000 (UTC)
Date: Thu, 2 May 2019 16:13:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RESEND PATCH v3 05/11] mtd: rawnand: vf610_nfc: add
 initializer to avoid -Wmaybe-uninitialized
Message-ID: <20190502161346.07c15187@xps13>
In-Reply-To: <20190423034959.13525-6-yamada.masahiro@socionext.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-6-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_071357_996768_C6B261A0 
X-CRM114-Status: GOOD (  17.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390@vger.kernel.org, Mathieu Malaterre <malat@debian.org>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDIzIEFwcgoyMDE5IDEyOjQ5OjUzICswOTAwOgoKPiBUaGlzIHBy
ZXBhcmVzIHRvIG1vdmUgQ09ORklHX09QVElNSVpFX0lOTElOSU5HIGZyb20geDg2IHRvIGEgY29t
bW9uCj4gcGxhY2UuIFdlIG5lZWQgdG8gZWxpbWluYXRlIHBvdGVudGlhbCBpc3N1ZXMgYmVmb3Jl
aGFuZC4KPiAKPiBLYnVpbGQgdGVzdCByb2JvdCBoYXMgbmV2ZXIgcmVwb3J0ZWQgLVdtYXliZS11
bmluaXRpYWxpemVkIHdhcm5pbmcKPiBmb3IgdGhpcyBwcm9iYWJseSBiZWNhdXNlIHZmNjEwX25m
Y19ydW4oKSBpcyBpbmxpbmVkIGJ5IHRoZSB4ODYKPiBjb21waWxlcidzIGlubGluaW5nIGhldXJp
c3RpYy4KPiAKPiBJZiBDT05GSUdfT1BUSU1JWkVfSU5MSU5JTkcgaXMgZW5hYmxlZCBmb3IgYSBk
aWZmZXJlbnQgYXJjaGl0ZWN0dXJlCj4gYW5kIHZmNjEwX25mY19ydW4oKSBpcyBub3QgaW5saW5l
ZCwgdGhlIGZvbGxvd2luZyB3YXJuaW5nIGlzIHJlcG9ydGVkOgo+IAo+IGRyaXZlcnMvbXRkL25h
bmQvcmF3L3ZmNjEwX25mYy5jOiBJbiBmdW5jdGlvbiDigJh2ZjYxMF9uZmNfY21k4oCZOgo+IGRy
aXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jOjQ1NTozOiB3YXJuaW5nOiDigJhvZmZzZXTi
gJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21heWJlLXVu
aW5pdGlhbGl6ZWRdCj4gICAgdmY2MTBfbmZjX3JkX2Zyb21fc3JhbShpbnN0ci0+Y3R4LmRhdGEu
YnVmLmluICsgb2Zmc2V0LAo+ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAgICAgICBuZmMtPnJlZ3MgKyBORkNfTUFJTl9B
UkVBKDApICsgb2Zmc2V0LAo+ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgICAgdHJmcl9zeiwgIW5mYy0+ZGF0YV9hY2Nlc3MpOwo+
ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKSU1ITyB0aGlzIHBhdGNo
IGhhcyBubyBkZXBlbmRlbmNpZXMgd2l0aCB0aGlzIHNlcmllcy4KV291bGQgeW91IG1pbmQgc2Vu
ZGluZyBpdCBhbG9uZSB3aXRoIHRoZSBwcm9wZXIgRml4ZXMgdGFnPwoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IC0t
LQo+IAo+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiBDaGFuZ2VzIGluIHYyOgo+ICAgLSBzcGxpdCBp
bnRvIGEgc2VwYXJhdGUgcGF0Y2gKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZj
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy92ZjYxMF9uZmMuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jCj4gaW5kZXggYTY2MmNhMTk3MGU1Li4xOTc5
MmQ3MjVlYzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy92ZjYxMF9uZmMuYwo+IEBAIC0zNjQsNyArMzY0
LDcgQEAgc3RhdGljIGludCB2ZjYxMF9uZmNfY21kKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4g
IHsKPiAgCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0cjsKPiAgCXN0cnVjdCB2ZjYx
MF9uZmMgKm5mYyA9IGNoaXBfdG9fbmZjKGNoaXApOwo+IC0JaW50IG9wX2lkID0gLTEsIHRyZnJf
c3ogPSAwLCBvZmZzZXQ7Cj4gKwlpbnQgb3BfaWQgPSAtMSwgdHJmcl9zeiA9IDAsIG9mZnNldCA9
IDA7Cj4gIAl1MzIgY29sID0gMCwgcm93ID0gMCwgY21kMSA9IDAsIGNtZDIgPSAwLCBjb2RlID0g
MDsKPiAgCWJvb2wgZm9yY2U4Yml0ID0gZmFsc2U7Cj4gIAoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
