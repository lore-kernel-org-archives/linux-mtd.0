Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS1d0-0006ty-OD
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 15:19:52 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: Fix memory allocation in nanddev_bbt_init()
Date: Wed, 28 Nov 2018 15:19:37 +0000
Message-ID: <b7adc960-c81d-19c6-2122-cd6781b64a17@kontron.de>
References: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
 <20181128154104.577d5923@bbrezillon>
 <7634bb45-6167-31e8-e169-b5c9bf7e2fc5@kontron.de>
 <20181128160215.45e5162e@bbrezillon>
In-Reply-To: <20181128160215.45e5162e@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <964C622D6325BB4F83509DC02A69A437@snt-world.com>
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

T24gMjguMTEuMTggMTY6MDIsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gT24gV2VkLCAyOCBO
b3YgMjAxOCAxNDo1NTo0NSArMDAwMA0KPiBTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJl
bXBmQGtvbnRyb24uZGU+IHdyb3RlOg0KPiANCj4+IEhpIEJvcmlzLA0KPj4NCj4+IE9uIDI4LjEx
LjE4IDE1OjQxLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+Pj4gT24gVHVlLCAyNyBOb3YgMjAx
OCAwNzo0NDo1MiArMDAwMA0KPj4+IFNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZA
a29udHJvbi5kZT4gd3JvdGU6DQo+Pj4gICAgDQo+Pj4+IEZpeCB0aGUgc2l6ZSBvZiB0aGUgYnVm
ZmVyIGFsbG9jYXRlZCB0byBzdG9yZSB0aGUgaW4tbWVtb3J5IEJCVC4NCj4+Pj4gVGhpcyBidWcg
d2FzIHByZXZpb3VzbHkgaGlkZGVuIGJ5IGEgZGlmZmVyZW50IGJ1ZywgdGhhdCB3YXMgZml4ZWQg
aW4NCj4+Pj4gZDA5ODA5M2JhMDZlLg0KPj4+Pg0KPj4+PiBGaXhlczogOWMzNzM2YTNkZTIxICgi
bXRkOiBuYW5kOiBBZGQgY29yZSBpbmZyYXN0cnVjdHVyZSB0byBkZWFsIHdpdGggTkFORCBkZXZp
Y2VzIikNCj4+Pj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+DQo+Pj4N
Cj4+PiBMb29rcyBsaWtlIHlvdXIgRnJvbSBoZWFkZXIgZG9lcyBub3QgbWF0Y2ggdGhlIFNvQiB0
YWcNCj4+PiAoJ0ZyaWVkZXIgU2NocmVtcGYnIHZzICdTY2hyZW1wZiBGcmllZGVyJykgYW5kIGNo
ZWNrcGF0Y2ggZG9lcyBub3QgbGlrZQ0KPj4+IHRoYXQuIEknbGwgZml4IGl0IHdoZW4gYXBwbHlp
bmcsIGJ1dCBtYXliZSB5b3Ugc2hvdWxkIGZpeA0KPj4+IHlvdXIgLmdpdGNvbmZpZyB0byBtYWtl
IHRoZW0gbWF0Y2guDQo+Pg0KPj4gQWN0dWFsbHkgdGhlIEZyb20gaGVhZGVyIGluIG15IGxvY2Fs
IHBhdGNoIGlzIGNvcnJlY3QgKDxmaXJzdCBuYW1lPg0KPj4gPGxhc3QgbmFtZT4sIEZyaWVkZXIg
U2NocmVtcGYpIGFzIGl0IGNvbWVzIGZyb20gbXkgZ2l0IGNvbmZpZy4gQnV0IHNpbmNlDQo+PiBv
dXIgY29tcGFueSB3YXMgcmVuYW1lZCBhbmQgb3VyIG1haWwgc2VydmVycyB3ZXJlIHRyYW5zZmVy
cmVkLCBvdXINCj4+IGUtbWFpbHMgYXJlIHNlbnQgd2l0aCBGcm9tPTxsYXN0IG5hbWU+IDxmaXJz
dCBuYW1lPi4NCj4+DQo+PiBJdCBzZWVtcyBsaWtlIGdpdCBzZW5kLWVtYWlsIG9yIHBhdGNod29y
ayBvciB3aGF0ZXZlciB1c2VzIHRoZQ0KPj4gaW5mb3JtYXRpb24gZnJvbSB0aGUgZS1tYWlsIGhl
YWRlciBpbnN0ZWFkIG9mIHdoYXQgaXMgaW4gdGhlIHBhdGNoLg0KPj4NCj4+IEkgd2lsbCB0cnkg
dG8gcmFpc2UgdGhpcyBpc3N1ZSB3aXRoIG91ciBJVCBkZXBhcnRtZW50IGFzIHRoaXMgd291bGQg
YmUNCj4+IGJlc3QgZml4ZWQgb24gdGhlaXIgc2lkZS4NCj4gDQo+IFRoZXJlJ3MgYW5vdGhlciBz
b2x1dGlvbjogbWFrZSBnaXQgc2VuZC1lbWFpbCBhZGQgYSBGcm9tIGhlYWRlciBpbiB0aGUNCj4g
bWVzc2FnZSBib2R5Lg0KPiANCj4gZ2l0IGNvbmZpZyAtLWdsb2JhbCBzZW5kZW1haWwuZnJvbSAi
U2NocmVtcGYgRnJpZWRlciA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiINCg0KSSBkb24n
dCBnZXQgaXQuIEhvdyB3b3VsZCB0aGF0IGNoYW5nZSB0aGluZ3M/IE15IEZyb20gc3RpbGwgd291
bGRuJ3QgDQptYXRjaCBteSBTb0IgdGFncy4=
