Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhMkq-0001Jy-1o
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2018 22:23:06 +0000
From: Theuns Verwoerd <Theuns.Verwoerd@alliedtelesis.co.nz>
To: Richard Weinberger <richard.weinberger@gmail.com>, Al Viro
 <viro@zeniv.linux.org.uk>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] jffs2: Provide jffs2_sync files to track gc POLL
 progress
Date: Sun, 22 Jul 2018 22:22:27 +0000
Message-ID: <e85ebd5d-e4a0-0b48-4664-78f90211c64f@alliedtelesis.co.nz>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <f1c6c3cc0c8850e143594afd57b50d30cd8bb5f8.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <20180720000431.GA30522@ZenIV.linux.org.uk>
 <b2b2e3e0-14b7-9f46-434d-2134d1d0cfad@alliedtelesis.co.nz>
 <CAFLxGvyTmz8JQVn-OJFSVdns74o49XgdWbhGpPsqYe5S2uahYg@mail.gmail.com>
In-Reply-To: <CAFLxGvyTmz8JQVn-OJFSVdns74o49XgdWbhGpPsqYe5S2uahYg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <31F9504A4CD84245B4CF996530ACAEDF@atlnz.lc>
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

T24gMDcvMjMvMjAxOCAwMToxNyBBTSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOg0KPiBCZXNp
ZGUgb2YgdGhhdCwgSU1ITyB0aGlzIGRlYnVnZnMgZmlsZSBpcyBhIGdyb3NzIGhhY2suDQo+IERp
ZCB5b3UgbG9vayBpbnRvIHRoZSBwb3NzaWJpbGl0eSB0byBhZGQgdGhlIEdDIHBoYXNlIGludG8g
dGhlIHVubGluayBjb2RlPw0KSSdtIG5vdCB0ZXJyaWJseSBrZWVuIG9uIGl0IGVpdGhlciwgYnV0
IGl0J3MgdGhlIGxlYXN0IGJhZCBvcHRpb24gSSANCmNvdWxkIHRoaW5rIG9mLsKgIFRoZSBtYWlu
IGlzc3VlIGlzIHRoYXQgdGhpcyBraW5kIG9mIGZvcmNlZCBHQyBjYW4gYmUgDQp2ZXJ5IHNsb3cg
KHR5cGljYWxseSAybWluIG9uIG15IHRlc3QgcGxhdGZvcm0pLCBhbmQgaXMgbm90IG5lY2Vzc2Fy
eSBmb3IgDQp0aGUgdmFzdCBtYWpvcml0eSBvZiB1bmxpbmsgY2FzZXMgLSB3ZSBvbmx5IG5lZWQg
dG8gc2VjdXJlbHkgZGVsZXRlIA0Ka2V5cywgb3RoZXIgZmlsZXMgY2FuIGJlIGNsZWFuZWQgdXAg
ZXZlbnR1YWxseS4gVW5saW5rIGNhbGxzIGhhdmUgbm8gd2F5IA0Kb2YgaWRlbnRpZnlpbmcgc3Vj
aCBzZW5zaXRpdmUgZmlsZXMsIGhvd2V2ZXIsIG5vciBpcyB0aGVyZSBhIHdheSBvZiANCmRlbWFy
Y2F0aW5nIGEgc2VyaWVzIG9mIGJhY2stdG8tYmFjayBzZWN1cmUgZGVsZXRpb25zIHRoYXQgY2Fu
IGJlIA0KY29sbGVjdGVkIGVuIG1hc3NlLsKgIFBhcmFsbGVsIHRvIHRoZSBwcm9ibGVtIG9mIHRy
aWdnZXJpbmcgdGhlIGZvcmNlZCANCkdDLCBpcyB0aGUgaXNzdWUgb2Yga25vd2luZyB3aGVuIGl0
IGhhcyBjb21wbGV0ZWQ6IGJsb2NraW5nIG9uIGZpbGUgcmVhZCANCnNlZW1lZCB0byBiZSB0aGUg
bW9zdCBkaWdlc3RpYmxlIHRvIHVzZXJzcGFjZSB3YXkgb2YgZG9pbmcgdGhhdC4NCg0KQWx0ZXJu
YXRpdmVzIEkndmUgY29uc2lkZXJlZCBpbmNsdWRlIG92ZXJ3cml0ZS1iZWZvcmUtdW5saW5rICh0
aGUgYmxvY2sgDQpoaXN0b3J5IGdldHMgY29tcGxpY2F0ZWQsIHBsdXMgdGhlIHByb2JsZW0gb2Yg
YWN0dWFsbHkgZG9pbmcgc3VjaCBhbiANCm92ZXJ3cml0ZSksIGF1dG9tYXRpYyBHQyBvbiB1bmxp
bmsgKHNlZSBhYm92ZSksIGFuIGFsdGVybmF0aXZlIHN5c3RlbSANCmNhbGwgZm9yIHNlY3VyZSB1
bmxpbmsgKHRoYXQgbWVzc2VzIHVwIHRoZSBlbnRpcmUgRlMgY2FsbCBjaGFpbiksIGFuZCANCmVu
Y3J5cHRpbmcgdGhlIHNlbnNpdGl2ZSBmaWxlcyAoa2V5IHRvIGFjY2VzcyBrZXlzIG11c3QgYWxz
byBiZSANCnBlcnNpc3RlbnQsIHdoaWNoIGdldHMgdXMgYmFjayB0byB0aGUgc2FtZSBwcm9ibGVt
KS7CoCBJbiBteSBvcmlnaW5hbCANCnZlcnNpb24gSSdkIHVzZWQgYSAvcHJvYyBmaWxlLCBidXQg
ZGVidWdmcyBoYXMgYSBtb3JlIGZvcmdpdmluZyBzb2NpYWwgDQpjb250cmFjdC4NCg0KUmVnYXJk
cywNCg0KVGhldW5zDQpLUk4=
