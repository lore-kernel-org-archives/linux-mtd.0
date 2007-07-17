Received: from wa-out-1112.google.com ([209.85.146.182])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IAkbn-0000rh-Q8
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 06:48:50 -0400
Received: by wa-out-1112.google.com with SMTP id v33so1852385wah
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Jul 2007 03:48:46 -0700 (PDT)
Message-ID: <9b52d64c0707170348r18010d23ub5586d3ff73793d6@mail.gmail.com>
Date: Tue, 17 Jul 2007 16:18:45 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: UBI: Can we handle -EINTR differently in erase/write path???
In-Reply-To: <1184668607.3531.144.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: base64
Content-Disposition: inline
References: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
	<1184668607.3531.144.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SSdsbCBzZW5kIHRoZSBwYXRjaCBieSB0b21vcnJvdyB3aXRoIGhhbmRsaW5nIGZvciAtRUlOVFIg
aW4gd3JpdGUgYWxzby4KClRoYW5rcyAmIFJlZ2FyZHMKVmluaXQuCgpPbiA3LzE3LzA3LCBBcnRl
bSBCaXR5dXRza2l5IDxkZWRla2luZEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiBPbiBGcmksIDIw
MDctMDctMTMgYXQgMTE6MzcgKzA1MzAsIFZpbml0IEFnbmlob3RyaSB3cm90ZToKPiA+IEhpIGhl
cmVzIGZldyBjb2RlIHNuaXAgZnJvbSBlcmFzZV93b3JrZXIoKTsgZnJvbSB3bC5jCj4gPiBpZiAo
ZXJyICE9IC1FSU8pIHsKPiA+ICAgICAgICAgLyoKPiA+ICAgICAgICAgICogSWYgdGhpcyBpcyBu
b3QgJS1FSU8sIHdlIGhhdmUgbm8gaWRlYSB3aGF0IHRvIGRvLiBTY2hlZHVsaW5nCj4gPiAgICAg
ICAgICAqIHRoaXMgcGh5c2ljYWwgZXJhc2VibG9jayBmb3IgZXJhc3VyZSBhZ2FpbiB3b3VsZCBj
YXVzZQo+ID4gICAgICAgICAgKiBlcnJvcnMgYWdhaW4gYW5kIGFnYWluLiBXZWxsLCBsZXRzIHN3
aXRjaCB0byBSTyBtb2RlLgo+ID4gICAgICAgICAgKi8KPiA+ICAgICAgICAgdWJpX3JvX21vZGUo
dWJpKTsKPiA+ICAgICAgICAgcmV0dXJuIGVycjsKPiA+ICAgICB9Cj4gPiBTdXBwb3NlIHdoaWxl
IGVyYXN1cmUgaW4gcHJvZ3Jlc3MgJiBzb21lb25lIHByZXNzZWQgIkN0cmwrQyIgdGhlbiBVQkkK
PiA+IHN0cmFpZ2h0IHdheSBtYXJrcyBlbnRpcmUgZGV2aWNlIGFzIFJlYWQgb25seSAmIGl0cyBy
ZWFsbHkgcGFpbmZ1bAo+ID4gYmVjYXVzZSB0aGVuIHlvdSBjYW50IGV2ZW4gZGVsZXRlIHRoYXQg
dm9sdW1lIGFzIFVCSSBpcyByZWFkIG9ubHkuCj4gPiBXaGljaCBJIGd1ZXNzIGl0cyBub3QgZ29v
ZCB3YXkuIElmIHVzZSBjYXNlcyBhcmUgY29uc2lkZXJlZCBpdCBpcwo+ID4gaGlnaGx5IGxpa2Vs
eSB0aGF0IHVzZXIgY2FuIGhpdCAiQ3RybCtjIiAsIGxpa2UgaGUgd2FudCB0byBjYW5jZWwKPiA+
IGVyYXNlIGF0IHRoYXQgdGltZSBvciBzb21ldGhpbmcgbGlrZSB0aGF0LiBTbyB3ZSBjYW4gaGFu
ZGxlIC1FSU5UUgo+ID4gZGlmZmVyZW50bHkgYnkgZm9sbG93aW5nIHdheQo+Cj4gUGxlYXNlLCBm
ZWVsIGZyZWUgdG8gaWdub3JlIG15IHNpbGx5IHF1ZXN0aW9uIGFuZCBqdXN0IHNlbmQgdGhlCj4g
cGF0Y2ggOi0pCj4KPiAtLQo+IEJlc3QgcmVnYXJkcywKPiBBcnRlbSBCaXR5dXRza2l5ICjiydTA
w8vJyiDh0tSjzSkKPgo+CgoKLS0gCkkgZmVlbCBmcmVlIG5vdwo=
