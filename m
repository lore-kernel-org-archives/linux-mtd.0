Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F684606A32C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kkIuVCvA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wuuryPMX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gYzEUYXuUpk9uAthkPrWLjxMAI0x1/AcYudqmAIh18o=; b=kkIuVCvAn51W74GRCzmh6Qlhi3
	aTydGuoFaAiUeZ/VVjVleACKbXYUZKOhyw5ONi6Owhg13P35Bo+n24iCgMA40bEROJ2ydkitIKTii
	fs0/MP/YeC9XPLgTuaAXGJLJSTZXyTv4f1QCqOgeImY8CKTB9lUSGTmgnQoTVWcQfCNJ9twTTAjYE
	dZ0HrsPTZuH2J2xrRtvGVs96BABT//5X+tfJgTPwB1VQ+KuE+J5RGp74fADK3+6DBSIBZqjVYcwBm
	qmTRSrczEWqh45HRmIxKjslc1jMXOHyVdUjPW+s4TMIGsnY7kTFVSp0Wkf9pKH6oQh2SaX+y2f11H
	V+aLYgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnOf-0000000ALOo-1VEq;
	Wed, 18 Nov 2026 21:40:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnOb-0000000ALO1-3atc
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 21:40:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so2129175e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 13:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038048; x=1795642848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKnQaHE9688yraIogV/DS41+AONmyX+Vuhqn/FS9syM=;
        b=wuuryPMXE/lUXaj8wrMCtCuKaGwUHzhfVitEICWlt34Ygrn1cphbjUVC0WRUo8+MYH
         pbTy30FsHy/HmxUkwP7N+IQFggEWGz9KQkDZRpFEquf43/hlVGRaGuGPiK+S8dhmlrEN
         dlHfV0Xw4dFxcuWgUCKFWEMdpsG/Ea6AQhrj7xSVwzHvvlAJ82fnoMM34ODMwGrWYRmU
         XhXiRxP+1LKXZwaqYiWU2TQEeVFL/JfU60hAN7bQqCXPUX3N3YpSGaYBJ1TaOepIHoOl
         aZXAUYLQ4IoANJo0qjfYuD6dSNleq9UUCqE8Lk6w9BFUrD+KxoXr+TYTWzbEhSuglcdW
         ZS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038048; x=1795642848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKnQaHE9688yraIogV/DS41+AONmyX+Vuhqn/FS9syM=;
        b=OY5midOFZdrjcaooSSB2BKdUSWPxObkApQdDs4TWmh/KsXLzuIpGpH1vGjSvv3xiR6
         vtXUJ0VpI33R1wZhjuDxeDgNqRqcgg7MrNoaZ5H3cYXO8Jif/ub/Fel8OCfPBTuj8T6b
         QsmO3zXCJWnwhF0Kx3zqFowGGoNs4N61GufSZtWV8xC8Wyp16HoQ7JS1eC9Ft7c983IJ
         WqzuK8r4F6C+tXZ1otMX+ffKv+YFfk+TdCi/17N2qU6f8e91bLXp1WkitfCbm/YE+q2h
         fImm450/WKFmk8C2ipxmxJJ9SAUUHuKLZaOXqwj2iQeiiAlFexDBMKerg3pZ9TwY9mLi
         ZFEw==
X-Forwarded-Encrypted: i=1; AL+hErHJ3jsKKNaLi3LFQ5RV+5CwYng70rwr5DneHQwSE795wkTgm9N1KXPr+lD4QuhYcQt2p43n/UWu9pA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+gMHND9JEAvoLvxq7nw2BGwhxL3dH+mJcx2GiRpMaEiQ0JDJiv
	OtCSAHOnhn+ckhhORfwdhomuR3wPS+n1Qp9tGjRbMp+leZ3IoZ9G+AaucOFzL+1pWcw=
X-Gm-Gg: AYBFou1onUPBG9FDjbHodfdHxoS5yk7j5F4NpyFzJwNJcLJwPkjpD6XZt4vIIO32UVf
	mXCv+asuijLeaH40lCKWEthyZQc3wNzN+WP5yzk0W+Qt6ek/E/gEEGDCykVU7bX2+cqbz24MPMC
	OKv9RaV+ZUIb/dmCakq7NxSjFkP1ixpzstWJNkOSCxLfbZ51pedDKYqe6KUh1G5OlVdDB80liqJ
	mQSMEsgy9E0+14FMauVN6ooNpsLCw0l4RMn01ebIsX0CMez4NspzgCrtUqgWQPfIhq8I330NFuX
	ProBtVcNfAHApnTLR3F0hcYwG9ku9GrhRYX1XZWKHXRNt9S1Z8hJm02wLTsPRZpIWY4F6m6zD95
	moPkarr17Fiy+2n7cY6oy29B1MHJ6rCTCOu5hnKeYJo9XZLxSpfus2rBftqPsWlu+iNuWEUcxt0
	d/G2bQOmswWip5lSzqNVu+kzJvhoH8QsJW5O//oeN2NrT0v01pL7iD0PfDKarNlxpcUHCCIcvni
	mexT/B2tiZ3CtVnczExNJljOXbS5ubFMO3esmi3qjygQaPlNvv4ETkWgjrGuZFglFaOdb034ypI
	GOTm+Tc/W3pBsZreGkzm5xEDNZx/Xig/Fkp7eyUXnp9HEyFJB9vXvziHkCuixkw3AKyZIHqU5WK
	Zx+0Tb8VccJZqPv2eE/SPWRsrzugN0V1j16Sd0TXUYX9KimE=
