Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E3606A69F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mh/NfsBk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1UYZucN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yub107eISi5uFxGovMRLOjPMWGsog8cJWyN5jhqq6SI=; b=Mh/NfsBk53cMdln1HsKfzT9Zh/
	ADySoQhfPSHyMxGMC9n2LMSXvjSTIhuxYn489GucoE3joj58Dhfr2kSS2ui/b2IVNcnNT8YSgXUZN
	M0RHmbFEZOUlgWESP+YToGTayKYrwTTv3Ct6931n4uXqG2zepmfH+A4l9f24R7ytcojYZRkl/9n6P
	Yyio+gyjLH29JUnnhAGE/9KKs1k1picqGs5mQHOZtdtpAN/4An6ut26bYPjpgKmfMqJu048H3m/ux
	kNVTebL0+cYdcltJCfqF60PM/XG/lykLMLUXSrPI3J/cIEGJJAU8uhkOaGifiIREV3vju8BYQYxys
	v+kKHuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZds-0000000GZsr-35QS;
	Sat, 21 Nov 2026 01:11:50 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdF-0000000GZIN-0uPB
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:11 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-4f14642adb4so920584b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223468; x=1795828268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=j1UYZucNsWa3NWv12VhLK9byd4VIjxX/EnleY6hEDc77GM2BEGpR+nkybVOf1U32kq
         s425b0HM0FciKr31zvE+2NyS7RyL8JunVz/e5Z8iRm+eKsVgCNviwwwSceBStMvlbo8J
         l9miPEdBakdvg0CVrRfoVzvuBSCKn8GEUSl6+th6T/Exq7y8K6TNHY+mfbQv781pe9If
         9xLdYHoNSWAmvXBjAGWmbIVJ0A3B7YLPTqmzCddt31uAOjIndMezp0u4655yV72Ap8Bc
         7wJOmELihuWWQnwgsVvpQpLfPIT55sllv9shrvPicGjPFRJGKw/P4SFa8Lu5INVlIIZc
         6mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223468; x=1795828268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=Su0JhcuLLu9Thbj/mhQ96npS2YHbCLR2D05V8hOVghNJex6WuwMMEPI/LMbcmVyXo1
         lL868ECz+gBQ+PX5nKc+VC02a2P67AitZeFPSfGjGRX9DQyg1c1yvEdLU0zGv7IMeb+P
         +BjJ+EuK5Uk7kIQE9axTKvcs+cRjhUuTY+q7fnQ7Pe2Zh7Suv+ZDjl6FN/RlTUp0qJNV
         gJa1b9f2dEqysHtUOkm41A6FsdGUvEqEswOMxTkDVxRIT+bhPcvWolOVEIFOEd0s3QgP
         FOO6plHSAkT6jjePnTgjsnAjyiKwT3hJGIT665MipEv+5hiM5vGTfo7B97oYov6H3mMM
         PDjA==
X-Forwarded-Encrypted: i=1; AL+hErGZk30j5d2FbAt6Fr6iHsG+wf4t/Rqb5vGFi0U7j8mDxfSl/UhyYth11zRb6gSHCPDUHSliXdCENhQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z83ExjlnnDZYiYDRR/vHkfhMwEDLXqxvAlUmAf80Kh4gpfq6hlE
	5CPzzsi9vWldBM+fsuuBYJSKlb4Pu0FL+Lmqv+rfh6R1wxIlo2A2u/lt
X-Gm-Gg: AYBFou2D0eajChrvMnGjA6k8pyxhpD/zRWVXq6HE59EoPxpNonBjum11I7MZ9tOdBCY
	ilN5PbfTW5/69WJa2trQ6qbg4AUR27pDubAIsJtOpJ9qh+MLaif5NvjDaNsmXOQ7ChdoJz8u0kX
	uzwqrMYiiFmMdvXcxE0O6Km5nGMyTUIHkJciuR7EnH19PPaZhsC+vyrwGVpWklYJuTO0WzX0w8T
	jFJ3/28hMMAUxYy4T8/4rbKbUzab3lAeNp1tZkXUbF+BBamYzQ58IA4wBs4D6UCnZc2Tytlep4h
	FgYc0ZubeuatOIWJlwr9No+GuncKlVnSTzu16eGcvkH1GdJqV+e5keRytDCIaS5/7wt6I5xgYKP
	576WaKtpn2acHlt23kfNZ3l77rISQMWfOtPnhxwMPtTE3ev0J8f/MLR9D95U8lkxaFGgW6kIcli
	j50nnW4V3nCmSKJ4eiwoWAJy39yWJ2rRbMuM3rWIJTAkIPX86sAQbCojiba8DxXCxKlp9Ihork5
	tDNbGuOxKPyuNOxdUCV9UgppMdHNUd6hcmfPBQeEwV24jVEi2tk/xjWJrYeDyk4c+MIYWkLMTF6
	24PRW6MT8MX1idgOLLbbExoX+vL2QG4s5X0l89neLvmdAu/YLgEdHEBpQd9O4+J//KUaRSt45RO
	J9YHdBWTEg6YUkoNZGUqhrvuvHrJfnrFGz0GQnkXwhOBhl42pBcQhSOfId1rlrP6KShuBQtOL+X
	xWZnsDUlSYWmbKHurTx/7IAdDDnXnbYT2IZ5ANb9wKLcWYbccaCwr1Xw==
X-Received: by 2002:a05:6808:4f6a:b0:572:75e6:1d0e with SMTP id 5614622812f47-57a06d1a870mr5691634b6e.5.1795223468341;
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:32 -0700
Subject: [PATCH v11 09/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-9-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171110_328314_A32D09A4 
X-CRM114-Status: GOOD (  14.11  )
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

A page or subpage write can issue PAGEPROG and report success even
though sending the setup command or address timed out. The PIO and DMA
writers ignore errors from nand_prog_page_begin_op(), transfer the data
and send the program confirm as if setup had succeeded.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6d7384aac917..76f60fde7a86 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1578,7 +1578,9 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1593,14 +1595,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1616,7 +1621,9 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1632,10 +1639,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1676,7 +1686,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
