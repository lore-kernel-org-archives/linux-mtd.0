Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlPNF-0001OC-0B
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 22:13:33 +0000
Received: from dovecot03.posteo.de (unknown [185.67.36.28])
 by mx02.posteo.de (Postfix) with ESMTPS id 5285F1F46581
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 00:12:57 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3lXtDT5MQbz5vN0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 00:12:57 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] Makefile: fix build against musl
Date: Fri, 24 Apr 2015 00:12:52 +0200
Message-Id: <1429827173-1739-2-git-send-email-joerg.krause@embedded.rocks>
In-Reply-To: <1429827173-1739-1-git-send-email-joerg.krause@embedded.rocks>
References: <1429827173-1739-1-git-send-email-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rml4IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gJ2xpYmludGxfZ2V0dGV4dCcuCgpTaWduZWQtb2Zm
LWJ5OiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5yb2Nrcz4KLS0tCiBNYWtl
ZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggZWFkZTIzNC4uMzZiYjcw
MCAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTEwNSw3ICsxMDUsNyBA
QCAkKGNhbGwgX21rZGVwLGxpYi8sbGlibXRkLmEpCiBvYmotbWtmcy51YmlmcyA9IGNyYzE2Lm8g
bHB0Lm8gY29tcHIubyBkZXZ0YWJsZS5vIFwKIAloYXNodGFibGUvaGFzaHRhYmxlLm8gaGFzaHRh
YmxlL2hhc2h0YWJsZV9pdHIubwogTERGTEFHU19ta2ZzLnViaWZzID0gJChaTElCTERGTEFHUykg
JChMWk9MREZMQUdTKSAkKFVVSURMREZMQUdTKQotTERMSUJTX21rZnMudWJpZnMgPSAtbHogLWxs
em8yIC1sbSAtbHV1aWQKK0xETElCU19ta2ZzLnViaWZzID0gLWx6IC1sbHpvMiAtbG0gLWx1dWlk
IC1saW50bAogJChjYWxsIG1rZGVwLG1rZnMudWJpZnMvLG1rZnMudWJpZnMsLHViaS11dGlscy9s
aWJ1YmkuYSkKIAogIwotLSAKMi4zLjYKCg==
