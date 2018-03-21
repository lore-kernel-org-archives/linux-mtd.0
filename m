Received: from mail-sn1nam02on0080.outbound.protection.outlook.com
 ([104.47.36.80] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyRDj-0000ys-Di
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 00:03:13 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "joakim.tjernlund@transmode.se" <joakim.tjernlund@transmode.se>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/3] cfi_cmdset_0001: Workaround Micron Erase suspend bug.
Date: Wed, 21 Mar 2018 00:02:56 +0000
Message-ID: <1521590574.4790.268.camel@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
 <20180301133941.19660-3-joakim.tjernlund@infinera.com>
 <CAFLxGvx9ZC6P9iYtODnvGi=qnE1Z9zNtdbo6fRAFBSpdsLzV8g@mail.gmail.com>
In-Reply-To: <CAFLxGvx9ZC6P9iYtODnvGi=qnE1Z9zNtdbo6fRAFBSpdsLzV8g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0708C585EBA444EA509D54D692EFB53@namprd10.prod.outlook.com>
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

T24gV2VkLCAyMDE4LTAzLTIxIGF0IDAwOjA2ICswMTAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3Jv
dGU6DQo+IA0KPiBKb2FraW0sDQo+IA0KPiBPbiBUaHUsIE1hciAxLCAyMDE4IGF0IDI6MzkgUE0s
IEpvYWtpbSBUamVybmx1bmQNCj4gPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPiB3cm90
ZToNCj4gPiBGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5kQHRyYW5zbW9k
ZS5zZT4NCj4gPiANCj4gPiBTb21lIE1pY3JvbiBjaGlwcyBkb2VzIG5vdCB3b3JrIHdlbGwgd3J0
IEVyYXNlIHN1c3BlbmQgZm9yDQo+ID4gYm9vdCBibG9ja3MuIFRoaXMgYXZvaWRzIHRoZSBpc3N1
ZSBieSBub3QgYWxsb3dpbmcgRXJhc2Ugc3VzcGVuZA0KPiA+IGZvciB0aGUgYm9vdCBibG9ja3Mg
Zm9yIHRoZSAyOEYwMEFQMzAoMUdCaXQpIGNoaXAuDQo+IA0KPiBJcyB0aGlzIGJ1ZyBkb2N1bWVu
dGVkIHNvbWV3aGVyZT8NCg0KT25lIHdvdWxkIGhvcGUgYnV0IG5vLiBXZSBnb3QgY29uZmlybWF0
aW9uIG9mIHRoZSBwcm9ibGVtIGZyb20gdGhlIHN1cHBsaWVyIHRob3VnaA0KYnV0IG5vdGhpbmcg
d3JpdHRlbi4gDQoNCiBKb2NrZQ==
