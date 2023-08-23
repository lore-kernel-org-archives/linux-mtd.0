Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3481EEE49A0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:
	Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=m8IVxpxPjDr1SR2HCu65jR440UoighRR8R8vRIqrQng=; b=VKRVfqtbCkk+7J
	22NEuUdkoL8AvCjBgrbErnZTfJURWXyq3m3x2ZazYTBoM3W4nu6HERWCluYHz0GcXMB9jSxyf/sgV
	il2Ho/44Sb+gFLC9jVdlO5/+4xLBmv5c7OllvyqpwZm3HZT9AiFZN5RQyUEHwfaqO3Yaz6QMc7gP+
	uG0IhCD3X4S61s50WLR2ScrKyd1jIJ5Pj13QZorQj33ptFKb7eb1wmi6sazpxT3J0ftshnsWgeEmj
	bA1TfFCmX6FfVQdCPe92+pLIhCvVN3OfVZy3/aSzxFtpCtTAAGyzxlpPu94ow6yQ/T487MrtWayjl
	U/hlQ9x8MhaFE0FuX0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlAF-000IUy-2z;
	Wed, 23 Aug 2023 10:32:39 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlA9-000INO-3A
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:32:35 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYlA0-006vFr-Ts; Wed, 23 Aug 2023 18:32:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 18:32:25 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Wed, 23 Aug 2023 18:32:25 +0800
Subject: [PATCH 6/12] wifi: mac80211: Do not include crypto/algapi.h
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Theodore Y. Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Jason A. Donenfeld <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
Message-Id: <E1qYlA0-006vFr-Ts@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033234_060153_266AB3C4 
X-CRM114-Status: UNSURE (   9.86  )
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

 net/mac80211/fils_aead.c |    2 +-
 net/mac80211/key.c       |    2 +-
 net/mac80211/wpa.c       |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/fils_aead.c b/net/mac80211/fils_aead.c
index e1d4cfd99128..912c46f74d24 100644
--- a/net/mac80211/fils_aead.c
+++ b/net/mac80211/fils_aead.c
@@ -5,9 +5,9 @@
  */
 
 #include <crypto/aes.h>
-#include <crypto/algapi.h>
 #include <crypto/hash.h>
 #include <crypto/skcipher.h>
+#include <crypto/utils.h>
 
 #include "ieee80211_i.h"
 #include "aes_cmac.h"
diff --git a/net/mac80211/key.c b/net/mac80211/key.c
index 21cf5a208910..13050dc9321f 100644
--- a/net/mac80211/key.c
+++ b/net/mac80211/key.c
@@ -9,6 +9,7 @@
  * Copyright 2018-2020, 2022-2023  Intel Corporation
  */
 
+#include <crypto/utils.h>
 #include <linux/if_ether.h>
 #include <linux/etherdevice.h>
 #include <linux/list.h>
@@ -17,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <net/mac80211.h>
-#include <crypto/algapi.h>
 #include <asm/unaligned.h>
 #include "ieee80211_i.h"
 #include "driver-ops.h"
diff --git a/net/mac80211/wpa.c b/net/mac80211/wpa.c
index 4133496da378..2d8e38b3bcb5 100644
--- a/net/mac80211/wpa.c
+++ b/net/mac80211/wpa.c
@@ -15,7 +15,7 @@
 #include <asm/unaligned.h>
 #include <net/mac80211.h>
 #include <crypto/aes.h>
-#include <crypto/algapi.h>
+#include <crypto/utils.h>
 
 #include "ieee80211_i.h"
 #include "michael.h"

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
