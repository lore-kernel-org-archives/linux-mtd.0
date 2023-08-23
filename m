Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC373EE49B0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:
	Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=viFYSDcCvlOODGjflZqLSnBjiAdk0mqQ7nvyx0EP22s=; b=V9hljqgiaYGG/N
	sHfEolfXtqHx9QEdFeLmLL7hD24KfQvfg1hswB4Snt1yNiZEB1jTw+xec863zxzdA0gYXrRgCZZeC
	7s1aaSN58Seg4NIqVMM9Fx8qKGPfU0VQ/fWgi1CSLslSLF/+abuN6VSmTfkhAy5FYlBkN+8n3T2tm
	w7HekuVsA2vDzkn5KerR1/xx+radyJK9+J6T1axfoRV5Oqb6YQ/t/cnsXfVUkh4AeyjUtN/0oB8kj
	QHYpO26swKmlfnd8uC6xho5MFxZLERZSPRUPaUG5uGthScRW59cl5xp1Tyb/Bb9cgEXofPLwWR90Y
	ANTLX9fXIB/ehXacb3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlAG-000IVq-2F;
	Wed, 23 Aug 2023 10:32:40 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlAB-000IMa-0M
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:32:37 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYl9y-006vF1-RM; Wed, 23 Aug 2023 18:32:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 18:32:23 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Wed, 23 Aug 2023 18:32:23 +0800
Subject: [PATCH 5/12] ah: Do not include crypto/algapi.h
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Theodore Y. Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Jason A. Donenfeld <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
Message-Id: <E1qYl9y-006vF1-RM@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033235_172800_DCE6F808 
X-CRM114-Status: UNSURE (   9.85  )
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

 net/ipv4/ah4.c |    2 +-
 net/ipv6/ah6.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
index 015c0f4ec5ba..bc0f968c5d5b 100644
--- a/net/ipv4/ah4.c
+++ b/net/ipv4/ah4.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #define pr_fmt(fmt) "IPsec: " fmt
 
-#include <crypto/algapi.h>
 #include <crypto/hash.h>
+#include <crypto/utils.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/net/ipv6/ah6.c b/net/ipv6/ah6.c
index 01005035ad10..56f9282ec5df 100644
--- a/net/ipv6/ah6.c
+++ b/net/ipv6/ah6.c
@@ -13,8 +13,8 @@
 
 #define pr_fmt(fmt) "IPv6: " fmt
 
-#include <crypto/algapi.h>
 #include <crypto/hash.h>
+#include <crypto/utils.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <net/ip.h>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
