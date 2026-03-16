Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F22F506D5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6JbtEa27zzfU3YeCuX9U8KLrOSFKZz0nMPOIBNew+k=; b=o7dV/Z1urh9UJ2
	jsYX5WtZvDiB4Sq1f9FkKMVPxgO3FEEMbsEScC+HpTc+JEq0d16X1zD1IXDjlfGs3IOJWkWCU/Cau
	O9TVuTzO8Nm2K6KKvdtaaTkooxzjnTPYLhyimTLw6eKM+D4I/nhyKdcqvuFZL3WspbULSE2X2jFp+
	et43yhWSoxF4yizzZ2cog+bHEI9/JJNFZX9b4eLp2+vOuenmzYuIneivU3p6dkSx3lmfX5RoQqmYd
	bUppdSzK6oMnTBGKIW5FcCweNgYhZKzm2JTnVztIBEvZFIeDfcCcNHFOIRVMQ6y7hQCpynMBIg/hK
	aPT+jYAmlJupOxvPQSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28yg-00000004Bih-3fWS;
	Mon, 16 Mar 2026 14:31:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28yf-00000004Bi6-2Ht4;
	Mon, 16 Mar 2026 14:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8023760018;
	Mon, 16 Mar 2026 14:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC85CC19421;
	Mon, 16 Mar 2026 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671488;
	bh=wmwRlESgrnvepPbb1PirkwNJB9yCJFViHuseAPzZgTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1MvHmFeTMXLS17UDbf4qKWdxfdfl1nIIM1Znjt/hB9Jrz7XpIjRGeKs/GgD5HbmT
	 GJnoLBvTQBD3mLyiQNYu/uMaiNpDmAFyJZxaGwL4kth9NMa+7N8pWmipLI9MOUnNIm
	 XZuQWf4hbnuJkGt5El0XdUQ+XGEEEj/ffydaRt0U7/71pqXpi7xrliHkFxDB3ruYpx
	 nd8CvutsY0NcvbrtfRvTcx8uB1G0uZ0HoUdnCcCHmTSa8GQRX3yC4bOT9X7R/YGAmG
	 CL3fSgSn9uu67vMXPRuf0GENu4YKm6u93U51R6SiQiRnK+y3zr8woWQTM2An6cXIJn
	 BxJKdQaXB4REg==
Date: Mon, 16 Mar 2026 14:31:17 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 03/15] mm: document vm_operations_struct->open the same
 as close()
Message-ID: <fdc193c6-483e-4e8e-8813-fa71d984bfb1@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
 <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
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

