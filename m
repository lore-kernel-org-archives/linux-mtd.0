Received: from rwcrmhc11.comcast.net ([204.127.198.35])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19iNNi-0006Zv-H0
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2003 01:02:50 +0100
Message-ID: <3F29AE2C.2020000@mvista.com>
Date: Thu, 31 Jul 2003 20:02:52 -0400
From: "George G. Davis" <gdavis@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------040300080606050307040602"
Subject: kernel oops due to aligment error in cmdlinepart.c
Reply-To: gdavis@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040300080606050307040602
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Greetings,

I've been using the latest MTD CVS (+/- a few days) on an ARM Integrator/CM920T
running linux-2.4.20'ish and have found that cmdlinepart.c has a struct alignment
problem which causes a kernel oops. The attached patch fixes the alignment problem
for me (YMMV : ). I've successfully tested this on an ARM Integrator/CM920T, ADS
Graphics Client Plus and TI Innovator/OMAP1510, FWIW. : )

--
Regards,
George


--------------040300080606050307040602
Content-Type: text/plain;
 name="cmdlinepart.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="cmdlinepart.patch"

SW5kZXg6IGRyaXZlcnMvbXRkL2NtZGxpbmVwYXJ0LmMKPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpSQ1MgZmls
ZTogL2hvbWUvY3ZzL210ZC9kcml2ZXJzL210ZC9jbWRsaW5lcGFydC5jLHYKcmV0cmlldmlu
ZyByZXZpc2lvbiAxLjEwCmRpZmYgLXUgLXIxLjEwIGNtZGxpbmVwYXJ0LmMKLS0tIGRyaXZl
cnMvbXRkL2NtZGxpbmVwYXJ0LmMJMjkgTWF5IDIwMDMgMDk6MjU6MjIgLTAwMDAJMS4xMAor
KysgZHJpdmVycy9tdGQvY21kbGluZXBhcnQuYwkzMSBKdWwgMjAwMyAyMzo0ODoyMCAtMDAw
MApAQCAtMjQxLDYgKzI0MSw3IEBACiAJCQkJJm51bV9wYXJ0cywJLyogb3V0OiBudW1iZXIg
b2YgcGFydHMgKi8KIAkJCQkwLAkJLyogZmlyc3QgcGFydGl0aW9uICovCiAJCQkJKHVuc2ln
bmVkIGNoYXIqKikmdGhpc19tdGQsIC8qIG91dDogZXh0cmEgbWVtICovCisJCQkJX19hbGln
bm9mX18oKnRoaXNfbXRkKSAtIDEgKwogCQkJCW10ZF9pZF9sZW4gKyAxICsgc2l6ZW9mKCp0
aGlzX210ZCkpOwogCQlpZighcGFydHMpCiAJCXsKQEAgLTI1Miw3ICsyNTMsMjEgQEAKIAkJ
CSAqIHVubGlrZWx5IHRvIHN1Y2NlZWQgaW4gcGFyc2luZyBhbnkgbW9yZQogCQkJICovCiAJ
CQkgcmV0dXJuIDA7Ci0JCSB9CisJCX0KKworCQlpZiAoKHVuc2lnbmVkIGxvbmcpKHRoaXNf
bXRkKSAmIChfX2FsaWdub2ZfXygqdGhpc19tdGQpIC0gMSkpCisJCXsKKwkJCS8qIFNvbWUg
YXJjaHMgZG8gbm90IGFsbG93IG5vbi1hbGlnbmVkIGFjY2Vzc2VzCisJCQkgKiB3aXRoaW4g
dGhlIGtlcm5lbC4gU28gbWFrZSBzdXJlIHdlJ3JlIHByb3Blcmx5CisJCQkgKiBhbGlnbmVk
IGhlcmUuCisJCQkgKi8KKwkJCXVuc2lnbmVkIGxvbmcgZml4dXAgPSAodW5zaWduZWQgbG9u
ZykgdGhpc19tdGQ7CisJCQlkYmcoKCJ0aGlzX210ZDogMHglMHhcbiIsIHRoaXNfbXRkKSk7
CisJCQlmaXh1cCArPSBfX2FsaWdub2ZfXygqdGhpc19tdGQpIC0gMTsKKwkJCWZpeHVwICY9
IH4oX19hbGlnbm9mX18oKnRoaXNfbXRkKSAtIDEpOworCQkJdGhpc19tdGQgPSAoc3RydWN0
IGNtZGxpbmVfbXRkX3BhcnRpdGlvbiAqKSBmaXh1cDsKKwkJCWRiZygoInRoaXNfbXRkOiAw
eCUweCAoYWxpZ25lZClcbiIsIHRoaXNfbXRkKSk7CisJCX0KIAogCQkvKiBlbnRlciByZXN1
bHRzICovCSAgICAKIAkJdGhpc19tdGQtPnBhcnRzID0gcGFydHM7Cg==
--------------040300080606050307040602--
