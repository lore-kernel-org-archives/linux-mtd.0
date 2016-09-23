Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnOXN-0003UB-Hd
 for linux-mtd@lists.infradead.org; Fri, 23 Sep 2016 11:21:02 +0000
From: "Chugh, Sanjeev" <Sanjeev_Chugh@mentor.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 2/2] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
Date: Fri, 23 Sep 2016 11:20:36 +0000
Message-ID: <BEFE8A70F8F03B42BC5848A2E783B9E950AC8413@EU-MBX-03.mgc.mentorg.com>
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
 <5795EA8B.2040209@nod.at> <20160729182449.GA124841@google.com>
 <1470292252.2311.48.camel@gmail.com>
In-Reply-To: <1470292252.2311.48.camel@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
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

SGVsbG8gQnJpYW4sIEFydGVtLA0KDQpBcmUgeW91IHN1Z2dlc3RpbmcgdGhhdCB0aGlzIGNoYW5n
ZSBiZSBkb2N1bWVudGVkIGluc3RlYWQuIE5vdGUgdGhhdCB3ZSBhcmUgdXNpbmcgTk9SIGZsYXNo
IGRldmljZXMgZm9yIG91ciB0ZXN0aW5nIGFzIHlvdSBhc2tlZC4NCg0KQ2FuIEkgcmVxdWVzdCB5
b3UgdG8gcGxlYXNlIGNsYXJpZnkgb24gYWNjZXB0YW5jZSBvZiB0aGlzIHBhdGNoID8NCg0KVGhh
bmtzDQpTYW5qZWV2DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFydGVt
IEJpdHl1dHNraXkgW21haWx0bzpkZWRla2luZDFAZ21haWwuY29tXQ0KPlNlbnQ6IFRodXJzZGF5
LCBBdWd1c3QgMDQsIDIwMTYgMTI6MDEgUE0NCj5UbzogQnJpYW4gTm9ycmlzOyBSaWNoYXJkIFdl
aW5iZXJnZXINCj5DYzogUmFqZWV2IEt1bWFyOyBkd213MkBpbmZyYWRlYWQub3JnOyBsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj5zdGFibGVAdmdlci5rZXJuZWwub3JnDQo+U3ViamVj
dDogUmU6IFtQQVRDSCAyLzJdIHViaTogYXR0YWNoOiBkbyBub3QgcmV0dXJuIC1FSU5WQUwgaWYg
dGhlIG10ZC0NCj4+bnVtZXJhc2VyZWdpb25zIGlzIDENCj4NCj5PbiBGcmksIDIwMTYtMDctMjkg
YXQgMTE6MjQgLTA3MDAsIEJyaWFuIE5vcnJpcyB3cm90ZToNCj4+IChBcnRlbSwgYW55IG9waW5p
b25zLCBzaW5jZSB5b3UgaGFkIHRoZSBtb3N0IG9waW5pb24gbGFzdCB0aW1lIHRoaXMNCj4+IGNh
bWUNCj4+IHVwPykNCj4NCj5IaSBCcmlhbiwNCj4NCj53ZWxsLCBJIGRvIG5vdCBoYXZlIHN0cm9u
ZyBvcGluaW9uLiBUaGF0IFVCSSB0cmFuc2xhdGVzIHRvICJJIGRvIG5vdCBrbm93IGhvdyB0bw0K
PmRlYWwgd2l0aCBtdWx0aXBsZSByZWdpb25zIiwgbm90aGluZyBlbHNlLg0KPg0KPkkgdGhpbmsg
dGhpcyB3YXMgbXkgdW5kZXJzdGFuZGluZyBvZiBudW1lcmFzZXJlZ2lvbnMNCj4NCj4xLiBudW1h
cmFzZXJlZ2lvbnM9MDogbm8gcmVnaW9ucywganVzdCB1bmlmb3JtIGZsYXNoLg0KPg0KPjIuIG51
bWVyYXNlcmVnaW9ucz0xOiBiYXNpY2FsbHkgc2FtZSBhcyBhYm92ZSwgYnV0IGZyaWVuZGxpZXIg
dG8gdGhlIHJlZ2lvbi0NCj5hd2FyZSBzb2Z0d2FyZS4gSW5kZWVkLCBpZiBJIGNhcmUgYWJvdXQg
cmVnaW9ucywgSSBkbyBub3Qgd2FudCB0byBoYW5kbGUgdGhlDQo+c3BlY2lhbCBjYXNlIG9mIG51
bWVyYXNlcmVpb25zPTAsIEkgd2FudCBhIGNvbW1vbiBjYXNlIHdpdGgNCj5udW1lcmFzZXJlaW9u
dHM+MC4NCj4NCj5PciB0byBwdXQgaXQgdGhpcyB3YXksIGZyb20gdGhlIGRyaXZlcnMnIHdyaXRl
ciBQT1c6DQo+DQo+bnVtYXJhc2VyZWdpb25zPTAgLSBkbyBub3Qga25vdyBhbnl0aGluZyBhYm91
dCByZWdpb25zLCBkbyBub3QgY2FyZS4NCj5BbHNvIHByZS1yZWdpb25zIGRpcml2ZXJzLCBvbGQg
c3R1ZmYNCj4NCj5udW1lcmFzZXJlZ2lvbnM9MSAtIEkgd2FudCBteSBkcml2ZXIgdG8gYmUgaWRl
YWwuIE5vbi1hd2FyZSBTVyB3b24ndCBsb29rIHRvDQo+dGhlIHJlZ2lvbnMgc3R1ZmYsIHRoZSBh
d2FyZSBTVyB3aWxsIHdvcmsgbmljZWx5Lg0KPg0KPlNvIG15IHRha2UgaXM6IGJhbiBudW1lcmFz
ZXJlZ2lvbnM9MSBpZiB5b3UgZmVlbCBsaWtlLCBidXQgSSByZWNvbW1lbmQgdG8ganVzdA0KPmRv
Y3VtZW50IHRoZSAwIChkb24ndCBjYXJlL2xlZ2FjeSkgYW5kIDEgKHNhbWUgYXMgMCwgYnV0IGNh
cmUpIGFuZCBhbGxvdyBmb3INCj5ib3RoLg0KPg0KPkFydGVtLg0K
