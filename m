Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC74C5DF7E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhAAc3htKe6/39tws4xTEqT9mh3wXr8z457yFn4xb8s=; b=V5VKD0XKBr4PPX
	kc3M7RBQ+I3GZkSs7FiuGAlvCJpyO9mdGnw33WzGRZMx2hhIMB3ZQgfcTn9IHPsFKG4V8fSBAbxwr
	97vQMRfurY0tkrFyeNyPv6eos+NqvLhwxS0Vqa6wwDePqVYOAZ2jCaZfO/+lD31ZeWAteuSE2CaGj
	DZhtE5Ak80cVcNAQah/oK0zV9oDT7ahbsQ5gapyPh8n+Qj+fnX9t5x+/x9V076cZjJUHmwbn+j1K5
	FOoLf0WlrziYH5rB4AeIyLO+rOxAortyjhRheK4SRl9xEBkvqPFhw5Berdqs0DLRG3O5usOWx+Zi5
	ok2bk4Z/5gG5RaMwFH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwICv-00000007rjF-0zUC;
	Tue, 18 Aug 2026 11:42:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwICs-00000007rid-3xUI
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 11:42:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49800c6a846so52916895e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053333; x=1787658133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tMfNTzrnv95v9YWomQJOjZXq4ObY0ENOn5OxxBG6Ow=;
        b=iUbxdcitdovXfAwH8+EYL2tSKvf9byy+mkO+P/JdQKbxZBRfxdgdJHveCpc9ItlJK5
         YlboB6QyZGuQPQWxkjpaBylNjgW7BC1O2PbrzpNTXy6QOrsl0SninVlMom3YXXE2R16V
         SHFbv6m2UTS0rRALlVLKneABeFg0fktgy623zNlLukr79GLvgLjuUPntUTHJxzArfqdj
         6kxMVx41mlYCQYyjUdAyER+2jdKxA1Wd2ci8ToYPuw3gxnjFAbezKY7GZqTNYztbaXpE
         504uuXrKPc9vQI0p+pIBexX9lIu5yuyOyG7rOH/dy72EFkVzclwmAKiofL0NwYy1Z77n
         yPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053333; x=1787658133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tMfNTzrnv95v9YWomQJOjZXq4ObY0ENOn5OxxBG6Ow=;
        b=rXNcHDwUcsVtOaf67koe2X8Jnqhd9wawJyd/yrhqSL3uZeMVP7S5g8XdfAryaO95rV
         dha2D/q2sWV+w63kv7yCJNQoTMFZ2DtcEDWwKUs6q1RRlcBHoH57ueGQcoaPtaqwMcFK
         REvVz3WtFrPFZiN7fXkfMcap6YYGlQaJhGKaFYUtndFDZgP2YEfdtliLAKQBJE8V0XPt
         t7nYtEHOvi3Ur7t0ijjma9RMnfNBbRlvKae+cLznx1xPaNDTkKil14/dsJRUCoxA8jbx
         txGH2xS57a/NmTZk4r6gjRhQw8X95ELfogszh0KGJIrLaxD4c+qJMO+Yf+YdQFNlfhvN
         3xeg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+MGl5CIKovP4v8SjmlEPBoM8lju/tmO39zj78G6mcmxmOLZK2KeRp//RTIDdMp03Y6FLWnrJ0TlE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgLiN8+KXPYhm3wicztAe7M3YfdUYlkJoOaUnE6lDq4wOslk+p
	/9zkUE1Km5jAcMmvHXPZGC9BwhB+bmvh2bEW0QATQMkDy15dl1lEekqX
