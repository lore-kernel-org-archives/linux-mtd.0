Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11286C61DD5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqfsztwLIjCMWdBg4Ln1EgW+LBB7RKyzTeZC90NtIEI=; b=R/ImBMWqUvnXtv
	PkYXFFSrSwGhJspXTobNNG6QIqrU2jS6RyI7kFVs/Iq6m15t1WUdnC0/zfOQeZYPWyPEIfK+5U/qC
	CB59t/mzBgLjli1BkwJKrM5bdsFVQnrfKoma4qC4lpQ/o0ioXB9wvg2KK4y6pKx5LoiX2v7+tbGkd
	wQkW1pTHuOgeBWs04KwuG5UApCfaEps5IIv3RilPP1eaIhukbZ2KWqOq1+eKiRC4saQUZaUU1XLfy
	VB0nMDnrEf4PqEJ0zzQQY8fCHvFOUtOIctXiZOPVgvwc2n5pcywiQBrBXth/OvHHKIQhn/87zBkYH
	Dz7bpxUTZTJEcy2z7FXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLK-00000005MuQ-1Fbe;
	Fri, 28 Aug 2026 08:53:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLG-00000005MsJ-1bb1
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 08:53:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso480888f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2026 01:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907220; x=1788512020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFbwIJ1I5+0GqyyrWqwabMNqn7eX9NbIKOOypBYOimE=;
        b=Nct5WtOz6SX1J63wRNPE1XEPd+U9HHmcvaQO98WGqP2r245MZvCaAoJOT+XT0AudGj
         gFxTYk8dim+8pW+2W0BrBdPEue96hu4cmMvhSUPiGDEaGXNE5+eTCkjs6nkqZakYiQOj
         RkqpSUZc7uoKdt65QBXnIgYgjZ90u0+CoJ1t+6t03TVc/xHx3JqTLJuATc/rK5+oK3co
         EM+hGGokAvxB+1oFShXb+aUfIVWaobx/7VZoh8HmcIQT/I8y+nW50MTasMGdu4PymBQg
         VnF47gTDnzF0hTAGhQr/I4fe8HG93Hl3qQF0Y8WJQ3HQekBmQ0XMnzQs6IeVmXk2Gs8d
         V3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907220; x=1788512020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFbwIJ1I5+0GqyyrWqwabMNqn7eX9NbIKOOypBYOimE=;
        b=r7hY7imMeN8KYOwgyqP+MmnxWQuyomOD/iF37JdI4gA8pB6H4P0UCxwgms5C3oK/px
         GJPDbXNiWxw+40OrNQs0wXnh47Ki124tEqy3/mvs/0Vf4jolclAfLrM+JouEXlxx6Q/L
         UaNOKmkqgNTBhRmTdGHUrPzRk8UStkZtTM/W3bd7UeJOdGI2ctQxNKowrEg7eKeOfu8j
         07UetEtwGl4CkpeWmqz+hu8D+X0oCNvLi/zPtrVppDDt1JyfzJZYoaI5c1x9JsekSF3v
         gqKhD4ZyL7vgxwufgeYhItzSLgkUiwCIhhW1PRxRa78kYemsDONY//GM32T4Ov1HjmDK
         vIyg==
X-Forwarded-Encrypted: i=1; AHgh+RqnVs4fNvkIDeDFM1ClpuAdFTgclXpTtcrU8tEnlohvMextlsO/UfJtr28wOZqxO1IgmVLrBDTwSUI=@lists.infradead.org
X-Gm-Message-State: AFuF++lyplbkaxB8vOmhowbDB+FRJv6NlxhHYYfBOGhJDpIXR6FTqhHY
	iIfGwdEncI+lbevKQglwgl7hs9uZdqJMwD7npzTob5owQzbwVLdg1CTD
X-Gm-Gg: AR+sD133C/ugtLfI8fhp4YcJylVU5omGhxR8bnHIevIbyrOybYHbkJO80GFB1Xqnd+Q
	/HktFMECPk8XI61nmhqWIgZZP5mWqSDZMZtiuegRrOdbzg5vUSfu20RxnVgqfJrd3XhgMxhZ5As
	1pde7M8VfU/VPGMZaykd733DBYad04ejo8ItBe1P2TyxyQfFNc5IR6e+0nWzNcPhmyE1RNAn35r
	maLtonzkaTMRPpY9DYbFnBCvgXgqa/Hdiu2/S/Qj2Z7CJSAf3OBMYUhVa0pFDi4iG2VRVuxJXk3
	IX7cjL7Boq9c+QkvR5ZxieRhyAIkZWH8L8NWkgjdqIfIm3EpWqiwGboIuVZUfnR2wany5MbgRjE
	foclnsrFYUemOOVmOvdowYG5KlWNGmhlVqa0lDbnXbtjPrMV/mSgCXl2boyNQPemmx24deVPCzs
	L1O1G6FtQx19QDiY9GHA8qbtIH2NlGY677IxNCYwkb3Feur/d1VAsbdJl5sZXeQua7bQ==
X-Received: by 2002:a05:6000:4708:b0:47f:ddc0:602a with SMTP id ffacd0b85a97d-482f79f3be1mr8467992f8f.18.1787907220324;
        Fri, 28 Aug 2026 01:53:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb278f7sm2921103f8f.26.2026.08.28.01.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:39 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
Date: Fri, 28 Aug 2026 10:53:37 +0200
Message-ID: <20260828085337.3916199-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085337.3916199-1-mehmet.fide@gmail.com>
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015342_436722_D1E5475D 
X-CRM114-Status: GOOD (  19.60  )
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
v2:
 - the no-ECC re-read and the erased-page check use the clamped spare
   size instead of mtd->oobsize
 - condense the re-read comment to one line
 - Reported-by/Link trailer order fixed (checkpatch)

 drivers/mtd/nand/raw/vf610_nfc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9104db19dd29..ffcf66f96c7f 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -520,6 +520,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	u8 ecc_status;
 	u8 ecc_count;
 	int flips_threshold = nfc->chip.ecc.strength / 2;
+	int ret;
 
 	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
 	ecc_count = ecc_status & ECC_STATUS_ERR_COUNT;
@@ -527,9 +528,15 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	if (!(ecc_status & ECC_STATUS_MASK))
 		return ecc_count;
 
+	/* The failed decode leaves a bogus correction in SRAM; re-read without ECC */
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
+	ret = nand_read_page_op(&nfc->chip, page, 0, dat, nfc->chip.ecc.size);
+	if (!ret)
+		ret = nand_read_oob_op(&nfc->chip, page, 0, oob,
+				       vf610_nfc_spare_size(mtd));
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
