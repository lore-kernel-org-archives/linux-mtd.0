Received: from mail-cys01nam02on0085.outbound.protection.outlook.com
 ([104.47.37.85] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQVTd-0003yT-4u
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 10:15:39 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: cfi_cmdset_0002: Avoid point less
 unlocking/locking
Date: Wed, 6 Jun 2018 10:15:22 +0000
Message-ID: <ddda35a7de31c272a8006b4f1ccfcc07730faf70.camel@infinera.com>
References: <20180605140710.8624-1-joakim.tjernlund@infinera.com>
 <20180605140710.8624-2-joakim.tjernlund@infinera.com>
 <20180605171443.29365913@bbrezillon>
 <6b6a8a0d50c00eb2067b019b893a2239e4c4c135.camel@infinera.com>
In-Reply-To: <6b6a8a0d50c00eb2067b019b893a2239e4c4c135.camel@infinera.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5ED8EEA9F0175A42BD13BA45114F3AA4@namprd10.prod.outlook.com>
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

T24gVHVlLCAyMDE4LTA2LTA1IGF0IDE4OjU3ICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBUdWUsIDIwMTgtMDYtMDUgYXQgMTc6MTQgKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3
cm90ZToNCj4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9m
IHRoZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCj4gPiANCj4gPiANCj4gPiBPbiBUdWUsICA1IEp1biAyMDE4IDE2OjA3OjEwICswMjAw
DQo+ID4gSm9ha2ltIFRqZXJubHVuZCA8am9ha2ltLnRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdy
b3RlOg0KPiA+IA0KPiA+ID4gY2ZpX3BwYl91bmxvY2soKSB3YWxrcyBhbGwgZmxhc2ggY2hpcHMg
d2hlbiB1bmxvY2tpbmcgc2VjdG9ycy4NCj4gPiA+IFRoaXMgaXMgYSB3YXN0ZSB3aGVuIGNyb3Nz
aW5nIGNoaXAgYm91bmRhcmlzIHVuYWZmZWN0ZWQNCj4gPiANCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4gYm91bmRhcmllcy4NCj4gPiANCj4gPiA+IGJ5IHRoZSB1
bmxvY2sgb3BlcmF0aW9uLg0KPiA+IA0KPiA+IEFGQUlDVCB0aGVyZSBhcmUgMiB1bnJlbGF0ZWQg
Y2hhbmdlcyBpbiB0aGlzIGNvbW1pdDoNCj4gPiAxLyBGaXggdGhlIGJvdW5kYXJ5IGNoZWNrIHdo
aWNoIGlzIGJyb2tlbiBpZiB0aGUgdW5sb2NrIG9wZXJhdGlvbg0KPiA+ICAgIGNyb3NzZXMgYSBj
aGlwIGJvdW5kYXJ5IChhZHIgaXMgcmVzZXQgdG8gMCB3aGVuIHRoYXQgaGFwcGVucykuDQo+IA0K
PiBub3QgYnJva2VuLCB0aGUgZHJpdmVyIHdpbGwganVzdCByZWxvY2sgdGhlIHNhbWUgc2VjdG9y
IG5lZWRsZXNzbHkuDQo+IEkgZGlkIG5vdCBub3RpY2UgYW55dGhpbmcgYnJlYWtpbmcgd2hlbiB0
aGF0IGhhcHBlbmVkLg0KPiBUaGVzZSB0d28gY2hhbmdlcyBvcHRpbWl6ZXMgdGhlIHVubG9jayBv
cGVyYXRpb24uDQo+IFN0aWxsIG5lZWQgdHdvIGNvbW1pdHM/DQoNCkkganVzdCBhc3N1bWVkIHlv
dSBkaWQgYW5kIHJlc2V0IGJvdGggcGF0Y2hlcyBzcGxpdCB1cCBpbnRvIDQuDQoNCiBKb2NrZQ==
