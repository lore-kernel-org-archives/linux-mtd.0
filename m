From: H Hartley Sweeten <hartleys@visionengravers.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Thu, 29 Apr 2010 15:06:37 -0500
Subject: Potential namespace problem for 'struct flash_platfrom_data'
Message-ID: <0D753D10438DA54287A00B0270842697636E305F88@AUSP01VMBX24.collaborationhost.net>
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

SGVsbG8gYWxsLA0KDQpJIHdhcyBsb29raW5nIGF0IGFuIGlzc3VlIHdpdGggYSBzcGkgZmxhc2gg
ZGV2aWNlIGFuZCBub3RpY2VkIGENCnBvdGVudGlhbCBuYW1lc3BhY2UgcHJvYmxlbS4NCg0KYXJj
aC9hcm0vaW5jbHVkZS9hc20vbWFjaC9mbGFzaC5oIGhhcyB0aGlzOg0KDQpzdHJ1Y3QgZmxhc2hf
cGxhdGZvcm1fZGF0YSB7DQoJY29uc3QgY2hhcgkqbWFwX25hbWU7DQoJY29uc3QgY2hhcgkqbmFt
ZTsNCgl1bnNpZ25lZCBpbnQJd2lkdGg7DQoJaW50CQkoKmluaXQpKHZvaWQpOw0KCXZvaWQJCSgq
ZXhpdCkodm9pZCk7DQoJdm9pZAkJKCpzZXRfdnBwKShpbnQgb24pOw0KCXZvaWQJCSgqbW1jb250
cm9sKShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHN5bmNfcmVhZCk7DQoJc3RydWN0IG10ZF9w
YXJ0aXRpb24gKnBhcnRzOw0KCXVuc2lnbmVkIGludAlucl9wYXJ0czsNCn07DQoNCmFuZCBpbmNs
dWRlL2xpbnV4L3NwaS9mbGFzaC5oIGhhcyB0aGlzOg0KDQpzdHJ1Y3QgZmxhc2hfcGxhdGZvcm1f
ZGF0YSB7DQoJY2hhcgkJKm5hbWU7DQoJc3RydWN0IG10ZF9wYXJ0aXRpb24gKnBhcnRzOw0KCXVu
c2lnbmVkIGludAlucl9wYXJ0czsNCg0KCWNoYXIJCSp0eXBlOw0KDQoJLyogd2UnbGwgbGlrZWx5
IGFkZCBtb3JlIC4uLiB1c2UgSkVERUMgSURzLCBldGMgKi8NCn07DQoNClNob3VsZCBhbnl0aGlu
ZyBiZSBkb25lPw0KDQpSZWdhcmRzLA0KSGFydGxleQ==
