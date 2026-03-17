Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB36F3381E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeSROqQzcxNRRLx2txOYC5JEDvTBsd8W3KRI+EYDPZc=; b=JZJHmH6igktnzi
	1TajUYXzh2om/sgrZp8o9YrCCSOeGwzSMEtf2AMkJAcvSBvZSvwmpcKjX9E9NxTrftRO+MHR1ZUqs
	eSrh9E78lPMs1E8iFbmRFpTDinPmJ8PM+QSnWb1HU8B1J2MqId3kIyIHAcvS1SqIej0ZTxDf6jH3u
	rvvhtgzDi8UR10DQIemnTI114lZcPiseaEuVPlpDHpLmcNSfa6NujgHPmlS+Xk5Yy9TUK0Cv3QKSz
	OSHXOVYIr1j4+tbmlaRPS5GZZkGGYqWO6tV8t1hfJmUi8XD0wRXQhFEm3tlwM2R5ZovevrJRgFQrv
	JMRD1NMcfFU33P2N5ThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QFm-00000005mPx-39rq;
	Tue, 17 Mar 2026 08:58:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QFj-00000005mNz-2rcB;
	Tue, 17 Mar 2026 08:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4329D40C49;
	Tue, 17 Mar 2026 08:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0D5C2BCB6;
	Tue, 17 Mar 2026 08:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737894;
	bh=6555lE8Eqz4VdrShTAZB8tLmpI5/NfoZfhGSGsRo30Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jK3J4jIDbHMCKrxQ+OjUgrUordb9Xw/krWi+plO21PkM4j44mP8jyUr0+L6Gs8K54
	 3+hgkwVbgGjfrOruLgVyuttzaOPX/kP+WAWxiOzWMmNRwEJfgcT1aOb+x9THjCaONq
	 W9tloCz+rbEOI7JtI6nvRrRf2D+/xm5SN0ksYzj8cK9AxVC7/LC8vX5ZIQjB8gYlTe
	 Ws0eHBg1CWeRLxy89UpcLRszfQD6r867MrcFbjb+4b6l6NGjIPmb/YlGHORmMA2O/9
	 FjMkQioxd3ZmUvzvbV0gDNR0yAshhPSjBnl+NHW2jaZPx63xqVGFwCmPgqjWPZC4k5
	 khapcITUoXimg==
Date: Tue, 17 Mar 2026 08:58:02 +0000
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
Message-ID: <679f8190-752a-4b0c-ab5e-635938169cab@lucifer.local>
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
 <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
 <CAJuCfpFio6n-O-1NkPXrymV0o3UqvHYS8ZOyQtt=JXnZ5dTGhQ@mail.gmail.com>
 <2536c05e-e228-404f-9916-906c0447b114@lucifer.local>
 <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpH2XyAJOFKCZnviVV_UbF4O0wzj3QgJieo+LD=Cvr71jA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_015815_760260_E06B5218 
