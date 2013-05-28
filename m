Received: from smtp6-v.fe.bosch.de ([2a03:cc00:ff0:100::2])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhJWh-000550-99
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 13:01:20 +0000
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 28 May 2013 15:00:52 +0200
Subject: RE: UBIFS failure & stable page writes
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DD7F@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
In-Reply-To: <1369732266.5446.117.camel@sauron.fi.intel.com>
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

Q291bGQgdGhlcmUgYmUgYSByZWxhdGlvbiBiZXR3ZWVuIHRoZSBpc3N1ZSBhbmQgdGhlIGZvbGxv
d2luZyBjb21taXRzIChmcmVlaW5nIG9mIG9ycGhhbnMvY25leHQ9TlVMTCk/Og0KDQpodHRwOi8v
Z2l0LmluZnJhZGVhZC5vcmcvdWJpZnMtMi42LmdpdC9jb21taXQvOGFmZDUwMGNiNTJhNWQwMGJh
YjQ1MjVkZDVhNTYwZDE5OWY5NzliOQ0KaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3ViaWZzLTIu
Ni5naXQvY29tbWl0LzI5MjhmMGQwYzVlYmQ2Yzk2MDVjMGQ5ODIwN2E0NDM3NjM4N2MyOTgNCg0K
DQpNZXQgdnJpZW5kZWxpamtlIGdyb2V0ZW4gfCBCZXN0IFJlZ2FyZHMsIA0KQW50b24gUHJpbnMN
Cg0KQm9zY2ggU2VjdXJpdHkgU3lzdGVtcyBCViwgDQpDb25mZXJlbmNlIFN5c3RlbXMgKFNULUNP
L0VORzEuMSkgDQpUb3JlbmFsbGVlIDQ5DQo1NjE3IEJBICBFaW5kaG92ZW4NClRoZSBOZXRoZXJs
YW5kcyANCnd3dy5ib3NjaHNlY3VyaXR5LmNvbSANClQuICszMSAoMCk0MCAyNTc3MDc3DQphbnRv
bi5wcmluc0BubC5ib3NjaC5jb20NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogQXJ0ZW0gQml0eXV0c2tpeSBbbWFpbHRvOmRlZGVraW5kMUBnbWFpbC5jb21dIA0KU2VudDog
ZGluc2RhZyAyOCBtZWkgMjAxMyAxMToxMQ0KVG86IFByaW5zIEFudG9uIChTVC1DTy9FTkcxLjEp
DQpDYzogSmFuIEthcmE7IEFkcmlhbiBIdW50ZXI7IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnDQpTdWJqZWN0OiBSZTogVUJJRlMgZmFpbHVyZSAmIHN0YWJsZSBwYWdlIHdyaXRlcw0KDQpP
biBUdWUsIDIwMTMtMDUtMjggYXQgMTA6MTggKzAyMDAsIFByaW5zIEFudG9uIChTVC1DTy9FTkcx
LjEpIHdyb3RlOg0KPiBDcmVhdGlvbiBpcyBvZiB0aGUgcHJvYmxlbSBpcyBub3QgdGhhdCBlYXN5
LCBidXQgb25jZSB5b3UgYm9vdCBhbmQgdGhpcyBoYXBwZW5zIGl0IGlzIHJlcHJvZHVjaWJsZSBl
dmVyeSBib290Lg0KPiBFdmVuIGlmIEkgY29weSB0aGUgaW1hZ2UgKG5hbmRkdW1wKSB0byBhbm90
aGVyIGRldmljZSB0aGUgZmFpbHVyZSBtb3ZlcyB3aXRoIHRoZSBpbWFnZS4NCg0KV2VsbCwgdGhl
IGxhdHRlciBpcyBsZXNzIGludGVyZXN0aW5nLg0KDQotLSANCkJlc3QgUmVnYXJkcywNCkFydGVt
IEJpdHl1dHNraXkNCg0K
