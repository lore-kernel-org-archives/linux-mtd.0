Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlkaB-0005d8-7g
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 20:52:20 +0000
Received: from dovecot03.posteo.de (unknown [185.67.36.28])
 by mx02.posteo.de (Postfix) with ESMTPS id 892C025ACC53
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 22:51:52 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3lYSNR6Ps6z5vN2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 22:51:51 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] serve_image: do not include error.h
Date: Fri, 24 Apr 2015 22:51:46 +0200
Message-Id: <1429908707-12537-1-git-send-email-joerg.krause@embedded.rocks>
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

c2VydmVfaW1hZ2UgZG9lcyBub3QgdXNlIGFueXRoaW5nIGZyb20gaXQgYW5kIGl0IGlzIG5vdCBh
dmFpbGFibGUgd2l0aCBhbGwKQyBsaWJyYXJpZXMsIGUuZy4gbXVzbC4KClNpZ25lZC1vZmYtYnk6
IErDtnJnIEtyYXVzZSA8am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgotLS0KIHNlcnZlX2lt
YWdlLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
c2VydmVfaW1hZ2UuYyBiL3NlcnZlX2ltYWdlLmMKaW5kZXggMzg1NDlhMS4uNGYwZTk0NiAxMDA2
NDQKLS0tIGEvc2VydmVfaW1hZ2UuYworKysgYi9zZXJ2ZV9pbWFnZS5jCkBAIC0zLDcgKzMsNiBA
QAogCiAjaW5jbHVkZSA8dGltZS5oPgogI2luY2x1ZGUgPGVycm5vLmg+Ci0jaW5jbHVkZSA8ZXJy
b3IuaD4KICNpbmNsdWRlIDxuZXRkYi5oPgogI2luY2x1ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8
c3RkbGliLmg+Ci0tIAoyLjMuNgoK
