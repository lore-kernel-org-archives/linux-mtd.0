Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCB4EE49A0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:
	Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=zczwcW+/pReMuCMcd1lrIBN6bgTCKiJqNqsWxQJdA7k=; b=WIUVLQ6yZ7OdeM
	T6ZbvX/ZfsxByYONYSdqxgdq3zXRMQLwsGDW+2PEpA+Viwh7jVPJ3W7N7dqfxFcousKKniMJP5XaJ
	1RGkxBMYAoT6716nf991qc+x/oYy2mC/8m06xFZ3mJ9fhFEL+7mLIs+oD6yMunZBEkNGv4tClJQjX
	o8ck8QD87Cwf6NodFM03lRi9jVt1F26mvL+OcijpwfF0pKFZafbK113yOYM157yHfWQjDD3w8igKT
	NYV5s6JCCHFr/rC/YuxP2IFbImtYJPvVTJQ0vLMLEROvl7W0/w8k3uD8fjY70QcNBbQ/razXycP50
	Q37IrT52RNyr6jE/nXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlA3-000IJp-0a;
	Wed, 23 Aug 2023 10:32:27 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlA0-000IG4-1a
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:32:25 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYl9q-006vDd-FJ; Wed, 23 Aug 2023 18:32:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 18:32:15 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Wed, 23 Aug 2023 18:32:15 +0800
Subject: [PATCH 1/12] fscrypt: Do not include crypto/algapi.h
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Theodore Y. Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Jason A. Donenfeld <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
Message-Id: <E1qYl9q-006vDd-FJ@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033224_527535_4CA1FCC1 
X-CRM114-Status: UNSURE (   9.59  )
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

 fs/crypto/keysetup_v1.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 75dabd9b27f9..d698ecb9ad44 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -20,8 +20,8 @@
  *    managed alongside the master keys in the filesystem-level keyring)
  */
 
-#include <crypto/algapi.h>
 #include <crypto/skcipher.h>
+#include <crypto/utils.h>
 #include <keys/user-type.h>
 #include <linux/hashtable.h>
 #include <linux/scatterlist.h>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
