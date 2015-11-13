Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxBGb-0004FF-5G
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 10:07:38 +0000
From: Marcus Prebble <marcus.prebble@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: Marcus Prebble <prebble@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>,
 Richard Weinberger <richard@nod.at>
Date: Fri, 13 Nov 2015 11:07:12 +0100
Subject: Re: [PATCH] mtd-utils: lib: mtd_read: Take the buffer offset into
 account when reading
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B65B@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7B9E316CFDF@xmail3.se.axis.com>
 <20151112190924.GD8456@google.com>
In-Reply-To: <20151112190924.GD8456@google.com>
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

SGkgQnJpYW4sCgpUaGFua3MgZm9yIGxvb2tpbmcgYXQgdGhlIHBhdGNoIQoKCk9uIFRodSwgMjAx
NS0xMS0xMiBhdCAxMTowOSAtMDgwMCwgQnJpYW4gTm9ycmlzIHdyb3RlOgo+IEhpIE1hcmN1cywK
PiAKPiBPbiBUdWUsIE9jdCAwNiwgMjAxNSBhdCAwMjoxMzoyM1BNICswMjAwLCBNYXJjdXMgUHJl
YmJsZSB3cm90ZToKPiA+IEhpIG10ZC1saXN0LAoKPiAuLi50aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbiB3aWxsIG92ZXJ3cml0ZSB0aGUgZGF0YSBhbHJlYWR5Cj4gPiByZWFkIGluIGJ1ZiB3aGlj
aCBkb2Vzbid0IHNlZW0gY29ycmVjdC4KPiAKPiBJbiBhZGRpdGlvbiwgdGhpcyBtZWFucyB3ZSBt
aWdodCBub3QgYWN0dWFsbHkgZmlsbCB1cCB0aGUgZW50aXJlIGJ1ZmZlciwKPiBzaW5jZSAyIG9y
IG1vcmUgc2hvcnQgcmVhZCgpJ3MgbWlnaHQgZ2V0IHVzIHRvIGV4aXQgdGhlIGxvb3Agd2l0aCBh
Cj4gY3VtdWxhdGl2ZSB2YWx1ZSBpbiAncmQnLCBidXQgb25seSBhIHBhcnRpYWxseS1maWxsZWQg
YnVmZmVyLiBUaGF0IGNvdWxkCj4gY2F1c2UgYSB1c2VyIHRvIHRyeSBhbmQgaGFuZGxlIGdhcmJh
Z2UvdW5pbml0aWFsaXplZCBkYXRhLgoKWWVzLCB0aGF0IGlzIGRlZmluaXRlbHkgcG9zc2libGUg
YW5kIG5vdCBuaWNlIGZvciB0aGUgdXNlci4KCj4gUGF0Y2ggbG9va3MgT0suIERpZCB5b3UgdGVz
dCBpdD8gSGF2ZSB5b3Ugc2VlbiBNVEQgZHJpdmVycyB0aGF0IHdpbGwKPiByZXR1cm4gc2hvcnQg
cmVhZHM/CgpJIG9ubHkgbm90aWNlZCBpbiBwYXNzaW5nLCBub3QgYmVjYXVzZSBJIHdhcyBoaXQg
YnkgdGhlIGVycm9yLiBJIHNtb2tlCnRlc3RlZCBpdCwgYnV0IGRpZCBub3QgaGFjayBhIGRyaXZl
ciB0byByZXR1cm4gbGVzcyB0aGFuIGxlbi4KSWYgSSBoYWQgdG8gZ3Vlc3MsIEkgd291bGQgc2F5
IHRoYXQgaW4gbmVhcmx5IGFsbCBjYXNlcyB0aGUgZHJpdmVycyBkbwpub3QgcmV0dXJuIHNob3J0
IHJlYWRzIG90aGVyd2lzZSB0aGlzIHdvdWxkIHByb2JhYmx5IGhhdmUgYmVlbiBwaWNrZWQgdXAK
Ynkgbm93LiAKCj4gCj4gQnJpYW4KCg==
