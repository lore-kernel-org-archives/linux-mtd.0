From: Sebastian RASMUSSEN <sebastian.rasmussen@stericsson.com>
To: Vipin KUMAR <vipin.kumar@st.com>,
	Armando VISCONTI <armando.visconti@st.com>
Date: Fri, 3 Sep 2010 13:22:49 +0200
Subject: RE: [PATCH 27/74] ST SPEAr : NAND interface driver for spear platforms
Message-ID: <ECD438FDEF6BD742895E554C24725A401602C9EF37@EXDCVYMBSTM005.EQ1STM.local>
References: <cover.1283161023.git.viresh.kumar@st.com>
	<07ce8daf18d3a9f13864752074af3490a324d84c.1283161023.git.viresh.kumar@st.com>
	<7cd7060b403b448d74649cec5c28c795bcbbdbc3.1283161023.git.viresh.kumar@st.com>
	<AANLkTik9Di4k183t+wuY-1eprsO3xBOESaOY5dnxt6ii@mail.gmail.com>
	<4C7F5B9E.8090406@st.com> <4C809FBC.8020003@st.com>
In-Reply-To: <4C809FBC.8020003@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Pratyush ANAND <pratyush.anand@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	Vipul Kumar SAMAR <vipulkumar.samar@st.com>,
	Bhupesh SHARMA <bhupesh.sharma@st.com>,
	Linus Walleij <linus.ml.walleij@gmail.com>,
	Alessandro Rubini <rubini-list@gnudd.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>,
	Rajeev KUMAR <rajeev-dlh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Deepak SIKRI <deepak.sikri@st.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkhDQoNCj4gQWRkaW5nIG9uIHRvcCBvZiB3aGF0IEFybWFuZG8gaGFzIGFscmVhZHkgcG9pbnRl
ZCBvdXQsIEZTTUMgYmxvY2sgbWF5IA0KPiBoYXZlIGRpZmZlcmVudCB2ZXJzaW9ucyBhbmQgZWFj
aCBvZiB0aGVtIG1heSBzdXBwb3J0IGRpZmZlcmVudCBmZWF0dXJlcyANCj4gYmFzZWQgb24gaXRz
IGNvbmZpZ3VyYXRpb24gZWcuIHNwZWFyIGRldmljZSdzIEZTTUMgYmxvY2sgaXMgdmVyc2lvbjgg
DQo+IGFuZCBpcyBjb25maWd1cmVkIGZvciAxMyBieXRlIGVjYyhwZXIgNTEyIGJ5dGVzIGRhdGEs
IEJDSDggYWxnb3JpdGhtKS4gDQo+IFRoZXJlIGFyZSBvdGhlciBwb3NzaWJpbGl0aWVzIGVnLiBC
Q0g0LCBCQ0gyIGV0YyB3aGljaCBhcmUgbm90IHVzZWQgaW4gDQo+IHNwZWFyIGRldmljZXMuDQoN
Ckxvb2tpbmcgYXQgdGhlIGZ1dHVyZSB0cmVuZCBvZiBOQU5EIGZsYXNoIG1lbW9yaWVzIEkgYmVs
aWV2ZSB0aGF0IEJDSDggaXMNCmxpa2VseSB0byBiZSBvZiBtb3N0IGludGVyZXN0LCBidXQgb2Yg
Y291cnNlIGhhdmluZyBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eQ0Kd2l0aCBhbHJlYWR5IGV4aXN0
aW5nIEZTTUMgYmxvY2sgdXNhZ2UgaXMgaW50ZXJlc3RpbmcgZW5vdWdoLg0KDQo+IE1ha2luZyBp
dCBnZW5lcmljIHdvdWxkIGFsc28gZW50YWlsIHN1cHBvcnRpbmcgYWxsIHBvc3NpYmxlIGNvbmZp
Z3VyYXRpb25zIA0KPiB0aHJvdWdoIHNpbmdsZSBkcml2ZXIgKG1ha2VzIG1vcmUgc2Vuc2UpDQpb
Li4uXQ0KPiBBbGVzc2FuZHJvL1NlYmFzdGlhbjogSXMgaXQgT0sgdG8gYWRkIGEgY29tbW9uIGRy
aXZlciBmb3IgYWxsIEZTTUMgdmVyc2lvbnMNCj4gYW5kIGN1c3RvbWl6YXRpb25zDQoNCkkgYmVs
aWV2ZSB0aGF0IGEgY29tbW9uIGRyaXZlciBpcyB0aGUgYmVzdCB3YXkgZm9yd2FyZCwgeWVzLiBM
ZXQgbWUga25vdyBpZiBJDQpjYW4gYXNzaXN0IHlvdSBpbiBhbnkgb2YgdGhlIGRldmVsb3BtZW50
IG9yIHRlc3RpbmcuDQoNCiAvIFNlYmFzdGlhbg0K
