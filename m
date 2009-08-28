Received: from sdcmail02.amcc.com ([198.137.200.90])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mh1s5-0002TW-A8
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 13:52:09 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Subject: RE: [PATCH] [JFFS2] Fix csize integer overflow issue due to truncation
Date: Fri, 28 Aug 2009 06:52:01 -0700
Message-ID: <0CA0A16855646F4FA96D25A158E299D606EDB124@SDCEXCHANGE01.ad.amcc.com>
In-Reply-To: <1251436725.3514.9.camel@localhost>
References: <25217471.1985431251223831787.JavaMail.nabble@isper.nabble.com>
	<0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
	<1251436725.3514.9.camel@localhost>
From: "Victor Gallardo" <vgallardo@amcc.com>
To: <dedekind1@gmail.com>
Cc: Prodyut Hazarika <phazarika@amcc.com>,
	David Woodhouse <dwmw2@infradead.org>, Feng Kan <fkan@amcc.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiA+DQo+ID4gSSBzdWJtaXR0ZWQgdGhlIGZvbGxvd2luZyBwYXRjaCBhbmQgbmVlZCB0byBtb25p
dG9yIGl0IHVudGlsIGl0IGdldHMgYXBwbGllZC4NCj4gPg0KPiA+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAwOS1BdWd1c3QvMDI3MDA1Lmh0bWwNCj4g
PiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMzE4NTQvDQo+IA0KPiBZb3VyIHBh
dGNoIGlzIGluIG15IGwyLW10ZC0yLjYgdHJlZToNCj4gDQo+IGh0dHA6Ly9naXQuaW5mcmFkZWFk
Lm9yZy91c2Vycy9kZWRla2luZC9sMi1tdGQtMi42LmdpdC9jb21taXQvYTMzZjAyMzYzZDRmNTdj
N2JjNjEzM2U4OTJhZDk5ZDdjZTdlN2M4Nw0KPiANCg0KVGhhbmtzIEFydGVtLCBJIGRpZCBub3Qg
a25vdyB0byBsb29rIGhlcmUuDQoNCkJlc3QgUmVnYXJkcywNCg0KVmljdG9yIEdhbGxhcmRvDQoN
Cg==
