Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F679CC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydJYFs6XOOX16cU6taK/MgmIk7OQ8A7BIh/7OJwTj2E=; b=rdPLrvyIyLPPrd
	Ub+rnU0n11KYVdGpyO6bE2ST54UkUuqEzSHzlPyH99g2NMkEatKwpqzPH0smJ3wPhiDF7r4/DiklU
	l9SrJOVCq0Kw4imBkvD/XbTaF+UxlEg6zb2RtB2nGfS5vEuhicpYcMgP9Ffpweckc66/csy+L/8Gl
	elOxdPhq688IZl8LVrQ5Ot5y8dSUdD/En15DyGTYfzZCtQzq9DeN1/nxhDj2Jw53mCvPjF/IaNHAp
	eUNoDTJ1P7bnTzg08SLMFEioOh1EOfQEc2HoM+8OoQ5OWlqcgb6/sQxFZ/ZUAehUns/cnDsOl5qAx
	lHeeLyGYUD/YFaQ2R9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlO0-0000000ECZi-41dd;
	Tue, 13 Oct 2026 22:54:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlNz-0000000ECYK-1nJU
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:54:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89D9260236;
	Tue, 13 Oct 2026 22:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8701F00893;
	Tue, 13 Oct 2026 22:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791932058;
	bh=PPjRPdoXmqcoE+yKsFNTRZ91VsaW0SCaan3CS2orgSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aD/J83amyEpQPtNDSR5Y7mWcIWtxo0L7j2puj21nguKWbVacHXWltVdWd0wx6FQyE
	 XnG3sqn2UllfFA5KFSALl2ZVLQXBK+/PaLXfHHxqPuN1OL21uw0Y2toUIUKShVhH6p
	 VweMqeryKBFbRTeJFayB6ymM5m4PoNpkeqYcXglYLI3moQygYDJP6AoDgJ+s6N5Fnf
	 ctUQYCfm+kKqaIlsILDzKHfcx3kYthBKYDF8LvMXDMTyvWnGxvSzariGkB9tTpoG1A
	 DucOzxqIk7Z8Gq4FptC9R9eu/3q2V01IYy+ORpbuXnoB+jDM4c02fERIzmEljtkuWR
	 WqcKRIq0nw6tA==
Message-ID: <sashiko-outbox-170607@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/11] ACPI: CPPC: Free cpc_desc in kobject release
 callback
