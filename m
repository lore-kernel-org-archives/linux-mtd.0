Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZreA-0007Zu-0q
 for linux-mtd@lists.infradead.org; Wed, 17 Aug 2016 03:36:09 +0000
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>, <dedekind1@gmail.com>
From: Wang Fangpeng <wangfangpeng1@huawei.com>
Subject: =?UTF-8?Q?Coverity_Scan=ef=bc=9adead_code_on_ubi?=
Message-ID: <57B3DB5B.3040406@huawei.com>
Date: Wed, 17 Aug 2016 11:34:51 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020409060707050806040701"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------020409060707050806040701
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi, folks,

Coverity Scan reports dead code on Linux/drivers/mtd/ubi/io.c:956-957 (kernel-4.7)

945                 if (data_size == 0) {
946                         ubi_err(ubi, "zero data_size");
947                         goto bad;
948                 }
949                 if (lnum < used_ebs - 1) {
950                         if (data_size != usable_leb_size) {
951                                 ubi_err(ubi, "bad data_size");
952                                 goto bad;
953                         }
954                 } else if (lnum == used_ebs - 1) {
955                         if (data_size == 0) {
956                                 ubi_err(ubi, "bad data_size at last LEB");
957                                 goto bad;
958                         }
959                 } else {
960                         ubi_err(ubi, "too high lnum");
961                         goto bad;
962                 }

The data_size argument has been checked(data_size == 0) at line 945 and goto bad if true.
At line 955, check it again. but the value of "data_size" must be at least 1, cannot be
equal to 0.  So, execution cannot reach line 956-957. it is dead code.

Can we fix this situation by the attach patch?

--------------020409060707050806040701
Content-Type: text/plain; charset="UTF-8";
	name="0001-fix-dead-code-at-drivers-mtd-ubi-io.c.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="0001-fix-dead-code-at-drivers-mtd-ubi-io.c.patch"

RnJvbSAwYWQyNTBlNGJlNGExYmQ0NDZlYzUyN2UyMDFhYWRjNjEzMjU0MTQxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiB3YW5nZmFnbnBlbmcgPHdhbmdmYW5ncGVuZzFAaHVh
d2VpLmNvbT4KRGF0ZTogV2VkLCAxNyBBdWcgMjAxNiAxMTozNjo1NSArMDgwMApTdWJqZWN0
OiBbUEFUQ0hdIGZpeCBkZWFkIGNvZGUgYXQgZHJpdmVycy9tdGQvdWJpL2lvLmMKCi0tLQog
ZHJpdmVycy9tdGQvdWJpL2lvLmMgfCAgICA3ICstLS0tLS0KIDEgZmlsZXMgY2hhbmdlZCwg
MSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3ViaS9pby5jIGIvZHJpdmVycy9tdGQvdWJpL2lvLmMKaW5kZXggYmY3OWRlZi4uNWQ2
YzQxNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvdWJpL2lvLmMKKysrIGIvZHJpdmVycy9t
dGQvdWJpL2lvLmMKQEAgLTk1MSwxMiArOTUxLDcgQEAgc3RhdGljIGludCB2YWxpZGF0ZV92
aWRfaGRyKGNvbnN0IHN0cnVjdCB1YmlfZGV2aWNlICp1YmksCiAJCQkJdWJpX2VycigiYmFk
IGRhdGFfc2l6ZSIpOwogCQkJCWdvdG8gYmFkOwogCQkJfQotCQl9IGVsc2UgaWYgKGxudW0g
PT0gdXNlZF9lYnMgLSAxKSB7Ci0JCQlpZiAoZGF0YV9zaXplID09IDApIHsKLQkJCQl1Ymlf
ZXJyKCJiYWQgZGF0YV9zaXplIGF0IGxhc3QgTEVCIik7Ci0JCQkJZ290byBiYWQ7Ci0JCQl9
Ci0JCX0gZWxzZSB7CisJCX0gZWxzZSBpZiAobG51bSA+IHVzZWRfZWJzIC0gMSkgewogCQkJ
dWJpX2VycigidG9vIGhpZ2ggbG51bSIpOwogCQkJZ290byBiYWQ7CiAJCX0KLS0gCjEuNy43
Cgo=
--------------020409060707050806040701--
