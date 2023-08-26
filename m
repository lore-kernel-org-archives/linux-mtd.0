Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEA8C83F16
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Aug 2023 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbHQB+DLF1/LdNbAOfUeTkpF9vrkCh8gcImebzTRbSo=; b=MaPeRorlZo89R0
	KdOmLjX5Rnt8thhJ4/xfU+Ra1jgcmEvSZN+SsWKht2QUXYAv/UQbgvdS0vCSBRWG2vyvb6BVC+L3I
	xMacWA6uZR9iSprD9EEZQTt8M0MCYWL4btwQmC2wNdGYqXaSbvVu+mnBGTsKxzG4F2oeqtXioes/y
	ck+daHEA/5nszR1FkJXYp3CoirIhLjM/7cMv0RwqTLCs7uNGUv4uOual3oWP5R5r7zhIvSSQHPR6v
	9Fh5Yyl9tRHxMXsdri7RnLOcvScpvKuiuzWb1nvRlDCZL7f3yaRlxj63lkw1iK//5RKhLjPXT5baJ
	1E/vKGjTeRG5OmZoy/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZonG-006ane-0y;
	Sat, 26 Aug 2023 08:37:18 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZonC-006an8-10
	for linux-mtd@lists.infradead.org;
	Sat, 26 Aug 2023 08:37:16 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qZomd-007ymm-Rh; Sat, 26 Aug 2023 16:36:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Aug 2023 16:36:41 +0800
Date: Sat, 26 Aug 2023 16:36:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kernel test robot <lkp@intel.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y.Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-fscrypt@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	ceph-devel@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	"David S. Miller" <davem@davemloft.net>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	Matthieu Baerts <matthieu.baerts@tessares.net>,
	Mat Martineau <martineau@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>,
	linux-nfs@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	linux-inte@web.codeaurora.org, grity@vger.kernel.org,
	"Jason A.Donenfeld" <Jason@zx2c4.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Subject: [PATCH] KEYS: Include linux/errno.h in linux/verification.h
Message-ID: <ZOm5mX0+oUGzO3xh@gondor.apana.org.au>
References: <E1qYl9s-006vDm-IW@formenos.hmeau.com>
 <202308261414.HKw1Mrip-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202308261414.HKw1Mrip-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_013714_353509_FC45817A 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Aug 26, 2023 at 02:58:48PM +0800, kernel test robot wrote:
>
> All errors (new ones prefixed by >>):
> 
>    In file included from fs/ubifs/auth.c:12:
> >> include/linux/verification.h:23:11: error: use of undeclared identifier 'EINVAL'

---8<---
Add inclusion of linux/errno.h as otherwise the reference to EINVAL
may be invalid.

Fixes: f3cf4134c5c6 ("bpf: Add bpf_lookup_*_key() and bpf_key_put() kfuncs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308261414.HKw1Mrip-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/verification.h b/include/linux/verification.h
index f34e50ebcf60..cb2d47f28091 100644
--- a/include/linux/verification.h
+++ b/include/linux/verification.h
@@ -8,6 +8,7 @@
 #ifndef _LINUX_VERIFICATION_H
 #define _LINUX_VERIFICATION_H
 
+#include <linux/errno.h>
 #include <linux/types.h>
 
 /*
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
