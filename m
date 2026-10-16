Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F90CCA473
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctjmRZ2X8HW0dl5BYKbusYeZxAyEjIdADA2hlBbDCk8=; b=bYSPylvyxncmp/
	oew2TslsMIVC7DdGiw5Zkoe4eoO3tZn2NZ7z5RvgesvEDS5nP9/6CeNxvwmJQhG5MmyQh/C2vbPzz
	HbxswOy+rVzJ4RcEtljw4mkbdQ50U45BWL37xcLpeQ7bZX/tHCh7kgaqAypedTrnhyRAr/XG6sJcu
	OlN/fPrE5qk9x5EKoR2X3yKCOyv5DBxiKQcdRxLjsf1uqgy3AoBQgNk+C85m/NFm3W1UVoLotqJxk
	ujdzlaQV5ufBQMxajZmY/nmqvDtO4pfQJH4eaa7NM5bIj9GmbKLUJ+aSyB1BiGmVl4N2wBrt9xUps
	e305zaQDoCLmVgKPKvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYt2-00000001sLK-0ikX;
	Fri, 16 Oct 2026 03:45:40 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYsx-00000001sFL-3fVM
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:37 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7f48c750afcso1858067a34.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122335; x=1792727135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=S8ioQkd2yyDYqwcphvWNcyFQnamhWUQPgmK8KheP8+wGIND/KrFtBZl1UVM4Fmz8Tu
         K6OV8Gw5iFvvN/qXuPjafe2cLTPvsFOyMvARPuDrCiLYVBb6ZQVKNPDwBFFwzedBfeoE
         yMoMyvFFQ8Oy1FFyzLQdZ51LwV7IMv57VqjebBgH0aamysKBmOBrQlH94+1+4/pJh63H
         ovwjWsR9EZVVUMFc0NkvadcEgd5ocyQX80Jyk6D6Y6b5U4g0lBO9ovvulmXFsQityP2Q
         gF5yXOBFSVOtHyeXRIYGPc0O0/HqqaECuUhJJ72dq7azAhQ2oeQzV1CsHW8q2F8H6mks
         EVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122335; x=1792727135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xu2UIC5iJfecJVYRm44JjAaDQ7zuRMhXFx3hC1cl90=;
        b=Jk1zlr1hP2XF5wcx+HhB85GgnV4LgB1k4/rjgcHYb4h9BN9nXOsBwBCaALLIT1/NPl
         PV68f/X+3OwiNwRaG1IR5sBkS3fAcn3qeUEIkWlLqrOMUqF4LLqsDdZ4Xei1VXCzKhci
         tfoS5fjpJAUT2khbC3CBmK8YXSGvqV4opdIbGt3J/7PizfA40ILYS84wISAwLf1GeE3I
         Pf7r0YxxsHDodSRDmZ1P0QiNMChBg19GrHeuPM8HWCMODezd3eVNAmfLTscMJajmaTbo
         pH6e4lJ/hI3SIoJ0pdpm9oEP0HSz612D5yNBev1GyzBCSWmds7ruJe0ipz0amU5MwG+Q
         +CXQ==
X-Forwarded-Encrypted: i=1; AKwUvByhBW5dtsm9IRUVb+NBC9gc9VYpnvyX6PLO6dvPFhFUcmy0HDOFK9QWToNi7InqL9IZP+TqwUDYOx4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKbru7oPDG9N+nyNDyf2QhM5DvpMBAPFt67D8lUPO7g1kzYN/Lw
	uoFLTzP+iwtrcKsC1YVJIBL8LOlludwLAk6D9lkW+I5qvpANgWE+y4rh4EK/ev6s
X-Gm-Gg: AYBFou0pbnyyV/xQHJuqbamZFdbYnKTs6O2lN6tWlBbkqvFiNvN+SMvlOOEp3EnreN6
	Z1xbxtg/byDFtwNEbT8ajM0YTfZhBGetTtq0Dye4uYh4KJcoD85DYxZr1oqu/NeipKL37ALnNlj
	0rf+RUcD7iyKzwhxc/JuV3pLZd/nFgwQ5xsUsZaZAeZUhTG46YvCNv+FoPlZUCIT/Aq7mmVUklY
	MvuqVGvTv8CsYNVUUFXpQnZOyH8c7bD+Cc6KDiw/Z6BEF/TXc+BTGl531xmBIBWQFCfJcwhzF8a
	l6gh1wKClxVhHOkGQhJm/1ZuUZ6CYzBlsHPHlipGhVMdtKQED8VzP8lLQlJJE15Van2SR6IBBKY
	izoovIsAyIb9OmCWJ1JDt58cJVWWLk0a5TeMECpWqXcyCp+0aK6GQJidklnsH+J4SgM9Vhb3hjL
	xJDM+6YAY+UnqlJXjxXj6pAwXB/ohKju1zgsWXRttA4G503JnvsPV8cyRTP3kx5BRE+u5SlUYka
	RztAtknERuBePr/RENuGH5YGe1RWdgJ7PRabrT65g2//Eg9yZdmGfTV0IANXNyWyEA345u85y4k
	SD7M972sYX9wQ7mXOanHmFMX2Q2f6jnZ5hAp8jiw2n9GamH1JUC7GgwB5w60ABFuF/tHA+tHQI4
	BZQLMpkgYZvFxiGYCAncoEA==
X-Received: by 2002:a05:6830:4394:b0:81b:9d18:75e with SMTP id 46e09a7af769-83090e15541mr22707196a34.4.1792122334840;
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:20 -0600
Subject: [PATCH v8 05/17] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-5-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204535_936238_4AC2E851 
X-CRM114-Status: GOOD (  15.60  )
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
index f7ddd4116bf4..d71b980ababb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1602,11 +1602,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1621,14 +1623,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1642,11 +1647,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int ret, i, cur_off = 0;
+	int ret = 0, i, cur_off = 0;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1662,10 +1669,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1706,7 +1716,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
