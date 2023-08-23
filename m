Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0ACEE49A0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:
	Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=cWBdMugtn7J3FpFsdzoxytC9xveajp5/9uJ+tviWrEA=; b=GI/zj48C/1ERnU
	4gi4YNxTeViMKrORz4YnDGo4aYJs9yPthbkguWN2wDSSvZcXdxe7ulis2Tr1lVrUOumcdv3w8Svyw
	/RQxUGxLWyeJJJFgghl3OTUlDu0C4nacv8zR2YY6cwtpCNnn7jv2cYsz0dYRos6CjcNBxBG7Yvnar
	oqQ5v1nPGbe/oO8i32liagYXYnMiuNgccP1sg2gCRk1BAbVn1aitcctnxvZOnFaIDIAhzGs4vgFfI
	Lm2EEOzzoRpoM7DhULdbZTkknpR495ia/zXBQ+EyzQywaYr2/eNEft0hs3Tlj6k1ElsQSwVwKkT76
	xQPUPRPpz9HoKIXfG/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlAM-000Icl-1l;
	Wed, 23 Aug 2023 10:32:46 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlAG-000ITG-2X
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:32:42 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYlA7-006vHq-8B; Wed, 23 Aug 2023 18:32:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 18:32:32 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Wed, 23 Aug 2023 18:32:32 +0800
Subject: [PATCH 9/12] evm: Do not include crypto/algapi.h
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Theodore Y. Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Jason A. Donenfeld <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
Message-Id: <E1qYlA7-006vHq-8B@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033240_841879_D946F64F 
X-CRM114-Status: UNSURE (   8.85  )
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

 security/integrity/evm/evm_main.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/evm_main.c
index c9b6e2a43478..e635a8d18dae 100644
--- a/security/integrity/evm/evm_main.c
+++ b/security/integrity/evm/evm_main.c
@@ -14,7 +14,6 @@
 #define pr_fmt(fmt) "EVM: "fmt
 
 #include <linux/init.h>
-#include <linux/crypto.h>
 #include <linux/audit.h>
 #include <linux/xattr.h>
 #include <linux/integrity.h>
@@ -24,7 +23,7 @@
 
 #include <crypto/hash.h>
 #include <crypto/hash_info.h>
-#include <crypto/algapi.h>
+#include <crypto/utils.h>
 #include "evm.h"
 
 int evm_initialized;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
