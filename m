Received: from rcdn-iport-9.cisco.com ([173.37.86.80])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKSCH-0000Fj-Gh
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 18:04:58 +0000
From: "Nikunj Kela (nkela)" <nkela@cisco.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
Date: Wed, 7 Nov 2018 18:04:35 +0000
Message-ID: <591D4732-BC3E-4F85-9277-25E049FFF4BA@cisco.com>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
In-Reply-To: <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <01205EDF9E5AF841A6C38CAD04ACCD40@emea.cisco.com>
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

T24gMTEvNy8xOCwgMTowNSBBTSwgIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVhZC5v
cmc+IHdyb3RlOg0KDQogICAgT24gVHVlLCAyMDE4LTExLTA2IGF0IDEzOjQ5IC0wODAwLCBOaWt1
bmogS2VsYSB3cm90ZToNCiAgID4+IFRoaXMgcGF0Y2ggYWxsb3dzIHRoZSBlbmRpYW5uZXNzIG9m
IHRoZSBKRlNTMiBmaWxlc3lzdGVtIHRvIGJlDQogICAgPj4gc3BlY2lmaWVkIGJ5IG1vdW50IG9w
dGlvbiAnZm9yY2VfZW5kaWFuPWJpZ3xsaXR0bGV8bmF0aXZlJy4gSWYNCiAgICA+PiBlbmRpYW5u
ZXNzIGlzIG5vdCBzcGVjaWZpZWQsIGl0IGRlZmF1bHRzIHRvICduYXRpdmUnIGVuZGlhbm5lc3MN
CiAgICA+PiB0aHVzIHJldGFpbmluZyB0aGUgZXhpc3RpbmcgYmVoYXZpb3IuDQogICAgPj4gDQog
ICAgPj4gU29tZSBhcmNoaXRlY3R1cmVzIGJlbmVmaXQgZnJvbSBoYXZpbmcgYSBzaW5nbGUga25v
d24gZW5kaWFubmVzcw0KICAgID4+IG9mIEpGRlMyIGZpbGVzeXN0ZW0gKGZvciBkYXRhLCBub3Qg
ZXhlY3V0YWJsZXMpIGluZGVwZW5kZW50IG9mIHRoZQ0KICAgID4+IGVuZGlhbm5lc3Mgb2YgdGhl
IHByb2Nlc3NvciAoQVJNIHByb2Nlc3NvcnMgY2FuIGJlIHN3aXRjaGVkIHRvIGVpdGhlcg0KICAg
ID4+IGVuZGlhbm5lc3MgYXQgcnVuLXRpbWUpLg0KICAgID4+IA0KICAgID4+IFdlIGhhdmUgYm9h
cmRzIHRoYXQgYXJlIHNoaXBwZWQgd2l0aCBCRSBqZmZzMiBhbmQgQkUga2VybmVsLiBXZSBhcmUN
CiAgICA+PiBub3cgbWlncmF0aW5nIHRvIExFIGtlcm5lbC4gVGhpcyBtb3VudCBvcHRpb24gaGVs
cHMgdXMgaW4gbW91bnRpbmcNCiAgICA+PiBCRSBqZmZzMiBvbiBMRSBrZXJuZWwuDQogICAgDQog
ICAgPlRoYW5rcyBmb3IgaW1wbGVtZW50aW5nIHRoaXMuIEpGRlMyIGhhcyBvZnRlbiBiZWVuIHZl
cnkgc2Vuc2l0aXZlIHRvDQogICAgPnBlcmZvcm1hbmNlIGF0IG1vdW50IHRpbWUg4oCUIEknZCBs
b3ZlIHRvIHNlZSBob3cgdGhpcyBhZmZlY3RzIHRoZSB0aW1lDQogICAgPnRha2VuIHRvIG1vdW50
IGEgbGFyZ2UgZmlsZSBzeXN0ZW0uIElmIGl0J3Mgc2lnbmlmaWNhbnQsIHdlIG1heSB3YW50IGEN
CiAgICA+Y29uZmlnIG9wdGlvbiB0byBtYWtlIHRoaXMgY29uZGl0aW9uYWw/DQogICAgPg0KICAg
ID5BbHNvLCBwZXJoYXBzIHdlIHNob3VsZCBpbXByb3ZlIHRoZSBiZWhhdmlvdXIgd2hlbiB0aGUg
dXNlcg0KICAgID5hY2NpZGVudGFsbHkgdHJpZXMgdG8gbW91bnQgYSB3cm9uZy1lbmRpYW4gZmls
ZSBzeXN0ZW0uIElmIHdlIGNhbid0DQogICAgPmp1c3QgbWFrZSBpdCBhdXRvZGV0ZWN0IGFuZCB1
c2UgdGhlICJjb3JyZWN0IiBlbmRpYW5uZXNzLCBwZXJoYXBzIHdlDQogICAgPnNob3VsZCBhdCBs
ZWFzdCBwcmludGsgYSBtZXNzYWdlIHN1Z2dlc3RpbmcgdGhhdCB0aGUgdXNlciB0cnkgYWdhaW4N
CiAgICA+d2l0aCB0aGUgb3RoZXIgZW5kaWFubmVzcz8NCg0KSSBoYWQgdHJpZWQgdG8gdXNlIGNv
bmZpZ3MgdG8gc3RhcnQgd2l0aCB2aWEgdGhlIGZvbGxvd2luZyBwYXRjaCBob3dldmVyIEkgd2Fz
IGFkdmlzZWQgdG8gaGF2ZSBhIG1vdW50IG9wdGlvbjoNCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL3BpcGVybWFpbC9saW51eC1tdGQvMjAxOC1Ob3ZlbWJlci8wODUxMjYuaHRtbA0KDQpUaGFu
a3MsDQotTmlrdW5qDQogICAgDQoNCg==
