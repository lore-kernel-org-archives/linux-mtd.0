Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgJho-000079-FH
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 00:55:38 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 76B048365D
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2018 12:54:55 +1200 (NZST)
From: Theuns Verwoerd <Theuns.Verwoerd@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] jffs2: Provide jffs2_sync files to track gc POLL
 progress
Date: Fri, 20 Jul 2018 00:54:49 +0000
Message-ID: <b2b2e3e0-14b7-9f46-434d-2134d1d0cfad@alliedtelesis.co.nz>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <f1c6c3cc0c8850e143594afd57b50d30cd8bb5f8.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <20180720000431.GA30522@ZenIV.linux.org.uk>
In-Reply-To: <20180720000431.GA30522@ZenIV.linux.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B57DF4BBAA831479198C277A588808D@atlnz.lc>
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

DQpPbiAwNy8yMC8yMDE4IDEyOjA0IFBNLCBBbCBWaXJvIHdyb3RlOg0KPiBPbiBGcmksIEp1bCAy
MCwgMjAxOCBhdCAxMTo1MDoxMkFNICsxMjAwLCBUaGV1bnMgVmVyd29lcmQgd3JvdGU6DQo+DQo+
PiArc3NpemVfdCBqZmZzMl9zeW5jX2ZpbGVfcmVhZChzdHJ1Y3QgZmlsZSAqZiwNCj4+ICsJICAg
ICAgY2hhciBfX3VzZXIgKmIsIHNpemVfdCBsZW4sIGxvZmZfdCAqb2ZzKQ0KPj4gK3sNCj4+ICsJ
c3RydWN0IGpmZnMyX3NiX2luZm8gKmMgPSBmaWxlX2lub2RlKGYpLT5pX3ByaXZhdGU7DQo+PiAr
DQo+PiArCXdoaWxlIChjLT50aWRlbWFyaykNCj4+ICsJCXNjaGVkdWxlKCk7DQo+PiArDQo+PiAr
CXJldHVybiAwOw0KPj4gK30NCj4gQnJpbGxpYW50LiAgU28gd2hlbiB0aGF0IGdldHMgY2FsbGVk
IHdpdGggYy0+dGlkZW1hcmsgYmVpbmcgdHJ1ZSBhbmQNCj4gbmVlZF9yZXNjaGVkKCkgLSBmYWxz
ZSwgd2Ugc2hhbGwuLi4NCkJ5IG15IHJlYWRpbmcsIHNjaGVkdWxlKCkgd2lsbCBoYXBwaWx5IGZv
cmNlIGEgcmVzY2hlZHVsZSAob25jZSkgd2hlbiANCm5lZWRfcmVzY2hlZCgpIGlzIGZhbHNlLsKg
IEV2ZXJ5IHRpbWUgdGhlIHByb2Nlc3MgaXMgZ3JhbnRlZCBhIHRpbWUgDQpzbGljZSwgaXQnbGwg
Y2hlY2sgdGhlIGNvbmRpdGlvbiBhbmQgc3VycmVuZGVyIGlmIG5vdCByZWFkeS4NCg0KV2hhdCBk
byB5b3UgYmVsaWV2ZSB3aWxsIGhhcHBlbj8NCj4gQm9udXMgcXVlc3Rpb246IHdoYXQgaGFwcGVu
cyBpZiB0aGF0IGlzIGNhbGxlZCBhZnRlciB0aGF0IGpmZnMyX3NiX2luZm8NCj4gZ2V0cyBmcmVl
ZD8NClRoYXQgaXMgcHJvYmFibHkgYSB2YWxpZCBjcml0aXF1ZSAtIGlmIGpmZnMyX2tpbGxfc2Io
KSBnZXRzIGNhbGxlZCB0aGUgDQpjbGVhbnVwIGluIGV4aXRfamZmczJfZnMoKSBpcyBub3Qgc3Vm
ZmljaWVudC4NCg0KUmVnYXJkcywNCg0KVGhldW5zDQpLUk4=
