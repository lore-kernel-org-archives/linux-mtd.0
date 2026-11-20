Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF2A60A5BC2
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XZEP8yv3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vf4DU23q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ds1JPXB9CncK69+4fnebHg3Q+t+deh4oSpEFS6Aqt6Y=; b=XZEP8yv3bdPAbs1j2bLg3eIIoD
	cLOYnKj36Hq6H9MizxEcGVXvl0N6PDpfHpW5uzmj11eRH/yHu5RujR6BhF0nxCNpevhOObbUVofSQ
	mFcfHfZtNx2sYzGRWr0+6eVbi8gtBghPSlfmwu14HhIW8pHyu2cvRy4h6//tZ1kbHTwJonU0nPWed
	aJxtnc//88D/OTiMx4mvYGkSk2psF5XRBMXstTIdD8efPfRPPQsRGWhoXAPO1zx9YJcW6JrvpttFQ
	w1BZQoc5+wpBJTj3Pe80T9HQGJJ5pT0n1JGrhfd2yHu0QgSuXJe2ZO9cZStYa/ZgSgN8HUuiuBxjH
	anlyOfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUug-0000000GBus-22n9;
	Fri, 20 Nov 2026 20:08:50 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuW-0000000GBql-2ZNe
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:42 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-86288992de5so1010837a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205319; x=1795810119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
        b=vf4DU23qIFyAfj/YE4n+2c/vHUYhd/HvuQgbQ0q/dv+Ia46pCimLPCIqTE8aajElTN
         yj1HOLMMmgz8pCrtsTFpt4qUM74HSVwEkx0fWy/u8LqrX+m8p9au8d3GUav9MahElBYD
         SEcDQFEwDIIxtuhPgzK/410joGL8bKlOQq1Xv5gQQBXKrtGhw0hi8VPppOehKROaQhGG
         5Oi7fHgU9NYH4MjlmRh1XrafqRbZ2cg/ubodA7o4GIJ8keYO4WncPe+33Z6F7Dnnmrwz
         2FMcfskuKZ36VQHLajyVuwpBg6UqQQm1wnz62zSnZzTzv8qGK9QfTBTGQFVq2+N1oSp5
         QNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205319; x=1795810119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TfKzkJmtwO3w9lSwQG9nI6f6Idy1UggKZRrUE1Xn1HQ=;
        b=jR3jtMEOuEYUqnjOcxtbgMVEKO0Tu4IGpDIgl9YPlD1At+h4zCwtnDWK1JFmGMws1A
         Mgfg0cRUJKSe4cFokJaf1+Ot3SHLS+28AUKFbQFsrAwD9CuQKcl26LfdJm8t8N5JhQQA
         FaMdoZFDa7ntKyNxknzIfDd1qjqg7FlZeGeel0fBI0hPRl2wMetYsx+hkWhYCLwgepTm
         clas1AY4wGWiTfY8+6E2iUYEParWCk14LtiweLUkP6/gPplJ/TkcgbEKMzjQS2ttTWJP
         1/L1E7cO48h1ACowY2F1fMFT11L+SN48p7o/GjAh5GFvHY8TAGPVD8zJShY5x5DIgj7a
         /VWQ==
X-Forwarded-Encrypted: i=1; AL+hErFI9tz73a0C3IvU7Jc13ABjq3/q5uPOskqt+e2dz59R8Fn7qFi9SKcZ+/GCK5MYGjTZQJXTCNO/Q5U=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+ryA5D5lPg7ubG21tfd1pgM43Gb2qBz1AYa8AqZpUNhhp/ZFz
	+qqXVZpYJW73ovUnuySjrXnyB0A5D9agnRfpN/HbGUPBHkNzcaPZD4HL
