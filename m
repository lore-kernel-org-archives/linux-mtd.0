Received: from rcdn-iport-2.cisco.com ([173.37.86.73])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKoca-0004GR-EK
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 18:01:41 +0000
From: "Nikunj Kela (nkela)" <nkela@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard.weinberger@gmail.com>
CC: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, "xe-linux-external(mailer list)"
 <xe-linux-external@cisco.com>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Date: Thu, 8 Nov 2018 18:01:23 +0000
Message-ID: <B1D7CC34-C9D3-4745-94A1-3F713C1CB216@cisco.com>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
 <CAFLxGvz8QgK1P6d-_biSRk4fyYEobio315_tUP+cRXTvt+m1hA@mail.gmail.com>
 <01b82f6eb37b674effc6c8b0fa4a014deb401a85.camel@infradead.org>
In-Reply-To: <01b82f6eb37b674effc6c8b0fa4a014deb401a85.camel@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0D312EDA69CD6469B06F9880DD80453@emea.cisco.com>
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

DQpPbiAxMS84LzE4LCAxMjoxMiBBTSwgIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVh
ZC5vcmc+IHdyb3RlOg0KDQogICAgT24gV2VkLCAyMDE4LTExLTA3IGF0IDE5OjE0ICswMTAwLCBS
aWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6DQogICAgPiBPbiBXZWQsIE5vdiA3LCAyMDE4IGF0IDc6
MDUgUE0gTmlrdW5qIEtlbGEgKG5rZWxhKSA8bmtlbGFAY2lzY28uY29tPiB3cm90ZToNCiAgICA+
ID4gSSBoYWQgdHJpZWQgdG8gdXNlIGNvbmZpZ3MgdG8gc3RhcnQgd2l0aCB2aWEgdGhlIGZvbGxv
d2luZyBwYXRjaCBob3dldmVyIEkgd2FzIGFkdmlzZWQgdG8gaGF2ZSBhIG1vdW50IG9wdGlvbjoN
CiAgICA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8y
MDE4LU5vdmVtYmVyLzA4NTEyNi5odG1sDQogICAgPiANCiAgICA+IEp1c3Qgc2hvdyBwZXJmb3Jt
YW5jZSBudW1iZXJzIG9uIGhvdyB5b3VyIGltcGxlbWVudGF0aW9uIGhhcyBhbiBpbXBhY3Qgb3Ig
bm90Lg0KICAgID4gU28gZmFyIHlvdXIgaW1wbGVtZW50YXRpb24gaXMgYWxzbyBub3QgbXVjaCBv
cHRpbWl6ZWQsIG1heWJlIGxpa2VseSgpDQogICAgPiBvciBzdGF0aWMga2V5cyBjYW4gaGVscC4u
Lg0KICAgIA0KICAgIFVzaW5nIGxpa2VseSgpIGZvciB0aGUgbmF0aXZlIGNhc2UgbWlnaHQgaGVs
cC4gU3RhdGljIGtleXMgbWlnaHQgaGVscCBhDQogICAgbGl0dGxlIG1vcmUsIGJ1dCBjb3VsZCBv
bmx5IHdvcmsgaWYgZXZlcnkgZmlsZSBzeXN0ZW0gaGFzIHRoZSAqc2FtZSoNCiAgICBlbmRpYW5u
ZXNzLiBVbmxlc3Mgd2UgZW5kIHVwIHdpdGggdGhyZWUgdmFyaWFudHMsIGZvciBuYXRpdmUgdnMu
IHN3YXANCiAgICB2cy4gcnVudGltZSBjaGVja2luZy4NCiAgICANCiAgICBXZSBhbHNvIGxvc2Ug
YSBidW5jaCBvZiB0aGUgb3B0aW1pc2F0aW9ucyB0aGF0IHdlIGdhaW5lZCBmcm9tIHVzaW5nDQog
ICAgX19idWlsdGluX3N3YWIgZnVuY3Rpb25zLCB3aGljaCBsZXQgdGhlIGNvbXBpbGVyIHNlZSB3
aGF0IHdhcyBnb2luZyBvbi4NCiAgICANCiAgICBCdXQgd2UgY2FuIGh5cG90aGVzaXNlIGFuZCBo
YW5kd2F2ZSBhYm91dCBpdCB1bnRpbCB0aGUgY293cyBjb21lIGhvbWU7DQogICAgSSdkIGxpa2Ug
dG8gc2VlIGEgcmVhbCB0ZXN0IG9mIHdoZXRoZXIgaXQgYWN0dWFsbHkgbWFrZXMgYSBkaWZmZXJl
bmNlDQogICAgdGhhdCB3ZSBjYXJlIGFib3V0Lg0KICAgIA0KICAgIElmIGl0IGRvZXMsIG9uZSBv
cHRpb24gbWlnaHQgYmUgdG8ganVzdCBidWlsZCBzZXBhcmF0ZSB2ZXJzaW9ucyBvZg0KICAgIHNj
YW4uYyBmb3IgZWFjaCBlbmRpYW5uZXNzLCBzaW5jZSB0aGF0J3MgdGhlIGNyaXRpY2FsIHBhdGgg
d2UgY2FyZQ0KICAgIGFib3V0Lg0KDQpJIHdvbmRlciBpZiB0aGlzIGZlYXR1cmUgaXMgcmVhbGx5
IHRoYXQgaW1wb3J0YW50IHRoYXQgd2UgbmVlZCB0byBkdXBsaWNhdGUgdGhlIGRyaXZlcnMuDQpB
bHNvLCBpdCBtaWdodCB0YWtlIHNvbWUgdGltZSBmb3IgbWUgdG8gZmluZCBzb21lIGRldmljZSB0
aGF0IEkgY2FuIHJ1biB0aGUgdGVzdHMgd2l0aCBhbmQgd2l0aG91dCB0aGlzIHBhdGNoLg0KSSBh
bSB3b25kZXJpbmcgaWYgd2UgY2FuIHN0aWxsIGNvbnNpZGVyIG15IGZpcnN0IHBhdGNoIHdpdGgg
Y29uZmlnIG9wdGlvbnMgYXMgYSBnb29kIGNvbXByb21pc2Ugb24gaXQ/DQogICAgDQoNCg==
