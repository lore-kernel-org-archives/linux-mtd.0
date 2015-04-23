Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlPNF-0001OD-3a
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 22:13:34 +0000
Received: from dovecot03.posteo.de (unknown [185.67.36.28])
 by mx02.posteo.de (Postfix) with ESMTPS id 528411F5E89B
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 00:12:58 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3lXtDT6hWXz5vN5
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 00:12:57 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] lib/libfec.c: fix build against musl
Date: Fri, 24 Apr 2015 00:12:53 +0200
Message-Id: <1429827173-1739-3-git-send-email-joerg.krause@embedded.rocks>
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

QWRkIG1pc3NpbmcgI2luY2x1ZGUgPHN5cy90eXBlcy5oPiBmb3IgdV9sb25nLgoKU2lnbmVkLW9m
Zi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+Ci0tLQogbGli
L2xpYmZlYy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9saWIvbGliZmVjLmMgYi9saWIvbGliZmVjLmMKaW5kZXggZmY1YTEyNy4uYzVlNzc0OSAx
MDA2NDQKLS0tIGEvbGliL2xpYmZlYy5jCisrKyBiL2xpYi9saWJmZWMuYwpAQCAtNDUsNiArNDUs
NyBAQAogI2luY2x1ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8c3RkbGliLmg+CiAjaW5jbHVkZSA8
c3RyaW5nLmg+CisjaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiAKIC8qCiAgKiBzdHVmZiB1c2VkIGZv
ciB0ZXN0aW5nIHB1cnBvc2VzIG9ubHkKLS0gCjIuMy42Cgo=
