Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886DC606A32C
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2YDPZyhF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYFcMVRK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7IX3DafTs5TOW9DXYvwWWqHRO4niIsHP8rxGqSzT4OA=; b=2YDPZyhFC9C00NpDfXYrBtw49D
	VE4s+INClD3JbD6SzA843N4aA74ZKF1OW+SCgCbeowsL7F74FzIC1bVEApwPk4tYfstQM9Rra/Bi/
	GjrgvecRPTFxhFg6KWrfhObODmx7M4dtZ2HkREGFHQxd+wqLi6fUMGpnj8d56LqPbheLB9kpuPbTe
	aEuryRCdIK4XYt6TbsvezzbhU+9ZHKJ/6zPyg4fioZwD8jJ+KniIOGwzFHLB1KshoM/SzVuLE1vPu
	7yZCT8FOV7wCCdpFBabLYtSh9bdnK7S3vUUEzboT7WHsIw3ERylheuKiHSu/Mfp0gU3+Z7MdH+6Jd
	+5PCso4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3pn-00000000uPL-15ql;
	Sun, 22 Nov 2026 09:26:07 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3pe-00000000uNm-1OGp
	for linux-mtd@lists.infradead.org;
	Sun, 22 Nov 2026 09:25:59 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-55e0090c580so931501b6e.3
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339557; x=1795944357; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLux4IaKjACihTjDhvHAsFdwr8NDbNNSjSatrsNIAE0=;
        b=lYFcMVRK10u5hP0FWNPyRTTM74B3xwWPMphVlnJVsEsbPRNE+uXTdDvt72KZ4yg/Vk
         3LF3iIRDCfLcsryGlGep22mFa5/evHi7sfEpvCd7GKmZ4eYtub/zvCgtfVoVXUtgZpNX
         biR2M+GEC0KFz4vYJT6Ms6kIokuDMClfJSl6OD1dVNiedGWsx5V3SEbqRL3C5nJesVSB
         D7iB9kBYUNnu2FAVh4sM3Sfg2q+6rJHmon3uM4pXQ0Zk79m7PZQE1qxxvrOBUJjLlZi9
         jJo4zcDITRavoZ4Hw39V7S0HURS/XU7FYLKMttz0NLg/Lav/ybh1dQ43tjKWMHKgLQBV
         GcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339557; x=1795944357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLux4IaKjACihTjDhvHAsFdwr8NDbNNSjSatrsNIAE0=;
        b=Am5cN4PCiRddwqkzGMnMwCnYMNgovgftNBkqmERACoke0HD+SI4yPhX7KEPBNdOuoX
         UO7M47pOxGyaJ3dMBc/nO4cn9CEeA7IXDjo/R5r3c9AqgrFytcTaRInDRQsdBvPBHOYJ
         JgiNriWIozcLaB05yAHmWd43lE74IgCKozNNVsybJsdABsRlOkyG8ms2lGzPG51tp8Y3
         rQS4a38AX7pNIHVEA82NLtGFJ1luv3E8EtApkCuiDj57a17Z1dNlyLxplL4EeWfGQl8j
         Q6ObRs6OrbHPTJjNaqjDF+rUQjF/sf9Qlh+grbNHZK5XMqTh/mJi/KTHS/Z+8/0S8FTv
         6vGA==
X-Gm-Message-State: APuU4Z9hhLbeuBnWOy6h2o8sKKsS4g8SDhewFgDS+oamUwVpcNm3FGkp
	Wj13GaJUVadTm7tXrmM37OUxg98XhwyOILECsQ3u/NupDf3kUpZJuwov
X-Gm-Gg: AZFdTZc1r3inDbmxy09Jp9F6R4owSPxxp89Ge5/fBKvDKH+rC5F+I9svP0exixjc9Ze
	dyoFrhoRJ5jfS+pog2RQahDSgJ+Af74rXgCJp6JeC+D5R0VqieHa360jGsUjaWv1QN5PgGN7ydW
	+XPBZeOLwmViA6V1ltFFFV0r7LIadXv2o4HIH+WpP3bK6NHjvqLkxjqY8N9QksqcbVviQm5MVcM
	vW5cpnYhCCIAGSbgvY78WMK37C2B2qOcLIW237tk9RneLUJzNB7W788RuD/vMdwl0JPviyz/5GH
	fYvwMhSQApLfgSx4L2v2hhx7SQnZM/qNNA+6qLc9JOX+fk5vZktLcTjCKr9/Mc4qnyjUYBhoP/k
	C4T43vKdwIzUqOsaiDmEyirujyvG4SVpjjgFEp9w4M9/jrUSHtwU2/X0/NFQqB2A/uDmTvGcD4Z
	M/RalxNaSfOXkGj9ket74rWkj3SbVshzRlkopY8S+IbkH95i8SKuftxAZvoMqGMo49xNXpe9x3P
	N8QB0LicUCeBannWO6gXJ+EbfN3/IJ8LKPFNOPJpSkOmIsg/QdAAvQCeWou6H+XKbR52CEBQxPe
	ZPyRS8Goq2YVVC+YanT2qYKXAewxHSEXp68mB3o/Ut7VJmHPWSRqvCu6Zs3+2JAoRv5qg+1JgYj
	3ttCSDZECWeNO80j5sO9vak/MyGxeDISUO2ZK2jqwNw1zc15Hf0Pw+yE+lvCCExv+3dzHMcTe28
	wTgGMWu1hYXV4vKGu6RSxkOCo1zl2477ifr89JpZ1Q5gDMc0mfAjTk
X-Received: by 2002:a05:6808:1384:b0:4ce:a4fc:a848 with SMTP id 5614622812f47-57a06a0da3amr10323868b6e.6.1795339557259;
        Sun, 22 Nov 2026 01:25:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm8698476fac.3.2026.11.22.01.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:25:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 02:25:20 -0700
Subject: [PATCH v2 1/2] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261122-submit-rawnand-operation-locking-v1-v2-1-030bc867f0c7@gmail.com>
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
In-Reply-To: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_012558_378477_1275C08A 
X-CRM114-Status: GOOD (  14.18  )
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

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. Normal NAND I/O
can interleave with these commands, use a different target or access
pages while OTP mode is enabled. OTP I/O can also run while the chip
is suspended.

Make the existing NAND serialization helpers available within the raw
NAND core and hold them across the entire OTP transaction, including
restoring normal mode and deselecting the target. This uses the same
lock ordering and suspend handling as normal NAND I/O.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Cc: stable@vger.kernel.org
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..2668f527e637 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+void nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 58dbcb004a62..2f1c973b8d3b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static void nand_get_device(struct nand_chip *chip)
+void nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 16847f28b19d..d7f5a9e7c240 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret, cleanup_ret;
 
 	nand = mtd_to_nand(mtd);
+	nand_get_device(nand);
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +427,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret ? ret : cleanup_ret;
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
