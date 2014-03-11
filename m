Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNJlm-0007G1-TT
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 10:18:47 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: RE: [PATCH v6 0/4] mtd: devices: elm: add checks ELM H/W
 constrains, driver code cleanup
Date: Tue, 11 Mar 2014 10:18:12 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB169A@DBDE04.ent.ti.com>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
 <20140311101342.GA18811@lee--X1>
In-Reply-To: <20140311101342.GA18811@lee--X1>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PkZyb206IExlZSBKb25lcyBbbWFpbHRvOmxlZS5qb25lc0BsaW5hcm8ub3JnXQ0KPg0KPj4gKmNo
YW5nZXMgdjUgLT4gdjYqDQo+PiBbUEFUQ0ggMDIvMDRdIG1pbm9yIGNsZWFudXANCj4+DQo+PiAq
Y2hhbmdlcyB2NCAtPiB2NSoNCj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHNwbGl0IHZlcnNpb24g
ZnJvbSBlYXJsaWVyIHNlcmllcyBbMV0uDQo+PiBUaGlzIHNlcmllcyByZWZhY3RvcnMgYW5kIGNs
ZWFucyBFTE0gZHJpdmVyIHdoaWNoIGlzIHVzZWQgYnkgSGFyZHdhcmUNCj4+IGJhc2VkIEJDSHgg
ZWNjLXNjaGVtZXMuDQo+PiAgLSBVbmRvOiBpbnRyb2R1Y3Rpb24gb2YgJ3N0cnVjdCBtdGRfaW5m
bycgYW5kICdzdHJ1Y3QgbmFuZF9jaGlwJy4gSW5zdGVhZA0KPj4gICAgICAgICAga2VlcCBFTE0g
ZHJpdmVyIGluZGVwZW5kZW50IG9mIG10ZF9pbmZvIGFuZCBuYW5kX2NoaXAgc3RydWN0cyBhbmQN
Cj4+ICAgICAgICAgIHBhc3Mgb25seSByZXF1aXJlZCBFQ0MgY29uZmlndXJhdGlvbnMgYXMgZWxt
X2NvbmZpZygpIGFyZ3VtZW50cw0KPj4gICAgICAgICAgZWxtX2NvbmZpZyguLi4sIGludCBlY2Nf
c3RlcHMsIGludCBlY2Nfc3RlcF9zaXplLCBpbnQgZWNjX3N0ZXBfYnl0ZXMpDQo+PiAgLSBVbmRv
OiByZS13cml0aW5nIG9mIGVsbV9sb2FkX3N5bmRyb21lKCkgRUNDIHJlZ2lzdGVyIGNvbmZpZ3Vy
YXRpb25zLg0KPj4NCj4+ICpjaGFuZ2VzIHYzIC0+IHY0IFsxXSoNCj4+ICAtIGluLWNvcnBvcmF0
ZWQgZmVlZGJhY2tzIGZyb20gQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5j
b20+DQo+PiAgLSB1cGRhdGVkOiB1c2UgJ3ByX2ZtdChmbXQpJyB0byBzdWZmaXggRFJJVkVSX05B
TUUNCj4+ICAtIHJlbW92ZWQ6IGxvY2FsICdlY2NzdGVwcycgaW4gRUxNIGRyaXZlciwgaW5zdGVh
ZCB1c2luZyBuYW5kX2NoaXAtPmVjYy5zdGVwcw0KPj4gIC0gdW5kbzogaXJyZWxhdmFudCB3aGl0
ZS1zcGFjZSBjaGFuZ2VzDQo+Pg0KPj4gWzFdIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3Bp
cGVybWFpbC9saW51eC1tdGQvMjAxMy1Ob3ZlbWJlci8wNTAyNDIuaHRtbA0KPj4NCj4+IFBla29u
IEd1cHRhICg0KToNCj4+ICAgbXRkOiBkZXZpY2VzOiBlbG06IGNoZWNrIGZvciBoYXJkd2FyZSBl
bmdpbmUncyBkZXNpZ24gY29uc3RyYWlucw0KPj4gICBtdGQ6IGRldmljZXM6IGVsbTogY2xlYW4g
ZWxtX2xvYWRfc3luZHJvbWUNCj4+ICAgbXRkOiBkZXZpY2VzOiBlbG06IGNvbmZpZ3VyZSBwYXJh
bGxlbCBjaGFubmVscyBiYXNlZCBvbiBlY2Nfc3RlcHMNCj4+ICAgbXRkOiBkZXZpY2VzOiBlbG06
IHVwZGF0ZSBEUklWRVJfTkFNRSBhcyAib21hcC1lbG0iDQo+Pg0KPj4gIGRyaXZlcnMvbXRkL2Rl
dmljZXMvZWxtLmMgICAgICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLQ0KPj4gIGRyaXZlcnMvbXRkL25hbmQvb21hcDIuYyAgICAgICAgICB8ICA5ICsrKysr
LS0tDQo+PiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL2VsbS5oIHwgMTAgKystLS0tLS0t
DQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkN
Cj4NCj5JIGNhbid0IHNlZW0gdG8gYmUgYWJsZSB0byBhcHBseSB0aGlzIHNldC4gV2hhdCBrZXJu
ZWwgcmVsZWFzZSBpdCBpcw0KPmJhc2VkIG9uPw0KPg0KVGhpcyBpcyByZWJhc2VkIG9uIGwyLW10
ZC9tYXN0ZXIuIFlvdSBjYW4gYWxzbyBwdWxsIGZyb20gWzFdDQoNClsxXSBodHRwOi8vZ2l0LnRp
LmNvbS9+cGVrb24vY29ubmVjdGl2aXR5LWludGVncmF0aW9uLXRyZWUvcGVrb25zLWNvbm5lY3Rp
dml0eS10aS1saW51eC1rZXJuZWwvY29tbWl0cy9sMi1tdGQvYmNoMTZfc3VwcG9ydA0KDQoNCndp
dGggcmVnYXJkcywgcGVrb24NCg==
