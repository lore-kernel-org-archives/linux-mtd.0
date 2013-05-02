From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH V4 5/9] mtd: replace the hardcode with the onfi_feature()
Date: Thu, 2 May 2013 05:42:19 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9C09FC@DBDE04.ent.ti.com>
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
 <1366967337-5534-6-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9BF544@DBDE04.ent.ti.com>
 <5181CC19.8000904@freescale.com>
In-Reply-To: <5181CC19.8000904@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiA+PiAtCSpidXN3ID0gMDsNCj4gPj4gLQlpZiAobGUxNl90b19jcHUocC0+ZmVhdHVyZXMpJiAg
MSkNCj4gPj4gLQkJKmJ1c3cgPSBOQU5EX0JVU1dJRFRIXzE2Ow0KPiA+PiArDQo+ID4+ICsJKmJ1
c3cgPSAob25maV9mZWF0dXJlKGNoaXApJiAgT05GSV9GRUFUVVJFXzE2X0JJVF9CVVMpID8NCj4g
Pj4gKwkJCU5BTkRfQlVTV0lEVEhfMTYgOiAwOw0KPiA+IElzIHRoaXMgcmVhbGx5IG5lZWRlZCA/
IHlvdSBoYXZlIGFscmVhZHkgY2hlY2tlZCB0aGUgJ29uZmlfdmVyc2lvbicNCj4gYWJvdmUgaW4N
Cj4gPiBuYW5kX2ZsYXNoX2RldGVjdF9vbmZpKCkgLi4NCj4gPiAJaWYgKCFjaGlwLT5vbmZpX3Zl
cnNpb24pIHsNCj4gPiAJCXByX2luZm8oIiVzOiB1bnN1cHBvcnRlZCBPTkZJIHZlcnNpb246ICVk
XG4iLA0KPiBfX2Z1bmNfXywgdmFsKTsNCj4gPiAJCXJldHVybiAwOw0KPiA+IAl9DQo+ID4NCj4g
Pg0KPiBJIHRoaW5rIGNoZWNraW5nIHRoZSBvbmZpX3ZlcnNpb24gaGFzIG5vIHJlbGF0aW9uc2hp
cCB3aXRoIHRoaXMgcGF0Y2guIDopDQo+IFRoaXMgcGF0Y2ggaXMganVzdCByZXBsYWNlIHRoZSBo
YXJkY29kZSBmb3IgMTYtYml0IG9uZmkgbmFuZCBjaGVjay4NCj4NCg0KW1Bla29uXTogW1BhdGNo
IDMvOV06IGFkZCBhIGhlbHBlciB0byBnZXQgdGhlIHN1cHBvcnRlZCBmZWF0dXJlcw0KSSBtZWFu
LCBkbyB5b3UgcmVhbGx5IG5lZWQgdGhpcyBoZWxwZXIgZnVuY3Rpb24gPw0KK3N0YXRpYyBpbmxp
bmUgaW50IG9uZmlfZmVhdHVyZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQ0KK3sNCisgICAgICAg
cmV0dXJuIGNoaXAtPm9uZmlfdmVyc2lvbiA/IGxlMTZfdG9fY3B1KGNoaXAtPm9uZmlfcGFyYW1z
LmZlYXR1cmVzKSA6IDA7DQorIH0NCg0KRm9sbG93aW5nIGNoYW5nZSBzaG91bGQgaGF2ZSBiZWVu
IGVub3VnaC4uDQoqYnVzdyA9IChsZTE2X3RvX2NwdShwLT5mZWF0dXJlcykgJiAgT05GSV9GRUFU
VVJFXzE2X0JJVF9CVVMpID8NCgkJCU5BTkRfQlVTV0lEVEhfMTYgOiAwOw0KDQoNCndpdGggcmVn
YXJkcywgcGVrb24NCg==
