Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6BEEE49B6
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:
	Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=RO5fzSLRCatkIAUvSmhSaBcpk5KsN6YCDFvXWJClSkk=; b=C2PsUE2AWI73Ji
	C2OQlS6lCiNstsFUzUh/q+1zbU82PYV2C71duo8W6gYxOyw8THiH1tW3yF/uLWcgyuofpPWhPhjs3
	4puXMNg14qZdryoFWq1aiAVPuzqvTlU2IPAxwvu2LKeFrkLFY/NGdyL7AYHo6t+J82L/zpKQwhAF0
	2VonMZo8hgD1SMqZLbu/QxJCw1bAo9EdEd1dSkDLkyKx5QyBz9VTyAwoIpiIvOyIikVr+UKULA54f
	0Aj84vcUyvzhTDUhvO31ORKWCaiMrI+PyWVowXTkiNZYYrOev2IVfhklk1IQKVb0Z9WYXtTD5+elI
	fQpxnQKrh9RcrMNdxCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlA5-000IM6-2j;
	Wed, 23 Aug 2023 10:32:29 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlA2-000IHR-0k
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:32:27 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYl9s-006vDm-IW; Wed, 23 Aug 2023 18:32:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 18:32:17 +0800
From: "Herbert Xu" <herbert@gondor.apana.org.au>
Date: Wed, 23 Aug 2023 18:32:17 +0800
Subject: [PATCH 2/12] ubifs: Do not include crypto/algapi.h
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Theodore Y. Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>, Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org, Jason A. Donenfeld <Jason@zx2c4.com>, Ayush Sawal <ayush.sawal@chelsio.com>
Message-Id: <E1qYl9s-006vDm-IW@formenos.hmeau.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_033226_268353_E56933AD 
X-CRM114-Status: GOOD (  10.59  )
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

 fs/ubifs/auth.c   |    3 +--
 fs/ubifs/replay.c |    1 -
 fs/ubifs/ubifs.h  |    2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index e564d5ff8781..0d561ecb6869 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -9,10 +9,9 @@
  * This file implements various helper functions for UBIFS authentication support
  */
 
-#include <linux/crypto.h>
 #include <linux/verification.h>
 #include <crypto/hash.h>
-#include <crypto/algapi.h>
+#include <crypto/utils.h>
 #include <keys/user-type.h>
 #include <keys/asymmetric-type.h>
 
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 4211e4456b1e..c59d47fe7939 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -23,7 +23,6 @@
 #include "ubifs.h"
 #include <linux/list_sort.h>
 #include <crypto/hash.h>
-#include <crypto/algapi.h>
 
 /**
  * struct replay_entry - replay list entry.
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4c36044140e7..fd66ed0cd612 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -31,7 +31,7 @@
 #include <linux/completion.h>
 #include <crypto/hash_info.h>
 #include <crypto/hash.h>
-#include <crypto/algapi.h>
+#include <crypto/utils.h>
 
 #include <linux/fscrypt.h>
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
