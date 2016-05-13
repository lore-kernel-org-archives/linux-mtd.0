Received: from mail-am1on0142.outbound.protection.outlook.com
 ([157.56.112.142] helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1FZH-0005uA-0A
 for linux-mtd@lists.infradead.org; Fri, 13 May 2016 16:03:59 +0000
From: "CN, Aananth (A.A.)" <caananth@visteon.com>
To: Richard Weinberger <richard@nod.at>
CC: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>, "Gunasundar,
 Balamanikandan (B.)" <bgunasun@visteon.com>, "Babu, Viswanathan (V.)"
 <vbabu3@visteon.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
Date: Fri, 13 May 2016 16:03:33 +0000
Message-ID: <6063F630-A01C-4965-916E-9805E59A8744@visteon.com>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
 <5732F9C7.6020206@nod.at> <20160511112630.GB22640@visteon-gnana>
 <573345F4.9070203@nod.at> <57348554.6010805@nod.at>
 <20160513095004.GA6195@visteon-gnana>,<5735DC82.2010309@nod.at>
In-Reply-To: <5735DC82.2010309@nod.at>
Content-Language: ta-IN
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

SGkgUmljaGFyZCwNCg0KWWVzLCBpdCBpcyB0aGUgc2FtZSBiYWQga2V5IHR5cGUgNS4NCg0KQWRk
aXRpb25hbCBoaW50IGlzLCB0aGUgbG9nIHJlcG9ydGVkICJ1bmNsZWFuIHNodXRkb3duIiBoYXBw
ZW5lZC4gU28sIGlzIGEgcmVzZXQgaGFwcGVuZWQgZHVyaW5nIGNvbW1pdCBvcGVyYXRpb24/DQoN
ClJlZ2FyZHMsDQpBYW5hbnRoIA0KDQpTZW50IGZyb20gbXkgbW9iaWxlIHBob25lDQoNCj4gT24g
MTMg4K6u4K+HLCAyMDE2LCBhdCA3OjI0IOCuquCuv+CuseCvjeCuquCuleCusuCvjSwgUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6DQo+IA0KPj4gQW0gMTMuMDUuMjAx
NiB1bSAxMTo0MCBzY2hyaWViIERIQU5BUEFMLCBHTkFOQUNIQU5EUkFOIChHLik6DQo+PiBSaWNo
YXJkLA0KPj4gDQo+PiBJIGJlbGlldmUgQ1JDIHZhbHVlIGZvciBhIG5vZGUgIGlzIGNhbGN1bGF0
ZWQgaW4gUkFNIGJlZm9yZSB3cml0aW5nIHRoZSBub2RlIGluIE5BTkQuIA0KPj4gSW4gdGhpcyBj
YXNlLCBub2RlIENSQyBhbmQgY2FsY3VsYXRlZCBDUkMgYXJlIG1hdGNoaW5nLiBzbyBXaWxsIHRo
ZXJlIGJlIHBvc3NpYmlsaXR5IA0KPj4gZm9yIGNvcnJ1cHRpbmcga2V5IHR5cGUgYXJlYSAoMzIg
Yml0cykgYW5kIGtlZXBpbmcgb3RoZXJzIGludGFjdGVkLiBvciBhbnkgb3RoZXIgDQo+PiBwb3Nz
aWJpbGl0eSBmb3Igbm9kZSBnZXR0aW5nIGNvcnJ1cHRlZC4NCj4gDQo+IEkgaGF2ZSB0byBjb3Jy
ZWN0IG15c2VsZiwgdGhlIGJyYW5jaGVzIG9mIGFuIGluZGV4IG5vZGUgYXJlIGNvdmVyZWQgYnkN
Cj4gdGhlIG5vZGUgaGVhZGVyIENSQy4NCj4gVGhpcyBtYWtlcyB0aGUgd2hvbGUgcGljdHVyZSBt
b3JlIHN0cmFuZ2UuDQo+IA0KPiBZb3Ugc2FpZCB5b3UncmUgZmFjaW5nIHRoZSBzYW1lIGlzc3Vl
IG9uIGFub3RoZXIgdW5pdC4NCj4gSXMgdGhlIGNvcnJ1cHRpb24gcmVhbGx5IHRoZSBzYW1lPyBC
YWQga2V5IHR5cGUgNT8NCj4gDQo+IFRoYW5rcywNCj4gLy9yaWNoYXJkDQo=