X-Gm-Gg: AYBFou2oVALG1VTyf8aV2s8wBLgzB+aVuZYjR9Pg21gwa2LEc8OIRTS5kWOQfYS9lS/
	+ukeX+k0BALWUnaO7+MSrRn/krdtAp+/gfFRiI2RowLAOL57ZybTvNefCzCZNpxlnmZxOALkF47
	QFvJEnZCPsoFR0OwaNxyKRgwPKBu5AM5sRlkyO+16Pbi3Hzzdvd2o/2xFCaaLg+Ys6AocoFaeZL
	uQAID45Gl5gGhR4DYi1+eVs/gRejLYbPZU2tM/YbGiwg0y4sRdk3ZAOsZdGklCe7YHMM5Vy8iYU
	+vf8ET6WIV0Pdq9NpQNrHYOAawEKz4eIBI6/8Vg8GQEuebaxHi0gIhq0OF58kzL7mb3U9nr8331
	ynk0A19e8png4HOi3sx/LJ6yxR/aI0wX0CaPqWl/OCpBRjrBBX76dSSCironOUpomS2g/c1loEm
	hALoNdyBcT+eMksrfCm47/o85TAIvb7UKML836VnatK84xBvIeHmXNLKuqjsD3eUXTIt/Oyb9br
	wUP3Mq9HAIpobfUVEXh2FbIYgZo8PKn9rCBiYcNZD6NXLkms/MDbiFxksN6nxAKYzDJgCP5E7Lk
	xqtwwJ6jtrlzPPYNtkveBE1iMpjGcjKvY9IIcA3q7AhSXxlkqQjMKIe4ebZ5RpRh33RyFwlWo1L
	ctTGneqE5BqszjpHf59l2xDikZ3krL9uE9Xbc9nhgKwR4zufBjycrhgDccwY++527cKgJSlOKUj
	DVArV9/FFL9hm3ZIzCFMj6RrnzwuOIweN+z5jQ/pOAPqrA1u+nCQAl
X-Received: by 2002:a05:6830:3143:b0:84c:58b:417f with SMTP id 46e09a7af769-86315491026mr4789532a34.5.1795205318952;
        Fri, 20 Nov 2026 12:08:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:32 -0700
Subject: [PATCH v3 02/11] nvmem: drain keepout and cell post-processing
 accesses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-2-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_120840_700345_B848E6DB 
X-CRM114-Status: GOOD (  17.14  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A provider can unregister while a read is still walking its keepout table
or running a cell's post-processing callback. Waiting for the register
callback alone does not keep that provider state alive.

Take the SRCU read lock once for each register or cell access. Use the
same operations pointer for every chunk, including the reads needed for
a partial-byte write. Unregister then waits for the entire operation;
new accesses fail even if they would only touch a keepout.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 110 ++++++++++++++++++++++++++-------------------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 03ea878874e4..32d36ca904cd 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -54,32 +54,18 @@ static LIST_HEAD(nvmem_lookup_list);
 
 static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 
-static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
-			    void *val, size_t bytes)
+static int nvmem_access_chunk(struct nvmem_device *nvmem,
+			      const struct nvmem_operations *ops,
+			      unsigned int offset, void *val, size_t bytes, bool write)
 {
-	struct nvmem_operations *ops;
-
-	guard(srcu)(&nvmem->srcu);
-	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
-		return -ENODEV;
-
-	if (!ops->reg_read)
-		return -EOPNOTSUPP;
-
-	return ops->reg_read(nvmem->priv, offset, val, bytes);
-}
-
-static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
-			     void *val, size_t bytes)
-{
-	struct nvmem_operations *ops;
 	int ret, wr_ok;
 
-	guard(srcu)(&nvmem->srcu);
-	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
-		return -ENODEV;
+	if (!write) {
+		if (!ops->reg_read)
+			return -EOPNOTSUPP;
+
+		return ops->reg_read(nvmem->priv, offset, val, bytes);
+	}
 
 	if (!ops->reg_write)
 		return -EOPNOTSUPP;
@@ -97,17 +83,20 @@ static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 	return wr_ok;
 }
 
-static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
-				      unsigned int offset, void *val,
-				      size_t bytes, int write)
+static int nvmem_access_locked(struct nvmem_device *nvmem,
+			       const struct nvmem_operations *ops,
+			       unsigned int offset, void *val, size_t bytes, bool write)
 {
-
 	unsigned int end = offset + bytes;
 	unsigned int kend, ksize;
 	const struct nvmem_keepout *keepout = nvmem->keepout;
-	const struct nvmem_keepout *keepoutend = keepout + nvmem->nkeepout;
+	const struct nvmem_keepout *keepoutend;
 	int rc;
 
+	if (!nvmem->nkeepout)
+		return nvmem_access_chunk(nvmem, ops, offset, val, bytes, write);
+
+	keepoutend = keepout + nvmem->nkeepout;
 	/*
 	 * Skip all keepouts before the range being accessed.
 	 * Keepouts are sorted.
@@ -120,11 +109,7 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 		if (offset < keepout->start) {
 			kend = min(end, keepout->start);
 			ksize = kend - offset;
-			if (write)
-				rc = __nvmem_reg_write(nvmem, offset, val, ksize);
-			else
-				rc = __nvmem_reg_read(nvmem, offset, val, ksize);
-
+			rc = nvmem_access_chunk(nvmem, ops, offset, val, ksize, write);
 			if (rc)
 				return rc;
 
@@ -150,13 +135,8 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 	 * If we ran out of keepouts but there's still stuff to do, send it
 	 * down directly
 	 */
-	if (offset < end) {
-		ksize = end - offset;
-		if (write)
-			return __nvmem_reg_write(nvmem, offset, val, ksize);
-		else
-			return __nvmem_reg_read(nvmem, offset, val, ksize);
-	}
+	if (offset < end)
+		return nvmem_access_chunk(nvmem, ops, offset, val, end - offset, write);
 
 	return 0;
 }
