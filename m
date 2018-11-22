From: <Tudor.Ambarus@microchip.com>
To: <eugeniy.paltsev@synopsys.com>
CC: <boris.brezillon@bootlin.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <alexey.brodkin@synopsys.com>,
 <vineet.gupta1@synopsys.com>, <linux-snps-arc@lists.infradead.org>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>, <richard@nod.at>
Subject: Re: [PATCH v2 0/2] MTD: spi-nor: add support for sst26wf016,
 sst26wf032
Date: Thu, 22 Nov 2018 17:45:39 +0000
Message-ID: <60792e70-a530-3403-f144-c430639d01f1@microchip.com>
References: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
 <1540216028.19916.6.camel@synopsys.com> <20181022155635.2175a595@bbrezillon>
 <1542641133.4940.5.camel@synopsys.com>
In-Reply-To: <1542641133.4940.5.camel@synopsys.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E61F74ACCEFC2941A03A5B31B46D195C@namprd11.prod.outlook.com>
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

SGksIEV1Z2VuaXksDQoNClRoaXMgaXMganVzdCB0byBsZXQgeW91IGtub3cgdGhhdCBJJ20gZ2V0
dGluZyBmYW1pbGlhciB3aXRoIHRoZSBpbmRpdmlkdWFsIGJsb2NrDQpsb2NrIHN1cHBvcnQuIFlv
dSdsbCBoYXZlIG15IHJldmlldyBpbiB0aGUgZmlyc3QgcGFydCBvZiBuZXh0IHdlZWsuDQoNClRo
YW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSwNCnRhDQoNCk9uIDExLzE5LzIwMTggMDU6MjUgUE0s
IEV1Z2VuaXkgUGFsdHNldiB3cm90ZToNCj4gSGkgQm9yaXMsDQo+IA0KPiBBcyA0LjIwLXJjMSBp
cyBhbHJlYWR5IG91dCBJIGd1ZXNzIHlvdSBjYW4gcGljayB0aGlzIHBhdGNoZXMgdG8gc3BpLW5v
ci9uZXh0Pw0KPiANCj4gVGhhbmtzLg0KPiANCj4gT24gTW9uLCAyMDE4LTEwLTIyIGF0IDE1OjU2
ICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+PiArVHVkb3INCj4+DQo+PiBIaSBFdWdl
bml5LA0KPj4NCj4+IFNvcnJ5LCBpdCdzIGFscmVhZHkgdG9vIGxhdGUgZm9yIDQuMjAsIGFuZCBJ
IHdvbid0IGFwcGx5IHBhdGNoZXMgdG8gdGhlDQo+PiBzcGktbm9yL25leHQgYnJhbmNoIGJlZm9y
ZSA0LjIwLXJjMSBpcyBvdXQuDQo+Pg0KPj4gVHVkb3IsIE1hcmVrLCBjYW4gSSBoYXZlIGEgUmV2
aWV3ZWQtYnkvQWNrZWQtYnkgb24gdGhpcyBwYXRjaHNldD8NCj4+DQo+PiBUaGFua3MsDQo+Pg0K
Pj4gQm9yaXMNCj4+DQo+Pj4NCj4+PiBPbiBNb24sIDIwMTgtMDktMTAgYXQgMTQ6NDYgKzAzMDAs
IEV1Z2VuaXkgUGFsdHNldiB3cm90ZToNCj4+Pj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBTU1Qgc3N0
MjZ3ZjAxNiBhbmQgc3N0MjZ3ZjAzMiBmbGFzaCBJQzoNCj4+Pj4NCj4+Pj4gc3N0MjZ3ZioqKiBm
bGFzaCBzZXJpZXMgYmxvY2sgcHJvdGVjdGlvbiBpbXBsZW1lbnRhdGlvbiBkaWZmZXJzIGZyb20g
b3RoZXINCj4+Pj4gU1NUIHNlcmllcywgc28gd2UgYWRkIGltcGxlbWVudGF0aW9uIGZvciBzc3Qy
NndmKioqIGxvY2svdW5sb2NrL2lzX2xvY2tlZA0KPj4+PiBmdW5jdGlvbnMuDQo+Pj4+DQo+Pj4+
IEFkZCBzc3QyNndmMDE2IGFuZCBzc3QyNndmMDMyIGZsYXNoIElDIGluZm8gdG8gc3BpX2ZsYXNo
X2lkcyBsaXN0Lg0KPj4+Pg0KPj4+PiBFdWdlbml5IFBhbHRzZXYgKDIpOg0KPj4+PiAgIG10ZDog
c3BpLW5vcjogQWRkIHN1cHBvcnQgb2Ygc3N0MjZ3ZiogZmxhc2ggSUNzIHByb3RlY3Rpb24gb3Bz
DQo+Pj4+ICAgbXRkOiBzcGktbm9yOiBhZGQgc3VwcG9ydCBmb3Igc3N0MjZ3ZjAxNiwgc3N0MjZ3
ZjAzMg0KPj4+Pg0KPj4+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAxNzkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICBpbmNsdWRlL2xp
bnV4L210ZC9zcGktbm9yLmggICB8ICAgNCArDQo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE4MyBp
bnNlcnRpb25zKCspDQo+Pj4+ICAgDQo+Pg0KPj4NCg==
