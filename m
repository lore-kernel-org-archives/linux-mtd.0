Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB3C61DB9
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZGx3hs8HYaUsRiNJHISv7y4rEZeKV01KuRORS8ZPtM=; b=JjF2/XdQtcaIWF
	pO2yPa/8whmLJwJ/rYCjDHsARuyzrMHNnnDA/iiJHEMKq8oFQc50CauoNECelqh2CPtlHQk+bQzO9
	qbzVxzc41/m75+G5lXkQlCXaMlgb1oM5Wf4mYLI4xH2nj0lcrXGAArhbBaQ6dnsutW+GdW3ngqgnB
	jpZLEO/YzBthwLL6rbBukZRDt3/fQZ2kNXP2/Z+IFr8Hjv1bAGIXl1sNsoYrRBDHaMlau8sX125HD
	EvNY/pPeJpZ+2Bv5ACtokZnSvF/O+ufQ0MshSTNdgUevWKXvi3C8lHygkp3lknSej/0D19Dl1c9k+
	LyGAMlSD0e/jtsG6vLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLN-00000005MvW-20sT;
	Fri, 28 Aug 2026 08:53:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLI-00000005Mt7-3hgn
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 08:53:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-482e2904915so513084f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2026 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907223; x=1788512023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhmXMGSEBsCnlvTzh8T6ufA5k4c6HxTFoY+6zbiHuaU=;
        b=FUQpkJrVWpJOVX4FymFLtBsn3E3UYyzFyuBdWl7McPucX87Bp7Ihghp3slMLJ/Qdjs
         HmZIyf4zbzO9k5lBHYVC4BbPKdigrAvMHvWJatvnK9cOPgPfR0w8SXsNBvdpsDjz6qlj
         U531p2pIj2xxQ5DezsLU0A5gWmlgWpzdprAD5bT+ioCa2g/HYifY2irpOdfXnf9mF3y0
         fXaEUG/pDDO5RSf66HvoYb0tNA1t5rp+sqMj6sXF9h0A76WZ43FqpmbQdF3YjjHGvINM
         lTKBbriD20SxsPbrZegUcLzL6kjAm+TaMvZS+AP3qEnu/Jxpp29hKuZgw8oCawaasw3X
         Tfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907223; x=1788512023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhmXMGSEBsCnlvTzh8T6ufA5k4c6HxTFoY+6zbiHuaU=;
        b=jRSF4HgdfVz94hzGTZEtMd3U1AERAcfx14PQXltOWd/uv823wnYz6F1UGHBJPAKWTh
         vGy8H4ag4yu6ycMLDbuhofD834dlAWJGypvIlocFWdWoK6vCJPonFfnacmRqBk3qqlub
         TH5ms6eRMpjr0pQmc5VUloJrCUtm8OaFLSEIDvzBKDOrE0aSY92toh39F0N2XP/oL9UG
         Xt8smNvoH68GoalkxMoNXUJe/+HKVPj3IguE300+5lvoWP08ad7EP9Bjlyi/X2X0YylV
         7p7KvN1J97uuuk0VJ61RO/lGXUw6kOrXLyHyJPPOyXn5mQzdI1i9ptZ8PL15WRmfscFB
         3ooA==
X-Forwarded-Encrypted: i=1; AHgh+RrkvYP3MIFSb87CAvObgQlRuqJaj5gcMZ33R+xtqRJfkDe2h1san4AZOeG6lK5OvFeeClujXa8N+yw=@lists.infradead.org
X-Gm-Message-State: AFuF++msQwOWyfWH2TO8xst+jrBJfvzawSPGPnC5Dt8xxmDkXJNKWEAr
	xWqHw4bHNB9xQ3BGQ22q3q6bJHAvJkgRR1bOZDKHHxUCV0nZZ22zniP/
X-Gm-Gg: AR+sD10KnnMrdVeVFmlZAuD5SoPNevrtr5yxFRRAg4ZiP4412XMeqfpVjsJ31WDopYQ
	aDcBxGn/BL4Uhv0AsBLKGGasGLtHaEvaW/u4cyGt6UpItUBxaYxAxBKdPokLYCPE1tTf1NnmEBD
	Vj+VXlghR6eBDM93/6eLJ9UHjIhyUm3Sxxu5FNb55XJDN9KQ+2LWOZlKQcJXi8j/UT8wJtTctpY
	22Lj8m1KP1NrFArPwHeLxHGe9lJwMxKcbxqpRe6C0Fp+hyxhkNp2E8EMVMy+Ch6uNoYcVFqMNC/
	dTXt0CL5DQ7YauMiWolhC2qWTsk2M/KD4ruUmshiK5/OrntMTIGCXt4MgxeGoM/DhX5rsfxL1Qm
	Bdqt+tmCD9ct2r4Kh3A+PxxsqOs6gFqbxBVCn7ZEXXU52u4bdT3mxDwfvnVJ1JGW0dcOkf5yDWZ
	GBOOA667tmRJeJdp2kdMr4N+FMO79uQ6e3BRKdrJiIv85WW3mHsT+/kKaG5UHl1HO1Xg==
X-Received: by 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr67153615e9.14.1787907222695;
        Fri, 28 Aug 2026 01:53:42 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm43155175e9.4.2026.08.28.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Bill Pringlemeir <bpringlemeir@nbsps.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
Date: Fri, 28 Aug 2026 10:53:39 +0200
Message-ID: <20260828085340.3916239-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085340.3916239-1-mehmet.fide@gmail.com>
References: <20260828085340.3916239-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015344_937954_AB3BC6BB 
X-CRM114-Status: GOOD (  13.44  )
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

The ECC page write transfers writesize plus the spare area from the
controller SRAM, but only the data half of the SRAM buffer is filled:
the conversion to ->exec_op() dropped the vf610_nfc_write_buf() call
that used to copy chip->oob_poi, so whatever the previous transfer left
in the spare region of the buffer is programmed into the OOB of every
written page. User OOB data is silently lost and the free OOB bytes of
a freshly written page read back as leftovers of an earlier page.

Copy the spare bytes into the SRAM buffer before starting the program
operation. The copy is unconditional: the NAND core fills chip->oob_poi
with 0xff when the caller writes no OOB, and the ECC engine overwrites
the parity region on its way to the flash, so this also stops the
stale-buffer leak into the free bytes.

Fixes: 1cbe30b0ddc7 ("mtd: rawnand: vf610_nfc: make use of ->exec_op()")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index ffcf66f96c7f..f831780d6fff 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -633,6 +633,9 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	 */
 	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
 			     mtd->writesize, false);
+	/* Fill the spare area too; oob_poi is 0xff when the caller writes no OOB */
+	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
+			     chip->oob_poi, vf610_nfc_spare_size(mtd), false);
 
 	code |= COMMAND_RB_HANDSHAKE;
 	cmd2 |= code << CMD_CODE_SHIFT;
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
