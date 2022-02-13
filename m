Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0A1C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Feb 2022 06:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UW+oGlL/l1/jIYlSpjP44fWJST3EQ52KVSkq+IF1oSM=; b=g1Y4W7SaXf7bWh
	63ZqYVitmFLomXVWGR0cSq+h+jgSX/fS4XG9sHFILLTGTRswzSdB3R1f2VEmYP5aQEoEl8u21ly/n
	ETF9v/Vy4ik7iqRdUm20p/Gq5ptEwUD0XvFZTXCRCbmuAztd1zAnshTCmaPteM2V3Nfo+kLTzrlsj
	DeTpSe+ltLax+0E/qhpcZbys2ne38TBWSpUtxaLv5vxnsrIxSef13nI+Q/j9FB36WDu6+ptsdN3Nz
	+B0UjuOjJs3YbKbNKeVwY0yJrb/UYF2yovT+VxVxzK/vl9kh1hcEaDuQQKl7yl6oQ6iX+sjFeDcR5
	Oy7pZEXIjqCa+zM4P2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJ8aF-00B5nA-To; Sun, 13 Feb 2022 06:42:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJ8aC-00B5mP-9I
 for linux-mtd@lists.infradead.org; Sun, 13 Feb 2022 06:42:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id i30so23703709pfk.8
 for <linux-mtd@lists.infradead.org>; Sat, 12 Feb 2022 22:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GLtGzCbeMg/qgbKDDCf7XWab2gZD78AfYQXR9n7ELa8=;
 b=HNwlDyGl0139uKx7mMf20bh413PTnzikv89/CepT7QqbUy9gBYJQwlpteBkcgGTE1e
 fwDsW+Zy2ANnzxo9ZeZjzCaDQQqInlDUVEz/0FOHv7ZaTlfFy83nWhMKftDQgOoqLZsL
 M4U2JhjPzlrMJmI/AuksJo9e33QLtf3eXB47yV5KU0s+L+mabXrjg6v2/clVQJQOnwUP
 lYJprnQfrzVJWcXh2c63Xa2cTqNu4jKWumDHYbXIDzcMPvukBVQNxv1YM+sBt+IXXnec
 mHX9fbp2MOhAfni2gjxb2eud1XsejhTDzrP+Px7sx+W3uTfSzzkkp2IVzFNyV46r7hd4
 oDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GLtGzCbeMg/qgbKDDCf7XWab2gZD78AfYQXR9n7ELa8=;
 b=Bx2vtD3Tuvf08eFKDMvHy+m6j9m4rwE43LDVSBXfAQesLx0Nhc3klwbmgtDjnGOwUJ
 4DZ7nXHGVoiPRsRDo8xWSNBorwfTu8GOLbkmIPsVMJDMkl+h+rpRBGW8PNZTamXgPqsv
 sm5GJ6nLD6Chmo24AmoS/mxy4+dIunLlYhoyC9OMBhhiBjDK+7yUyRGpTNilRXOxg31d
 MosX+JHHgpRnUdBzNNL6UB65jjMrlskt1mDcm2wkBwQfzmCdLIg73McNaUJmRKcKbqgC
 r3BgeJ1ibUOvDb6wEGByApJbTcIQZAU//cuZeA5E9v+4G1lmrvytcCbMbmpyXYxQpmvV
 l+FQ==
X-Gm-Message-State: AOAM532yVMlMWAFAiuitwXh0jON/NjlNg6IdSrWZQe7OtG0JNuRoqpSK
 Kas5LbJXzWKCGYVm6tDSz88=
X-Google-Smtp-Source: ABdhPJyJXzBMzoMunUfpRtqtr+uHskJSD4+WqQuAMDp4sG32t2Ubv0IbDnqIexPDX3typstIYzyBsQ==
X-Received: by 2002:a05:6a00:15d0:: with SMTP id
 o16mr8802460pfu.19.1644734523050; 
 Sat, 12 Feb 2022 22:42:03 -0800 (PST)
Received: from localhost.localdomain ([240b:12:500:6500:d566:8d88:e4de:7a25])
 by smtp.gmail.com with ESMTPSA id
 h4sm32117786pfv.166.2022.02.12.22.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 22:42:02 -0800 (PST)
From: INAGAKI Hiroshi <musashino.open@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: rafal@milecki.pl, baruch@tkos.co.il, hauke@hauke-m.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 INAGAKI Hiroshi <musashino.open@gmail.com>
Subject: [PATCH] mtd: parsers: trx: allow to use on MediaTek MIPS SoCs
Date: Sun, 13 Feb 2022 15:40:44 +0900
Message-Id: <20220213064045.1781-1-musashino.open@gmail.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_224204_380724_DC5DD438 
X-CRM114-Status: GOOD (  11.72  )
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

Buffalo sells some router devices which have trx-formatted firmware,
based on MediaTek MIPS SoCs. To use parser_trx on those devices, add
"RALINK" to dependency and allow to compile for MediaTek MIPS SoCs.

examples:

- WCR-1166DS  (MT7628)
- WSR-1166DHP (MT7621)
- WSR-2533DHP (MT7621)

Signed-off-by: INAGAKI Hiroshi <musashino.open@gmail.com>
---
 drivers/mtd/parsers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index 337ea8b9a4c3..23763d16e4f9 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -115,7 +115,7 @@ config MTD_AFS_PARTS
 
 config MTD_PARSER_TRX
 	tristate "Parser for TRX format partitions"
-	depends on MTD && (BCM47XX || ARCH_BCM_5301X || ARCH_MEDIATEK || COMPILE_TEST)
+	depends on MTD && (BCM47XX || ARCH_BCM_5301X || ARCH_MEDIATEK || RALINK || COMPILE_TEST)
 	help
 	  TRX is a firmware format used by Broadcom on their devices. It
 	  may contain up to 3/4 partitions (depending on the version).
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
