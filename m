Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58012C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 05:34:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016C2208DB
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 05:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bGLKo4dQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAXfGF92"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 016C2208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XKSw2rLCONJxDRuhgomOGyCNsj/NGoNrLkeE6zCTbs=; b=bGLKo4dQwIEYLN
	fkgOVopDzxw+RBlob/KccfWA+JmJikmsodS+SErboh8yM4KgVCXGbNo5tfyUS+dK8mxAVr2AfWEf8
	D8X8r9qz5eUHSw7IXELKxn9PLuk5mPKX1odt7s4rRmzGOm4k0iQSTB88lm63m9h6hzmvpLtLdYEHC
	FeEy0GDnhv8uHuNz5Yxr2bbSwBeqqzuPYuWN54fW8It/fNptJD8fnG73pfBj+/qhGiyR2QZmLZpay
	Zta40+tzxWRO8WhoGC/HcWF1zFJxv6BxcxmDQryW8FnmBdNRdFvNXUYMI9QZrItX4sPIjDyeBfMRJ
	e6lqQqpz9yEUQiscH0dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUkmP-0004Xp-4Q; Sat, 02 May 2020 05:33:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUkmJ-0004R6-4Q
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 05:33:32 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40D182184D;
 Sat,  2 May 2020 05:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588397610;
 bh=Xy09gJgOkkbJ0ZYrb6dZNClW7tkDv1nBUg2GeKdk1cQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lAXfGF92DERufghwz00F/QIgqNab18uegXgVsfl+gbihI7P/p7oBkSo2b7SRYemMo
 leI+9L+LpjxypzBwDoEDHo1kF1Vsv7aU4ikYmzDLr8A4ucNa1VtsvN0WpnFizpRcYI
 5y9cBCWx62jX8rIidTrAwvjSxsV+xDpN0LwZDndU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 01/20] crypto: hash - introduce crypto_shash_tfm_digest()
Date: Fri,  1 May 2020 22:31:03 -0700
Message-Id: <20200502053122.995648-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502053122.995648-1-ebiggers@kernel.org>
References: <20200502053122.995648-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_223331_214927_22B42C44 
X-CRM114-Status: GOOD (  11.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-bluetooth@vger.kernel.org,
 Kamil Konieczny <k.konieczny@samsung.com>,
 Robert Baldyga <r.baldyga@samsung.com>, ecryptfs@vger.kernel.org,
 Krzysztof Opasiak <k.opasiak@samsung.com>, linux-nfs@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, linux-sctp@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Zaibo Xu <xuzaibo@huawei.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Currently the simplest use of the shash API is to use
crypto_shash_digest() to digest a whole buffer.  However, this still
requires allocating a hash descriptor (struct shash_desc).  Many users
don't really want to preallocate one and instead just use a one-off
descriptor on the stack like the following:

	{
		SHASH_DESC_ON_STACK(desc, tfm);
		int err;

		desc->tfm = tfm;

		err = crypto_shash_digest(desc, data, len, out);

		shash_desc_zero(desc);
	}

Wrap this in a new helper function crypto_shash_tfm_digest() that can be
used instead of the above.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/shash.c        | 16 ++++++++++++++++
 include/crypto/hash.h | 19 +++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/crypto/shash.c b/crypto/shash.c
index c075b26c2a1d9f..e6a4b5f39b8c64 100644
--- a/crypto/shash.c
+++ b/crypto/shash.c
@@ -206,6 +206,22 @@ int crypto_shash_digest(struct shash_desc *desc, const u8 *data,
 }
 EXPORT_SYMBOL_GPL(crypto_shash_digest);
 
+int crypto_shash_tfm_digest(struct crypto_shash *tfm, const u8 *data,
+			    unsigned int len, u8 *out)
+{
+	SHASH_DESC_ON_STACK(desc, tfm);
+	int err;
+
+	desc->tfm = tfm;
+
+	err = crypto_shash_digest(desc, data, len, out);
+
+	shash_desc_zero(desc);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(crypto_shash_tfm_digest);
+
 static int shash_default_export(struct shash_desc *desc, void *out)
 {
 	memcpy(out, shash_desc_ctx(desc), crypto_shash_descsize(desc->tfm));
diff --git a/include/crypto/hash.h b/include/crypto/hash.h
index cee446c59497c6..4829d2367eda87 100644
--- a/include/crypto/hash.h
+++ b/include/crypto/hash.h
@@ -855,6 +855,25 @@ int crypto_shash_setkey(struct crypto_shash *tfm, const u8 *key,
 int crypto_shash_digest(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out);
 
+/**
+ * crypto_shash_tfm_digest() - calculate message digest for buffer
+ * @tfm: hash transformation object
+ * @data: see crypto_shash_update()
+ * @len: see crypto_shash_update()
+ * @out: see crypto_shash_final()
+ *
+ * This is a simplified version of crypto_shash_digest() for users who don't
+ * want to allocate their own hash descriptor (shash_desc).  Instead,
+ * crypto_shash_tfm_digest() takes a hash transformation object (crypto_shash)
+ * directly, and it allocates a hash descriptor on the stack internally.
+ * Note that this stack allocation may be fairly large.
+ *
+ * Context: Any context.
+ * Return: 0 on success; < 0 if an error occurred.
+ */
+int crypto_shash_tfm_digest(struct crypto_shash *tfm, const u8 *data,
+			    unsigned int len, u8 *out);
+
 /**
  * crypto_shash_export() - extract operational state for message digest
  * @desc: reference to the operational state handle whose state is exported
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
