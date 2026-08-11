Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEB6C5AD7B
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8vz9Z3FvC6Xru6B9vNmwGMYyMDvFJ9ZvCiqY1xFiXdQ=; b=zwDrS58HILLByQ
	0ARdzuc/PMMAkh4htHFWp/9cqEFjdE1Uv1nLN1BOFPoebgmfi74scOqoqo3UrHTgNAgOpXCdVrNJE
	8odXpvssYSZao/jQ6vaqni64Xsq9w1Il8B9Nrel7aqUwAf+CH6AgZJ3sYdiDWJCs/tXkLXDoFzfAr
	1N3nP9MmKPLqDlNwYRM7I/aNXeg63JAo5Xmwthpwkm+StavacCCRHbFQ8oqYY3kT2b2IvwGx4r+si
	YeOSVnjoMGQ8+NzeUp/ivpl/UtfvKW+amKnImbCxiqAa0BfGXqxt1l8tAu4+TVI5YTAImLkSw7pEp
	uEj2npabYXkT85Ra6jMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfdq-0000000DNkg-0Qd8;
	Tue, 11 Aug 2026 06:07:14 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfdn-0000000DNjl-1ecQ
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:07:12 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-4a427e628a9so706003b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 23:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428430; x=1787033230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQogJxVcWHF2/s1gpFEzMjsDacnUmvO1LDzMrn00kZM=;
        b=OTcgwUnvdxeBMZ1Gi4OR4+PCJfwbb5NK6Y4Sbs3W1+qFCtxld1Nm1mZZKUsTCE1z2z
         0EmiUkiGmlptvatw1n3Yh224US6qug3gsLQif5OYenGX52sw8M8QOcxKddoHwiNJVqQt
         Uy9xVzdvky965Qt6Kro35l2MeHSRlIACVhg1yrlPrXet6DY5juCRs/oTPAJ0RtKbC5b5
         qQCShZSw79AjfJIWSJ08zeu8N3CDbeSN7YD5p7pmgSQUi4awz0Hb42JdxSKXiFo2q3Hv
         QizqHLaPL3z+dViyZfs1+mFQgxVc0Sz6yBfEjzxFy2cMIjDtmsyFbGF5lrWyJL3OWznl
         OWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428430; x=1787033230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQogJxVcWHF2/s1gpFEzMjsDacnUmvO1LDzMrn00kZM=;
        b=Xj450ORXLMPdjdzzJCiB8JRB12ytCTzwQZgcQNaGQ6qjXtQpzN/Rb4/nuvgZ6pGH3i
         UD+UWvGanKnCkVsSMbTNwTsHDYvupp1uDgS0eCZMIUjj81I4fRY2SWQrs+GK6PcnD4D6
         iQ4i2Mu3UFQ4bxojzSTA6HYvd+LQAH+uONav2kEy3BQf7SriHwlL4CuLUkB2Jv3qXMHB
         EKYlxT+1fqQ4yhvQYvdEfJLmhx4PL8iEl8fNr69a2uJqLwETCjoEE5TZ9LS3OUmYVnYY
         5TwLcVjwIm6k+6Cw0NQOsg7ma5oO2vny7cdyESi3uDA+SRjShtHIN+n1tp9joK2+YCwV
         WWWg==
X-Gm-Message-State: AOJu0Yz2VuTczHmSLbpFPgOWMmkojdqHNAVZnzqO9cTj7DiJEh8+0xAR
	cv9BymVYMxZ/ChYrzhskMZYZoxx+UzRKCL6jnho403jHqJaI8pslLWCFvJqc49Ao
X-Gm-Gg: AR+sD106+0UHDortuXGJ4EnnzR/cGn42xKkdAj3tyQs6soAtPxpEZaln6oro71knPJ4
	FAgMLQHIjnj949mdxMI6hT21BUSybXxffZ2UD5/e03TcCIFPBJYK4YZfk+eBqIjG7C/bdu8KvR8
	4daxQHmzaMzkjIv/aT2IZcM0V4JpfoMO0ZcM4G/i5kSzPJGFFqvsiB7KN0Fdn7x4FOpwLMf7UAo
	eAeCVXZstSi2quJ/1sI3LogwTR48SgfdNzdi6XQNK/ktooTDhrxI4KEXLaXxQlboyUn3T8udnDi
	D3ko6mBdPuBddljEwBbZbCvRUm5vSDu3SHzWLrm/lYCCbCsE1wh0yrADEH1iPKUpBuseDEmW1/+
	psbZ2JSNZqRN+h+pKweILvi62wZENIuVar0QEK2BFA/1xskSmR6cqz5bqAmFQsoALNFxN6Jo8uP
	QEZkirPhDP/4c8EsoywAAeCia2WRKMHE6DXw89w/nsmel2ZgiIPvbU9z/Jbo1wFM8qBACLvwWUX
	uuxjd86hWklhOy4jB0IZlVejH3QbD91pHWCpYDbl+pxCKYupvyWEcbEkVob2FISle6gEA03nKOk
	/lduDiykKjDIMHLbLn8nrL1oJ1ZRB1JmcwLU0CUJT6I/xdFZmm8SqRKGOrBDNu6/IBA71CGOjU/
	6ZAJwGPlDxE+y2ynP7+G+Z93K7reiq1JuiT9R4w==
X-Received: by 2002:a05:6808:f01:b0:496:2b3:ae71 with SMTP id 5614622812f47-4b1fd9d2e1amr577795b6e.18.1786428430385;
        Mon, 10 Aug 2026 23:07:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2001331d2sm98211b6e.11.2026.08.10.23.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:07:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: reject invalid ECC step sizes
Date: Tue, 11 Aug 2026 00:06:48 -0600
Message-ID: <20260811060651.227431-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230711_535624_F20B6EB4 
X-CRM114-Status: GOOD (  15.30  )
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

ECC maximization forces a 1024-byte ECC step and divides the
available OOB bytes by the number of steps. A NAND with a smaller
page therefore produces zero steps and a division by zero.

An explicitly configured ECC step which is larger than, or does not
divide, the page also produces an unusable step count before the NAND
core can diagnose the configuration.

Validate the step size at both points where the driver derives the
number of sectors and reject invalid geometries.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..ad314c0e30b2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2032,6 +2032,15 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
+static int sunxi_nfc_ecc_steps(struct mtd_info *mtd, unsigned int step_size)
+{
+	if (!step_size || mtd->writesize < step_size ||
+	    mtd->writesize % step_size)
+		return -EINVAL;
+
+	return mtd->writesize / step_size;
+}
+
 static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
 					int ecc_bytes, int nsectors)
 {
@@ -2078,7 +2087,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		int bytes = mtd->oobsize;
 
 		ecc->size = 1024;
-		nsectors = mtd->writesize / ecc->size;
+		nsectors = sunxi_nfc_ecc_steps(mtd, ecc->size);
+		if (nsectors < 0)
+			return nsectors;
 
 		if (!nfc->caps->reg_user_data_len) {
 			/*
@@ -2163,7 +2174,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	/* HW ECC always work with even numbers of ECC bytes */
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
-	nsectors = mtd->writesize / ecc->size;
+	nsectors = sunxi_nfc_ecc_steps(mtd, ecc->size);
+	if (nsectors < 0)
+		return nsectors;
 
 	/*
 	 * The rationale for variable data length is to prioritize maximum ECC
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
