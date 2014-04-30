From: "Gupta, Pekon" <pekon@ti.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: RE: [RFC 07/47] mtd: nand: stm_nand_bch: initialise the BCH Controller
Date: Wed, 30 Apr 2014 10:59:33 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC6A35@DBDE04.ent.ti.com>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <1395735604-26706-8-git-send-email-lee.jones@linaro.org>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5CB7@DBDE04.ent.ti.com>
 <20140430102244.GK29462@lee--X1>
In-Reply-To: <20140430102244.GK29462@lee--X1>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "angus.clark@st.com" <angus.clark@st.com>,
 "kernel@stlinux.com" <kernel@stlinux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Ezequiel Garcia \(ezequiel.garcia@free-electrons.com\)"
 <ezequiel.garcia@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PkZyb206IExlZSBKb25lcyBbbWFpbHRvOmxlZS5qb25lc0BsaW5hcm8ub3JnXQ0KPj5PbiBXZWQs
IDI2IE1hciAyMDE0LCBHdXB0YSwgUGVrb24gd3JvdGU6DQpbLi4uXQ0KDQo+PiA+KwkvKiBSZXNl
dCBhbmQgZGlzYWJsZSBib290LW1vZGUgY29udHJvbGxlciAqLw0KPj4gPisJd3JpdGVsKEJPT1Rf
Q0ZHX1JFU0VULCBuYW5kaS0+YmFzZSArIE5BTkRCQ0hfQk9PVEJBTktfQ0ZHKTsNCj4+ID4rCXVk
ZWxheSgxKTsNCj4+ID4rCXdyaXRlbCgweDAwMDAwMDAwLCBuYW5kaS0+YmFzZSArIE5BTkRCQ0hf
Qk9PVEJBTktfQ0ZHKTsNCj4+DQo+PiBXaHkgdXNpbmcgJ3VkZWxheScgPw0KPj4gSXNuJ3QgdGhl
cmUgYW55IHN0YXR1cyByZWdpc3RlciB3aGljaCB0ZWxscyB5b3UgdGhhdCBjb250cm9sbGVyIGlz
IHJlc2V0IC8gaW5pdGlhbGl6ZWQgPw0KPj4gT3IgbWF5IGJlIHBvbGxpbmcgb24gTkFOREJDSF9C
T09UQkFOS19DRkcgbWF5IGl0c2VsZiBnaXZlIHlvdSBzdGF0dXMuDQo+DQo+RG9jdW1lbmF0aW9u
IHNheXM6DQo+DQo+ICAiVGhlIHNvZnQgcmVzZXQgYml0IGhhcyB0byBiZSByZXNldCB0byDigJgw
4oCZIHRvIGRlLWFzc2VydCB0aGUgc29mdA0KPiAgIHJlc2V0LiBUaGUgc29mdCByZXNldCBiaXQg
aXMgZXhwZWN0ZWQgdG8gYmUgYXNzZXJ0ZWQgZm9yIGF0IGxlYXN0DQo+ICAgb25lIGNsb2NrIGN5
Y2xlIGZvciBwcm9wZXIgcmVzZXQiDQo+DQpUaGF04oCZcyB0aGUgaGFyZHdhcmUgd2F5IG9mIHNh
eWluZyB0aGF0ICdlbmFibGUgdGhlIGNsb2NrIGJlZm9yZSBhcHBseWluZyByZXNldCcuDQpDbG9j
ayBpcyByZXF1aXJlZCB0byBwcm9wYWdhdGUgcmVzZXQtbG9naWMgdG8gZmxpcC1mbG9wcyBpbiBw
aXBlbGluZSwgd2hpY2ggZG8gbm90IGdldCBkaXJlY3QgcmVzZXQuDQoNCkhvd2V2ZXIgdGhhdCBh
cGFydC4gWW91IG1heSBzYWZlbHkgZHJvcCB1ZGVsYXkoMSkgYmVjYXVzZSB0aGlzICd1ZGVsYXkn
IGlzIGF0DQpDUFUgc2lkZSBhbmQgd29uJ3QgZ3VhcmFudGVlIGFueXRoaW5nIGFib3V0IGNsb2Nr
cyBhdCB5b3VyIGNvbnRyb2xsZXIgc2lkZS4NCkJ1dCBJIGxlYXZlIGl0IHRvIHlvdSBhcyB0aGlz
IGRlbGF5IGlzIHByZXR0eSBzbWFsbC4NCg0KDQp3aXRoIHJlZ2FyZHMsIHBla29uDQo=
