Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCsDw-0006P6-PY
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 14:52:41 +0000
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Date: Mon, 10 Feb 2014 14:52:12 +0000
Message-ID: <1392043932.32363.50.camel@sauron.fi.intel.com>
References: <52F6BA07.60707@nod.at> <20140208231501.GG22376@1wt.eu>
 <52F6BCCD.5070302@nod.at> <20140208233758.GH22376@1wt.eu>
 <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
In-Reply-To: <1392043814.32363.49.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <08D468EA281DCA4BBCE8B1941BC22DAA@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Cc: "thomas.petazzoni@free-electrons.com"
 <thomas.petazzoni@free-electrons.com>, "vapier@gentoo.org" <vapier@gentoo.org>,
 "michael.opdenacker@free-electrons.com"
 <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "piergiorgio.beruto@gmail.com" <piergiorgio.beruto@gmail.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "w@1wt.eu" <w@1wt.eu>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gTW9uLCAyMDE0LTAyLTEwIGF0IDE2OjUwICswMjAwLCBBcnRlbSBCaXR5dXRza2l5IHdyb3Rl
Og0KPiBPciBtYXJrIFIvVyBhcyBleHBlcmltZW50YWwgYW5kIG1ha2UgeW91ciBtb2R1bGUgdG8g
YmUgUi9PIGJ5IGRlZmF1bHQuDQo+IEZvcmNlIHBlb3BsZSB0byB1c2UgJ2Jsb2NrZGV2IC0tc2V0
cm8nIGlmIHRoZXkgd2FudCBSL1cuIFJ1bi10aW1lLg0KDQpFcnIsIGhlcmUgSSBkaWQgbm90IG1l
YW4gdGhlIEtjb25maWcgZXhwZXJpbWVudGFsLiBJIGFtIGFza2luZyBmb3Igbm8NCktjb25maWcg
b3B0aW9ucyBmb3IgdGhpcy4gSSBtb3JlIG1lYW50IGxpa2UgdGVsbCBwZW9wbGUgd2hlcmUgdGhl
IGRvY3MNCmFyZSwgYW5kIHRlbGwgdGhlcmUgdGhhdCB3cml0ZSBzdXBwb3J0IGlzIGV4cGVyaW1l
bnRhbC4NCg0KLS0gDQpCZXN0IFJlZ2FyZHMsDQpBcnRlbSBCaXR5dXRza2l5DQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVs
c2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4g
SGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNv
bmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNp
cGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVh
c2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4K
