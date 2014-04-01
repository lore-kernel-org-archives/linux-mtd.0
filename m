Received: from gw1.transmode.se ([195.58.98.146])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUu5B-0002gW-D2
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 08:30:10 +0000
In-Reply-To: <1396303460.4857.111.camel@mars>
References: <1396287151.4857.50.camel@mars>	
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
To: Christoph Fritz <chf.fritz@googlemail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAAA2@transmode.se>
Date: Tue, 1 Apr 2014 10:29:43 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Cc: linux-mtd@lists.infradead.org, Marius Achilles <M.Achilles@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Q2hyaXN0b3BoIEZyaXR6IDxjaGYuZnJpdHpAZ29vZ2xlbWFpbC5jb20+IHdyb3RlIG9uIDIwMTQv
MDQvMDEgMDA6MDQ6MjA6DQo+IA0KPiBPbiBNb24sIDIwMTQtMDMtMzEgYXQgMjI6MzEgKzAyMDAs
IEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gTm8gd2F5LCBkaXNhYmxpbmcgZXJhc2Ugc3Vz
cGVuZCB3aWxsIGNhdXNlIHNldmVyZSBsYXRlbmNpZXMgZm9yIA0KcmVhZC93cml0ZSANCj4gPiBv
cHMuDQo+IA0KPiBIZXJlIG9uIGEgbXgzNSBpdCdzIG5vdCByZWFsbHkgc2V2ZXJlLg0KDQpUaGVy
ZSBoYXMgYmVlbiBjb21wbGFpbnRzIGluIHRoZSBwYXN0IHdpdGggbm8gZXJhc2Ugc3VzcGVuZC4N
CllvdSBnZXQgZGVsYXlzIGNvbnNpZGVyaW5nIHRoYXQgYW4gZXJhc2UgdGFrZXMgYy5hIDEgc2Vr
IHNvDQpvbmNlIHlvdSBnZXQgaW50byBhIHN0YXRlIHdoZXJlIEdDIGlzIGVyYXNpbmcgbG90cyBv
ZiBibG9ja3MgYW5kIG90aGVyDQpwcm9ncyB3YW50cyByZWFkL3dyaXRlIHlvdSB3aWxsIG5vdGlj
ZS4NCg0KPiANCj4gPiBUaGUgZG9jdW1lbnQgbWVudGlvbnMgb3RoZXIgd2F5cyB0byBnZXQgYXJv
dW5kIHRoaXMgcHJvYmxlbSwgSSBzdWdnZXN0IA0KeW91IA0KPiA+IGV4cGxvcmUNCj4gPiB0aGVz
ZSBmaXJzdC4NCj4gDQo+IEFscmVhZHkgdHJpZWQgdGhlIOKAnDB4RkbigJ0gZHVtbXkgd3JpdGUg
Y3ljbGUgc3VnZ2VzdGlvbiwgc2hvdWxkIGhhdmUNCj4gbWVudGlvbmVkIHRoYXQuDQoNCk9LLCBi
dXQgb25lIG1vcmUgd29ya2Fyb3VuZCh0aGUgdWRlbGF5IHBhcnQpIGlzIHJlcXVpcmVkLCByaWdo
dD8NCg0KQWxzbywgdGhlIGRvYy4gaXMgd3JpdHRlbiBpbiAyMDExIGFuZCBvbmx5IG1lbnRpb25z
IHNvbWUgcmV2aXNpb25zIG9mIFAzeCANCmhhcyB0aGlzDQpwcm9ibGVtLiBBcmUgdGhlc2UgcHJv
YmxlbXMgc3RpbGwgcHJlc2VudCBpbiBjdXJyZW50IGZsYXNoIHBhcnRzPw0KDQo+IA0KPiA+IE1p
bnVzIGRlZ3JlZXMgaXMgbm90IGEgY29tbW9uIGVudmlyb25tZW50IGVpdGhlciBzbyBwZXJoYXBz
IGFueSBmaXggDQpzaG91bGQgDQo+ID4gYmUgc2VsZWN0YWJsZT8NCj4gDQo+IFRoZSBOT1IgaXMg
c3BlY2lmaWVkIGZvciBkb3duIHRvIC00MMKwQy4NCg0KVGhhdCBpcyBhIGxvdCBJIGd1ZXNzIGJ1
dCBub3QgZXZlcnlvbmUgcnVucyB0aGUgZXF1aXBtZW50IGF0IHRoZXNlIA0KdGVtcGVyYXR1cmVz
Lg0KDQo=
