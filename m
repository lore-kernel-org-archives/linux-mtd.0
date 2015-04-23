Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlPNF-0001OB-2T
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 22:13:33 +0000
Received: from dovecot03.posteo.de (unknown [185.67.36.28])
 by mx02.posteo.de (Postfix) with ESMTPS id 5987F1F46584
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 00:12:57 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3lXtDT4jR0z5vMr
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 00:12:57 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] include/common.h: fix build against musl
Date: Fri, 24 Apr 2015 00:12:51 +0200
Message-Id: <1429827173-1739-1-git-send-email-joerg.krause@embedded.rocks>
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

TGlrZSB1Q2xpYmMgdmVyc2lvbiBvbGRlciB0aGFuIChub3QgeWV0IHJlbGVhc2VkKSAwLjkuMzQg
bXVzbCBkb2VzIG5vdCBoYXZlCmEgcnBtYXRjaCgpIGltcGxlbWVudGF0aW9uLgoKdUNsaWJjIGRl
ZmluZXMgYm90aCBfX1VDTElCQ19fIGFuZCBfX0dMSUJDX18uIFNvIGZpcnN0IGNoZWNrIGZvciB1
Q2liYyBhbmQgaXRzCnZlcnNpb24gYW5kIHRoZW4gZm9yIGEgbm9uIGdsaWJjIGltcGxlbWVudGF0
aW9uIChsaWtlIG11c2wpLiBOb3RlLCBtdXNsIGRvZXMKbm90IGRlZmluZSBfX01VU0xfXy4KClNp
Z25lZC1vZmYtYnk6IErDtnJnIEtyYXVzZSA8am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgot
LS0KIGluY2x1ZGUvY29tbW9uLmggfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvY29tbW9u
LmggYi9pbmNsdWRlL2NvbW1vbi5oCmluZGV4IDliODgwNGEuLmZiMGNhODMgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvY29tbW9uLmgKKysrIGIvaW5jbHVkZS9jb21tb24uaApAQCAtMTE3LDExICsxMTcs
MTIgQEAgZXh0ZXJuICJDIiB7CiAJZnByaW50ZihzdGRlcnIsICIlczogd2FybmluZyE6ICIgZm10
ICJcbiIsIFBST0dSQU1fTkFNRSwgIyNfX1ZBX0FSR1NfXyk7IFwKIH0gd2hpbGUoMCkKIAotI2lm
IGRlZmluZWQoX19VQ0xJQkNfXykKLS8qIHVDbGliYyB2ZXJzaW9ucyBiZWZvcmUgMC45LjM0IGRv
bid0IGhhdmUgcnBtYXRjaCgpICovCi0jaWYgX19VQ0xJQkNfTUFKT1JfXyA9PSAwICYmIFwKKy8q
IHVDbGliYyB2ZXJzaW9ucyBiZWZvcmUgMC45LjM0IGFuZCBtdXNsIGRvbid0IGhhdmUgcnBtYXRj
aCgpICovCisjaWYgZGVmaW5lZChfX1VDTElCQ19fKSAmJiBcCisJCShfX1VDTElCQ19NQUpPUl9f
ID09IDAgJiYgXAogCQkoX19VQ0xJQkNfTUlOT1JfXyA8IDkgfHwgXAotCQkoX19VQ0xJQkNfTUlO
T1JfXyA9PSA5ICYmIF9fVUNMSUJDX1NVQkxFVkVMX18gPCAzNCkpCisJCShfX1VDTElCQ19NSU5P
Ul9fID09IDkgJiYgX19VQ0xJQkNfU1VCTEVWRUxfXyA8IDM0KSkpIHx8IFwKKwkhZGVmaW5lZChf
X0dMSUJDX18pCiAjdW5kZWYgcnBtYXRjaAogI2RlZmluZSBycG1hdGNoIF9fcnBtYXRjaAogc3Rh
dGljIGlubGluZSBpbnQgX19ycG1hdGNoKGNvbnN0IGNoYXIgKnJlc3ApCkBAIC0xMzAsNyArMTMx
LDYgQEAgc3RhdGljIGlubGluZSBpbnQgX19ycG1hdGNoKGNvbnN0IGNoYXIgKnJlc3ApCiAJKHJl
c3BbMF0gPT0gJ24nIHx8IHJlc3BbMF0gPT0gJ04nKSA/IDAgOiAtMTsKIH0KICNlbmRpZgotI2Vu
ZGlmCiAKIC8qKgogICogcHJvbXB0IHRoZSB1c2VyIGZvciBjb25maXJtYXRpb24KLS0gCjIuMy42
Cgo=
