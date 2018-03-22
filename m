Received: from mail-by2nam01on060e.outbound.protection.outlook.com
 ([2a01:111:f400:fe42::60e]
 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ez1Bu-0001Zu-Ms
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 14:27:44 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 3/3] cfi_cmdset_0002: Do not allow read/write to suspend
 erase block.
Date: Thu, 22 Mar 2018 14:27:29 +0000
Message-ID: <1521728847.4790.327.camel@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <20180301133941.19660-4-joakim.tjernlund@infinera.com>
 <CAFLxGvxc1=uZjtW-MixRa5FJQmBnnuK4fKvaFsTCnoEa17OCqQ@mail.gmail.com>
In-Reply-To: <CAFLxGvxc1=uZjtW-MixRa5FJQmBnnuK4fKvaFsTCnoEa17OCqQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF02C50415AA924F96F0161861444CEE@namprd10.prod.outlook.com>
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

T24gVGh1LCAyMDE4LTAzLTIyIGF0IDE1OjIxICswMTAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3Jv
dGU6DQo+IA0KPiBKb2FraW0sDQo+IA0KPiBPbiBUaHUsIE1hciAxLCAyMDE4IGF0IDI6MzkgUE0s
IEpvYWtpbSBUamVybmx1bmQNCj4gPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPiB3cm90
ZToNCj4gPiBDdXJyZW50bHkgaXQgaXMgcG9zc2libGUgdG8gcmVhZCBhbmQvb3Igd3JpdGUgdG8g
c3VzcGVuZCBFQidzLg0KPiA+IFdyaXRpbmcgL2Rldi9tdGRYIG9yIC9kZXYvbXRkYmxvY2tYIGZy
b20gc2V2ZXJhbCBwcm9jZXNzZXMgbWF5DQo+ID4gYnJlYWsgdGhlIGZsYXNoIHN0YXRlIG1hY2hp
bmUuDQo+ID4gDQo+ID4gVGFrZW4gZnJvbSBjZmlfY21kc2V0XzAwMDEgZHJpdmVyLg0KPiANCj4g
RG9lcyBjZmlfY21kc2V0XzAwMjAgYWxzbyBuZWVkIGZpeGluZz8NCg0KRHVubm8sIGJ1dCBteSBn
dWVzcyBpcyB5ZXMuDQoNCiBKb2NrZQ==
