Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A14F506D9
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xA1bAfAUuuRCriv8PDm1+JegWQQzspBeWUgiuAzXgVk=; b=ba9BNNuqsYWcCp
	5qLAhW3aDymnw1YTfdMNFedpPRgii84fWasYGCvVQYCTTuCZBMCT5U1x56X1oAd68SKZGDk7cUQd+
	y0C/9+DJzMYQ4lfFhUtDmycDl0k5Q+VO8Jz/gFBoX/ynJk5IDRWSRIY9UQP5bmN1+Vpg8AoohAP2S
	rPAtwgFfKZttQKfaErJzBR0at7nLyBUV+7KcuyyYTrm7h/x6heuxhgZ1kOYS5JqvIhiE155cdW0aN
	DIn/PTG8mBHOWkQUmUga3V1qisGHIp946xXYMSLozhE6T81TYTOajGmXwYEIv5Eg16a+HW+XarM5n
	TWo1xAk/cX5/dJ0wCkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wd-00000004BJ9-3Myy;
	Mon, 16 Mar 2026 14:29:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wa-00000004BIL-3Qa6;
	Mon, 16 Mar 2026 14:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Cn366Va24bwveg07+2tctE+IpJBqolPG9L9A57CTujc=; b=BWaFlM+93//vqgHYhH3CvzAUK8
	lK42u92QvaY5ni7tecI2r2Womiig/L9YDTTADSKDCU2FXl0U1/hnIqoF/8MQ46AEIJusi4VbdnYrr
	KPYqhpOfPT8l3aRpspqECvUiiVF4l4AAZ2g4flMUqMtpYdJuGufX2fwhyC0BufRM0Cs54z66DqRNS
	1y8qq/o+0oh4W1as2pnByG7pEL5YJVtKY1aNEpzpXzOuK4HbeIfa23SzLjonA2QV0khdjb5Q9Q+9v
	ZiZxgUvTeDlu2vcWYfSA2JA4xsEgH2g9qCdf3n0gyNDqdI/bSawQ6nYV7M84Jpn2rMLtpwFnqPWz5
	GvkR/s4A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wX-00000006x6i-1ssV;
	Mon, 16 Mar 2026 14:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4EBE42DCF;
	Mon, 16 Mar 2026 14:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901EFC19421;
	Mon, 16 Mar 2026 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671355;
	bh=PFUSnO/9ILgelOXbwjEIMdn/Aab1PlCJ0qMrqAnbvw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNArTqce345KwAkB2/OySCnh6EME1XoJwR/oAl0lWq7Ylt9gkTfk6stvl4mVK9/3F
	 KwYOcm79Ed4P16v4AgfrWxgeQ5kXFytmq8JtvKgeAJBHJni4gvkqoXRwSRojWkzMXW
	 KjdJCy/qJzif6rc5Ha23V7TyHyiPTJueX/dmlebfwa3TllC3B8dzFJIvh09GNdM5hA
	 U109OB4NNCj4y6zxKWnPMdODpWkf+W9tJkoIot699UjVOMo5rbg+oOW+XblrH75bPT
	 2K9hfeg+fCNBKA/MiRSMUpOgDleW7qa6JeZtPbHw5YSqiNeQgyfmSpebEkCOjXVHFZ
	 N7HDaEOyJ+00A==
Date: Mon, 16 Mar 2026 14:29:04 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Usama Arif <usama.arif@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Clemens Ladisch <clemens@ladisch.de>, 
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
Subject: Re: [PATCH 05/15] fs: afs: correctly drop reference count on mapping
 failure
Message-ID: <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_142917_877672_27A38976 
X-CRM114-Status: GOOD (  42.15  )
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

