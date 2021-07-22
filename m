Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2D8C63793
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 09:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC866109F
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 09:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC866109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LY+r4ze5kRG5mcDni40qkxTGIQ3DVj1YxYw+FLX3FPQ=; b=udUO70gTFc+RQg
	jUCss4HSQc0q5xVpN0lMWYVurnGI4qpS9YPhw1FfGS6NOd3bSIgnwBQh5LgarptmKEYJ5HigR37Ve
	Gbvpc80HdS7bHDaHnKzuKFqsrxT0hZgknftKjoCHjGN0dlFCa4VuxUZO32uTrOWVauP9ArTPuoviz
	I4EcpZGpPajKfKl8BdbItgKmnGoH2TX/Wh1Jx6Voi4nd1GA/jdJg4FJXxifcDtrAD8o55/16bZ/Vk
	oXd9W2ao4iSHnLvDI8FaVk624PT41esl8OVfLdihX/fnQ8uuSjCjYEzyB9XUwD4myDHXbpB2l5q8x
	YmG2OOAUE86UtE3CUouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ur7-000qcL-KK; Thu, 22 Jul 2021 09:19:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6UqZ-000qU3-CA
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 09:18:30 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1m6UqF-0001NO-DL; Thu, 22 Jul 2021 11:18:07 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1m6UqC-0001D1-HE; Thu, 22 Jul 2021 11:18:04 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Song Liu <song@kernel.org>,
 Richard Weinberger <richard@nod.at>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-raid@vger.kernel.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [RFC PATCH v1 4/4] ubifs: auth: consult encrypted and trusted keys if
 no logon key was found
Date: Thu, 22 Jul 2021 11:18:02 +0200
Message-Id: <f5891611f329583baef32089c8b322850d81166a.1626945419.git-series.a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.b2fdd70b830d12853b12a12e32ceb0c8162c1346.1626945419.git-series.a.fatoum@pengutronix.de>
References: <cover.b2fdd70b830d12853b12a12e32ceb0c8162c1346.1626945419.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_021827_489690_D8D06EBB 
X-CRM114-Status: GOOD (  19.51  )
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

Currently, UBIFS auth_key can only be a logon key: This is a user key
that's provided to the kernel in plaintext and that then remains within
the kernel. Linux also supports trusted and encrypted keys, which have
stronger guarantees: They are only exposed to userspace in encrypted
form and, in the case of trusted keys, can be directly rooted to a trust
source like a TPM chip.

Add support for auth_key to be either a logon, encrypted or trusted key.
At mount time, the keyring will be searched for a key with the supplied
name in that order.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
To: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
To: James Morris <jmorris@namei.org>
To: "Serge E. Hallyn" <serge@hallyn.com>
To: Alasdair Kergon <agk@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
To: dm-devel@redhat.com
To: Song Liu <song@kernel.org>
To: Richard Weinberger <richard@nod.at>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-raid@vger.kernel.org
Cc: keyrings@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-security-module@vger.kernel.org
Cc: linux-integrity@vger.kernel.org
---
 Documentation/filesystems/ubifs.rst |  2 +-
 fs/ubifs/auth.c                     | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/ubifs.rst b/Documentation/filesystems/ubifs.rst
index e6ee99762534..12d08458b3d7 100644
--- a/Documentation/filesystems/ubifs.rst
+++ b/Documentation/filesystems/ubifs.rst
@@ -101,7 +101,7 @@ compr=zlib              override default compressor and set it to "zlib"
 auth_key=		specify the key used for authenticating the filesystem.
 			Passing this option makes authentication mandatory.
 			The passed key must be present in the kernel keyring
-			and must be of type 'logon'
+			and must be of type 'logon', 'encrypted' or 'trusted'.
 auth_hash_name=		The hash algorithm used for authentication. Used for
 			both hashing and for creating HMACs. Typical values
 			include "sha256" or "sha512"
diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index 6a0b8d858d81..af8e9eb58a60 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -14,6 +14,8 @@
 #include <crypto/hash.h>
 #include <crypto/algapi.h>
 #include <keys/user-type.h>
+#include <keys/trusted-type.h>
+#include <keys/encrypted-type.h>
 #include <keys/asymmetric-type.h>
 
 #include "ubifs.h"
@@ -256,9 +258,10 @@ out_destroy:
 int ubifs_init_authentication(struct ubifs_info *c)
 {
 	struct key *keyring_key;
-	const struct user_key_payload *ukp;
 	int err;
+	unsigned int len;
 	char hmac_name[CRYPTO_MAX_ALG_NAME];
+	const void *key_material;
 
 	if (!c->auth_hash_name) {
 		ubifs_err(c, "authentication hash name needed with authentication");
@@ -277,6 +280,10 @@ int ubifs_init_authentication(struct ubifs_info *c)
 		 c->auth_hash_name);
 
 	keyring_key = request_key(&key_type_logon, c->auth_key_name, NULL);
+	if (IS_ERR(keyring_key) && IS_REACHABLE(CONFIG_ENCRYPTED_KEYS))
+		keyring_key = request_key(&key_type_encrypted, c->auth_key_name, NULL);
+	if (IS_ERR(keyring_key) && IS_REACHABLE(CONFIG_TRUSTED_KEYS))
+		keyring_key = request_key(&key_type_trusted, c->auth_key_name, NULL);
 
 	if (IS_ERR(keyring_key)) {
 		ubifs_err(c, "Failed to request key: %ld",
@@ -286,12 +293,10 @@ int ubifs_init_authentication(struct ubifs_info *c)
 
 	down_read(&keyring_key->sem);
 
-	ukp = user_key_payload_locked(keyring_key);
-	if (!ukp) {
-		/* key was revoked before we acquired its semaphore */
-		err = -EKEYREVOKED;
+	key_material = key_extract_material(keyring_key, &len);
+	err = PTR_ERR_OR_ZERO(key_material);
+	if (err < 0)
 		goto out;
-	}
 
 	c->hash_tfm = crypto_alloc_shash(c->auth_hash_name, 0, 0);
 	if (IS_ERR(c->hash_tfm)) {
@@ -324,7 +329,7 @@ int ubifs_init_authentication(struct ubifs_info *c)
 		goto out_free_hmac;
 	}
 
-	err = crypto_shash_setkey(c->hmac_tfm, ukp->data, ukp->datalen);
+	err = crypto_shash_setkey(c->hmac_tfm, key_material, len);
 	if (err)
 		goto out_free_hmac;
 
-- 
git-series 0.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
