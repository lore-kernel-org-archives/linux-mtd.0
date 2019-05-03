Return-Path: <SRS0=RfYw=TD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0447C43219
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 11:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90958206C3
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2019 11:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YE8SFJrK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JvwRGXHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90958206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBqZhWubj410WR3lN5i3Z3kHp6PTM0LrHR+cfxBsGB4=; b=YE8SFJrKseH3Ls
	9AvgNWo39rtO8QqKukRQiNrCFSHr5amRXDuNY51BRjDHrSTPDS106KN3ZDd8wj0fIyeJq3+jp9QZ7
	uRuym1NCRlZafe9GqD3LmsOkhZyJg+8MY3J6/DJCQVMO/OQKGCJQD1QdQAruFakBGSCOO7woOHlH5
	QwBHdUHEK+jBZUJi9pRbomejfy8/vzJ50iGbkSto7/AW5p1he7ykcz7ORMhn7Ozr0SMoLmOdqizlC
	VUNGEWZe+bwkVmbowPcIGEBzbmxeVmIEikr15wCC6V4YLh3YcHwb10vQD9VQ5Beca2s4LriTYItiQ
	JYpPCypY5FGv0Wv6ItHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMW7N-0002vI-F3; Fri, 03 May 2019 11:12:41 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMW7G-0002oz-PN; Fri, 03 May 2019 11:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eEIzHpfwHVHRvaExjRFeK3jxmEVbh9Kwf4OPsb6euv4=; b=JvwRGXHy5mEodBN7PyajBwUV9W
 E/owdUr7f2+i/qeG6kmoFcZesHl/twG+RCrz7ytF5EJz+oRkrUUGATGHkpC8AJTMgyotxmWd1XnQC
 s2ke3ZQ49Zk9OSv7WIHnIy/X23QdiSJOv5aOYX6Rj7n+Go8Hl0wS95CVRjzRXdLT2n40bEJDCunLE
 uaWRkwWULEVtNf7nsw3uvCJpAkM4OLKkvigwdPe7vTgkyaynz3cayBrWBKevawZ6+vXKDUxtiXajq
 fe1ZB0iSrFAbBzBF/sc/wAcIEta0qzDG2sX9zOY2IC+snEGlD/3TqsNanMPkqNvBt5r7H4tFkfzOy
 SdAX6vyw==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMW7C-0004Li-WA; Fri, 03 May 2019 11:12:32 +0000
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9D4FF100005;
 Fri,  3 May 2019 11:11:53 +0000 (UTC)
Date: Fri, 3 May 2019 13:11:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [RESEND PATCH v3 05/11] mtd: rawnand: vf610_nfc: add
 initializer to avoid -Wmaybe-uninitialized
Message-ID: <20190503131152.57b4ce25@xps13>
In-Reply-To: <CAK7LNAQH8v8_HG6-cytT4qe05W9iiYwEP1mud4zG2NxxYcFptQ@mail.gmail.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
 <20190423034959.13525-6-yamada.masahiro@socionext.com>
 <20190502161346.07c15187@xps13>
 <CAK7LNAQH8v8_HG6-cytT4qe05W9iiYwEP1mud4zG2NxxYcFptQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190503_071231_130624_6B861FC2 
X-CRM114-Status: GOOD (  22.35  )
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
 linux-s390 <linux-s390@vger.kernel.org>, Mathieu Malaterre <malat@debian.org>,
 X86 ML <x86@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBGcmksIDMgTWF5CjIwMTkgMTk6MzY6MzUgKzA5MDA6Cgo+IEhpIE1pcXVl
