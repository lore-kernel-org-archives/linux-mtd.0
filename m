Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BCD606A31B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 06:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zm9Rmv40;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRwc4o+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NIYYGZQogTrYRtZOPj1x+7XABFcS50BF/8JyWX2ER4A=; b=zm9Rmv40nJX5qi1wiSIQ6kAGP9
	cZyIgg5stfowi1YLmXC4NXL8hpJjb0YHFHrcRWwi0/7EwdYQ5mkuQ+oNpMiE7eV3Y5gk7UkrbdAa5
	ZAJ/vf5+VlZfCAU8wjx0b9roonZDKrlswG4NKftwz3cOgMA/W7R47u4O37608O3k1zh6o/uKU28mz
	iItko2x2CArR0moiqgDOPveMMf1LHR58lCWYZVCdbDvXO6foRl36ge8p6i3AhjEJwMLTPGP+UNX7V
	ba6SWxkTt4mjtZYestG+lcv2kXjch3x8/70QrWf6OJIp5TKcWl8Bl+Ytn2V8BWxcpvaavT7C5rUtY
	POdE/PNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUC9-00000004ONd-2tHq;
	Wed, 04 Nov 2026 06:10:01 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUBx-00000004OJM-1zvI
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 06:10:01 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-43bf9548df4so413778fac.0
        for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2026 22:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772588; x=1794377388; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vfv2SmA+eQB/LlpP+XHmSHhdsYo4evTD9DRQtL9SFXY=;
        b=LRwc4o+zS9AjpDu/kXOGrcHT7R8aalx8ZVV83P0LP+8W5yGPCaKL4lFP8lsYj0Buwv
         AhHcn+2BngEfGbFMrNyZTI3czCR02i5gBKeXbesDdv8WdTvBQp9e4YnxlxErlpWUJvlQ
         iYmb0DttDKMFjBUcSUc+FgVQBMEVSRK1y1O72gtToMwiGiabu8ZTpiynfFBfN8UPSoMG
         7WGXcsGHf13/7Fo9uC4PEDvfDE4206XzpVRf8PdOcOUJIMVdcc6S543hVeXnsIO0B1U2
         NcfSjMyV5Engo9dHTNNxY/P3A1QoP9ugm+T+P6Mc3/8wF0VboyapPRzVbPlEiGcph3QD
         8HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772588; x=1794377388;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vfv2SmA+eQB/LlpP+XHmSHhdsYo4evTD9DRQtL9SFXY=;
        b=LtU0GLUdN9/8voBQb4EcCXKai3BBpIr3evxE3BmQcMYCGAidi91rm/SYiyh2Vdp8vn
         qE87SdDKK5fGyACqROHRDKu8LAd2B5CgjI79ZqMIUVFc7mNcB0MXVpzx7ncSnKfEAt5j
         8w9V6yUuhrecMEZJB9LSNuCW/jZ9PwNqqeQX1GYvNA1Cg8nclf0nmtQio0sghL+nZtbP
         aIh7Aha+ObIhtW8fBItJZyd5xz7s/5Xvvw7wfGllDz4RziI+TMVpnenaJ1P7JXAxBnOY
         +blwiZOw+5KXdkMHwxmZrIioLfG6LO3qoHFOXTSmgNqnIsDP1W0+VO/oU0v7sh5kBefn
         I6Yg==
X-Gm-Message-State: APuU4Z8MLzPC3Kqn6qZRNBU1Nd6H5SFWY/wI7nD7Tv4/CHVpdH46U5Zl
	9XXLlHXx0E2lcrWW1Z/gksr5nSqmsmUS7/XqxCV8UBOu1fCuUThTjg+U