X-CRM114-Status: GOOD (  36.79  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMDg6NDE6NDhQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDE2LCAyMDI2IGF0IDc6MjnigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIE1h
ciAxNSwgMjAyNiBhdCAwNzozMjo1NFBNIC0wNzAwLCBTdXJlbiBCYWdoZGFzYXJ5YW4gd3JvdGU6
Cj4gPiA+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDU6MDDigK9BTSBMb3JlbnpvIFN0b2FrZXMg
KE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwg
TWFyIDEzLCAyMDI2IGF0IDA0OjA3OjQzQU0gLTA3MDAsIFVzYW1hIEFyaWYgd3JvdGU6Cj4gPiA+
ID4gPiBPbiBUaHUsIDEyIE1hciAyMDI2IDIwOjI3OjIwICswMDAwICJMb3JlbnpvIFN0b2FrZXMg
KE9yYWNsZSkiIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBD
b21taXQgOWQ1NDAzYjEwMzZjICgiZnM6IGNvbnZlcnQgbW9zdCBvdGhlciBnZW5lcmljX2ZpbGVf
Km1tYXAoKSB1c2VycyB0bwo+ID4gPiA+ID4gPiAubW1hcF9wcmVwYXJlKCkiKSB1cGRhdGVkIEFG
UyB0byB1c2UgdGhlIG1tYXBfcHJlcGFyZSBjYWxsYmFjayBpbiBmYXZvdXIgb2YKPiA+ID4gPiA+
ID4gdGhlIGRlcHJlY2F0ZWQgbW1hcCBjYWxsYmFjay4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
SG93ZXZlciwgaXQgZGlkIG5vdCBhY2NvdW50IGZvciB0aGUgZmFjdCB0aGF0IG1tYXBfcHJlcGFy
ZSBjYW4gZmFpbCB0byBtYXAKPiA+ID4gPiA+ID4gZHVlIHRvIGFuIG91dCBvZiBtZW1vcnkgZXJy
b3IsIGFuZCB0aHVzIHNob3VsZCBub3QgYmUgaW5jcmVtZW50aW5nIGEKPiA+ID4gPiA+ID4gcmVm
ZXJlbmNlIGNvdW50IG9uIG1tYXBfcHJlcGFyZS4KPiA+ID4KPiA+ID4gVGhpcyBpcyBhIGJpdCBj
b25mdXNpbmcuIEkgc2VlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRvZXMKPiA+ID4gYWZz
X2FkZF9vcGVuX21tYXAoKSBhbmQgdGhlbiBpZiBnZW5lcmljX2ZpbGVfbW1hcF9wcmVwYXJlKCkg
ZmFpbHMgaXQKPiA+ID4gZG9lcyBhZnNfZHJvcF9vcGVuX21tYXAoKSwgdGhlcmVmb3JlIHJlZmNv
dW50aW5nIHNlZW1zIHRvIGJlIGJhbGFuY2VkLgo+ID4gPiBJcyB0aGVyZSByZWFsbHkgYSBwcm9i
bGVtPwo+ID4KPiA+IEZpcnN0bHksIG1tYXBfcHJlcGFyZSBpcyBpbnZva2VkIGJlZm9yZSB3ZSB0
cnkgdG8gbWVyZ2UsIHNvIHRoZSBWTUEgY291bGQgaW4KPiA+IHRoZW9yeSBnZXQgbWVyZ2VkIGFu
ZCB0aGVuIHRoZSByZWZjb3VudGluZyB3aWxsIGJlIHdyb25nLgo+Cj4gSSBzZWUgbm93LiBPaywg
bWFrZXMgc2Vuc2UuCj4KPiA+Cj4gPiBTZWNvbmRseSwgbW1hcF9wcmVwYXJlIG9jY3VycyBhdCBz
dWNoIGF0IHRpbWUgd2hlcmUgaXQgaXMgX3Bvc3NpYmxlXyB0aGF0Cj4gPiBhbGxvY2F0aW9uIGZh
aWx1cmVzIGFzIGRlc2NyaWJlZCBiZWxvdyBjb3VsZCBoYXBwZW4uCj4KPiBSaWdodCwgYnV0IGlu
IHRoYXQgY2FzZSBhZnNfZmlsZV9tbWFwX3ByZXBhcmUoKSB3b3VsZCBkcm9wIGl0cwo+IHJlZmNv
dW50IGFuZCByZXR1cm4gYW4gZXJyb3IsIHNvIHJlZmNvdW50aW5nIGlzIHN0aWxsIGdvb2QsIG5v
PwoKTm9wZSwgaW4gX19tbWFwX3JlZ2lvbigpOgoKY2FsbF9tbWFwX3ByZXBhcmUoKQotPiBfX21t
YXBfbmV3X3ZtYSgpCnZtX2FyZWFfYWxsb2MoKSAtPiBjYW4gZmFpbAp2bWFfaXRlcl9wcmVhbGxv
YygpIC0+IGNhbiBmYWlsCl9fbW1hcF9uZXdfZmlsZV92bWEoKSAvIHNobWVtX3plcm9fc2V0dXAo
KSAtPiBjYW4gZmFpbAoKSWYgYW55IG9mIHRob3NlIGZhaWwgdGhlIFZNQSBpcyBub3QgZXZlbiBz
ZXQgdXAsIHNvIG5vIGNsb3NlKCkgd2lsbCBiZSBjYWxsZWQKYmVjYXVzZSB0aGVyZSdzIG5vIFZN
QSB0byBjYWxsIGNsb3NlIG9uLgoKVGhpcyBpcyB3aGF0IG1ha2VzIG1tYXBfcHJlcGFyZSB2ZXJ5
IGRpZmZlcmVudCBmcm9tIG1tYXAgd2hpY2ggcGFzc2VzIGluIChhCnBhcnRpYWxseSBlc3RhYmxp
c2hlZCkgVk1BLgoKVGhhdCBhbmQgb2YgY291cnNlIGEgcG90ZW50aWFsIG1lcmdlIHdvdWxkIG1l
YW4gYW55IHJlZmNvdW50IGluY3JlbWVudCB3b3VsZCBiZQp3cm9uZy4KCj4KPiA+Cj4gPiBJJ2xs
IHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gcmVmbGVjdCB0aGUgbWVyZ2UgYXNwZWN0IGFj
dHVhbGx5Lgo+Cj4gVGhhbmtzIQoKWW91J3JlIHdlbGNvbWUsIGFuZCBkb25lIGluIHYyIDopCgo+
Cj4gPgo+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXaXRoIHRoZSBuZXdseSBhZGRlZCB2
bV9vcHMtPm1hcHBlZCBjYWxsYmFjayBhdmFpbGFibGUsIHdlIGNhbiBzaW1wbHkgZGVmZXIKPiA+
ID4gPiA+ID4gdGhpcyBvcGVyYXRpb24gdG8gdGhhdCBjYWxsYmFjayB3aGljaCBpcyBvbmx5IGlu
dm9rZWQgb25jZSB0aGUgbWFwcGluZyBpcwo+ID4gPiA+ID4gPiBzdWNjZXNzZnVsbHkgaW4gcGxh
Y2UgKGJ1dCBub3QgeWV0IHZpc2libGUgdG8gdXNlcnNwYWNlIGFzIHRoZSBtbWFwIGFuZCBWTUEK
PiA+ID4gPiA+ID4gd3JpdGUgbG9ja3MgYXJlIGhlbGQpLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBUaGVyZWZvcmUgYWRkIGFmc19tYXBwZWQoKSB0byBpbXBsZW1lbnQgdGhpcyBjYWxsYmFjayBm
b3IgQUZTLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJbiBwcmFjdGljZSB0aGUgbWFwcGluZyBh
bGxvY2F0aW9ucyBhcmUgJ3RvbyBzbWFsbCB0byBmYWlsJyBzbyB0aGlzIGlzCj4gPiA+ID4gPiA+
IHNvbWV0aGluZyB0aGF0IHJlYWxpc3RpY2FsbHkgc2hvdWxkIG5ldmVyIGhhcHBlbiBpbiBwcmFj
dGljZSAob3Igd291bGQgZG8KPiA+ID4gPiA+ID4gc28gaW4gYSBjYXNlIHdoZXJlIHRoZSBwcm9j
ZXNzIGlzIGFib3V0IHRvIGRpZSBhbnl3YXkpLCBidXQgd2Ugc2hvdWxkIHN0aWxsCj4gPiA+ID4g
PiA+IGhhbmRsZSB0aGlzLgo+ID4gPgo+ID4gPiBuaXQ6IEkgd291bGQgZHJvcCB0aGUgYWJvdmUg
cGFyYWdyYXBoLiBJZiBpdCdzIGltcG9zc2libGUgd2h5IGFyZSB5b3UKPiA+ID4gaGFuZGxpbmcg
aXQ/IElmIGl0J3MgdW5saWtlbHksIHRoZW4gaGFuZGxpbmcgaXQgaXMgZXZlbiBtb3JlCj4gPiA+
IGltcG9ydGFudC4KPiA+Cj4gPiBTdXJlIEkgY2FuIGRyb3AgaXQsIGJ1dCBpdCdzIGFuIG9uZ29p
bmcgdGhpbmcgd2l0aCB0aGVzZSBzbWFsbCBhbGxvY2F0aW9ucy4KPiA+Cj4gPiBJIHdpc2ggd2Ug
Y291bGQganVzdCBtb3ZlIHRvIGEgc2NlbmFyaW8gd2hlcmUgd2UgY2FuIHNpbXB5IGFzc3VtZSBh
bGxvY2F0aW9ucwo+ID4gd2lsbCBhbHdheXMgc3VjY2VlZCA6KQo+Cj4gVGhhdCB3b3VsZCBiZSBy
ZWFsbHkgbmljZSBidXQgdW5mb3J0dW5hdGVseSB0aGUgd29ybGQgaXMgbm90IHRoYXQKPiBwZXJm
ZWN0LiBJIGp1c3QgZG9uJ3Qgd2FudCB0byBiZSBjaGFzaW5nIHNvbWUgcmFyZWx5IHJlcHJvZHVj
aWJsZSBidWcKPiBiZWNhdXNlIG9mIHRoZSBhc3N1bXB0aW9uIHRoYXQgYW4gYWxsb2NhdGlvbiBp
cyB0b28gc21hbGwgdG8gZmFpbC4KCkkgbWVhbiBJIGFncmVlLCB3ZSBzaG91bGQgaGFuZGxlIGFs
bCBlcnJvciBwYXRocy4KCkNoZWVycywgTG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
