Received: from out2.bezeqint.net ([192.115.188.208])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVkeE-00058z-E0
	for linux-mtd@lists.infradead.org; Thu, 23 Dec 2010 12:51:59 +0000
Received: from mail.wellsense-tech.com (bzq-218-140-171.cablep.bezeqint.net
	[81.218.140.171])
	by out2.bezeqint.net (Postfix) with ESMTPA id 627BE212552
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Dec 2010 14:51:54 +0200 (IST)
From: Boaz Ben-David <boaz.bd@wellsense-tech.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 23 Dec 2010 14:51:53 +0200
Subject: Re: UBIFS reboots issue
Message-ID: <39A4B204C321D34DA3490E3B119D5A6C68BF77674A@SBS2008.wellsense.local>
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local>
	<1293049245.2051.4.camel@koala>
In-Reply-To: <1293049245.2051.4.camel@koala>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SSBhbSB1c2luZyBrZXJuZWwgMi42LjMxIGZvciBpTVgzNSBhbmQgSSdtIG5vdCBzdXJlIHdoYXQg
dmVyc2lvbiBvZgpVQklGUyBpcyBwYXRjaGVkIGluIHRoZXJlLgpXaGF0IGRvIEkgbmVlZCB0byBk
byBpbiBvcmRlciB0byBwYXRjaCB0byB0aGUgbGF0ZXN0IHZlcnNpb24/IApJcyBpcyBlbm91Z2gg
dG8gY2xvbmUgVUJJRlMgMi42LjMxIGFuZCBjb3B5IG92ZXIgdGhlIGZzL3ViaWZzIGFuZAptdGQv
dWJpIGRpcmVjdG9yaWVzIG9yIGFyZSB0aGVyZSBhbnkgb3RoZXIgZGlyZWN0b3JpZXMgSSBuZWVk
IHRvIHRha2UKaW50byBhY2NvdW50PwoKVGhhbmtzLAoKQm9hei4KCk9uIFdlZCwgMjAxMC0xMi0y
MiBhdCAyMjoyMCArMDIwMCwgQXJ0ZW0gQml0eXV0c2tpeSB3cm90ZToKPiBPbiBXZWQsIDIwMTAt
MTItMjIgYXQgMTY6MzYgKzAyMDAsIEJvYXogQmVuLURhdmlkIHdyb3RlOgo+ID4gSGkgYWxsLAo+
ID4gCj4gPiBXZSBoYXZlIGFuIGVtYmVkZGVkIHN5c3RlbSB1c2luZyBhIFNhbXN1bmcgMkdCIE1M
QyBOQU5EIGFuZCBhcmUgdXNpbmcKPiA+IFVCSUZTIGFzIHRoZSBmaWxlIHN5c3RlbSBvbiBpdC4K
PiA+IEkgaGF2ZSBhIHF1ZXN0aW9uIHJlZ2FyZGluZyBVQklGUyBhbmQgaGFyZCByZWJvb3RzLgo+
ID4gQWZ0ZXIgc29tZSB3b3JrIHdpdGggdGhlIGZsYXNoIChkb2luZyByZWFkcyBhbmQgd3JpdGVz
IHRvIGl0KSwgc29tZQo+ID4gdGltZXMgb25lIG9mIG91ciBwYXJ0aXRpb25zIHdvdWxkIGZhaWwg
dG8gbW91bnQuCj4gPiBJIHN1c3BlY3RlZCB0aGlzIGhhcyBzb21ldGhpbmcgdG8gZG8gd2l0aCBh
IHJlYm9vdCB3aGljaCBoYXBwZW5zIGR1cmluZwo+ID4gYSB3cml0ZSB0byB0aGUgZmxhc2guCj4g
PiBJbiBvcmRlciB0byB0ZXN0IHRoaXMgSSBjcmVhdGVkIGEgc2ltcGxlIHNjcmlwdCB3aGljaCBj
b3BpZXMgYSBmaWxlIGZyb20KPiA+IHRvIHRoZSBwYXJ0aXRpb24sIHN5bmNzLCB0aGVuIGRlbGV0
ZXMgaXQgYW5kIGRvZXMgdGhpcyByZXBlYXRlZGx5IHVudGlsIAo+ID4gYSBoYXJkIHJlYm9vdCBv
Y2N1cnMgKHVzaW5nIHRoZSB3YXRjaCBkb2cgdG8gY2F1c2UgdGhlIGJvb3QpLgo+ID4gVGhpcyBw
cm9jZXNzIHJlcGVhdHMgaXRzZWxmIHVudGlsIHRoZSBwYXJ0aXRpb24gZmFpbHMgdG8gbW91bnQu
Cj4gPiBXaGVuIEkgcGVyZm9ybWVkIHRoZSB0ZXN0IG1lbnRpb25lZCBhYm92ZSwgYWZ0ZXIgYWJv
dXQgMy00IHRpbWVzIHRoZQo+ID4gcGFydGl0aW9uIHdvdWxkIGZhaWwuCj4gPiBJIGFtIG5vdCBz
dXJlIGlmIHRoaXMgYmVoYXZpb3VyIGlzIG5vcm1hbCBvciBub3QuCj4gPiBEaWQgc29tZW9uZSBl
bmNvdW50ZXIgc2ltaWxpYXIgYmVoYXZpb3VyPwo+IAo+IEp1c3QgY3VyaW91cywgZGlkIHlvdSBz
ZWUgdGhpczoKPiAKPiBodHRwOi8vbGludXgtbXRkLmluZnJhZGVhZC5vcmcvZmFxL3ViaWZzLmh0
bWwjTF91Ymlmc19tbGMKPiAKPiBJIGRvIG5vdCB0aGluayB5b3UgY2FuIGp1c3QgdXNlIFVCSS9V
QklGUyBvbiBNTEMgYXMgaXMsIHlvdSdkIG5lZWQgdG8KPiBtYWtlIHN1cmUgTUxDLXNwZWNpZmlj
IGJlaGF2aW9yIGlzIGhhbmRsZWQgcHJvcGVybHkuCj4gCj4gLS0gCj4gQmVzdCBSZWdhcmRzLAo+
IEFydGVtIEJpdHl1dHNraXkgKNCR0LjRgtGO0YbQutC40Lkg0JDRgNGC0ZHQvCkKPiAKCg==