bCwKPiAKPiBPbiBUaHUsIE1heSAyLCAyMDE5IGF0IDExOjE0IFBNIE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIE1hc2FoaXJvLAo+ID4K
PiA+IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3Rl
IG9uIFR1ZSwgMjMgQXByCj4gPiAyMDE5IDEyOjQ5OjUzICswOTAwOgo+ID4gIAo+ID4gPiBUaGlz
IHByZXBhcmVzIHRvIG1vdmUgQ09ORklHX09QVElNSVpFX0lOTElOSU5HIGZyb20geDg2IHRvIGEg
Y29tbW9uCj4gPiA+IHBsYWNlLiBXZSBuZWVkIHRvIGVsaW1pbmF0ZSBwb3RlbnRpYWwgaXNzdWVz
IGJlZm9yZWhhbmQuCj4gPiA+Cj4gPiA+IEtidWlsZCB0ZXN0IHJvYm90IGhhcyBuZXZlciByZXBv
cnRlZCAtV21heWJlLXVuaW5pdGlhbGl6ZWQgd2FybmluZwo+ID4gPiBmb3IgdGhpcyBwcm9iYWJs
eSBiZWNhdXNlIHZmNjEwX25mY19ydW4oKSBpcyBpbmxpbmVkIGJ5IHRoZSB4ODYKPiA+ID4gY29t
cGlsZXIncyBpbmxpbmluZyBoZXVyaXN0aWMuCj4gPiA+Cj4gPiA+IElmIENPTkZJR19PUFRJTUla
RV9JTkxJTklORyBpcyBlbmFibGVkIGZvciBhIGRpZmZlcmVudCBhcmNoaXRlY3R1cmUKPiA+ID4g
YW5kIHZmNjEwX25mY19ydW4oKSBpcyBub3QgaW5saW5lZCwgdGhlIGZvbGxvd2luZyB3YXJuaW5n
IGlzIHJlcG9ydGVkOgo+ID4gPgo+ID4gPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy92ZjYxMF9uZmMu
YzogSW4gZnVuY3Rpb24g4oCYdmY2MTBfbmZjX2NtZOKAmToKPiA+ID4gZHJpdmVycy9tdGQvbmFu
ZC9yYXcvdmY2MTBfbmZjLmM6NDU1OjM6IHdhcm5pbmc6IOKAmG9mZnNldOKAmSBtYXkgYmUgdXNl
ZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0K
PiA+ID4gICAgdmY2MTBfbmZjX3JkX2Zyb21fc3JhbShpbnN0ci0+Y3R4LmRhdGEuYnVmLmluICsg
b2Zmc2V0LAo+ID4gPiAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gPiA+ICAgICAgICAgICAgIG5mYy0+cmVncyArIE5GQ19NQUlOX0FS
RUEoMCkgKyBvZmZzZXQsCj4gPiA+ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gPiA+ICAgICAgICAgICAgIHRyZnJfc3osICFuZmMtPmRhdGFfYWNj
ZXNzKTsKPiA+ID4gICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+ICAKPiA+
Cj4gPiBJTUhPIHRoaXMgcGF0Y2ggaGFzIG5vIGRlcGVuZGVuY2llcyB3aXRoIHRoaXMgc2VyaWVz
LiAgCj4gCj4gCj4gVGhpcyBwYXRjaCBpcyB0aGUgcHJlcmVxdWlzaXRlIGZvciAxMS8xMS4KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA2NDk1OS8KPiAKPiAKPiBX
aXRob3V0IHRoZSBjb3JyZWN0IHBhdGNoIG9yZGVyLAo+IHRoZSBrYnVpbGQgdGVzdCByb2JvdCBy
ZXBvcnRzIHRoZSB3YXJuaW5nLgo+IAo+IAo+ID4gV291bGQgeW91IG1pbmQgc2VuZGluZyBpdCBh
bG9uZSB3aXRoIHRoZSBwcm9wZXIgRml4ZXMgdGFnPyAgCj4gCj4gCj4gSSBkbyBub3QgdGhpbmsg
Rml4ZXMgaXMgbmVjZXNzYXJ5LgoKSU1ITyBpdCBpcy4gRXZlbiBpZiB0b2RheSB0aGUgd2Fybmlu
ZyBkb2VzIG5vdCBzcGF3biwgdGhlcmUgaXMgYQpyZWFsIEMgZXJyb3Igd2hpY2ggbWlnaHQgYWxy
ZWFkeSBiZSBhbiBpc3N1ZS4KCj4gCj4gTm9ib2R5IGhhcyBub3RpY2VkIHRoaXMgcG90ZW50aWFs
IGlzc3VlIGJlZm9yZS4KPiBXaXRob3V0IDExLzExLCBwcm9iYWJseSB3ZSBjYW5ub3QgcmVwcm9k
dWNlIHRoaXMgd2FybmluZy4KPiAKPiAKPiBCVFcsIHRoaXMgc2VyaWVzIGhhcyBiZWVuIGZvciBh
IHdoaWxlIGluIGxpbnV4LW5leHQuCgpNaXNzZWQgdGhhdC4gT2ssIG5ldmVybWluZC4KCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
