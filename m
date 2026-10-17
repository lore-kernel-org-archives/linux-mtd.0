Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994C7CCF2C9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ka8CzD7rHwhInaPuIs+FRUgMPzd/12gGihyBDQ/kDR4=; b=DNZtbZeiEBW3LQ
	8GQpciXeI2XqGe6+C2A6X/Gg8fj25N5uDU4RKTsvY7PU6zw6+L+4m4xKkJePIMwO18S4MtfVcQATT
	bbDzRLZaPg/YqH2a67HtDd2YhmfztDGSTIfsxX7MhnR2TPnK8Fw+E2tJnqC0YeAeXNRWa20ayOtGe
	d1V1ZuouEoCsCs8ufkQEvGHJMfdnE/POX7QM3zz9ThdtSeWlD7cQ4UM8YbV8YZohVj+lfq2ZTUDMc
	6PnKBMPuGDNto37AwvCxcTAPaU57UF4xfL5tUj4AWC53Ln6DqaKzGA9cHOxUI9TfAB6dDYQUwGdGw
	W8VB7z8oL25RXbrZ78YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATM-00000005B43-05nG;
	Sat, 17 Oct 2026 19:53:40 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATJ-00000005B1h-2Kuw
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:53:38 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-825b40f8a26so355452a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266816; x=1792871616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=ezS7oE6ITsYRBujks+uDeFLVymHiH9/QHfd85gfzJtGQlEIv5OeDLJa0ie9ktynQO+
         ZN7+J5v+wc4wIhQVV5M2QkRvdkucimzrPYxO2noQgk9B+B2V+twunG0eOJqsAF8YJ8u0
         3F5Fxd8LhHZoC6OOnL3EXzZGGxn/eyRDEIrQtzVnGSkc99Kno3Uw3JNGF3okQ7hDWYYB
         3ZMideQjeuj3E2f0dgn/3TIk8Mi0+12dMDGRPHbzzaZ2iIX/q40K6M6b6Mt76StgMpvv
         bCsX6OKT+suvfh8iwtKObm+HQGX8rngC3WSio//lPaTgHwth40R5gvpqligSbooKp9I/
         erxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266816; x=1792871616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=1k2Najs32DemY1+thpuazQbQS1/YNEQ4lFAdg6g3zEF60LxQjfdzjIHnY+SvKQ8K1P
         JmGCTi7hZqMIowj+HddLuzckFymS3/ELHClOfUOR09Ll4DPGgelWDdlDrtSk1aos09oF
         P+eau9q2KyDz+4nMpQShTUTQPdOi2mN8FzLtBC1Z0YAzBKaEA66m+tByFRLSfNmQYFK1
         NBgNN2IEszT3eXzrLo3O2reEjH05u8sWIv1cUH6I07sXqImcNTrHpCkLESkwaUUp55GK
         1teGSYalv/OnCmPNd0D+E6u+R/pIfIIiSinOcnDQXESctwGPvoHpBnfFelZyTjGcf/Lp
         1Ruw==
X-Forwarded-Encrypted: i=1; AKwUvBz0DiKN18xNv4hup+UgFkIHXasQ535cI72CptVa8VKXl8NyRst6ZacODDz3JyEW211TekfEtLIojCY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/8izGKd7ENKJSveWayQAT1HzCenVYn3G7Jt7NlrcEzshQjT5Y
	YrDqAqExIEk8SctBfPBzaosBVBD8vwWqM/8e7f3cSGkbPXaF5tTRCE7t
X-Gm-Gg: AYBFou1FnWQ+arpPMRZmnwwMvNy5NVxMXQV/2MwczEXmbPskCA5EG5OCCqAS4L3zDMG
	BX3BMUUXLk6dpcxFpSNB62B8h0qzZI27gYvsC7d9/rJcr8RYHATSG8y2/zm7M0Acg0kVPz6mWYV
	5ojL47vDDJLd5ivviAw9lQo93pdUvycO+GtXU1QVhOgB3H1hTZ4uIgCQiZ/pJyslQ119JZ5JXzx
	o6j/KtLAsjJ4sHlfa2LTxq1TSFhbIyw5HwC1mg8AmoDTn2KaB0jEUAERivyRC8UXTMiRDIjY3kO
	sldG8aJ0j4wrZzoNzpCoxhLMIs3oztjPcNxebBs1w8jz/0cN8YD5WIvDhtbXUunzU3PAaAC5a99
	3kI/X+Y6XxVhnUfNjxeKK/D1aFlUgJYc9tcj90D63II04YSFXJ7tVAas22tnnsIe0rnj8O5IgGG
	dCZPueBqWZxfgvpz4Uk7Pj9oDi8vpY7OrIn9loa8OtAJKMkrov4h2IRZmRJDSzw4ISAVKWKLPwj
	7sV3zSSyU6UhgxHwTHMiKYk5y0YzdbCbA5OCoU1BH3RrSjOVv6p+dkFxSTK9R2/6ERFKyRhiJfz
	YavEe7RkvW4TPC7O1P0+7mpHOpYhHuZO3dG3ImGjbMzyep+zEytAbBGM4++F5gmHLYZ3SzJAky1
	7wMZV/ipvjIxyxTAC3/apZeKll2qmOe6pI4MTN9VO5GDKc/Xj9oaSkA==
X-Received: by 2002:a05:6830:4129:b0:83c:2a05:c65d with SMTP id 46e09a7af769-844ff4249d6mr3801148a34.18.1792266816507;
        Sat, 17 Oct 2026 12:53:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 15/18] mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
Date: Sat, 17 Oct 2026 13:53:04 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-15-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_125337_610166_E77DDA31 
X-CRM114-Status: GOOD (  11.36  )
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

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 993e2efcee04..45172175d4e6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1685,8 +1685,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1712,8 +1710,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1739,8 +1735,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1769,8 +1763,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1794,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1839,8 +1829,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