To: "Ian Rogers" <irogers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael
 J . Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Kees Cook" <kees@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy" <chleroy@kernel.org>, "Nayna
 Jain" <nayna@linux.ibm.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>, "Rich
 Felker" <dalias@libc.org>, "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "David Teigland" <teigland@redhat.com>, "Alexander
 Aring" <aahringo@redhat.com>, "Juergen Gross" <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, "Richard Weinberger" <richard@nod.at>, "Zhihao
 Cheng" <chengzhihao1@huawei.com>, "Felix Kuehling" <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261013223946.1836757-6-irogers@google.com>
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-6-irogers@google.com>
Date: Tue, 13 Oct 2026 22:54:16 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGFjcGk6IGNwcGM6IGRh
bmdsaW5nIHBlci1DUFUgcG9pbnRlciBhZnRlciBleGl0IGxlYWRzIHRvIFVBRgotIFtNZWRpdW1d
IGFjcGkvY3BwYzogbWlzc2luZyBrb2JqZWN0X2RlbCgpIGNhdXNlcyBzeXNmcyAtRUVYSVNUIG9u
IGRyaXZlciByZS1iaW5kCi0tCgpjb21taXQgMTQwNWM4MTQ1OWE2MmRhNTNhYzExNmE0OWE2NWNi
ZGMzYmNkY2Q2OApBdXRob3I6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KCkFDUEk6
IENQUEM6IEZyZWUgY3BjX2Rlc2MgaW4ga29iamVjdCByZWxlYXNlIGNhbGxiYWNrCgpjcGNfZGVz
Y19wdHIgZW1iZWRzIGEgc3RydWN0IGtvYmplY3QgdGhhdCBpcyByZWdpc3RlcmVkIGluIHN5c2Zz
IHZpYQprb2JqZWN0X2luaXRfYW5kX2FkZCgpLCBidXQgY3BwY19rdHlwZSBsYWNrZWQgYSAucmVs
ZWFzZSBjYWxsYmFjayBhbmQKYWNwaV9jcHBjX3Byb2Nlc3Nvcl9leGl0KCkgZnJlZWQgY3BjX3B0
ciBpbW1lZGlhdGVseSBhZnRlciBrb2JqZWN0X3B1dCgpLgpUaGlzIHBhdGNoIG1vdmVzIHRoZSBz
eXNfbWVtX3ZhZGRyIHVubWFwcGluZyBhbmQga2ZyZWUoY3BjX3B0cikgaW50byBhIG5ldwpjcHBj
X3JlbGVhc2UoKSBjYWxsYmFjay4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9jcHBjX2Fj
cGkuYyBiL2RyaXZlcnMvYWNwaS9jcHBjX2FjcGkuYwo+IGluZGV4IGYzNzBiZTg3MTVhZTIuLjBm
ZWZlMWNkYjYwY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL2NwcGNfYWNwaS5jCj4gKysr
IGIvZHJpdmVycy9hY3BpL2NwcGNfYWNwaS5jCj4gWyAuLi4gXQo+IEBAIC05NjEsMTUgKzk2Niw3
IEBAIHZvaWQgYWNwaV9jcHBjX3Byb2Nlc3Nvcl9leGl0KHN0cnVjdCBhY3BpX3Byb2Nlc3NvciAq
cHIpCj4gIAlpZiAoIWNwY19wdHIpCj4gIAkJcmV0dXJuOwo+ICAKPiAtCS8qIEZyZWUgYWxsIHRo
ZSBtYXBwZWQgc3lzIG1lbSBhcmVhcyBmb3IgdGhpcyBDUFUgKi8KPiAtCWZvciAoaSA9IDI7IGkg
PCBjcGNfcHRyLT5udW1fZW50cmllczsgaSsrKSB7Cj4gLQkJYWRkciA9IGNwY19wdHItPmNwY19y
ZWdzW2ktMl0uc3lzX21lbV92YWRkcjsKPiAtCQlpZiAoYWRkcikKPiAtCQkJaW91bm1hcChhZGRy
KTsKPiAtCX0KPiAtCj4gIAlrb2JqZWN0X3B1dCgmY3BjX3B0ci0+a29iaik7CgpbU2V2ZXJpdHk6
IEhpZ2hdCkRvZXMgdGhpcyBsZWF2ZSBhIGRhbmdsaW5nIHBvaW50ZXIgaW4gdGhlIHBlci1DUFUg
dmFyaWFibGU/CgpXaGVuIGFjcGlfY3BwY19wcm9jZXNzb3JfZXhpdCgpIGRyb3BzIHRoZSBrb2Jq
ZWN0IHJlZmNvdW50LCB0aGUgdW5kZXJseWluZwptZW1vcnkgaXMgZnJlZWQuIEhvd2V2ZXIsIGl0
IHNlZW1zIHBlcl9jcHUoY3BjX2Rlc2NfcHRyLCBwci0+aWQpIGlzIG5ldmVyCnNldCB0byBOVUxM
LgoKQ291bGQgb3RoZXIgQ1BQQyBmdW5jdGlvbnMgdGhhdCByZWx5IG9uIHRoaXMgcG9pbnRlciBi
ZWluZyBOVUxMIGlmCnVuaW5pdGlhbGl6ZWQsIHN1Y2ggYXMgY3BwY19nZXRfcGVyZl9jYXBzKCk6
CgoJc3RydWN0IGNwY19kZXNjICpjcGNfZGVzYyA9IHBlcl9jcHUoY3BjX2Rlc2NfcHRyLCBjcHVu
dW0pOwoJLy8gLi4uCglpZiAoIWNwY19kZXNjKSB7CgkJcHJfZGVidWcoIk5vIENQQyBkZXNjcmlw
dG9yIGZvciBDUFU6JWRcbiIsIGNwdW51bSk7CgkJcmV0dXJuIC1FTk9ERVY7Cgl9CgpzdWNjZXNz
ZnVsbHkgcGFzcyB0aGUgY2hlY2sgb24gdGhlIGRhbmdsaW5nIHBvaW50ZXIgYW5kIHRyaWdnZXIg
YQp1c2UtYWZ0ZXItZnJlZSB1cG9uIGRyaXZlciB1bmJpbmQ/CgpbU2V2ZXJpdHk6IE1lZGl1bV0K
Q291bGQgb21pdHRpbmcga29iamVjdF9kZWwoKSBoZXJlIGNhdXNlIGEgc3lzZnMgLUVFWElTVCBl
cnJvciB3aGVuIHRoZQpkcml2ZXIgaXMgcmUtYm91bmQ/CgpUaGUgdGVhcmRvd24gcGF0aCBkcm9w
cyB0aGUgcmVmZXJlbmNlIGJ1dCBhcHBlYXJzIHRvIG9taXQgZXhwbGljaXRseQp1bnJlZ2lzdGVy
aW5nIHRoZSBzeXNmcyBkaXJlY3RvcnkuIElmIHRoZSBrb2JqZWN0J3MgcmVmY291bnQgZG9lcyBu
b3QKaW1tZWRpYXRlbHkgcmVhY2ggMCAoZm9yIGV4YW1wbGUsIGlmIHVzZXJzcGFjZSBoYXMgYSBD
UFBDIHN5c2ZzIGZpbGUgb3BlbiwKb3IgaWYgQ09ORklHX0RFQlVHX0tPQkpFQ1RfUkVMRUFTRT15
IGRlZmVycyB0aGUgcmVsZWFzZSksIHRoZSBzeXNmcwpkaXJlY3RvcnkgaXMgbm90IHN5bmNocm9u
b3VzbHkgcmVtb3ZlZC4KClNob3VsZCBrb2JqZWN0X2RlbCgpIGJlIGNhbGxlZCBiZWZvcmUga29i
amVjdF9wdXQoKSB0byBlbnN1cmUgYSBzdWJzZXF1ZW50CmtvYmplY3RfYWRkKCkgaW4gdGhlIHBy
b2JlIHBhdGggZG9lcyBub3QgY29sbGlkZSB3aXRoIGEgbGluZ2VyaW5nIHN5c2ZzCmRpcmVjdG9y
eT8KCj4gLQlrZnJlZShjcGNfcHRyKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChhY3BpX2Nw
cGNfcHJvY2Vzc29yX2V4aXQpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAxMzIyMzk0Ni4xODM2NzU3LTEtaXJvZ2Vyc0Bnb29n
bGUuY29tP3BhcnQ9NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