T24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMDU6NDM6NDFQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFRodSwgTWFyIDEyLCAyMDI2IGF0IDE6MjfigK9QTSBMb3JlbnpvIFN0
b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBEZXNjcmliZSB3
aGVuIHRoZSBvcGVyYXRpb24gaXMgaW52b2tlZCBhbmQgdGhlIGNvbnRleHQgaW4gd2hpY2ggaXQg
aXMKPiA+IGludm9rZWQsIG1hdGNoaW5nIHRoZSBkZXNjcmlwdGlvbiBhbHJlYWR5IGFkZGVkIGZv
ciB2bV9vcC0+Y2xvc2UoKS4KPiA+Cj4gPiBXaGlsZSB3ZSdyZSBoZXJlLCB1cGRhdGUgYWxsIG91
dGRhdGVkIHJlZmVyZW5jZXMgdG8gYW4gJ2FyZWEnIGZpZWxkIGZvcgo+ID4gVk1BcyB0byB0aGUg
bW9yZSBjb25zaXN0ZW50ICd2bWEnLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3Rv
YWtlcyAoT3JhY2xlKSA8bGpzQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4
L21tLmggfCAxNSArKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gPiBpbmRleCBjYzU5NjBhODQzODIuLjEyYTBi
NGM2MzczNiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ID4gKysrIGIvaW5j
bHVkZS9saW51eC9tbS5oCj4gPiBAQCAtNzQ4LDE1ICs3NDgsMjAgQEAgc3RydWN0IHZtX3VmZmRf
b3BzOwo+ID4gICAqIHRvIHRoZSBmdW5jdGlvbnMgY2FsbGVkIHdoZW4gYSBuby1wYWdlIG9yIGEg
d3AtcGFnZSBleGNlcHRpb24gb2NjdXJzLgo+ID4gICAqLwo+ID4gIHN0cnVjdCB2bV9vcGVyYXRp
b25zX3N0cnVjdCB7Cj4gPiAtICAgICAgIHZvaWQgKCpvcGVuKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKiBhcmVhKTsKPiA+ICsgICAgICAgLyoqCj4gPiArICAgICAgICAqIEBvcGVuOiBDYWxsZWQg
d2hlbiBhIFZNQSBpcyByZW1hcHBlZCBvciBzcGxpdC4gTm90IGNhbGxlZCB1cG9uIGZpcnN0Cj4g
PiArICAgICAgICAqIG1hcHBpbmcgYSBWTUEuCj4KPiBJdCdzIGFsc28gY2FsbGVkIGZyb20gZHVw
X21tYXAoKSB3aGljaCBpcyBwYXJ0IG9mIGZvcmtpbmcuCgpBaCB5dXAgOikgd2lsbCB1cGRhdGUg
dGhhbmtzIQoKPgo+ID4gKyAgICAgICAgKiBDb250ZXh0OiBVc2VyIGNvbnRleHQuICBNYXkgc2xl
ZXAuICBDYWxsZXIgaG9sZHMgbW1hcF9sb2NrLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAg
dm9pZCAoKm9wZW4pKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ICAgICAgICAgLyoq
Cj4gPiAgICAgICAgICAqIEBjbG9zZTogQ2FsbGVkIHdoZW4gdGhlIFZNQSBpcyBiZWluZyByZW1v
dmVkIGZyb20gdGhlIE1NLgo+ID4gICAgICAgICAgKiBDb250ZXh0OiBVc2VyIGNvbnRleHQuICBN
YXkgc2xlZXAuICBDYWxsZXIgaG9sZHMgbW1hcF9sb2NrLgo+ID4gICAgICAgICAgKi8KPiA+IC0g
ICAgICAgdm9pZCAoKmNsb3NlKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiBhcmVhKTsKPiA+ICsg
ICAgICAgdm9pZCAoKmNsb3NlKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gPiAgICAg
ICAgIC8qIENhbGxlZCBhbnkgdGltZSBiZWZvcmUgc3BsaXR0aW5nIHRvIGNoZWNrIGlmIGl0J3Mg
YWxsb3dlZCAqLwo+ID4gLSAgICAgICBpbnQgKCptYXlfc3BsaXQpKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqYXJlYSwgdW5zaWduZWQgbG9uZyBhZGRyKTsKPiA+IC0gICAgICAgaW50ICgqbXJlbWFw
KShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKmFyZWEpOwo+ID4gKyAgICAgICBpbnQgKCptYXlfc3Bs
aXQpKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpOwo+ID4g
KyAgICAgICBpbnQgKCptcmVtYXApKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPiA+ICAg
ICAgICAgLyoKPiA+ICAgICAgICAgICogQ2FsbGVkIGJ5IG1wcm90ZWN0KCkgdG8gbWFrZSBkcml2
ZXItc3BlY2lmaWMgcGVybWlzc2lvbgo+ID4gICAgICAgICAgKiBjaGVja3MgYmVmb3JlIG1wcm90
ZWN0KCkgaXMgZmluYWxpc2VkLiAgIFRoZSBWTUEgbXVzdCBub3QKPiA+IEBAIC03NjgsNyArNzcz
LDcgQEAgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHsKPiA+ICAgICAgICAgdm1fZmF1bHRf
dCAoKmh1Z2VfZmF1bHQpKHN0cnVjdCB2bV9mYXVsdCAqdm1mLCB1bnNpZ25lZCBpbnQgb3JkZXIp
Owo+ID4gICAgICAgICB2bV9mYXVsdF90ICgqbWFwX3BhZ2VzKShzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBnb2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2Zm
X3QgZW5kX3Bnb2ZmKTsKPiA+IC0gICAgICAgdW5zaWduZWQgbG9uZyAoKnBhZ2VzaXplKShzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiBhcmVhKTsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyAoKnBh
Z2VzaXplKShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Cj4gPgo+ID4gICAgICAgICAvKiBu
b3RpZmljYXRpb24gdGhhdCBhIHByZXZpb3VzbHkgcmVhZC1vbmx5IHBhZ2UgaXMgYWJvdXQgdG8g
YmVjb21lCj4gPiAgICAgICAgICAqIHdyaXRhYmxlLCBpZiBhbiBlcnJvciBpcyByZXR1cm5lZCBp
dCB3aWxsIGNhdXNlIGEgU0lHQlVTICovCj4gPiAtLQo+ID4gMi41My4wCj4gPgoKQ2hlZXJzLCBM
b3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