X-Gm-Gg: AYBFou2DfEQDQnHtk2zers0/scqOeaZfglDcH5MYFT4b2hbZK5zxWST+IlAiVRAdHH9
	bMKNuFLQvgqkZhnqlvPDiLzu9Sp3ATbxqDK379toArEHmerViiGrRhgvsqZqNleOZ2XVnKOQvgC
	SC/uhqFU5YhqOm51p0To7i01za8sPY+Zj48Tawh8cvy+25OqPgD1zkLB320GWKvEXNjm3bWuwC+
	XqAOiepq4KmPdjNpQJBnI5MLfgQdQ4c4MPNd33tosxfPhuawRNWmyJu25BqkkD6giAYqE3mNxil
	31O305ia5l0m3gHuTg5lZkQtRFec3SGRFP/23tt4X2g5iVDBOv63AdGKnbTl2S6FDDlj51gCoVt
	cttEWcBj8EspZDKT3GItiblQznrUVXEImKWNNUT0atSTh7L9nZvVvN+2jI+VQ/Z5PiFV8SZ5IkT
	kSwILK76PTQAIouZSxllRLF29hACXbc75keimz9AmKthJSE5FQk+XpaJKSRbJBX7irbeJRA4yiv
	5oFVpQ/sP+GC0Q3cfhTCw6tEQ90DCl5wg1E4dtxh2D/G05q2woXDVrfLpQ1YnNLJtkuYGtT1GC9
	slv3XyoD20QbqoSAH4pwOhY6l6YetntOmxZMC7OJB+EU6/nosDHiZ9446ZAdeYM0aY0agFjyKp0
	y13MYmsrJvA6zmOAnxEJNiTguQyFZlLsSCMkeyoMcBLIR1W1KCqxsnKO1HJRSx1aGWpQaeznftO
	J7Tilk43Ou3+YLfMhHsQMD5uiv1w7USc8nBAlQbD13FT1ToFtPNWE=
X-Received: by 2002:a05:6870:c2a6:b0:4a7:5508:c526 with SMTP id 586e51a60fabf-4a90764b895mr10269244fac.21.1793772587945;
        Tue, 03 Nov 2026 22:09:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad58d37b40sm196917fac.11.2026.11.03.22.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:09:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:09:45 -0700
Subject: [PATCH] mtd: rawnand: copy OOB only after completing read retries
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-submit-rawnand-read-retry-oob-v1-v1-1-2a6a91b39e43@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTsJpVHAqxgWUxhhTGzNtICGc
 HeLbl7ybf63QWQVjnAtNlBeJErwGeZUQD+RHxllyIaqrC7GlBbj7J6SUGn15AdUpmOSfjAEh4t
 B19ZU2zPZpmkhZ17Kd3n/Lm7d37nx4D4dXdj3Lxb3xxeEAAAA
X-Change-ID: 20261103-submit-rawnand-read-retry-oob-v1-b97a735a3889
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Huang Shijie <b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_220949_531882_9E317186 
X-CRM114-Status: GOOD (  13.32  )
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

nand_do_read_ops() copies OOB to the caller and advances the output cursor
before deciding whether an ECC failure requires another read attempt.
The retry restores ECC statistics but does not restore the OOB cursor or
remaining length.

For a combined data/OOB read, a successful retry can therefore leave OOB
from the failed attempt in the first output slot and put the retried
page's OOB in the next page's slot. A later transport error also leaves
oobretlen accounting for attempts rather than completed pages.

Copy and account for OOB after the retry decision. A successful read or
an exhausted retry sequence contributes OOB once, while an attempt that
will be retried does not consume the caller's output buffer.

Fixes: ba84fb5952af ("mtd: nand: add generic READ RETRY support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..361918d11ce4 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3537,16 +3537,6 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 				memcpy(buf, bufpoi + col, bytes);
 			}
 
-			if (unlikely(oob)) {
-				int toread = min(oobreadlen, max_oobsize);
-
-				if (toread) {
-					oob = nand_transfer_oob(chip, oob, ops,
-								toread);
-					oobreadlen -= toread;
-				}
-			}
-
 			nand_wait_readrdy(chip);
 
 			if (mtd->ecc_stats.failed - ecc_stats.failed) {
@@ -3566,6 +3556,16 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 				}
 			}
 
+			if (unlikely(oob)) {
+				int toread = min(oobreadlen, max_oobsize);
+
+				if (toread) {
+					oob = nand_transfer_oob(chip, oob, ops,
+								toread);
+					oobreadlen -= toread;
+				}
+			}
+
 			buf += bytes;
 			max_bitflips = max_t(unsigned int, max_bitflips, ret);
 		} else {

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-read-retry-oob-v1-b97a735a3889

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
