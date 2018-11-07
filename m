Received: from alln-iport-1.cisco.com ([173.37.142.88])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKCLo-0004lX-8L
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 01:09:46 +0000
From: "Nikunj Kela (nkela)" <nkela@cisco.com>
To: Richard Weinberger <richard@nod.at>, "Daniel Walker (danielwa)"
 <danielwa@cisco.com>
CC: Richard Weinberger <richard.weinberger@gmail.com>, Al Viro
 <viro@zeniv.linux.org.uk>, "xe-linux-external(mailer list)"
 <xe-linux-external@cisco.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rod Whitby
 <rod@whitby.id.au>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Make JFFS2 endianness configurable
Date: Wed, 7 Nov 2018 01:09:29 +0000
Message-ID: <08C13A64-E842-4E4D-AD04-31C09DFD1108@cisco.com>
References: <20181101225603.17806-1-nkela@cisco.com>
 <CAFLxGvy-0-A1Ta1vf=o4q0tcJAdr+uv9eQc7UrnwqF9NkJiWUw@mail.gmail.com>
 <20181102211444.nqqqbd4w5diyqrfw@zorba> <2265901.Da3O5o3T4q@blindfold>
In-Reply-To: <2265901.Da3O5o3T4q@blindfold>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9145249FEF7EAF4D94F128212B92B15F@emea.cisco.com>
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

VGhhbmtzIGZvciBpbnB1dC4gSSBoYXZlIHBvc3RlZCBhbm90aGVyIHBhdGNoIHdpdGggbW91bnQg
b3B0aW9uOg0KDQpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbXRk
LzIwMTgtTm92ZW1iZXIvMDg1MjUyLmh0bWwNCg0KDQpPbiAxMS8yLzE4LCAyOjIzIFBNLCAiUmlj
aGFyZCBXZWluYmVyZ2VyIiA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOg0KDQogICAgQW0gRnJlaXRh
ZywgMi4gTm92ZW1iZXIgMjAxOCwgMjI6MTQ6NDQgQ0VUIHNjaHJpZWIgRGFuaWVsIFdhbGtlcjoN
CiAgICA+ID4gTWFrZSBpdCBhIG1vdW50IG9wdGlvbiBhbmQgc3RvcmUgdGhlIGVuZGlhbm5lc3Mg
bW9kZSBpbiB0aGUgc3VwZXIgYmxvY2suDQogICAgPiANCiAgICA+IEl0J3MgYWN0dWFsbHkgYSBt
a2ZzIG9wdGlvbiBjdXJyZW50bHkuIEknbSBub3Qgc3VyZSBob3cgdGhhdCBmYWN0b3JzIGluLA0K
ICAgID4gDQogICAgPiBmcm9tIHRoZSBta2ZzLmpmZnMyIG1hbiBwYWdlLA0KICAgID4gDQogICAg
PiAgICAgICAgLWwsIC0tbGl0dGxlLWVuZGlhbg0KICAgID4gICAgICAgICAgICAgICBDcmVhdGUg
YSBsaXR0bGUtZW5kaWFuIEpGRlMyIGltYWdlLiAgRGVmYXVsdCBpcyB0byBtYWtlIGFuIGltYWdl
IHdpdGggdGhlIHNhbWUgZW5kaWFubmVzcyBhcyB0aGUgaG9zdC4NCiAgICA+IA0KICAgID4gICAg
ICAgIC1iLCAtLWJpZy1lbmRpYW4NCiAgICA+ICAgICAgICAgICAgICAgQ3JlYXRlIGEgYmlnLWVu
ZGlhbiBKRkZTMiBpbWFnZS4gIERlZmF1bHQgaXMgdG8gbWFrZSBhbiBpbWFnZSB3aXRoIHRoZSBz
YW1lIGVuZGlhbm5lc3MgYXMgdGhlIGhvc3QuDQogICAgDQogICAgQXMgbG9uZyB0aGlzIHNldHRp
bmcgaXMgbm90IHN0b3JlZCBpbiB0aGUgZmlsZXN5c3RlbSBpdHNlbGYsIGl0IGlzIHVzZWxlc3Mu
DQogICAgSUlSQyBpdCBqdXN0IGNvbnRyb2xzIHRoZSBlbmRpYW5uZXNzIHNldHRpbmcgZm9yIG1r
ZnMuamZmczIncw0KICAgIHQzMigpIGFuZCB0MTYoKSBtYWNyb3MuDQogICAgDQogICAgVGhhdCdz
IHdoeSBJIHRoaW5rIG9mIGEgbW91bnQgb3B0aW9uIGxpa2UgImZvcmNlX2VuZGlhbj0iLg0KICAg
IA0KICAgIFRoYW5rcywNCiAgICAvL3JpY2hhcmQNCiAgICANCiAgICANCiAgICANCg0K
