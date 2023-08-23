Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0D7EE49A0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:
	Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=mCqntiKFDYScda/mTmWyVwR13xXoWrjK5AsjOitHOq8=; b=EyNXw3b98eJJTg
	IKfHL38NQqVLHeD2WzuT7R+zzdws61/6aHH8VZb58mTF7lPI1Ml1p82Q6rXCqZFFcmOR8MrZQb0y2
	3GvGr3rI9RRiwHJ+Ynw660LKav/3u10brAfXeMDSjjnwVtlQIP4seBONYS5k3mMTJlUUwhRm8TRUM
	yb9yRLmN3zeXtgA14TKgzy3J0b+Ie0/8+bZGuO64E1jn2EZQ2OR17fm5IomIqok2YzKCYW+Fy90/e
	pWVyoAKctBefH5RIpRsBEVQQhrLERwne9Z7pnVqK+RZ2Zg35Os4ZJgz1B6vVstMsgWX9W64EA+pJC
	rMY6SrvnWPe8FWzrTDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlA9-000IOO-02;
	Wed, 23 Aug 2023 10:32:33 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlA4-000IIc-04
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:32:29 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYl9u-006vE6-L2; Wed, 23 Aug 2023 18:32:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 18:32:19 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Wed, 23 Aug 2023 18:32:19 +0800
Subject: [PATCH 3/12] Bluetooth: Do not include crypto/algapi.h
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Theodore Y. Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Jason A. Donenfeld <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
Message-Id: <E1qYl9u-006vE6-L2@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033228_062707_FFE4A3BE 
X-CRM114-Status: UNSURE (   8.74  )
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

 net/bluetooth/smp.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index f1a9fc0012f0..5f2f97de295e 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -22,11 +22,10 @@
 
 #include <linux/debugfs.h>
 #include <linux/scatterlist.h>
-#include <linux/crypto.h>
 #include <crypto/aes.h>
-#include <crypto/algapi.h>
 #include <crypto/hash.h>
 #include <crypto/kpp.h>
+#include <crypto/utils.h>
 
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
