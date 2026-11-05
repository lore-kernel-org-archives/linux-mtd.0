Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79372606D804
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SIhQfrAi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYnT56Pr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6RFCQHkUm3ebPz4Uax6KhSldXvCy77lfV+6HWvOjIZA=; b=SIhQfrAilcGk3QAZioQ6XxkTFM
	3jwR3m3vPVXzKZdDLSFIFalEjbvDHyfd9qWcQevjCMK2Wg9k+77oy9k8H7k+HvTTKNX1IIWKJoHYV
	+iz0gckzktKUiFTMTGF37Uo2tSCKE0as/R0xX8ZOEdZItX8vObSOfYtjwmyapAYWpvcalPBDOGWQX
	2D3FgdKlpsT32KE8N9afFs62IlPywOTF6g0hJZ36tannY2XmhgMv1vGH/xoiLm80X1Cv++B4tEEZI
	SWR6GRt6SABTiufX0BVCnCQ/6rARlTCzhIVhPlaD5mnMVH2pR/b3zCXjWG/XzxdINLSSl7cBrfcyW
	tR9D/zTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2e5-0000000AEDw-0HFJ;
	Thu, 05 Nov 2026 18:57:09 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cl-0000000ADK4-0zAg
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:59 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6e560e00a86so1474468eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904946; x=1794509746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
        b=BYnT56PrMiVyMHUQz3lXtV9QIvvoWzOO/lJVS+DQPMdTpzUKvQPJ0FREdfyALk/7rT
         5kunuJNWdXqvqm5H82cBn3UEifkEMIHYvxKqA/CVS7p601uvLjiMzdTngJPgVPVBdaLJ
         CxVS0Ba1nZOyGPxIy6zZ1Bl6Ax1veshJi84VmBxlDVjz5mm+CWHBKbpm4P5TBjN5QFF0
         7pQGV4XmeEeaD2Uqhr+KqFb6dglKmQhtXEK/zCBdRyWwcVJgRojYJ9XCSGSOHZijWfm7
         3/dwJGSk3WnqJAsz57uIPcvv/cZ6zdRgICAe6hSxihxEUEs+Rx3Tx7T2Ywdg2pSw1Mhv
         kxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904946; x=1794509746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Km1F4VU7EFf3gMbcR27k+iCcZ4YJytvSjdEZeNVUaRo=;
        b=w4zG8l0c6tt+Ln4+9mbj72xSZsXcDUTfws4cexDr+0hkXOlgDjAr02lYSy+OJel1G5
         oBoL/nVLvf9pINi9/Y11b4L+5LrT/Hej3R1Tsp0DtOH8oFSnPZiMTrfp2KRIEzQ3nTte
         VVGYXnnsLjW6MVX623N+3LFGCPgdCnYydLVEt/q3xmb2Z0IJJJWLsEX96Yj9OqqpEvHe
         VtIkTMrRkkHxQKLUHMxPwpuG3r/sMQlrGNpfSsMmluwxV6stgiCA2boM0XY/m7d7B2uM
         EJSM51/Lkx8BUgeYxyOPfMDPlfafoS3jnmLfsvbwd775J9/6EaVaqavqD8MH2+rcDLZj
         cLyA==
X-Forwarded-Encrypted: i=1; AKwUvBysf9w5vdgt3vbgkD4q3S9X49gVci2AEk8mVHWWnLSDn15+yQAjksBDcnt1HFk4hIsmyvwFL3n8uxQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/XPQ8X6jpBUtoYNHvUtqrNij+YppnunTfwePNlaYaGDfL/c2AE
	xqR4gDUlmvlCZaKi/f5TRBffoTCeCXf3WFaefn3d5orQPPc8dqDEsHEI
X-Gm-Gg: AYBFou2cf2PYr81xi7w2ZF1mE/2jaOwhUCDFBvEh+HyPabFK2etcWLAr+Gm/Lxk7ZVK
	4ZL0fZubrieKBGIMnkZzxtHs+kduWQhX6+bTqgJGmQ5hVzcVg9idkK82Rv5eOeWD32nAHT/tw5w
	tfVB8YiGVRRO6PujkndjeGTJORpIOXUNdWekhfUzVoZ+Jhn07ub4E3eHHbmoJeRxx01777RHw8r
	L4hE0Xf4Ff8OEQN1nvEA+PBzCVpHYclo8zIi1slxUtQ4DkwtPDKMUnTOECXvu4r6R/1ePMaQucr
	rpOLecbhVm1SjgwijeqI84fwguryTDPh4I3J/kC1oa478Md33sAIki0nwD/6p6soHEmnvHdtjHK
	mcvatBgYrg5rpnRSJLN8GRRf2aElUJjFUsS0waHakYF7oGN7+qXx/jg7DAAjP9KW+z947zAWVSI
	tf3VQCtuXNlTIoKwor/uFbu1HKpJiEW2dZLv+r2TgtE2aC4PquwYz4q3m3Bm8jAdDggaJL3+Ll0
	euOT+Rq/KIQHbOlpzpcVd4cuEpC++v3GHVfhrH9k5t8iUeKCIqse374NOBn4wedIxloVpl/9Cpm
	atu9dTYa0l5kNQfSZhWvmh5O3cO7epiaZsGYPC8F7Bhi2jndqb7Jx8qDztOELjHNvUXXQlRfmcP
	AgatIlyfYRQzg8PhPkouabjn+yY0fUlsARZRETaXix273+0r+asIAOJyL6bqyNhSNEkRWX6dGjj
	jrpeszCrfx+Lk1UWVgvrJh0e1CWMmdVgi2QqR5jl1K0zcgWB7V9SLn
X-Received: by 2002:a05:6820:2d04:b0:716:cbdc:4fa8 with SMTP id 006d021491bc7-716e796f91fmr333364eaf.41.1793904946065;
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:24 -0700
Subject: [PATCH v10 08/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-8-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105549_646841_6F90CC03 
X-CRM114-Status: GOOD (  15.75  )
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

A page program has three stages: send the setup command and address,
transfer the data with ECC, then send PAGEPROG to commit it and check
the NAND status. The PIO page/subpage and DMA page writers ignore the
return from nand_prog_page_begin_op(). A FIFO or command-completion
timeout can therefore be followed by data transfers and PAGEPROG, with a
later success hiding the original setup failure.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.
Keep the successful setup/transfer/confirm sequence unchanged; this
patch does not add a new controller-reset or NAND-abort policy.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 111094b1c64c..02aa02d2cdb9 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1611,9 +1611,11 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1628,14 +1630,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1649,9 +1654,11 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1667,10 +1674,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1711,7 +1721,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
