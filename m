Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0966AC3DA7A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2u6UhLOuNouiOzIThkoocqfjoGfL7Hv8cK7pMS1uodU=; b=QIsbOFEm58+5kT
	hQqzF89+fdKEpewqtn2R4g896WNHR06CFhYV0X0M2OfvolE/bMkx9xX5QewBe/5jqSqMiVkUulAgk
	roG2ap5mUtqPImd4rXS3FVFtC3NI0PkKJNJc5UjIQ3roRdabrkw4xfOX8vrEv92FXP/G7vbLtBSEY
	NofiDvIgRl017sF/nb9J9sUovMgu+jyNN5IPVnwwi4AT7X3OMYnfXD/akh7WJ8+4dRBwTZRc2S8cJ
	6AU+0z0AfsXoPLMYU98ZY8LUnkDWoXxPKWoaGZKt9+UXo2Sa18J/TwEdFrXln/4M/9l1Eck2d/TKu
	Hoal3IyBFeEJQB03aObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH32A-0000000G69n-2KDx;
	Wed, 14 Oct 2026 17:44:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH329-0000000G69g-0aW3
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 17:44:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7156940856;
	Wed, 14 Oct 2026 17:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330F01F000C4;
	Wed, 14 Oct 2026 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791999896;
	bh=sTxxFIiD6mgFs2UdEY1I8MyQnekZZiyPvhQw7RuhHrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y/JbqQJUIEWFLFscjenxW9GCe5wNUa4lKG/qtufKEMdVe8I7JjwbgDqX5hbrhnbnk
	 g11pdaabApMfzBMkfpM3w5n1u6n4ty6P15W2DYuVy6e5rpnrYB4vdZc0i3KcsTyQQY
	 TKLv1ClTGNe42312p3oiyQs34X3dYVxDiKaB2oxQ=
Date: Wed, 14 Oct 2026 19:45:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Ian Rogers <irogers@google.com>,
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
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct
 kobj_type::release
Message-ID: <2026101434-scam-padding-87a5@gregkh>
References: <20261013223946.1836757-1-irogers@google.com>
 <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
 <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgMDY6NDQ6MThQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDY6MzfigK9QTSBLZWVzIENvb2sgPGtlZXNA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSSdkIHJlYWxseSBsaWtlIHRvIGhhdmUgdGhlIGF0
dHJpYnV0ZSBhdmFpbGFibGUsIGFuZCBJJ3ZlIGdvdCBhdCBsZWFzdAo+ID4gb25lIHVzZXIgSSBj
YW4gYXBwbHkgdG9kYXkgdGhhdCBkb24ndCByZXF1aXJlIGZpeC11cHMgKHNlcV9maWxlKSwgc28K
PiA+IGlmIE1pZ3VlbCBpcyBva2F5IHdpdGggaXQsIEknZCBsaWtlIHRvIHNuYWcgcGF0Y2ggMSBh
bmQgc2VuZCBpdCB3aXRoCj4gPiBteSBzZXFfZmlsZSAiZmlyc3QgdXNlciIgZm9yIHRoaXMgY29t
aW5nIG1lcmdlIHdpbmRvdyBzbyBpdCdzIGF2YWlsYWJsZQo+ID4gc3RhcnRpbmcgd2l0aCB2Ny40
LXJjMSwgYW5kIHdlIGRvbid0IGVuZCB1cCBuZWVkaW5nIHRvIHdhaXQgMTAgd2Vla3MgZm9yCj4g
PiBvdGhlciBzdWJzeXN0ZW1zIHRvIGJlIGFibGUgdG8gdXNlIGl0LiBBbmQgdGhlIGtvYmogZml4
dXBzIGNhbiBjb250aW51ZQo+ID4gaW4gcGFyYWxsZWwuIERvZXMgdGhhdCBzb3VuZHMgb2theT8K
PiAKPiBPZiBjb3Vyc2UsIHBsZWFzZSBmZWVsIGZyZWUgdG8gcGljayBpdCB1cCAod2l0aCB0aGUg
c21hbGwgdHdlYWsgSQo+IHJlcXVlc3RlZCkgaWYgeW91IGhhdmUgYSB1c2VyLgo+IAo+IEFuZCBp
ZiB5b3UgZG9uJ3QgcGljayB0aGUgdXNlciwgSSBjb3VsZCBzdGlsbCBwaWNrIHRoZSBmaXJzdCBw
YXRjaCB1cAo+IHRocm91Z2ggdGhlIGNvbXBpbGVyIGF0dHJpYnV0ZXMgdHJlZSBpZiB5b3UgYW5k
IG90aGVyIGZvbGtzIHdhbnQgdG8KPiB1c2UgaXQgYWZ0ZXIgLXJjMS4KPiAKPiBHcmVnOiBhZGRp
bmcgdGhlIGF0dHJpYnV0ZSBpdHNlbGYgc2hvdWxkIGJlIHNhZmUgYW5kIHdvdWxkIHVuYmxvY2sK
PiBvdGhlcnMgdGhhdCBtYXkgd2FudCB0byAicHJvdGVjdCIgdGhlbXNlbHZlcywgd2l0aG91dCBo
YXZpbmcgdG8gd2FpdAo+IGZvciBldmVyeSBwb3RlbnRpYWwgdXNlciB0byBnZXQgZml4ZWQgKGJ1
dCBvZiBjb3Vyc2UgSSBhZ3JlZSB0aGV5Cj4gc2hvdWxkIGdldCBmaXhlZCAtLSB3ZSBzaG91bGQg
bm90IGZvcmdldCBhYm91dCB0aGVtLCBpZiB0aGF0IGlzIHlvdXIKPiBjb25jZXJuKS4KCkkgYWdy
ZWUsIG5vdCBhIHByb2JsZW0gdG8gYWRkIHRoZSBhdHRyaWJ1dGUgbm93IGFzIGxvbmcgYXMgaXQg
ZG9lc24ndApicmVhayB0aGUgYnVpbGQuCgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
