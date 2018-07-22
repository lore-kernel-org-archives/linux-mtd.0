Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhMrk-0004vL-QH
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2018 22:30:15 +0000
From: Theuns Verwoerd <Theuns.Verwoerd@alliedtelesis.co.nz>
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, "linux-mtd @ lists . infradead .
 org" <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Secure deletion under JFFS2
Date: Sun, 22 Jul 2018 22:29:58 +0000
Message-ID: <bc19f9b8-fccc-67e8-00af-1d83e5fd508a@alliedtelesis.co.nz>
References: <cover.1532043059.git.theuns.verwoerd@alliedtelesis.co.nz>
 <CAFLxGvyqZNLeRgxGvNNnc-zsPydYLisEB3eX0R5CVCEhEuN4QQ@mail.gmail.com>
In-Reply-To: <CAFLxGvyqZNLeRgxGvNNnc-zsPydYLisEB3eX0R5CVCEhEuN4QQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A350C2E054BAC4AB3571C2908C43D3E@atlnz.lc>
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

DQoNCk9uIDA3LzIzLzIwMTggMDc6MDYgQU0sIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToNCj4g
T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMTo1MCBBTSwgVGhldW5zIFZlcndvZXJkDQo+IDx0aGV1
bnMudmVyd29lcmRAYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+PiBTZWN1cml0eSBjZXJ0
aWZpY2F0aW9ucyBzdWNoIGFzIEZJUFMgcmVxdWlyZSB0aGUgY2FwYWJpbGl0eSB0byBzZWN1cmVs
eQ0KPj4gZGVsZXRlIGZpbGVzLCB3aGljaCBpcyBwcm9ibGVtYXRpYyB1bmRlciBKRkZTMidzIGxv
Zy1iYXNlZCBtb2RlbC4gIFdlIGNhbg0KPiBDYW4geW91IHBsZWFzZSBiZSBhIGxpdHRsZSBtb3Jl
IHNwZWNpZmljIGFib3V0IHRoZSBjZXJ0aWZpY2F0aW9ucz8NCmh0dHBzOi8vd3d3Lm5pYXAtY2Nl
dnMub3JnL0RvY3VtZW50c19hbmRfR3VpZGFuY2Uvdmlld190ZC5jZm0/dGRfaWQ9MTMzDQoNCmdp
dmVzIHNvbWUgbGV2ZWwgb2YgY29udGV4dC7CoCBJIGJlbGlldmUgYm90aCBGSVBTIGFuZCBDQyBo
YXZlIHNpbWlsYXIgDQpleHBlY3RhdGlvbnMgYXJvdW5kIGtleSBkZWxldGlvbi4NCj4gVGhlc2Ug
ZGF5cyBzZWN1cmUgZGVsZXRpb24gYXQgZmlsZSBzeXN0ZW0gbGV2ZWwgaXMgYWxtb3N0IGltcG9z
c2libGUgdG8gYWNoaWV2ZQ0KPiBzaW5jZSB5b3UgZG9uJ3QgaGF2ZSBmdWxsIGNvbnRyb2wgb2Yg
dGhlIHN0b3JhZ2Ugc3RhY2suDQo+IEkga25vdywgSSBrbm93LCBJbiB0aGUgcmF3IGZsYXNoIGNh
c2Ugd2UgaGF2ZSwgYnV0IHN0aWxsLiBJdCBtYWtlcw0KPiB0aGluZ3MgdmVyeSBjb21wbGljYXRl
ZC4NCj4NCj4gQSBjb21tb24gYXBwcm9hY2ggZG8gZGVsZXRlIGEgZmlsZSBpbiBhIHNlY3VyZSB3
YXkgaXMgaGF2aW5nIGl0DQo+IGVuY3J5cHRlZCBhbmQgdXBvbiBkZWxldGlvbg0KPiB5b3UgZm9y
Z2V0IHRoZSBrZXkuDQo+IFdvdWxkbid0IHRoYXQgd29yayBmb3IgeW91IHRvbz8NClRvIHJldGFp
biBncmFudWxhcml0eSBmb3IgbWFuYWdpbmcgaW5kaXZpZHVhbCBrZXlzLCB5b3UnZCByZXF1aXJl
IGEgMToxIA0Ka2V5LXRvLWFjY2Vzcy1rZXkgKGt0YWspLsKgIEJlY2F1c2Uga2V5cyBhcmUgZXhw
ZWN0ZWQgdG8gYmUgcGVyc2lzdGVudCwgDQpzbyBtdXN0IHRoZSBrdGFrIGJlIC0gYXQgd2hpY2gg
cG9pbnQgd2UndmUgcmVwbGFjZWQgdGhlIHJlcXVpcmVtZW50IGZvciANCnNlY3VyZWx5IGRlbGV0
aW5nIGEga2V5IHdpdGggb25lIHRvIHNlY3VyZWx5IGRlbGV0ZSBhIGt0YWsuDQooSW4gYWRkaXRp
b24sIHNpbmNlIHRoaXMgYXBwcm9hY2ggZmFsbHMgb3V0c2lkZSB0aGUgc3BlY2lmaWMgbGFuZ3Vh
Z2UgDQp1c2VkIGluIHRoZSBjZXJ0aWZpY2F0aW9uIGd1aWRhbmNlIGRvY3VtZW50cywgaXQnZCBu
ZWVkIHRvIGJlIGp1c3RpZmllZCANCmluIGRldGFpbCwgd2hpY2ggYWRkcyByaXNrLikNCg0KUmVn
YXJkcywNCg0KVGhldW5zDQpLUk4=