X-Received: by 2002:a05:600c:8594:b0:4bb:6816:127c with SMTP id 5b1f17b1804b1-4bb8328e7d4mr12662075e9.8.1795038047426;
        Wed, 18 Nov 2026 13:40:47 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6361300f8f.19.2026.11.18.13.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:40:46 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] jffs2: check the data CRC of a node in RAM, not through point()
Date: Wed, 18 Nov 2026 21:40:44 +0000
Message-ID: <20261118214045.107562-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_134049_950156_34D77D44 
X-CRM114-Status: GOOD (  21.09  )
X-Spam-Score: -2.1 (--)
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

check_node_data() points at the node data when the MTD supports it
and runs crc32() over the flash, which saves a kmalloc() and a copy.
That paid off while the generic crc32() read words (slice-by-8). Since
commit 5e3c1c48fac3 ("lib/crc32: remove other generic implementations")
it reads a byte at a time, and on a CPU without an arch CRC32 and an
uncached map, such as a NOR flash on a boot bus, every byte is a bus
access of its own, while jffs2_flash_read() copies a word per load.
The MTDs that can be pointed at today are cfi_cmdset_0001 (Intel NOR),
lpddr, map_ram and map_rom.

On an Octeon board with an 8-bit AMD NOR, with point() added to
cfi_cmdset_0002 (under review [1]), the first lookup of a 46.6 MB
file checks the data at 2.77 MB/s through point() and at 3.37 MB/s
from a buffer (16.8 s against 13.8 s), the rate of a plain read of
the partition.

Always read the data into a buffer. MTDs that can be pointed at now
pay a kmalloc() and a copy per node, as all others already do.

[1] https://lore.kernel.org/all/20261117214141.3826637-1-orgads@gmail.com/

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
 fs/jffs2/readinode.c | 65 +++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 43 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1caabff9d..18a47b432 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -31,7 +31,7 @@
 static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info *tn)
 {
 	struct jffs2_raw_node_ref *ref = tn->fn->raw;
-	int err = 0, pointed = 0;
+	int err = 0;
 	struct jffs2_eraseblock *jeb;
 	unsigned char *buffer;
 	uint32_t crc, ofs, len;
@@ -61,48 +61,32 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 	dbg_readinode("check node at %#08x, data length %u, partial CRC %#08x, correct CRC %#08x, data starts at %#08x, start checking from %#08x - %u bytes.\n",
 		ref_offset(ref), tn->csize, tn->partial_crc, tn->data_crc, ofs - len, ofs, len);
 
-#ifndef __ECOS
-	/* TODO: instead, incapsulate point() stuff to jffs2_flash_read(),
-	 * adding and jffs2_flash_read_end() interface. */
-	err = mtd_point(c->mtd, ofs, len, &retlen, (void **)&buffer, NULL);
-	if (!err && retlen < len) {
-		JFFS2_WARNING("MTD point returned len too short: %zu instead of %u.\n", retlen, tn->csize);
-		mtd_unpoint(c->mtd, ofs, retlen);
-	} else if (err) {
-		if (err != -EOPNOTSUPP)
-			JFFS2_WARNING("MTD point failed: error code %d.\n", err);
-	} else
-		pointed = 1; /* successfully pointed to device */
-#endif
-
-	if (!pointed) {
-		buffer = kmalloc(len, GFP_KERNEL);
-		if (unlikely(!buffer))
-			return -ENOMEM;
+	/*
+	 * Read the data into RAM even when the flash can be pointed at:
+	 * the generic crc32() goes through it a byte at a time, and on an
+	 * uncached map each byte is a bus access of its own, while the
+	 * read copies a word per load.
+	 */
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (unlikely(!buffer))
+		return -ENOMEM;
 
-		/* TODO: this is very frequent pattern, make it a separate
-		 * routine */
-		err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
-		if (err) {
-			JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs, err);
-			goto free_out;
-		}
+	/* TODO: this is very frequent pattern, make it a separate routine */
+	err = jffs2_flash_read(c, ofs, len, &retlen, buffer);
+	if (err) {
+		JFFS2_ERROR("can not read %d bytes from 0x%08x, error code: %d.\n", len, ofs, err);
+		goto free_out;
+	}
 
-		if (retlen != len) {
-			JFFS2_ERROR("short read at %#08x: %zd instead of %d.\n", ofs, retlen, len);
-			err = -EIO;
-			goto free_out;
-		}
+	if (retlen != len) {
+		JFFS2_ERROR("short read at %#08x: %zd instead of %d.\n", ofs, retlen, len);
+		err = -EIO;
+		goto free_out;
 	}
 
 	/* Continue calculating CRC */
 	crc = crc32(tn->partial_crc, buffer, len);
-	if(!pointed)
-		kfree(buffer);
-#ifndef __ECOS
-	else
-		mtd_unpoint(c->mtd, ofs, len);
-#endif
+	kfree(buffer);
 
 	if (crc != tn->data_crc) {
 		JFFS2_NOTICE("wrong data CRC in data node at 0x%08x: read %#08x, calculated %#08x.\n",
@@ -133,12 +117,7 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 	return 0;
 
 free_out:
-	if(!pointed)
-		kfree(buffer);
-#ifndef __ECOS
-	else
-		mtd_unpoint(c->mtd, ofs, len);
-#endif
+	kfree(buffer);
 	return err;
 }
 
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