@@ -164,19 +144,27 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			  void *val, size_t bytes)
 {
-	if (!nvmem->nkeepout)
-		return __nvmem_reg_read(nvmem, offset, val, bytes);
+	const struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
-	return nvmem_access_with_keepouts(nvmem, offset, val, bytes, false);
+	return nvmem_access_locked(nvmem, ops, offset, val, bytes, false);
 }
 
 static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
-	if (!nvmem->nkeepout)
-		return __nvmem_reg_write(nvmem, offset, val, bytes);
+	const struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
-	return nvmem_access_with_keepouts(nvmem, offset, val, bytes, true);
+	return nvmem_access_locked(nvmem, ops, offset, val, bytes, true);
 }
 
 #ifdef CONFIG_NVMEM_SYSFS
@@ -1649,10 +1637,15 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 			     struct nvmem_cell_entry *cell,
 			     void *buf, size_t *len, const char *id, int index)
 {
+	const struct nvmem_operations *ops;
 	int rc;
 
-	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
 
+	rc = nvmem_access_locked(nvmem, ops, cell->offset, buf, cell->raw_len, false);
 	if (rc)
 		return rc;
 
@@ -1708,6 +1701,7 @@ void *nvmem_cell_read(struct nvmem_cell *cell, size_t *len)
 EXPORT_SYMBOL_GPL(nvmem_cell_read);
 
 static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
+					     const struct nvmem_operations *ops,
 					     u8 *_buf, int len)
 {
 	struct nvmem_device *nvmem = cell->nvmem;
@@ -1727,7 +1721,7 @@ static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
 		*b <<= bit_offset;
 
 		/* setup the first byte with lsb bits from nvmem */
-		rc = nvmem_reg_read(nvmem, cell->offset, &v, 1);
+		rc = nvmem_access_locked(nvmem, ops, cell->offset, &v, 1, false);
 		if (rc)
 			goto err;
 		*b++ |= GENMASK(bit_offset - 1, 0) & v;
@@ -1746,8 +1740,8 @@ static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
 	/* if it's not end on byte boundary */
 	if ((nbits + bit_offset) % BITS_PER_BYTE) {
 		/* setup the last byte with msb bits from nvmem */
-		rc = nvmem_reg_read(nvmem,
-				    cell->offset + cell->bytes - 1, &v, 1);
+		rc = nvmem_access_locked(nvmem, ops, cell->offset + cell->bytes - 1,
+					 &v, 1, false);
 		if (rc)
 			goto err;
 		*p |= GENMASK(7, (nbits + bit_offset) % BITS_PER_BYTE) & v;
@@ -1763,10 +1757,18 @@ static void *nvmem_cell_prepare_write_buffer(struct nvmem_cell_entry *cell,
 static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, size_t len)
 {
 	struct nvmem_device *nvmem = cell->nvmem;
+	const struct nvmem_operations *ops;
 	int rc;
 
-	if (!nvmem || nvmem->read_only ||
-	    (cell->bit_offset == 0 && len != cell->bytes))
+	if (!nvmem)
+		return -EINVAL;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return -ENODEV;
+
+	if (nvmem->read_only || (cell->bit_offset == 0 && len != cell->bytes))
 		return -EINVAL;
 
 	/*
@@ -1780,12 +1782,12 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 	if (cell->bit_offset || cell->nbits) {
 		if (len != BITS_TO_BYTES(cell->nbits) && len != cell->bytes)
 			return -EINVAL;
-		buf = nvmem_cell_prepare_write_buffer(cell, buf, len);
+		buf = nvmem_cell_prepare_write_buffer(cell, ops, buf, len);
 		if (IS_ERR(buf))
 			return PTR_ERR(buf);
 	}
 
-	rc = nvmem_reg_write(nvmem, cell->offset, buf, cell->bytes);
+	rc = nvmem_access_locked(nvmem, ops, cell->offset, buf, cell->bytes, true);
 
 	/* free the tmp buffer */
 	if (cell->bit_offset || cell->nbits)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