T24gU3VuLCBNYXIgMTUsIDIwMjYgYXQgMDc6MzI6NTRQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDU6MDDigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIE1h
ciAxMywgMjAyNiBhdCAwNDowNzo0M0FNIC0wNzAwLCBVc2FtYSBBcmlmIHdyb3RlOgo+ID4gPiBP
biBUaHUsIDEyIE1hciAyMDI2IDIwOjI3OjIwICswMDAwICJMb3JlbnpvIFN0b2FrZXMgKE9yYWNs
ZSkiIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gQ29tbWl0IDlkNTQwM2Ix
MDM2YyAoImZzOiBjb252ZXJ0IG1vc3Qgb3RoZXIgZ2VuZXJpY19maWxlXyptbWFwKCkgdXNlcnMg
dG8KPiA+ID4gPiAubW1hcF9wcmVwYXJlKCkiKSB1cGRhdGVkIEFGUyB0byB1c2UgdGhlIG1tYXBf
cHJlcGFyZSBjYWxsYmFjayBpbiBmYXZvdXIgb2YKPiA+ID4gPiB0aGUgZGVwcmVjYXRlZCBtbWFw
IGNhbGxiYWNrLgo+ID4gPiA+Cj4gPiA+ID4gSG93ZXZlciwgaXQgZGlkIG5vdCBhY2NvdW50IGZv
ciB0aGUgZmFjdCB0aGF0IG1tYXBfcHJlcGFyZSBjYW4gZmFpbCB0byBtYXAKPiA+ID4gPiBkdWUg
dG8gYW4gb3V0IG9mIG1lbW9yeSBlcnJvciwgYW5kIHRodXMgc2hvdWxkIG5vdCBiZSBpbmNyZW1l
bnRpbmcgYQo+ID4gPiA+IHJlZmVyZW5jZSBjb3VudCBvbiBtbWFwX3ByZXBhcmUuCj4KPiBUaGlz
IGlzIGEgYml0IGNvbmZ1c2luZy4gSSBzZWUgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9l
cwo+IGFmc19hZGRfb3Blbl9tbWFwKCkgYW5kIHRoZW4gaWYgZ2VuZXJpY19maWxlX21tYXBfcHJl
cGFyZSgpIGZhaWxzIGl0Cj4gZG9lcyBhZnNfZHJvcF9vcGVuX21tYXAoKSwgdGhlcmVmb3JlIHJl
ZmNvdW50aW5nIHNlZW1zIHRvIGJlIGJhbGFuY2VkLgo+IElzIHRoZXJlIHJlYWxseSBhIHByb2Js
ZW0/CgpGaXJzdGx5LCBtbWFwX3ByZXBhcmUgaXMgaW52b2tlZCBiZWZvcmUgd2UgdHJ5IHRvIG1l
cmdlLCBzbyB0aGUgVk1BIGNvdWxkIGluCnRoZW9yeSBnZXQgbWVyZ2VkIGFuZCB0aGVuIHRoZSBy
ZWZjb3VudGluZyB3aWxsIGJlIHdyb25nLgoKU2Vjb25kbHksIG1tYXBfcHJlcGFyZSBvY2N1cnMg
YXQgc3VjaCBhdCB0aW1lIHdoZXJlIGl0IGlzIF9wb3NzaWJsZV8gdGhhdAphbGxvY2F0aW9uIGZh
aWx1cmVzIGFzIGRlc2NyaWJlZCBiZWxvdyBjb3VsZCBoYXBwZW4uCgpJJ2xsIHVwZGF0ZSB0aGUg
Y29tbWl0IG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgbWVyZ2UgYXNwZWN0IGFjdHVhbGx5LgoKPgo+
ID4gPiA+Cj4gPiA+ID4gV2l0aCB0aGUgbmV3bHkgYWRkZWQgdm1fb3BzLT5tYXBwZWQgY2FsbGJh
Y2sgYXZhaWxhYmxlLCB3ZSBjYW4gc2ltcGx5IGRlZmVyCj4gPiA+ID4gdGhpcyBvcGVyYXRpb24g
dG8gdGhhdCBjYWxsYmFjayB3aGljaCBpcyBvbmx5IGludm9rZWQgb25jZSB0aGUgbWFwcGluZyBp
cwo+ID4gPiA+IHN1Y2Nlc3NmdWxseSBpbiBwbGFjZSAoYnV0IG5vdCB5ZXQgdmlzaWJsZSB0byB1
c2Vyc3BhY2UgYXMgdGhlIG1tYXAgYW5kIFZNQQo+ID4gPiA+IHdyaXRlIGxvY2tzIGFyZSBoZWxk
KS4KPiA+ID4gPgo+ID4gPiA+IFRoZXJlZm9yZSBhZGQgYWZzX21hcHBlZCgpIHRvIGltcGxlbWVu
dCB0aGlzIGNhbGxiYWNrIGZvciBBRlMuCj4gPiA+ID4KPiA+ID4gPiBJbiBwcmFjdGljZSB0aGUg
bWFwcGluZyBhbGxvY2F0aW9ucyBhcmUgJ3RvbyBzbWFsbCB0byBmYWlsJyBzbyB0aGlzIGlzCj4g
PiA+ID4gc29tZXRoaW5nIHRoYXQgcmVhbGlzdGljYWxseSBzaG91bGQgbmV2ZXIgaGFwcGVuIGlu
IHByYWN0aWNlIChvciB3b3VsZCBkbwo+ID4gPiA+IHNvIGluIGEgY2FzZSB3aGVyZSB0aGUgcHJv
Y2VzcyBpcyBhYm91dCB0byBkaWUgYW55d2F5KSwgYnV0IHdlIHNob3VsZCBzdGlsbAo+ID4gPiA+
IGhhbmRsZSB0aGlzLgo+Cj4gbml0OiBJIHdvdWxkIGRyb3AgdGhlIGFib3ZlIHBhcmFncmFwaC4g
SWYgaXQncyBpbXBvc3NpYmxlIHdoeSBhcmUgeW91Cj4gaGFuZGxpbmcgaXQ/IElmIGl0J3MgdW5s
aWtlbHksIHRoZW4gaGFuZGxpbmcgaXQgaXMgZXZlbiBtb3JlCj4gaW1wb3J0YW50LgoKU3VyZSBJ
IGNhbiBkcm9wIGl0LCBidXQgaXQncyBhbiBvbmdvaW5nIHRoaW5nIHdpdGggdGhlc2Ugc21hbGwg
YWxsb2NhdGlvbnMuCgpJIHdpc2ggd2UgY291bGQganVzdCBtb3ZlIHRvIGEgc2NlbmFyaW8gd2hl
cmUgd2UgY2FuIHNpbXB5IGFzc3VtZSBhbGxvY2F0aW9ucwp3aWxsIGFsd2F5cyBzdWNjZWVkIDop
CgpWbGFzdGEgLSB0aG91Z2h0cz8KCkNoZWVycywgTG9yZW56bwoKPgo+ID4gPiA+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4K
PiA+ID4gPiAtLS0KPiA+ID4gPiAgZnMvYWZzL2ZpbGUuYyB8IDIwICsrKysrKysrKysrKysrKyst
LS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2Fmcy9maWxlLmMgYi9mcy9hZnMv
ZmlsZS5jCj4gPiA+ID4gaW5kZXggZjYwOTM2NmZkMmFjLi42OWVmODZmNWUyNzQgMTAwNjQ0Cj4g
PiA+ID4gLS0tIGEvZnMvYWZzL2ZpbGUuYwo+ID4gPiA+ICsrKyBiL2ZzL2Fmcy9maWxlLmMKPiA+
ID4gPiBAQCAtMjgsNiArMjgsOCBAQCBzdGF0aWMgc3NpemVfdCBhZnNfZmlsZV9zcGxpY2VfcmVh
ZChzdHJ1Y3QgZmlsZSAqaW4sIGxvZmZfdCAqcHBvcywKPiA+ID4gPiAgc3RhdGljIHZvaWQgYWZz
X3ZtX29wZW4oc3RydWN0IHZtX2FyZWFfc3RydWN0ICphcmVhKTsKPiA+ID4gPiAgc3RhdGljIHZv
aWQgYWZzX3ZtX2Nsb3NlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqYXJlYSk7Cj4gPiA+ID4gIHN0
YXRpYyB2bV9mYXVsdF90IGFmc192bV9tYXBfcGFnZXMoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBn
b2ZmX3Qgc3RhcnRfcGdvZmYsIHBnb2ZmX3QgZW5kX3Bnb2ZmKTsKPiA+ID4gPiArc3RhdGljIGlu
dCBhZnNfbWFwcGVkKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBwZ29m
Zl90IHBnb2ZmLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmaWxlICpm
aWxlLCB2b2lkICoqdm1fcHJpdmF0ZV9kYXRhKTsKPiA+ID4gPgo+ID4gPiA+ICBjb25zdCBzdHJ1
Y3QgZmlsZV9vcGVyYXRpb25zIGFmc19maWxlX29wZXJhdGlvbnMgPSB7Cj4gPiA+ID4gICAgIC5v
cGVuICAgICAgICAgICA9IGFmc19vcGVuLAo+ID4gPiA+IEBAIC02MSw2ICs2Myw3IEBAIGNvbnN0
IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgYWZzX2ZpbGVfYW9wcyA9IHsKPiA+ID4g
PiAgfTsKPiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNf
c3RydWN0IGFmc192bV9vcHMgPSB7Cj4gPiA+ID4gKyAgIC5tYXBwZWQgICAgICAgICA9IGFmc19t
YXBwZWQsCj4gPiA+ID4gICAgIC5vcGVuICAgICAgICAgICA9IGFmc192bV9vcGVuLAo+ID4gPiA+
ICAgICAuY2xvc2UgICAgICAgICAgPSBhZnNfdm1fY2xvc2UsCj4gPiA+ID4gICAgIC5mYXVsdCAg
ICAgICAgICA9IGZpbGVtYXBfZmF1bHQsCj4gPiA+ID4gQEAgLTUwMCwxMyArNTAzLDIyIEBAIHN0
YXRpYyBpbnQgYWZzX2ZpbGVfbW1hcF9wcmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2Mp
Cj4gPiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKHZub2RlKTsKPiA+ID4KPiA+ID4gSXMgdGhl
IGFib3ZlIGFmc19hZGRfb3Blbl9tbWFwIGFuIGFkZGl0aW9uYWwgb25lLCB3aGljaCBjb3VsZCBj
YXVzZSBhIHJlZmVyZW5jZQo+ID4gPiBsZWFrPyBEb2VzIHRoZSBhYm92ZSBvbmUgbmVlZCB0byBi
ZSByZW1vdmVkIGFuZCBvbmx5IHRoZSBvbmUgaW4gYWZzX21hcHBlZCgpCj4gPiA+IG5lZWRzIHRv
IGJlIGtlcHQ/Cj4gPgo+ID4gQWggeWVhaCBnb29kIHNwb3QsIHdpbGwgZml4IHRoYW5rcyEKPiA+
Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAgICAgcmV0ID0gZ2VuZXJpY19maWxlX21tYXBfcHJlcGFy
ZShkZXNjKTsKPiA+ID4gPiAtICAgaWYgKHJldCA9PSAwKQo+ID4gPiA+IC0gICAgICAgICAgIGRl
c2MtPnZtX29wcyA9ICZhZnNfdm1fb3BzOwo+ID4gPiA+IC0gICBlbHNlCj4gPiA+ID4gLSAgICAg
ICAgICAgYWZzX2Ryb3Bfb3Blbl9tbWFwKHZub2RlKTsKPiA+ID4gPiArICAgaWYgKHJldCkKPiA+
ID4gPiArICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ICsKPiA+ID4gPiArICAgZGVzYy0+
dm1fb3BzID0gJmFmc192bV9vcHM7Cj4gPiA+ID4gICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gIH0K
PiA+ID4gPgo+ID4gPiA+ICtzdGF0aWMgaW50IGFmc19tYXBwZWQodW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgbG9uZyBlbmQsIHBnb2ZmX3QgcGdvZmYsCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKip2bV9wcml2YXRlX2RhdGEpCj4g
PiA+ID4gK3sKPiA+ID4gPiArICAgc3RydWN0IGFmc192bm9kZSAqdm5vZGUgPSBBRlNfRlNfSShm
aWxlX2lub2RlKGZpbGUpKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgIGFmc19hZGRfb3Blbl9tbWFw
KHZub2RlKTsKPiA+ID4gPiArICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+
ID4gIHN0YXRpYyB2b2lkIGFmc192bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+
ID4gPiA+ICB7Cj4gPiA+ID4gICAgIGFmc19hZGRfb3Blbl9tbWFwKEFGU19GU19JKGZpbGVfaW5v
ZGUodm1hLT52bV9maWxlKSkpOwo+ID4gPiA+IC0tCj4gPiA+ID4gMi41My4wCj4gPiA+ID4KPiA+
ID4gPgo+ID4KPiA+IENoZWVycywgTG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
