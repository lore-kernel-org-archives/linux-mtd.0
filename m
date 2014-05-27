Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpAgn-0003VR-7W
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 06:16:46 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ted Juan <ted.juan@gmail.com>
Subject: RE: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop
 error
Date: Tue, 27 May 2014 06:16:18 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAEA280@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EAD825F@DBDE04.ent.ti.com>
 <1400813650-7417-1-git-send-email-ted.juan@gmail.com>
 <CAE94FHEEpdyO-4nk-CVvSh6agECKsMibxSzgS=U_8osdVav5Rg@mail.gmail.com>
In-Reply-To: <CAE94FHEEpdyO-4nk-CVvSh6agECKsMibxSzgS=U_8osdVav5Rg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgVGVkLA0KDQo+RnJvbTogVGVkIEp1YW4gW21haWx0bzp0ZWQuanVhbkBnbWFpbC5jb21dDQoN
Cj5XaGVuIEkgYWRkICJDQzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgMy4xMy54KyIgaW4g
cGF0Y2gsIHRoZW4gZ2l0DQo+c2VuZC1lbWFpbC4NCj4NCj5UaGVyZSBhcmUgc29tZSB3YXJuaW5n
IG1lc3NhZ2UgYXMgYmxvdy4gU2hvdWxkIEkgZml4IGl0Pw0KPkFuZCB3aGljaCBzdGFibGUgdmVy
c2lvbiBJIHNob3VsZCBtYXJrPw0KPg0KSWYgSSdtIG5vdCB3cm9uZywgYmVsb3cgaXMgbXkgdW5k
ZXJzdGFuZGluZyAuLg0KDQpQYXRjaGVzIG1hcmtlZCBmb3Igc3RhYmxlIGFyZSBhdXRvbWF0aWNh
bGx5IHB1bGxlZC1pbiBieSBtYWludGFpbmVycyBvZg0Kc3RhYmxlIHRyZWVzIHdoZW4gdGhvc2Ug
cGF0Y2hlcyBnZXQgbWVyZ2VkIGFuZCB0YWdnZWQgaW4gbGludXMncyB0cmVlLg0KVGhpcyBpcyBk
b25lIGJ5IHNjcmlwdHMgd2hpY2ggc2VhcmNoICJDQzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
ICMgPHRhZz4iDQppbiBjb21taXQgbG9nIG9mIGFsbCBwYXRjaGVzLiBUaHVzICJDQzogPHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmc+ICMgMy4xMy54KyINCmhlcmUgaXMgbGlrZSBhIG1hcmtlciBmb3Ig
c2NyaXB0cy4gSW4gcHJhY3RpY2UsIHlvdSBzaG91bGQgbm90IGRpcmVjdGx5IHNlbmQNCnlvdXIg
cGF0Y2ggdG8gInN0YWJsZUB2Z2VyLmtlcm5lbC5vcmciIG1haWwtbGlzdCwgdW5sZXNzIG1haW50
YWluZXIgZG9lcyBzby4NCg0KU28sIHdoaWxlIHNlbmRpbmcgc3RhYmxlIHBhdGNoZXMgdXNlIGZv
bGxvd2luZyBjb21tYW5kIHRvIGF2b2lkIGJlbG93IGVycm9yDQonZ2l0IHNlbmQtZW1haWwgLS0t
c3VwcHJlc3MtY2M9Ym9keWNjJw0KDQpBbHNvIHJlZmVyOg0KaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE0LU1heS8wNTM5MTEuaHRtbA0KWzJdIERvY3Vt
ZW50YXRpb24vc3RhYmxlX2tlcm5lbF9ydWxlcy50eHQuDQoNCg0Kd2l0aCByZWdhcmRzLCBwZWtv
bg0KDQo+VGhhbmtzLg0KPg0KPihtYm94KSBBZGRpbmcgY2M6ICJ0ZWQuanVhbiIgPHRlZF9qdWFu
QHdlaW50ZWsuY29tPiBmcm9tIGxpbmUgJ0Zyb206DQo+InRlZC5qdWFuIiA8dGVkX2p1YW5Ad2Vp
bnRlay5jb20+Jw0KPihib2R5KSBBZGRpbmcgY2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAj
IDMuMTMueCsgZnJvbSBsaW5lICdDQzoNCj48c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyAzLjEz
LngrJw0KPlVzZSBvZiB1bmluaXRpYWxpemVkIHZhbHVlICRjYyBpbiBzdHJpbmcgZXEgYXQNCj4v
dXNyL2xpYi9naXQtY29yZS9naXQtc2VuZC1lbWFpbCBsaW5lIDk4My4NCj5Vc2Ugb2YgdW5pbml0
aWFsaXplZCB2YWx1ZSAkY2MgaW4gcXVvdGVtZXRhIGF0DQo+L3Vzci9saWIvZ2l0LWNvcmUvZ2l0
LXNlbmQtZW1haWwgbGluZSA5ODMuDQo+VzogdW5hYmxlIHRvIGV4dHJhY3QgYSB2YWxpZCBhZGRy
ZXNzIGZyb206IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDMuMTMueCsNCj5XOiB1bmFibGUg
dG8gZXh0cmFjdCBhIHZhbGlkIGFkZHJlc3MgZnJvbTogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
ICMgMy4xMy54Kw0KPg0KDQoNCg==
