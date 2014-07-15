Received: from blu004-omc2s22.hotmail.com ([65.55.111.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6uHe-0002ZN-Lq
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 04:24:07 +0000
Message-ID: <BLU185-W7188DFB38D0DD264DF6255A6F60@phx.gbl>
From: Bean Huo <beanhuo@outlook.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Tue, 15 Jul 2014 04:23:44 +0000
In-Reply-To: <20140712064639.GD23883@brian-ubuntu>
References: <BLU185-W2144FD57B7B7D8B8C90EB4A60F0@phx.gbl>,
 <CAOY=C6HaXPrEGPSzEUb5XM79SdqTSGwMPmQXq3U7abNvW0SuQA@mail.gmail.com>,
 <BLU185-W959F702F780985563AD7C0A60E0@phx.gbl>,
 <CAOY=C6GcNzvBieUVm1pk4XQipxj3U9N1Dw09JEM6ZdW7jJLjcA@mail.gmail.com>,
 <BLU185-W92FA6A378C0039524F045FA60E0@phx.gbl>,
 <CAOY=C6FG8fgZGKhXvXG03hQQNSOYz+=uqrfYmNXfHKkz4XRSog@mail.gmail.com>,
 <BLU185-W73A028C46FBD1D13672BC0A6090@phx.gbl>,
 <20140712064639.GD23883@brian-ubuntu>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "christian.riesch@omicron.at" <christian.riesch@omicron.at>,
 "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Stijn Devriendt <highguy@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiArIExpbnV4LU1URA0KPg0KPiBQbGVhc2UgZG8gbm90IHJlbW92ZSB0aGUgTVREIG1haWxpbmcg
bGlzdCBmcm9tIHlvdXIgZW1haWwuIEkgYW0gbXVjaA0KPiBtb3JlIGxpa2VseSB0byBpZ25vcmUg
aXQgdGhhdCB3YXkuDQo+DQo+IEFsc28sIHBsZWFzZSBkb24ndCB0b3AgcG9zdC4gSSdtIHRvcC1w
b3N0aW5nIHJpZ2h0IG5vdywgYmVjYXVzZSBJIGNhbid0DQo+IHVuZGVyc3RhbmQgeW91ciB0aHJl
YWQgdmVyeSBlYXNpbHksIGFuZCBpdCdzIGhhcmQgdG8gcmVzdXJyZWN0IGZvcg0KPiBzZW5kaW5n
IHRvIHRoZSBtYWlsaW5nIGxpc3QgYW55d2F5Lg0KPg0KPiBSZWdhcmRpbmcgU3Rpam4ncyBjb21t
ZW50czogaWYgeW91IGhhdmUgZ29vZCByZWFzb24gdG8gYmVsaWV2ZSB0aGF0IHNvbWUNCj4gZmxh
c2gncyBDRkkgcGFyYW1ldGVyIHdpbGwgYmUgbm9uLXplcm8sIGJ1dCBpbmNvcnJlY3QsIHRoZW4g
cGVyaGFwcyB5b3UNCj4gY291bGQgZW5mb3JjZSBhIG1pbmltdW0gdmFsdWUuDQo+DQo+IEJyaWFu
DQo+DQoNCmhpLEJyaWFuDQpUaGFua3MgZm9yIHlvdXIgd2FybWx5IHJlc3BvbnNlIGFib3V0IG15
IHBhdGNoLkkgaGF2ZSBiZWVuIHdhaXRpbmcgZm9yIHlvdXIgbWVzc2FnZSB0b28gbG9uZy4NCkl0
J3MgaGFyZCBmb3IgbWUgdG8gZ2l2ZSB5b3UgYSBnb29kIHJlYXNvbiB0aGF0IHNvbWUgZmxhc2gn
cyBDRkkgcGFyYW1ldGVyIGlzIG5vbi16ZXJvLGFuZCANCmluY29ycmVjdC5JIGp1c3QgZm91bmQg
dGhhdCBpZiBmbGFzaCdidWZmZXIgaXMgNTEyIGJ5dGVzLG5vdCAyNTYgYnl0ZXMsdGltZW91dCBl
cnJvciB3aWxsIGhhcHBlbi4NCklmIHVzaW5nIENGSSdzIHRpbWVtb3V0IHZhbHVlLHRoYXQgaXMg
T0suQnV0IGZvciBjZmlfY21kc2V0XzAwMDEuYyxpdCBhbHNvIHVzZSB0aW1lb3V0IHZhbHVlIG9m
IENGSS4NClRoZSBkaWZmZXJlbmNlIHdpdGggbWluZSBpcyB0aGF0IGlmIHRpbWVvdXQgdmFsdWUg
aXMgbm90IGRlZmluZWQgaW4gdGhlIENGSSx0aGUgZGVmYXVsdCBtYXhtdW0gdGltZW91dA0KdmFs
dWUgaXMgNTAwMDAwdXMuDQpCZWNhdXNlIG15IGNvbXBhbnkncyBtYWlsYm94IHRpdGxlIGV4c2l0
cyBjaGluZXNlIHdvcmRzLGFuZCBpIHNlbnQgdGhpcyBwYXRjaCBmb3IgDQptYW55IHRpbWVzLHlv
dSBkb24ndCBoYXZlIG9uZSByZXNwb25zZSxzbyBpIHRob3VnaHQgdGhhdCB5b3UgbWF5YmUgY291
bGRuJ3QgcmVjZWl2ZSBteSBlbWFpbC5sYXRlcixpDQpjaG9zZSBteSBwZXJzb25hbCBlbWFpbC4N
Cg0KRm9yIHRoaXMgcGF0Y2gsaSB3aWxsIGRvIHNvbWUgY2hhbmdlcyxwbGVhc2UgZXZlcnkgbWFp
bnRhaW5lciBhbmQgY29tbWl0LXNpZ25lciBjaGVjay4gCQkgCSAgIAkJICA=
