Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSKhI-0005hN-7M
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 06:18:52 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Lee Jones <lee.jones@linaro.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: New NAND driver
Date: Tue, 25 Mar 2014 06:18:16 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB561C@DBDE04.ent.ti.com>
References: <20140324132446.GA21665@lee--X1>
In-Reply-To: <20140324132446.GA21665@lee--X1>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "angus.clark@st.com" <angus.clark@st.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@stlinux.com" <kernel@stlinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGksDQoNCj5Gcm9tOiBMZWUgSm9uZXMNCj4NCj5IaSBCcmlhbiwNCj4NCj5GaXJzdGx5IEknZCBs
aWtlIHRvIHRoYW5rIHlvdSBmb3Igc3VwcG9ydGluZyB0aGUgaW5jbHVzaW9uIG9mIFNUJ3MgU1BJ
DQo+Tk9SIChGU00pIGRyaXZlci4gQXMgcHJvbWlzZWQgSSB3aWxsIGNvbnZlcnQgaXQgb3ZlciB0
byB0aGUgbmV3DQo+ZnJhbWV3b3JrIG9uY2UgaXQgaGFzIGJlZW4gYXBwbGllZCBieSB5b3VyIGdv
b2Qgc2VsZi4NCj4NCj5JbiB0aGUgbWVhbnRpbWUgaG93ZXZlciwgSSBoYXZlIGEgTkFORCBkcml2
ZXIgd2hpY2ggSSBuZWVkIHRvDQo+c3VibWl0LiBJIHdhbnRlZCB0byBnaXZlIHlvdSBhIGhlYWRz
LXVwIHByaW9yIHRvIHNlbmRpbmcgaXQgaW4gY2FzZQ0KPnlvdSBoYWQgYW55IHNwZWNpYWwgcmVx
dWVzdHMuIEZZSTogU2hvdmluZyBpdCB3aGVyZSB0aGUgc3VuIGRvbid0DQo+c2hpbmUsIGlzIG5v
dCBhIHZhbGlkIHJlcXVlc3QgYnkgdGhlIHdheSA6KS4gSXQncyAyNzAwIGxpbmVzIGFuZCBJJ3Zl
DQo+c3BsaXQgaXQgb3ZlciA0NyBwYXRjaGVzIGZvciByZXZpZXdpbmcgcHVycG9zZXMuDQo+DQpX
aWxsIGl0IGJlIHBvc3NpYmxlIGZvciB5b3UgdG8gc2VuZCB0aGUgcGF0Y2hlcyBzcGxpdCBpbiBv
bmUgcGF0Y2ggcGVyIGZpbGUgPw0KQXMgc3dpdGNoaW5nIGJhY2sgYW5kIGZvcnRoLCBiZXR3ZWVu
IDQ3IHBhdGNoZXMgbWF5IGJlIGJpdCB0cm91Ymxlc29tZS4NCkxhdGVyIHlvdSBtYXkgc3BsaXQg
aXQgYXMgeW91IG9yIG90aGVycyBsaWtlLi4NCg0KPlNvcnJ5IHRvIGRvIHRoaXMgdG8geW91IEJy
aWFuLCBJIGFtIHNlbnNpdGl2ZSB0byBob3cgb3Zlci1idXJkZW5lZCB5b3UNCj5hcmUgd2l0aCB0
aGUgc3Vic3lzdGVtIGFscmVhZHkuIFBlcmhhcHMgaXQgbWlnaHQgbWFrZSBzZW5zZSB0byBwdXQg
b3V0DQo+YSBwbGVhIGZvciB2b2x1bnRlZXJzIHRvIGhlbHAgd2l0aCBtYWludGFpbiBNVEQgc3Vi
c3lzdGVtIG9uIExLTUw/DQo+DQpJIGNhbiBoZWxwIHJldmlld2luZyB0aG9zZSBwYXRjaGVzLCBp
ZiB5b3UgY2FuIHBsZWFzZSBzaGFyZSB5b3VyDQpjb250cm9sbGVyIHNwZWNzLCBhbmQgYWxzbyBz
aGFyZSBpZiB0aGVyZSBhcmUgYW55IGFscmVhZHkga25vdw0KaGFyZHdhcmUgbGltaXRhdGlvbnMu
DQoNCj5Bbnl3YXksIHdoYXQncyB0aGUgYmVzdCB0aGluZyB0byBkbyBpbiB0aGlzIGluc3RhbmNl
PyBTaG91bGQgSSBqdXN0DQo+c2VuZCBpdCB0byB0aGUgbGlzdCBhcyBhbiBSRkMgYW5kIGJlIGRv
bmUgd2l0aCBpdD8NCj4NCg0Kd2l0aCByZWdhcmRzLCBwZWtvbg0K
