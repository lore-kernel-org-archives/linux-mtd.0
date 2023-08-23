Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229D1EE49B0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:
	Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=XycPbx3rqfKB+IXrA+1PVCWub3mAleI5Sbz8SRKr9O4=; b=vRrHISHGyTNXrV
	munfoTOrYW7Tzk4Dpnu2XkiN+fYkRs/x1BN2wMlDh2GqOA0o3aHhtRwPSs7xze865tD6bCsxL+4JK
	YpJZsxc45KY3UhZeZaIww231wkNWmUIk/n04dQ4bStnKtk365btayrZOxLLTXjJD0Me1WKVovg9iZ
	7vvsM+HFxsoaYS2ehW7XTq9xybM9DYnO8lt7Cc3U1omJPrqafYjl0HWq4w9MUSx3QMp1w7wyxooLA
	5F9Ibll3PX64HCTO7YY1IzCIIGBzWJBqVGHihCGKwO4+1Lxksh758De2LO6cuvQ/3KwIW6+ot3BNo
	bopXR5dRGXPArgjBFYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlAQ-000Ihf-2J;
	Wed, 23 Aug 2023 10:32:50 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlAM-000IaK-2m
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:32:48 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYlAB-006vJI-Cv; Wed, 23 Aug 2023 18:32:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 18:32:36 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Wed, 23 Aug 2023 18:32:36 +0800
Subject: [PATCH 11/12] wireguard: Do not include crypto/algapi.h
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Theodore Y. Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Jason A. Donenfeld <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
Message-Id: <E1qYlAB-006vJI-Cv@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033246_899222_87792627 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The header file crypto/algapi.h is for internal use only.  Use the
header file crypto/utils.h instead.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/net/wireguard/cookie.c  |    2 +-
 drivers/net/wireguard/netlink.c |    2 +-
 drivers/net/wireguard/noise.c   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireguard/cookie.c b/drivers/net/wireguard/cookie.c
index 4956f0499c19..f89581b5e8cb 100644
--- a/drivers/net/wireguard/cookie.c
+++ b/drivers/net/wireguard/cookie.c
@@ -12,9 +12,9 @@
 
 #include <crypto/blake2s.h>
 #include <crypto/chacha20poly1305.h>
+#include <crypto/utils.h>
 
 #include <net/ipv6.h>
-#include <crypto/algapi.h>
 
 void wg_cookie_checker_init(struct cookie_checker *checker,
 			    struct wg_device *wg)
diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index 6d1bd9f52d02..0a1502100e8b 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -12,10 +12,10 @@
 
 #include <uapi/linux/wireguard.h>
 
+#include <crypto/utils.h>
 #include <linux/if.h>
 #include <net/genetlink.h>
 #include <net/sock.h>
-#include <crypto/algapi.h>
 
 static struct genl_family genl_family;
 
diff --git a/drivers/net/wireguard/noise.c b/drivers/net/wireguard/noise.c
index 720952b92e78..e7ad81ca4a36 100644
--- a/drivers/net/wireguard/noise.c
+++ b/drivers/net/wireguard/noise.c
@@ -10,12 +10,12 @@
 #include "queueing.h"
 #include "peerlookup.h"
 
+#include <crypto/utils.h>
 #include <linux/rcupdate.h>
 #include <linux/slab.h>
 #include <linux/bitmap.h>
 #include <linux/scatterlist.h>
 #include <linux/highmem.h>
-#include <crypto/algapi.h>
 
 /* This implements Noise_IKpsk2:
  *

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
