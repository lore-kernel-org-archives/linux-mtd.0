Received: from mail-qe0-f53.google.com ([209.85.128.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXK9C-0004Dy-R7
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2013 23:39:47 +0000
Received: by mail-qe0-f53.google.com with SMTP id i11so648714qej.12
 for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2013 16:39:23 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 30 Apr 2013 17:39:22 -0600
Message-ID: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>
Subject: nand_base: fix for ONFI chips that do not support GET/SET FEATURES
From: David Mosberger-Tang <dmosberger@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: multipart/mixed; boundary=047d7bdc1220cdacfc04db9c82c5
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--047d7bdc1220cdacfc04db9c82c5
Content-Type: text/plain; charset=ISO-8859-1

The attached patch is relative to linux-mtd.  It fixes a problem with
NAND-chips that are ONFI-compliant but don't support the SET/GET
FEATURES commands (such as Spansion S34Mx).

  --david

--047d7bdc1220cdacfc04db9c82c5
Content-Type: text/plain; charset=US-ASCII; name="nand_base-features-fix.diff.txt"
Content-Disposition: attachment; filename="nand_base-features-fix.diff.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hg5putmn0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9u
YW5kL25hbmRfYmFzZS5jCmluZGV4IGRmY2QwYTUuLjEzYzgwNDMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvbmFuZF9iYXNlLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2Uu
YwpAQCAtMjcyMCw3ICsyNzIwLDkgQEAgc3RhdGljIGludCBuYW5kX29uZmlfc2V0X2ZlYXR1cmVz
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogewogCWludCBz
dGF0dXM7CiAKLQlpZiAoIWNoaXAtPm9uZmlfdmVyc2lvbikKKwlpZiAoIWNoaXAtPm9uZmlfdmVy
c2lvbiB8fAorCSAgICAvLyBzdXBwb3J0cyBHRVQvU0VUIEZFQVRVUkVTPworCSAgICAhKGxlMTZf
dG9fY3B1KGNoaXAtPm9uZmlfcGFyYW1zLm9wdF9jbWQpICYgNCkpCiAJCXJldHVybiAtRUlOVkFM
OwogCiAJY2hpcC0+Y21kZnVuYyhtdGQsIE5BTkRfQ01EX1NFVF9GRUFUVVJFUywgYWRkciwgLTEp
OwpAQCAtMjc0MSw3ICsyNzQzLDkgQEAgc3RhdGljIGludCBuYW5kX29uZmlfc2V0X2ZlYXR1cmVz
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogc3RhdGljIGlu
dCBuYW5kX29uZmlfZ2V0X2ZlYXR1cmVzKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLAogCQkJaW50IGFkZHIsIHVpbnQ4X3QgKnN1YmZlYXR1cmVfcGFyYW0pCiB7
Ci0JaWYgKCFjaGlwLT5vbmZpX3ZlcnNpb24pCisJaWYgKCFjaGlwLT5vbmZpX3ZlcnNpb24gfHwK
KwkgICAgLy8gc3VwcG9ydHMgR0VUL1NFVCBGRUFUVVJFUz8KKwkgICAgIShsZTE2X3RvX2NwdShj
aGlwLT5vbmZpX3BhcmFtcy5vcHRfY21kKSAmIDQpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCS8q
IGNsZWFyIHRoZSBzdWIgZmVhdHVyZSBwYXJhbWV0ZXJzICovCg==
--047d7bdc1220cdacfc04db9c82c5--
