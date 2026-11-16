Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401B606A33E
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H7ii12bO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYUSRQ7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zBnQPmdEVVS6CvnVXubo2gEYbDm72czTgCSy+0ToXTA=; b=H7ii12bOBYwce1S6yOM4GqZJN1
	KpF+449LmJCAKdFLYamhKdT3/oT2jgHzJKzN4Dlo+p9mwHJrTQThdEAS66DUKUofU0Yqjn3AB08OX
	DLWZZ3xTyO30zfw3KZCYV50SJUavVicmIU+WnMzbVdc1/iLCn1NjelLrxDOa65A5hvbpTdCm8FdGy
	GWljl+UPlkFezsSHD+y/86D1v7JIl94mcLaWFbmWWKX38nyiUnkySrCtjy9L3kYVQpyLKt5vGQ0ru
	4LYIq5ALHvoSp9HpP+m6Y6mm9VZ/dpoaISaaWy5Q3S0LKc0EJ9NDaC/NlmFteuycmYFoj76HMt3Cl
	CAQ3Xs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyhO-000000035Hv-3pm4;
	Mon, 16 Nov 2026 15:32:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyhJ-000000035DV-12JX
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 15:32:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso23349515e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2026 07:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843163; x=1795447963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37g0U2XiZsITbmJfFYH1a6i8Mla0nRkTmn1Jvrq3M5s=;
        b=kYUSRQ7fzb4NmoBjZ8+g7DOyak5iFGtD6l8b94I9/94dWlZYauNg+g23T/vAUoiO8u
         dnQcjG7UTbien+MXocNTd3HWhn+ZULWN1XbMVhqkKt8u4c1EgUV1Q63rE0g/NysEKOFG
         3CJiIBDbCOUI5tXDw4E/ngZUeE1kV8tt1e2rK48kfxp4vZ8IvlmpUBJb+Lu90hDTZSzu
         9DNx5Pg/YgOcmLFSxzDyC3/Dxe4Y5ABqZK+OANasJApvYUirwoivoajc5RhglkOag0mo
         OVl8cq3P0g5TMUj7z0CyOhga3zJw238xeG47MTvbHFRz1513qG3JmW2qQpu+EDwo84C8
         UJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843163; x=1795447963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37g0U2XiZsITbmJfFYH1a6i8Mla0nRkTmn1Jvrq3M5s=;
        b=SmHihkgrAn96dXy92AG7uc+pZlpKZ4r/uFB41bFq2+7wb6OZjTarhXf5BAH6gMRZhy
         jW2qJQjNZ9DrEyLAumYvQO8ktcyTaeb6j7ODCGJdKz3bpM2Da9MlbfcQ1bzhwkIIq8Qw
         cOMUnhQ+6dvJXCafSMF20LAp2qD/p7JuWsmzKiHT5E2c/UtWzS7AtciHTm/VkZ79baYV
         3G5mItwOnykHmLf2Y5ly0d3SA6l9RAZGR2S5lcqd6eSA7+Ep4KmU+ljd/dI4v/8s6a7B
         vIGUdTGB8O/Xtxqtwx3RAsz5cUn/069wNvK5gw0ut8HYqvgDVymWGXyHYYFMKdLkGWiN
         +oyg==
X-Forwarded-Encrypted: i=1; AL+hErGdDUyxxiseHCXrJPlT3Mlpt/fve0l8G1Kqrg8Dg0qj/SvTyf1FPPt1VQRH7SqJIcvTNMAsFiVhlyk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8M2QnGhJ6yqt8XbGLkPNIA0IAAipgtKI0IhdHbMPj9X+qvCoAV
	gencuyj9bnVVN/mlYnZjVloLhZrln+WbvwXZ3FpY5hGWPglM7jzi5BNW
X-Gm-Gg: AYBFou2NRog0SIKIM/baoQrrtjwIUoR7furVwr1B6XGYOqqCGxXbpWn8w5btg7FxVgB
	OlwOo3Vu2wBZKDx6A9WA3ZH3Zpolcd6BS1XN5zRZjSCaiXTR4avXI3WVrR67o4Kur60BZ68y8Cc
	VRTIj9ilTmsZ320O0vVlYIoq7gicus3CH4D9cY9qid0u2OomnTxVVmdT1OyQorWWVWBLyj9FK6/
	97yuGhH7xr/blfkFUJmUsZJyI8xFgKvnlsVI7MAkQQpoLxV0SvA29NVpQLuiSCSE/hF9h0CS1/a
	FX7y2FBb2TmjVoGq44E3XAl6gqjVA97oc92DU2AMBUXElhIGrdh6SWn+PgKlO+PQLUUiMmaj3tY
	Wupvv+n3ECN9dl9WseZmKzYHIGK9xrWntMSbYYPTBelQ18OI2e6MArdw1fBuaGRUGVPpYr3qF6d
	Zvp9dq9yw/kAS2+LTDasehhV5rNFhCBZpdDo4JObgdnDZEXhTqagKxeIMit4VxkRE+00ARXssoY
	zp+cNvg9U1gzI9wKPKmwCzcwR367k6GLIPOMk4pMRx4LBOVYabkAxyqrYGBYzBThgfW2+MdDwHc
	dmrfXMgxPMaAUil/58+wcj5ERFOWAOwK9WUPOEnOIBHJI2wSj3Lg
X-Received: by 2002:a05:600c:468d:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb741d103amr51216505e9.17.1794843162939;
        Mon, 16 Nov 2026 07:32:42 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm86798195e9.3.2026.11.16.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:32:42 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: [PATCH 1/2] mtd: spinand: gigadevice: add support for GD5F4GM7UExxG
Date: Mon, 16 Nov 2026 16:28:46 +0100
Message-ID: <20261116152847.3658486-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
References: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_073246_081717_9BD0BE9B 
X-CRM114-Status: GOOD (  10.78  )
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

Add the GigaDevice GD5F4GM7UExxG. It is a 4Gbit 3.3V SPI NAND with
4096 byte pages and 256 byte OOB.

The ECC status works like on the GD5F4GM8. With ECC enabled, only the
first 128 OOB bytes are free. The other 128 hold the ECC parity, like
on the GD5F4GQ4xC. The Quad IO read needs two dummy bytes, like on the
GD5F1GQ5.

The values come from the GigaDevice datasheet DS-01326, Rev 1.0.

Tested on an STM32MP133 board with UBI and UBIFS.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index a6d6d6e0c..990f2d271 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -564,6 +564,16 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F4GM7UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x94),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgq4xc_oob_256_ops,
+				     gd5fxgq4uexxg_ecc_get_status)),
 	SPINAND_INFO("GD5F4GM8UExxG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x95),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 1, 1, 1),
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
