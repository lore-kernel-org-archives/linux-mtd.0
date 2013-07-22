Received: from smtp2.lantiq.com ([195.219.66.201])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1EC5-00060h-LJ
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 11:22:23 +0000
From: <thomas.langer@lantiq.com>
To: <b32955@freescale.com>, <pekon@ti.com>
Subject: RE: support DUAL and QUAD[patch v1]
Date: Mon, 22 Jul 2013 11:21:58 +0000
Message-ID: <593AEF6C47F46446852B067021A273D6D97E2ED4@MUCSE039.lantiq.com>
References: <CAHSAbzP0Nc1ahf_ra6yDuMvV998_+EGcUOGDv5ifKaagYf+NOg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
 <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E851E@DBDE04.ent.ti.com>
 <593AEF6C47F46446852B067021A273D6D93B49E1@MUCSE039.lantiq.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E85D0@DBDE04.ent.ti.com>
 <CAHSAbzP5jqHwCm0qhu=DiNzpP0swqWHsQ0=MnF+EKaSN22E5hg@mail.gmail.com>
 <CA+7tXihoZZhpoyvxj58c+Zi-Zy631kK5s-kDoSxPKq=ej0qyvA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E967D@DBDE04.ent.ti.com>
 <20130722093342.GJ9858@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73E9EC9B1@DBDE04.ent.ti.com>
 <51ED0A57.4060105@freescale.com>
In-Reply-To: <51ED0A57.4060105@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: broonie@kernel.org, linux-mtd@lists.infradead.org,
 spi-devel-general@lists.sourceforge.net, sourav.poddar@ti.com,
 tpiepho@gmail.com, wangyuhang2014@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGVsbG8gSHVhbmcsDQoNCkh1YW5nIFNoaWppZSB3cm90ZSBvbsKgMjAxMy0wNy0yMjoNCj4g5LqO
IDIwMTPlubQwN+aciDIy5pelIDE3OjU2LCBHdXB0YSwgUGVrb24g5YaZ6YGTOg0KPj4gKGIpIHN0
cnVjdCBzcGlfdHJhbnNmZXI6IGlmIGVhY2ggdHJhbnNmZXIgb2Ygc2FtZSBtZXNzYWdlIG5lZWQg
dG8gYmUNCj4+IHRyYW5zZmVycmVkIGF0IGRpZmZlcmVudCB3aWR0aC4gCUV4YW1wbGU6IENvbW1h
bmQgQCBTaW5nbGUtU1BJDQo+PiAgIGZvbGxvd2VkIGJ5IERhdGEgQCBRdWFkLVNQSQ0KPiBJIGFt
IGNvZGluZyB0aGUgUXVhZFNwaSBkcml2ZXIgZm9yIEZyZWVzY2FsZSdzIFZ5YnJpZCBub3cuDQo+
IA0KPiBJIHRoaW5rIHdlIGRvdCBuZWVkIHRvIGNoYW5nZSB0aGUgc3BpIGNvZGUuIHRoZSBzcGkg
bGF5ZXIgc2hvdWxkIG5vdA0KPiBrbm93IHRoZSBkaWZmZXJlbnQgd2lkdGggb2YgdGhlIGNvbW1h
bmQgYW5kIHRoZSBkYXRhLCBsZXQgdGhlIHFzcGkNCj4gZHJpdmVyIGRvZXMgaXQuDQpOTyENCj4g
DQo+IEluIHRoZSBtMjVwX3Byb2JlKCksIGFmdGVyIHdlIGtub3dzIHRoYXQgdGhlIHFzcGkgZHJp
dmVyIGFuZCBmbGFzaA0KPiBzdXBwb3J0IHRoZSBRdWFkIHJlYWQsIHNvIHdlIGNhbiBzZXQgdGhl
DQo+IG0yNXAtPnJlYWRfb3Bjb2RlIHRvIDB4ZWIgb3IgMHhlYy4gSW4gdGhlIHFzcGkgZHJpdmVy
LCBpdCBjYW4gZG8gdGhlDQo+IHJlYWwgam9iLg0KTm8sIHRoZSBxc3BpIGRyaXZlciAoYXMgZXhh
bXBsZSBoZXJlKSBzaG91bGQgcHJvdmlkZSBhIHRyYW5zcGFyZW50IGludGVyZmFjZSBvbmx5LA0K
YW5kIHRoZSBtcDI1cDgwIGRyaXZlciwgd2hpY2gga25vd3MgdGhlIGRldGFpbHMgb2YgdGhlIGZs
YXNoLCBoYXMgdG8gcHJvdmlkZSB0aGUgaW5mb3JtYXRpb24NCndoaWNoIHBhcnRzIG9mIGEgdHJh
bnNmZXIgaGFzIHRvIGJlIGRvbmUgaW4gc2luZ2xlLS9kdWFsLSBvciBxdWFkLW1vZGUuDQpPdGhl
cndpc2UgeW91IGFsd2F5cyBuZWVkIHRvIGV4dGVuZCB0aGUgcXNwaSBkcml2ZXIgZm9yIG5ldyBm
bGFzaGVzLg0KDQo+IA0KPiB0aGFua3MNCj4gSHVhbmcgU2hpamllDQo+IA0KQmVzdCBSZWdhcmRz
LA0KVGhvbWFzDQoNCg==
