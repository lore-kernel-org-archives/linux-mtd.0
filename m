Received: from g5t0007.atlanta.hp.com ([15.192.0.44])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtXzA-0004yF-0W
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 04:44:12 +0000
Received: from G6W1798G.americas.hpqcorp.net (g6w1798g.atlanta.hp.com
	[16.230.17.175]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by g5t0007.atlanta.hp.com (Postfix) with ESMTPS id 1F0D4149D7
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Aug 2011 04:44:09 +0000 (UTC)
From: "Fryar, Jeff" <jeff.fryar@hp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 17 Aug 2011 05:42:31 +0100
Subject: RE: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
Message-ID: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6D135FA4@GVW0547EXC.americas.hpqcorp.net>
References: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
	<CAMjpGUc4SMSvU3mHjeZ6oq=2K8tvuYVcEOjpE9vPfYnL7DZByA@mail.gmail.com>
In-Reply-To: <CAMjpGUc4SMSvU3mHjeZ6oq=2K8tvuYVcEOjpE9vPfYnL7DZByA@mail.gmail.com>
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

U3VnZ2VzdGVkIGZpeCAobm93IHdpdGggbW9yZSB3aGl0ZXNwYWNlKSAgOikNCg0KSmVmZiBGcnlh
ciA8amVmZi5mcnlhciBhdCBocC5jb20+DQoNCg0KLS0tIG10ZC11dGlscy1mMWZlODY1L25hbmR3
cml0ZS5jLk9SSUcgIDIwMTEtMDctMjAgMDA6Mjg6NTIuMDAwMDAwMDAwIC0wNTAwDQorKysgbXRk
LXV0aWxzLWYxZmU4NjUvbmFuZHdyaXRlLmMgICAgICAgMjAxMS0wOC0xMSAwOToxOToxMi4wMDAw
MDAwMDAgLTA1MDANCkBAIC02NTksNyArNjU5LDcgQEANCiAgICAgICAgICAgICAgICAgICAgICAg
IGZwcmludGYoc3RkZXJyLCAiRXJhc2luZyBmYWlsZWQgd3JpdGUgZnJvbSAlIzA4bGx4IHRvICUj
MDhsbHhcbiIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2Nrc3RhcnQsIGJs
b2Nrc3RhcnQgKyBlYnNpemVfYWxpZ25lZCAtIDEpOw0KICAgICAgICAgICAgICAgICAgICAgICAg
Zm9yIChpID0gYmxvY2tzdGFydDsgaSA8IGJsb2Nrc3RhcnQgKyBlYnNpemVfYWxpZ25lZDsgaSAr
PSBtdGQuZWJfc2l6ZSkgew0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAobXRk
X2VyYXNlKG10ZF9kZXNjLCAmbXRkLCBmZCwgbXRkLmViX3NpemUpKSB7DQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChtdGRfZXJhc2UobXRkX2Rlc2MsICZtdGQsIGZkLCAoaSAv
IG10ZC5lYl9zaXplKSkpIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgZXJybm9fdG1wID0gZXJybm87DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3lzX2Vycm1zZygiJXM6IE1URCBFcmFzZSBmYWlsdXJlIiwgbXRkX2RldmljZSk7
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycm5vX3RtcCAh
PSBFSU8pIHsNCg0K
