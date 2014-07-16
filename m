Received: from blu004-omc2s24.hotmail.com ([65.55.111.99])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7IcH-0006LK-1Q
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 06:23:01 +0000
Message-ID: <BLU185-W3905FC27DFF1AF3917B0DAA6F70@phx.gbl>
From: Bean Huo <beanhuo@outlook.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v3] mtd:nor:timeout:fix do_write_buffer() timeout error
Date: Wed, 16 Jul 2014 06:22:38 +0000
In-Reply-To: <20140715072823.GH23883@brian-ubuntu>
References: <BLU185-W2144FD57B7B7D8B8C90EB4A60F0@phx.gbl>,
 <CAOY=C6HaXPrEGPSzEUb5XM79SdqTSGwMPmQXq3U7abNvW0SuQA@mail.gmail.com>,
 <BLU185-W959F702F780985563AD7C0A60E0@phx.gbl>,
 <CAOY=C6GcNzvBieUVm1pk4XQipxj3U9N1Dw09JEM6ZdW7jJLjcA@mail.gmail.com>,
 <BLU185-W92FA6A378C0039524F045FA60E0@phx.gbl>,
 <CAOY=C6FG8fgZGKhXvXG03hQQNSOYz+=uqrfYmNXfHKkz4XRSog@mail.gmail.com>,
 <BLU185-W73A028C46FBD1D13672BC0A6090@phx.gbl>,
 <20140712064639.GD23883@brian-ubuntu>,
 <BLU185-W7188DFB38D0DD264DF6255A6F60@phx.gbl>,
 <20140715072823.GH23883@brian-ubuntu>
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

DQoNCj4+IEZvciB0aGlzIHBhdGNoLGkgd2lsbCBkbyBzb21lIGNoYW5nZXMscGxlYXNlIGV2ZXJ5
IG1haW50YWluZXIgYW5kIGNvbW1pdC1zaWduZXIgY2hlY2suDQo+DQo+IFllcywgcGxlYXNlIHNl
bmQgYSBuZXcgdmVyc2lvbiAodmVyc2lvbiA0IG5vdz8pLiBCdXQgcGxlYXNlIGRvdWJsZSBjaGVj
aw0KPiB5b3VyIHBhdGNoIHN1Ym1pc3Npb24sIHNvIHRoYXQgaXQgYXBwbGllcyBjb3JyZWN0bHkg
dGhpcyB0aW1lLg0KPg0KPiBUaGFua3MsDQo+IEJyaWFuDQpUaGFua3Mgb25jZSBhZ2FpbiBmb3Ig
eW91ciBhZHZpY2UuWWVzLEkgd2lsbCBzZW5kIHZlcnNpb24gNCBhYm91dCB0aGlzIHBhdGNoLmFu
ZCBJIGhhdmUgdGVzdGVkIGl0LiAJCSAJICAgCQkgIA==