X-Gm-Gg: AR+sD11sQVm2T5saHexBqi7BhJAox78P/qnTLgkaeEXm8RYwLYgI7OBRcMsLbG7ujqA
	peMHJzFXo4S7q7onmXFUGeZs/4rj0UfKJuFHCl3MmlmSMBVBtB8Reu6r515uuFs7GgY5TF/Zeuf
	j6eOOkM7DIdwG74hRniw2zEuMWADgLK6emsWKG3S8TOr16+OlYFr87T+/LOI9jVUHNY/x/d7rsl
	1vN0s5ARZHNZ/QZ/MLd3JacrlnNd70j+oxC7Q1CaJGxkQFZULx5BJuc3hydEFjIW2jpUbV+JMr2
	n6MRsZFMQz//6T6R03gCt2hI56v38AxALNDUu8HUx+JWZtIl6FX1KXpafshQFQXIih7csdEaEkV
	UnWzNiW9g63lNhsTIufdZ8/eKJtSYoBkfoa3dceyId2kZ4Encw9gxUOXJ7VpUgwLkGs19p7zKKa
	gSgL1nndvYjOc0b7tRUNWzVhty9Hi753jErf1lNFUvatc+uuVEe/q7kZUGXekJfA/yOLsxMf91z
	d0K
X-Received: by 2002:a05:600d:8489:20b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-4998b133b3dmr329338725e9.4.1787053332437;
        Tue, 18 Aug 2026 04:42:12 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998780397esm28680785e9.3.2026.08.18.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:42:11 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Stefan Agner <stefan@agner.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Edward Karpicz <webmaster@toradex.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
Date: Tue, 18 Aug 2026 13:42:08 +0200
Message-ID: <20260818114208.2780311-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260818114208.2780311-1-mehmet.fide@gmail.com>
References: <20260818114208.2780311-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_044215_020472_18DE63BA 
X-CRM114-Status: GOOD (  20.16  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When the ECC engine fails to decode a page, the driver re-reads the OOB
area with the engine bypassed, but runs the erased-page check for the
data area on the buffer left in the controller SRAM by the failed
transfer.

That buffer does not hold what is on the flash: the failing engine
writes a bogus single-bit "correction" into it. In the 60-byte ECC mode
the all-0xff content of an erased page always decodes to the same error
location, so every erased page shows one stale zero bit at data offset
0x5FD, which the erased-page check then reports as a corrected bitflip.

Edward Karpicz discovered this behaviour and identified the offset on a
Colibri VF61; the analysis and the fix build on his finding. Measured
with an instrumented driver on a Colibri VF50 (MX30LF1G18AC, 32-bit
ECC): reading a 126 MiB partition with nanddump increased the corrected
counter by 18035, exactly one per erased page, while raw reads of the
same pages return clean 0xff. A v4.4 kernel on the VF61 (MX30LF4G28AC)
accumulates the same false counts, so the behaviour follows the
controller rather than the chip or the driver generation. Neither the
Vybrid reference manual nor the published mask set errata (VFXXX_2N02G)
document it. The 45-byte ECC mode is not affected.

Restoring the known byte is not enough: on pages that fail to decode
with content other than all-0xff the engine writes its correction
wherever the syndrome points (measured at a different offset on such a
page), so the check has to run on what the flash holds. Re-read the data
area with the ECC engine bypassed, exactly as already done for the OOB
area. The corrected counter then stays at zero on both boards.

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index f27ef2b0884d..d41750a4352c 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -514,6 +514,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	u8 ecc_status;
 	u8 ecc_count;
 	int flips_threshold = nfc->chip.ecc.strength / 2;
+	int ret;
 
 	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
 	ecc_count = ecc_status & ECC_STATUS_ERR_COUNT;
@@ -521,9 +522,17 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	if (!(ecc_status & ECC_STATUS_MASK))
 		return ecc_count;
 
+	/*
+	 * The failed decode leaves a bogus "correction" in the SRAM buffer,
+	 * so re-read the data without ECC too, as already done for the OOB.
+	 */
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
+	ret = nand_read_page_op(&nfc->chip, page, 0, dat, nfc->chip.ecc.size);
+	if (!ret)
+		ret = nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
 	nfc->data_access = false;
+	if (ret)
+		return ret;
 
 	/*
 	 * On an erased page, bit count (including OOB) should be zero or
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
