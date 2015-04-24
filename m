Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlkaB-0005d9-7f
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 20:52:19 +0000
Received: from dovecot03.posteo.de (unknown [185.67.36.28])
 by mx02.posteo.de (Postfix) with ESMTPS id 8930D25AF51A
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 22:51:52 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3lYSNR6zVkz5vN3
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 22:51:51 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] recv_image: do not include error.h
Date: Fri, 24 Apr 2015 22:51:47 +0200
Message-Id: <1429908707-12537-2-git-send-email-joerg.krause@embedded.rocks>
In-Reply-To: <1429908707-12537-1-git-send-email-joerg.krause@embedded.rocks>
References: <1429908707-12537-1-git-send-email-joerg.krause@embedded.rocks>
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

cmVjdl9pbWFnZSBkb2VzIG5vdCB1c2UgYW55dGhpbmcgZnJvbSBpdCBhbmQgaXQgaXMgbm90IGF2
YWlsYWJsZSB3aXRoIGFsbApDIGxpYnJhcmllcywgZS5nLiBtdXNsLgoKU2lnbmVkLW9mZi1ieTog
SsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+Ci0tLQogcmVjdl9pbWFn
ZS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Jl
Y3ZfaW1hZ2UuYyBiL3JlY3ZfaW1hZ2UuYwppbmRleCAyNmE4MzYxLi4wMDkzODMxIDEwMDY0NAot
LS0gYS9yZWN2X2ltYWdlLmMKKysrIGIvcmVjdl9pbWFnZS5jCkBAIC00LDcgKzQsNiBAQAogI2Rl
ZmluZSBfQlNEX1NPVVJDRQkvKiBzdHJ1Y3QgaXBfbXJlcSAqLwogCiAjaW5jbHVkZSA8ZXJybm8u
aD4KLSNpbmNsdWRlIDxlcnJvci5oPgogI2luY2x1ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8bmV0
ZGIuaD4KICNpbmNsdWRlIDxzdGRsaWIuaD4KLS0gCjIuMy42Cgo=
