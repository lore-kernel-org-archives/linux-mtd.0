Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C59CCF2CF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3p1m/AZkLBlQ1UGV9OdKXRShM/VYzSnrxf+UNDktUU=; b=C6z5TDlPYCpzuX
	nlSzxWefjgV2tzYf68yCa0GZkV2Urrc6R4GW4EHDmT1+cwC6Iqr7wdMuKoYtBsEaJ6FoNYMaZBNqX
	E1b1H6SwmxMOTX5ruvlAVO/yeS/7S1XkISWvcINMqP7SZ5fByaDg9tzW0Jf6FzxZMqd13BJB6jGO5
	j8FT/o3RYJAwqzY0vQoUVKanUez1SbLx95dZb1niti5H/4GkdXBmSt8dBCxLfXk/heyZYlqgc09Ii
	tIJX6SsDgvOLlUrSB6T4+oGudXGvvGQEhK8EJ5Epwr+IjI3rGSij3CZxnBQxO43ob8nIjG/lF6itN
	hs/Nh9l2W7HVz6vJlGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMW-0000000599v-0eG4;
	Sat, 17 Oct 2026 19:46:36 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMI-000000058v0-3Qvk
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:25 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7f48c750afcso488385a34.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266382; x=1792871182; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9jTHHCWKanN7K8lakzXwANno/EOLzQpBktQemhjHz4=;
        b=A+NFk3PnuBbmvJK91rm5SceRs88rJDNbkZvKIb55tJLmp/hoVQ884NAVnHEMgF4lzN
         sfaE2A37F4to5eX67ObyPPbqOYfkjAMB8cex/a012nQs8TIQBDODhO1h/q9SSDl6aQZW
         PeFzUYdymWSYPPG7c7B18k61OYtOIvj/mmQQvfw+nVRvrcby6fJ0/SM72UK34MrQEQyZ
         iWF/t30JMNpyGPledtqpUb/fr+NoadGLhqZyckfn97nE9YVv7Yw9wcml2vCH1eq57m9e
         7D4LgKzwb2mCkZoztJuJ8Qm3SVXBVhjv3FAmHrAppgxbEpni/bdmd0cc8ZnBX+J7X4zO
         35BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266382; x=1792871182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9jTHHCWKanN7K8lakzXwANno/EOLzQpBktQemhjHz4=;
        b=aLWgmVwKYHHGc6cStuJbkku44ejs79fr8QJaMRAS5Mj5DPNxpY+UMtHNSVp0NVKBdD
         sRi0jSrQ4MECVglJKC5ZUKn4gxn/jRqHK4XGLyX6REaE5sPUu34Wbw26/1cIV6FfhFoj
         /+g/e28ivjkI8eZSnO0lvyvUVE5iLH7+46gHb333s9ABj4Uaxs5z19U0jhJF6CMcAh76
         jaecnGd2B12oK7zhJOerRE7tsWTZGQzopY+JhH/PciixFjKsEbrDiEdVn7F4ZIG8w0BA
         6qCslS8POVXOw3k47of1M8fElMSD/hFoiBDmcRCKcv+5J21iy+ldWWL3um5Vv+wyt0FS
         6qJQ==
X-Forwarded-Encrypted: i=1; AKwUvBye9YjXCvqCHX0PEHmeTJvDjCoXjV5DtEgtWQlI94N+p//UfIRfT0Yz1NbP614bS9vdnAGY03P0Ae0=@lists.infradead.org
X-Gm-Message-State: AFq9FYIiI5XM2rtW2qH/bZBHLj9Pqi7zUrc3vd3DQYHjM9sBS1VimdWR
	mf+e7Mwe3758f/oO/cJ/6E9LOMOOi1+cnbSH+ROYTPThxBYxaf6X/B4q
X-Gm-Gg: AYBFou205Y9sfgT0hMGBbka1YpYaVINVleGkdZF75VZMGFkoeRtRr5rNSjUAwd2MGym
	QaLcEl089trvrKPlYhAY023abkafI6agqyDfvFpgVahHREVWuJ2VHP9YcNikUanbaYXGlpDJRaU
	2/OSa9MA1/UEqrop88qvCa5ymRZXqPTNoeLJJcTqP81bmKnHAbDu9qSYGI3avOQPIhlLydqu5CN
	JrPToQMtX3f7ofpqsu3ValJ4JGd9qMNn5xQk4C/ljJGsSS6BnBe5WhZAzox8WyTvllGCnMWXxH8
	Qihvia5M5ce0Js0JZJ90/mnP8e0xrHeR2PZF71CVL/R5dEQW3LDAzf17lgVpAJC702cxr92BIMl
	ZsYKnzDxonnzzVsZpLdZCbIYxBpt4VUJY1MbS3/b9noIwnySdxph2jrn0m9Frb2Zw9m9fkhkKVV
	cUhAS99v9tBAxzexLAtg+gvgke2LcdJITue/UNVF7PmXsISayVJ1v/OBHDivQtB9R6kL7W6SbyA
	qqnPcuyp6bO+Te+GZVq+rLbHOskRIXmy3zIQRP6pyKO/m+Bq0FBmLFGu+HF69j9Ca3Mnn14c379
	grlvTgxOVFyDgwhAdLvByolrKrGPM0Z89xGaY3lnUz96Fty7K+x/VWJkHfja6SzXylKas1wcFSc
	SVWVov1SmHMq55yWLMPz2
X-Received: by 2002:a05:6808:3086:b0:4c0:89e5:da46 with SMTP id 5614622812f47-53ccdca9f83mr2990622b6e.32.1792266381790;
        Sat, 17 Oct 2026 12:46:21 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:01 -0600
Subject: [PATCH v9 06/18] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-6-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
X-CRM114-CacheID: sfid-20261017_124623_627056_A6861C0A 
X-CRM114-Status: GOOD (  15.27  )
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
index 5b736a4a7fe9..1db6ee18594a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1614,11 +1614,13 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
 
@@ -1633,14 +1635,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
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
@@ -1654,11 +1659,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
 
@@ -1674,10 +1681,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
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
@@ -1718,7 +1728,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
