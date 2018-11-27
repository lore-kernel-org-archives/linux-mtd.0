Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRbMa-0008ED-Do
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 11:17:10 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id DF10667A5BB
 for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2018 12:16:55 +0100 (CET)
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 1/9] ARM: dts: Reflect change of FSL QSPI driver and
 remove unused properties
Date: Tue, 27 Nov 2018 11:16:55 +0000
Message-ID: <dddc8370-1059-4565-5556-4baf91f7e432@kontron.de>
References: <1543314174-28580-1-git-send-email-frieder.schrempf@kontron.de>
 <1543314174-28580-2-git-send-email-frieder.schrempf@kontron.de>
 <20181127110134.7xdwo7ird44qj2ih@pengutronix.de>
In-Reply-To: <20181127110134.7xdwo7ird44qj2ih@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB831274B8AE834EA8AD39C358CBB02A@snt-world.com>
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

SGkgVXdlLA0KDQpPbiAyNy4xMS4xOCAxMjowMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+
IEhlbGxvLA0KPiANCj4gT24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMTA6MjQ6MTlBTSArMDAwMCwg
U2NocmVtcGYgRnJpZWRlciB3cm90ZToNCj4+IFRoZSBGU0wgUVNQSSBkcml2ZXIgd2lsbCBiZSBt
b3ZlZCB0byB0aGUgU1BJIGZyYW1ld29yayBhbmQgaXQgdGhlbg0KPj4gYWN0cyBhcyBhIFNQSSBj
b250cm9sbGVyLiBUaGVyZWZvcmUgdGhlIHN1Ym5vZGVzIG5lZWQgdG8gc2V0DQo+PiBzcGktW3J4
L3R4XS1idXMtd2lkdGggPSA8ND4sIHNvIHF1YWQgbW9kZSBpcyB1c2VkIGp1c3QgYXMgYmVmb3Jl
Lg0KPj4NCj4+IEFsc28gdGhlIHByb3BlcnRpZXMgJ2J1cy1udW0nLCAnZnNsLHNwaS1udW0tY2hp
cHNlbGVjdHMnIGFuZA0KPj4gJ2ZzbCxzcGktZmxhc2gtY2hpcHNlbGVjdHMnIHdlcmUgbmV2ZXIg
cmVhZCBieSB0aGUgZHJpdmVyIGFuZA0KPj4gY2FuIGJlIHJlbW92ZWQuDQo+Pg0KPj4gVGhlICdy
ZWcnIHByb3BlcnRpZXMgYXJlIGFkanVzdGVkIHRvIHJlZmxlY3Qgd2hhdCBidXMgYW5kDQo+PiBj
aGlwc2VsZWN0IHRoZSBmbGFzaCBpcyBjb25uZWN0ZWQgdG8sIGFzIHRoZSBuZXcgZHJpdmVyIG5l
ZWRzDQo+PiB0aGlzIGluZm9ybWF0aW9uLg0KPj4NCj4+IFRoZSBwcm9wZXJ0eSAnZnNsLHFzcGkt
aGFzLXNlY29uZC1jaGlwJyBpcyBub3QgbmVlZGVkIGFueW1vcmUNCj4+IGFuZCB3aWxsIGJlIHJl
bW92ZWQgYWZ0ZXIgdGhlIG9sZCBkcml2ZXIgd2FzIGRpc2FibGVkIHRvIGF2b2lkDQo+PiBicmVh
a2luZyBsczEwMjFhLW1veGEtdWMtODQxMGEuZHRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEZy
aWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4NCj4gDQo+IGRvIHdl
IG5lZWQgdG8gY2hhbmdlIHRoZSBiaW5kaW5nIGRvY3VtZW50IGFjY29yZGluZ2x5Pw0KDQpCaW5k
aW5ncyBhcmUgY2hhbmdlZCBoZXJlOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3BhdGNo
LzEwMDM3NjEvDQoNClRoYW5rcywNCkZyaWVkZXI=
