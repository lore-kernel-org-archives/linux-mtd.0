Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlK0B-0000Na-0N
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 08:25:24 +0000
Received: by fg-out-1718.google.com with SMTP id 22so1503626fge.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Apr 2008 01:25:21 -0700 (PDT)
Message-ID: <fe810cf0804140125y6a4e316dqdb22c07ef347af6e@mail.gmail.com>
Date: Mon, 14 Apr 2008 12:25:21 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "=?UTF-8?Q?J=C3=B6rn_Engel?=" <joern@logfs.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes
	kernel panic
In-Reply-To: <20080413105046.GB6022@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
	<Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
	<1207937133.5965.17.camel@sauron> <20080413105046.GB6022@logfs.org>
Cc: nickpiggin@yahoo.com.au, Alexey Korolev <akorolev@infradead.org>,
	Jean Pihet <jpihet@mvista.com>, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gU3VuLCBBcHIgMTMsIDIwMDggYXQgMjo1MCBQTSwgSsO2cm4gRW5nZWwgPGpvZXJuQGxvZ2Zz
Lm9yZz4gd3JvdGU6Cj4gT24gRnJpLCAxMSBBcHJpbCAyMDA4IDIxOjA1OjMzICswMzAwLCBBcnRl
bSBCaXR5dXRza2l5IHdyb3RlOgo+ICA+Cj4gID4gU28gd2h5IGRpZCB5b3Ugc3RhcnQgdGhpcyBw
cm9qZWN0PyBIb3cgYWJvdXQganVzdCBtYWtpbmcgYWxsIHlvdXIgd29yawo+ICA+IHRvIGdvIGlu
dG8gbWFpbmxpbmUgaW5zdGVhZD8KPgo+ICBBdCBsZWFzdCBvbmUgb2YgdGhlIHBhdGNoZXMgc2hv
dWxkIG5vdCBnbyB0byBtYWlubGluZS4gIEl0IGlzIG9uZSBvZgo+ICB0aG9zZSBzdHJhbmdlICJJ
ZiBJIGNoYW5nZSB0aGUgY29kZSBoZXJlLCBhbGwgc3ltcHRvbXMgZGlzYXBwZWFyIgo+ICBwYXRj
aGVzIHRoYXQgZG9lc24ndCBjdXJlIHRoZSBjYXVzZS4gIFNvbWVvbmUgc2hvdWxkIHNwZW5kIHNv
bWUgdGltZSB0bwo+ICBmaW5kIHRoZSByb290IGNvdXNlLCBidXQgbm9vbmUgaGFzLgoKSm9lcm4s
IEkgZG8ga25vdyB0aGUgcGF0Y2ggeW91IGFyZSB0YWxraW5nIGFib3V0IDspIEl0IHdhcyBhYm91
dCBqZmZzMgpnYyBwYXRoIGJ1Zy4KClRoZXJlIGFyZSB0d28gb3B0aW9uczogdG8gY29uc3RhbnRs
eSBoaXQgdGhlIGJ1ZyBiZWNhdXNlIG5vb25lIGlzCmludGVyZXN0ZWQgKGhhdmUgbm8gdGltZSkg
aW4gZml4aW5nIGl0ICJwcm9wZXJseSIgb3IgdG8gdXNlIGN1cmUKKHRlc3RlZCBhbmQgc3RyZXNz
ZWQpIHVudGlsIHNvbWVvbmUgd291bGQgbWFrZSBiZXR0ZXIgZml4IGluIHRoZQptYWlubGluZS4K
CkZpcnN0IHRpbWUgKG1vcmUgdGhhbiBoYWxmIG9mIHllYXIgYWdvKSBJJ3ZlIHN1Ym1pdHRlZCB0
aGUgcGF0Y2ggKHdpdGgKZGV0YWlsZWQgYnVnIGFuYWx5c2lzKSBpdCB3YXMgc2ltcGx5IGlnbm9y
ZWQuIFRoZSBzZWNvbmQgdGltZSBKb2VybgpjbGFpbWVkIGl0IGFzIGN1cmUgbm90IGEgZml4LiBi
dHcgSm9lcm4gd2FzIHRoZSBvbmx5IHBlcnNvbiB3aG8KcmVwbGllZCAtIHRoYW5rcy4KClNvIGJ1
ZyBkb2VzIGV4aXN0LCBubyBmaXggaW4gbWFpbmxpbmUsIGFuZCBubyBmcnVpdGZ1bCBkaXNjdXNz
aW9uIGluCm1haWxpbmcgbGlzdC4gSU1PIGFuc3dlciB0byBBcnRlbSdzIHF1ZXN0aW9uIGJlY29t
ZXMgcXVpdGUgb2J2aW91cy4KCi1hCg==
