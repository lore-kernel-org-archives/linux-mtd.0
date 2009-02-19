Received: from smtpbg93.qq.com ([119.147.10.252])
	by casper.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1La87g-0006F4-Hx
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 12:35:28 +0000
From: "=?ISO-8859-1?B?ZXE2MTM=?=" <eq613@qq.com>
To: "=?ISO-8859-1?B?bGludXgtbXRk?=" <linux-mtd@lists.infradead.org>
Sender: eq613@qq.com
Subject: how to get mtd partitions info in chip->ecc.read_page 
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Thu, 19 Feb 2009 20:27:15 +0800
Message-ID: <tencent_775DAF1410FC6C15664A8A35@qq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

aW4gdGhlIHJlYWRfcGFnZSBmdW5jdGlvbiwgSSB3YW50IHRvIGRvIHNvbWUgc3BlY2lhbCBm
b3IgZGlmZmVyZW50IG5hbmQgcGFydGl0aW9uLCBidXQgdGhlIA0KY2hpcC0+ZWNjLnJlYWRf
cGFnZShtdGQsIGNoaXAsIGJ1ZnBvaSk7IC8vbXRkPXNsYXZlLT5tYXN0ZXIsIGJ1dCBpIHdh
bnQgZ2V0IHRoZSBtdGRfaW5mbyBvZiBzbGF2ZSANCg0KaXMgdGhlcmUgc29tZSBtZXRob3Jk
ID8NCg0Kc3RydWN0IG10ZF9wYXJ0IHsNCiBzdHJ1Y3QgbXRkX2luZm8gbXRkOyAgLy93YW50
IHRoaXMgDQogc3RydWN0IG10ZF9pbmZvICptYXN0ZXI7ICAgIC8vIGJ1dCBnZXQgdGhpcyAN
CiB1X2ludDMyX3Qgb2Zmc2V0Ow0KIGludCBpbmRleDsNCiBzdHJ1Y3QgbGlzdF9oZWFkIGxp
c3Q7DQogaW50IHJlZ2lzdGVyZWQ7DQp9Ow0KDQoNCnRoZSBjb250YWluZXJfb2YgZG9lcyBu
b3Qgd29yazoNCg0Kc3RydWN0IG10ZF9wYXJ0ICogIG10ZG1hc3Rlcl90b19tdGRfcGFydCgg
c3RydWN0IG10ZF9pbmZvICoqbXRkKXsNCiByZXR1cm4gY29udGFpbmVyX29mKG10ZCxzdHJ1
Y3QgbXRkX3BhcnQsbWFzdGVyKTsNCn0gDQoNCiBzdHJ1Y3QgbXRkX3BhcnQgKiBtdGRfcGFy
dD1tdGRtYXN0ZXJfdG9fbXRkX3BhcnQoJm10ZCk7DQogc3RydWN0IG10ZF9pbmZvICAgKiAg
c2xhdmVwYXJ0PShzdHJ1Y3QgbXRkX2luZm8qKShtdGRfcGFydCk7
