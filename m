Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhF76-0007JS-Kx
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 08:18:37 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 28 May 2013 10:18:07 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
In-Reply-To: <1369727042.5446.112.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Q3JlYXRpb24gaXMgb2YgdGhlIHByb2JsZW0gaXMgbm90IHRoYXQgZWFzeSwgYnV0IG9uY2UgeW91
IGJvb3QgYW5kIHRoaXMgaGFwcGVucyBpdCBpcyByZXByb2R1Y2libGUgZXZlcnkgYm9vdC4NCkV2
ZW4gaWYgSSBjb3B5IHRoZSBpbWFnZSAobmFuZGR1bXApIHRvIGFub3RoZXIgZGV2aWNlIHRoZSBm
YWlsdXJlIG1vdmVzIHdpdGggdGhlIGltYWdlLg0KDQpNZXQgdnJpZW5kZWxpamtlIGdyb2V0ZW4g
fCBCZXN0IFJlZ2FyZHMsIA0KQW50b24gUHJpbnMNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEFydGVtIEJpdHl1dHNraXkgW21haWx0bzpkZWRla2luZDFAZ21haWwuY29tXSAN
ClNlbnQ6IGRpbnNkYWcgMjggbWVpIDIwMTMgOTo0NA0KVG86IFByaW5zIEFudG9uIChTVC1DTy9F
TkcxLjEpDQpDYzogSmFuIEthcmE7IEFkcmlhbiBIdW50ZXI7IGxpbnV4LW10ZEBsaXN0cy5pbmZy
YWRlYWQub3JnDQpTdWJqZWN0OiBSZTogVUJJRlMgZmFpbHVyZSAmIHN0YWJsZSBwYWdlIHdyaXRl
cw0KDQpPbiBUdWUsIDIwMTMtMDUtMjggYXQgMDk6MDcgKzAyMDAsIFByaW5zIEFudG9uIChTVC1D
Ty9FTkcxLjEpIHdyb3RlOg0KPiBXZSB1c2UgYSBiYWNrcG9ydCBvZiBVQklGUy0yLjYgKGp1bmUg
MjAxMiksIGFuZCBjaGVja2VkIGZvciBpbXBvcnRhbnQgZml4ZXMgaW4gdGhpcyBhcmVhLg0KPiAN
Cj4gSXMgdGhlcmUgYSB3YXkgdG8gY2hlY2svZmluZCBpZiBhICdyb290LW5vZGUnIGlzIGxvYWQg
ZnJvbSBmbGFzaCAoZS5nLiBkdXJpbmcgcmVjb3ZlcnkpPw0KPiANCj4gRG9lcyByZWNvdmVyeSBu
ZWVkIHRoZSAncm9vdC1ub2RlJz8NCg0KSSB0aGluayB5b3VyIGVycm9yIHdhcyBhYm91dCB0aGUg
cm9vdCBpbm9kZToNCg0KInViaWZzX2lnZXQ6IGZhaWxlZCB0byByZWFkIGlub2RlIDEsIGVycm9y
IC0yIg0KDQp3aGljaCBpcyB0aGUgaW5vZGUgb2YgdGhlIHJvb3QgZGlyZWN0b3J5LiBKdXN0IGxp
a2UgZXZlcnl0aGluZyBlbHNlLCBpdA0KaXMgc3RvcmVkIGluIHRoZSBpbmRleCB0cmVlLg0KDQpP
ZiBjb3Vyc2UgdGhlIHJvb3QgaW5vZGUgaXMgcmVxdWlyZWQgdG8gYWNjZXNzIHRoZSBmaWxlLXN5
c3RlbS4gRm9yIHNvbWUNCnJlYXNvbiBpdCBjYW5ub3QgYmUgZm91bmQuIFByb2JhYmx5IGlmIHlv
dSBlbmFibGUgYWxsIGRlYnVnIG1lc3NhZ2VzIC0NCml0IG1heSBiZSB1c2VmdWwuDQoNCklzIHRo
aXMgcHJvYmxlbSByZXByb2R1Y2libGU/DQoNCi0tIA0KQmVzdCBSZWdhcmRzLA0KQXJ0ZW0gQml0
eXV0c2tpeQ0KDQo=
