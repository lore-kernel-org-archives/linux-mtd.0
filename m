Received: from skedge04.snt-world.com ([91.208.41.69])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKfEM-0004TG-Fg
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 08:00:00 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.De>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "david.wolfe@nxp.com" <david.wolfe@nxp.com>,
 "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "prabhakar.kushwaha@nxp.com"
 <prabhakar.kushwaha@nxp.com>, "yogeshnarayan.gaur@nxp.com"
 <yogeshnarayan.gaur@nxp.com>, "han.xu@nxp.com" <han.xu@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [PATCH v4 00/10] Port the FSL QSPI driver to the SPI framework
Date: Thu, 8 Nov 2018 07:59:43 +0000
Message-ID: <454d5661-5f52-7d81-da02-f8207b3ce8c3@kontron.de>
References: <1541601809-16950-1-git-send-email-frieder.schrempf@kontron.de>
 <20181107155315.056a0d47@bbrezillon>
 <c9b12dba-3922-9deb-e600-8a3aa1b3dfb5@kontron.de>
 <20181107161039.4b509a80@bbrezillon>
In-Reply-To: <20181107161039.4b509a80@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E0709148A70F643953F95E36EA4FB01@snt-world.com>
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

T24gMDcuMTEuMTggMTY6MTAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToNCj4gT24gV2VkLCA3IE5v
diAyMDE4IDE1OjA3OjM3ICswMDAwDQo+IFNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVt
cGZAa29udHJvbi5EZT4gd3JvdGU6DQo+IA0KPj4gT24gMDcuMTEuMTggMTU6NTMsIEJvcmlzIEJy
ZXppbGxvbiB3cm90ZToNCj4+PiBPbiBXZWQsICA3IE5vdiAyMDE4IDE1OjQzOjE3ICswMTAwDQo+
Pj4gRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiB3cm90ZToN
Cj4+PiAgICANCj4+Pj4gQ2hhbmdlcyBpbiB2NDoNCj4+Pj4gPT09PT09PT09PT09PT0NCj4+Pj4g
KiBSZWJhc2Ugb24gdG9wIG9mIHY0LjIwLXJjMQ0KPj4+PiAqIERyb3AgcGF0Y2hlcyB0aGF0IHdl
cmUgbWVyZ2VkIHNlcGFyYXRlbHkNCj4+Pj4gKiBBZGRyZXNzIGNoYW5nZSBvZiBjb21wYW55IG5h
bWUgYW5kIGVtYWlsIGFkZHJlc3MNCj4+Pg0KPj4+IExvb2tzIGxpa2UgeW91ciBTb0IgYW5kIEF1
dGhvciBmaWVsZHMgYXJlIHN0aWxsIHVzaW5nIHRoZSBvbGQgYWRkcmVzcy4NCj4+DQo+PiBJIGNo
YW5nZWQgbXkgZ2l0IHVzZXIgZW1haWwgYW5kIGdpdCBzZW5kLWVtYWlsIGFkZGVkIGEgIkZyb206
IiBmaWVsZCB0bw0KPj4gZWFjaCBwYXRjaCBiZWNhdXNlIHRoZSBvbGQgU29CIGRvZXNuJ3QgbWF0
Y2ggdGhlIG5ldyBnaXQgdXNlciBjb25maWcuDQo+Pg0KPj4gSSBjYW4gY2hhbmdlIHRoZSBTb0Ig
ZmllbGRzIGluIHRoZSBuZXh0IHZlcnNpb24uDQo+IA0KPiBZZXAsIHlvdSdkIGJldHRlciB1cGRh
dGUgYm90aCB0aGUgU29CIGFuZCBhdXRob3IgKHRoZXkgaGF2ZSB0byBtYXRjaCk6DQo+IA0KPiBn
aXQgY29tbWl0IC0tYW1lbmQgLS1hdXRob3I9IlNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2No
cmVtcGZAa29udHJvbi5kZT4iIC1zDQo+IA0KPiAoYW5kIGRvbid0IGZvcmdldCB0byByZW1vdmUg
dGhlIG9sZCBTb0IpDQoNClRoYW5rIHlvdSBmb3IgdGhlIGhpbnQuIEkgZW5kZWQgdXAgdXNpbmcg
dGhlIGZvbGxvd2luZyBjb21tYW5kIHdoaWNoIGlzIA0KZXZlbiBhIGJpdCBzaW1wbGVyOg0KDQpn
aXQgY29tbWl0IC0tYW1lbmQgLS1yZXNldC1hdXRob3IgLXM=
