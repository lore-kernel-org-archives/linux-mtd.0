Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZfGx-0001OT-BF
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 11:09:44 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: RE: [PATCH v2 4/5] mtd: nand: omap2: Use devm_kzalloc
Date: Fri, 25 Oct 2013 11:09:14 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2AE0F@DBDE04.ent.ti.com>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2AD60@DBDE04.ent.ti.com>
 <20131025104246.GA2489@localhost>
In-Reply-To: <20131025104246.GA2489@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiBGcm9tOiBFemVxdWllbCBHYXJjaWEgW21haWx0bzplemVxdWllbC5nYXJjaWFAZnJlZS1lbGVj
dHJvbnMuY29tXQ0KPiANCj4gSG0uLiB3ZWxsIHRoZSBwcm9ibGVtIHdpdGggdGhhdCBwYXRjaCBp
cyB0aGF0IGl0J3MgaW4gdGhlIG1pZGRsZSBvZiBhbg0KPiB1bnJlbGF0ZWQgc2VyaWVzLiBBcyBJ
IGFscmVhZHkgdG9sZCB5b3UsIEkgdGhpbmsgeW91IHNob3VsZCBoYXZlIHB1c2hlZA0KPiB0aGF0
IGFzIGEgb25lLXBhdGNoIGZpeC4gSGF2ZSB5b3Ugc2VlbiB0aGF0IHN1Z2dlc3Rpb24/DQo+IA0K
WWVzLCBJIGtub3cuLiBhY3R1YWxseSB0aGUgb3JpZ2luYWwgcGF0Y2ggc2VyaWVzLCB3aGVuIGl0
IHN0YXJ0ZWQgc29tZXdoZXJlDQpBcHJpbCAob3IgYmVmb3JlKSBpcyB2ZXJ5IGRpZmZlcmVudCBm
cm9tIHRoZSB2ZXJzaW9uIHYxMSBub3cgOi0pLg0KVGhpcyBkZXZtXyB1cGRhdGUgd2FzIGFkZGVk
IGluIG1pZGRsZSBvZiB2Ni12NyB2ZXJzaW9uIGNoYW5nZQ0KKE1vc3Qgb2YgdGhlIGNoYW5nZXMg
c2luY2UgZmlyc3QgdmVyc2lvbiBvZiB0aGlzIHBhdGNoc2V0IGlzIGNhcHR1cmVkIGluIA0KQ292
ZXItbGV0dGVyKS4NCg0KDQo+IE9uIHRoZSBvdGhlciBzaWRlLCB5b3UncmUgZml4aW5nIHRvbyBt
YW55IHRoaW5ncyBpbiB0aGF0IHNpbmdsZSBwYXRjaCwNCj4gZm9yIG15IHRhc3RlLiBNYXliZSBJ
J20gbm90IHRoZSBzbWFydGVyIGRldmVsb3BlciwgYnV0IGdvaW5nIHRocm91Z2gNCj4gdGhhdCBw
YXRjaCBpcyBub3QgZWFzeSB0byBjYXRjaCBpZiB0aGVyZSdzIG5vIG1pc3Rha2UgZG9uZS4NCj4g
DQo+IFVzdWFsbHkgaWYgaXQncyBwb3NzaWJsZSB0byBzcGxpdCBhIHBhdGNoIChtYWludGFpbmlu
ZyBjb25zaXN0ZW5jeSkgaXQgbWFrZXMNCj4gdGhlIHJldmlld2luZyBwcm9jZXNzIGVhc2llci4N
Cj4gSWYgeW91J2QgcmF0aGVyIHNlbmQgdGhpcyBkZXZtX3h4eCBjaGFuZ2UgeW91cnNlbGYgdGhh
dCdzIGZpbmUgYnkgbWUsDQo+IA0KQWhoIG5vdGhpbmcgbGlrZSB0aGF0Li4gQnJpYW4gaGFkIGFs
cmVhZHkgcmV2aWV3ZWQgdGhlc2UgY291cGxlIG9mIHRpbWVzDQpBbmQgaXQgd2FzIG9ubHkgW1Bh
dGNoIDA0LzEwXSB3aGljaCB3YXMgbGFzdCBvbmUgcmVtYWluaW5nLi4NCkkganVzdCBzYWlkIGl0
IGJlY2F1c2UgdGhpcyBtaWdodCBzaG93IHVwIGluIG1lcmdlIGNvbmZsaWN0IC4uIG9yIHJlamVj
dHMuLg0KDQo+IGJ1dCAqcGxlYXNlKiBzcGxpdCB0aGUgcGF0Y2ggaW4gdHdvIGFuZCB3cml0ZSBw
cm9wZXIgY29tbWl0IG1lc3NhZ2VzLg0KPiANCj4gQW55d2F5OiB0aGlzIGlzIGp1c3QgYSBzaWxs
eSBjaGFuZ2UsIHRoZSBpbXBvcnRhbnQgb25lIGlzIHRoZSBvdGhlcg0KPiBuYW5kX3NjYW5faWRl
bnQoKSBmaXguIENvdWxkIHlvdSBoZWxwIG1lIHJldmlldyB0aGF0Pw0KPiANCj4gSSdtIGludGVy
ZXN0ZWQgaW4ga25vd2luZyBob3cgd2lsbCB0aGF0IHdvcmsgd2l0aCA4LWJpdCBhbmQgMTYtYml0
IGRldmljZXMuDQo+IC0tDQpZZXMsIEknbSBqdXN0IHByZXBhcmluZyB0aGUgc2NlbmFyaW8gd2hl
cmUgQlVTV0lEVEhfQVVUTyB3b3VsZCBmYWlsLi4NCnVubGVzcyB5b3UgZG8gR1BNQyBkcml2ZXIg
Y2hhbmdlcyBhbHNvLi4gc2FtZSBpc3N1ZSB3YXMgZm91bmQgYnkNCk1hdHRoaWV1IENBU1RFVCAo
bWF0dGhpZXUuY2FzdGV0QHBhcnJvdC5jb20pDQoocGxlYXNlIHNlZSBteSBvdGhlciBtYWlsKQ0K
DQoNCndpdGggcmVnYXJkcywgcGVrb24NCg==
