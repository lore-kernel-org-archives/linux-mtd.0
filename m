Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D665ACC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pijDe9CNRZkxIPiO6kOxQjz2S0bjOq+SrdeqghtPB4o=; b=WfZPzzjD0+YGHp
	2sYUEtZCAZ+2AtUEqAgay7cgM8hY8691O5w5ggZc+0mkMJ3fSjNaNeDLsPuOm5whC8L665EEkHfnI
	1+AqnnnYpWbX8qOvCHLJZ2MjQpMUEXjpMN8wIY79ok327KcCpK/KpN+FXioVWLdIM+ko83mKGg5jR
	+x6npya0a06dKPy6fW6xGjRqEZfY6YD+lLUFZKs/vqwfdyGroArYkMYJp8TnSL/rVI2mcSHjR9cOl
	rrrNS2dNM47J/b9VXUBoT9TuqT4MrtPrDVTT70EYj5rbqtO/yJvR6Jbl+V4bMCOWra/Ll6q21Ixi6
	EHUohSt1nFTW5ptU1oFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1z9-0000000G0gc-1xJ3;
	Wed, 14 Oct 2026 16:37:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1z7-0000000G0gM-0XqA
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 16:37:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9B3E4094A;
	Wed, 14 Oct 2026 16:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E201F000C4;
	Wed, 14 Oct 2026 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791995864;
	bh=ovAqcUcR1GnKTtcInlqEnrexmz1gsb8w6q2FfK1T5r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GwrpOxogXrqhTXQ0pfmjgGMR/nhqs689d6d2T2UbxyqwEi+VJ/4ET2F3bxSsa/yCN
	 EaglIPzBQ4qutHm/Eihe0pPBAWe+NlyY72FoJLC4Rcx8zYnrd+VBcodEifrd7JTzwT
	 8EqOjY6NHHc/4uGTfqT13dIP1aP05fs1tpq0wWe/LFtLEAv3fcER387/hVuHvXtsuD
	 UxSDlOug9/2BlYA6zAYEAL+qTg5TM5momYM01f0IFfrqT1XCvpcIhwvzWCD/yfd3Rd
	 ixvRP2r8X3I5Gfn87O/r4tNbn1q5lLdLD9Jj9tp7JpRRBzFzF6fUQnw/3GazF0kGmz
	 Z7FdXtLFV/36A==
Date: Wed, 14 Oct 2026 09:37:44 -0700
From: Kees Cook <kees@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ian Rogers <irogers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Nayna Jain <nayna@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	David Teigland <teigland@redhat.com>,
	Alexander Aring <aahringo@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	gfs2@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] Compiler Attributes: Add
 __require_explicit_initialization macro
Message-ID: <202610140937.B68C8C9AAC@keescook>
References: <20261013223946.1836757-1-irogers@google.com>
 <20261013223946.1836757-2-irogers@google.com>
 <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgMDE6Mjg6NTVQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDEyOjQw4oCvQU0gSWFuIFJvZ2VycyA8aXJv
Z2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiArLyoKPiA+ICsgKiBPcHRpb25hbDogbm90
IHN1cHBvcnRlZCBieSBnY2MKPiA+ICsgKgo+ID4gKyAqIGNsYW5nOiBodHRwczovL2NsYW5nLmxs
dm0ub3JnL2RvY3MvQXR0cmlidXRlUmVmZXJlbmNlLmh0bWwjcmVxdWlyZS1leHBsaWNpdC1pbml0
aWFsaXphdGlvbgo+ID4gKyAqLwo+ID4gKyNpZiBfX2hhc19hdHRyaWJ1dGUoX19yZXF1aXJlX2V4
cGxpY2l0X2luaXRpYWxpemF0aW9uX18pCj4gPiArIyBkZWZpbmUgX19yZXF1aXJlX2V4cGxpY2l0
X2luaXRpYWxpemF0aW9uIF9fYXR0cmlidXRlX18oKF9fcmVxdWlyZV9leHBsaWNpdF9pbml0aWFs
aXphdGlvbl9fKSkKPiA+ICsjZWxzZQo+ID4gKyMgZGVmaW5lIF9fcmVxdWlyZV9leHBsaWNpdF9p
bml0aWFsaXphdGlvbgo+ID4gKyNlbmRpZgo+IAo+IFRoZSBMUEMgc2xpZGVzIG1lbnRpb24gQ2xh
bmcgMTQrLCBidXQgZnJvbSBhIHF1aWNrIHRlc3QgaW4gQ29tcGlsZXIKPiBFeHBsb3JlciBhbmQg
YSBgZ2l0IGxvZyAtLWdyZXBgIG9uIHRoZSBMTFZNIHJlcG9zaXRvcnkgdG8gY29uZmlybSwgaXQK
PiBzZWVtcyB0aGUgYXR0cmlidXRlIHdhcyBpbnRyb2R1Y2VkIGluIENsYW5nIDIwKywgbm8/Cj4g
Cj4gSWYgdGhhdCBpcyBjb3JyZWN0LCB0aGVuIGl0IGlzIG5vdCBhdmFpbGFibGUgaW4gYWxsIExM
Vk0gdmVyc2lvbnMgd2UKPiBzdXBwb3J0IChMTFZNIDE3KyksIHNvIHdlIHNob3VsZCBhZGQ6Cj4g
Cj4gICAgICAqIE9wdGlvbmFsOiBvbmx5IHN1cHBvcnRlZCBzaW5jZSBjbGFuZyA+PSAyMC4wCj4g
Cj4gV2l0aCB0aGF0Ogo+IAo+IEFja2VkLWJ5OiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5v
cmc+CgpZdXAsIEkgY2FuIGNvbmZpcm0sIEkgb25seSBzZWUgaXQgd2l0aCAyMCsgdG9vLgoKLS0g
CktlZXMgQ29vawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
