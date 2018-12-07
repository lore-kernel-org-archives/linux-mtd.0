Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVDH2-0001AW-T4
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 10:22:23 +0000
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Christophe KERELLO
 <christophe.kerello@st.com>
CC: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Vasut
 <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?TWlxdcOobCBSYXluYWw=?= <miquel.raynal@bootlin.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [ v3 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2
 NAND flash controller driver
Date: Fri, 7 Dec 2018 10:21:38 +0000
Message-ID: <dafcda21-fceb-1577-7f1c-41f1009b99a7@st.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
 <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
In-Reply-To: <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <078A5EA132870140BCEA3C0D522F978E@st.com>
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

DQpPbiAxMi83LzE4IDEwOjA2IEFNLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0KPiBIaSBDaHJpc3Rv
cGhlLA0KPg0KPiBPbiBUaHUsIE5vdiAyOSwgMjAxOCBhdCA1OjQyIFBNIENocmlzdG9waGUgS2Vy
ZWxsbw0KPiA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGU6DQo+DQo+PiArLyogRk1D
MiBDb250cm9sbGVyIFJlZ2lzdGVycyAqLw0KPj4gKyNkZWZpbmUgRk1DMl9CQ1IxICAgICAgICAg
ICAgICAgICAgICAgIDB4MA0KPj4gKyNkZWZpbmUgRk1DMl9QQ1IgICAgICAgICAgICAgICAgICAg
ICAgIDB4ODANCj4gKC4uLikNCj4+ICsvKiBSZWdpc3RlcjogRk1DMl9CQ1IxICovDQo+PiArI2Rl
ZmluZSBGTUMyX0JDUjFfRk1DMkVOICAgICAgICAgICAgICAgQklUKDMxKQ0KPiBXZWxsIHRoaXMg
bG9va3MgbGlrZSBhbiBlc3BlY2lhbGx5IGNsZXZlciByZWdpc3RlciBtYXAgYW5kIGEgc3BlY2lm
aWMgY2hvaWNlDQo+IG9mIGJpdCAzMSBpbiB0aGUgZmlzdCByZWdpc3RlciB0byBhY3RpdmF0ZSBG
TUMyLiBSZWdpc3RlcnMgMHgwNCB0aHJ1DQo+IDB4N2MgYXJlIGNvbXBsZXRlbHkgdW51c2VkIHNh
dmUgZm9yIG9uZSBiaXQuDQo+DQo+IEl0J3MgYWxtb3N0IGxpa2UgdGhpcyBpcyB0aGUgZ29vZCBv
bGQgRlNNQyBpbnRlZ3JhdGVkIGluIHBhcmFsbGVsIHdpdGggRk1DMiwNCj4gc28gdGhhdCBpZiB5
b3UgZG9uJ3Qgc2V0IGJpdCAzMSwgdGhpcyBiZWNvbWVzIHNvbWV0aGluZyB0aGF0IGNhbiBiZSB1
c2VkDQo+IHdpdGggZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMsIGFuZCBGTUMyIG1v
ZGUgaXMgYWN0aXZhdGVkDQo+IGJ5IHNldHRpbmcgdGhpcyBiaXQsIGFjdGl2YXRpbmcgYWxsIHRo
ZSBuZXcgcmVnaXN0ZXJzLg0KPg0KPiBJdCB3b3VsZG4ndCBzdXJwcmlzZSBtZSBnaXZlbiBob3cg
SFcgZGVzaWduZXJzIGxpa2UgdG8gd29yay4NCj4NCj4gSXMgdGhpcyB0aGUgY2FzZT8NCg0KTm8s
IGl0IGlzIHRoZSBzYW1lIHN0b3J5IHRoYW4gZm9yIHN0bWZ4IGRyaXZlciwgaXQgbG9va3MgdG8g
YmUgdGhlIHNhbWUgDQpmcm9tIHJlZ2lzdGVycw0KDQpwb2ludCBvZiB2aWV3IGJ1dCBpbnRlcm5h
bCBoYXJkd2FyZSBibG9jayBkZXNpZ24gaXMgY29tcGxldGVseSBkaWZmZXJlbnQuDQoNCj4NCj4g
SWYgdGhhdCBpcyB0aGUgY2FzZSBJIHRoaW5rIGl0IHNob3VsZCBhdCBsZWFzdCBiZSBtZW50aW9u
ZWQgaW4gY29tbWl0DQo+IGxvZ3MgYW5kIERUIGJpbmRpbmdzIGFuZCBwb3NzaWJseSBpbiBhIGNv
bW1lbnQgb24gdGhlIGRyaXZlcg0KPiBpdHNlbGYuDQo+DQo+IFlvdXJzLA0KPiBMaW51cyBXYWxs
ZWlqDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IExpbnV4LXN0bTMyIG1haWxpbmcgbGlzdA0KPiBMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tDQo+IGh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
