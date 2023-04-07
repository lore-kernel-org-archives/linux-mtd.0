Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BF8C76196
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 06:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEDsobKtN1ueBJP9+yI8TfgoSBuksAhHJfeIrnobEx4=; b=NtM4MkCtJT1T8v
	iaZiO0DZXkJfMnEXsgKg11k+seejAGfIIRwaYazeZmaJOcTGIxdYg39F6pL1diFPo5p+4uXNMOsTF
	cRtXrLSDRaJFJKx6p+4IkKu+I6vdPFe5cRnGozWdRVJfl/9tr6lA+yb5Ue0JQ+ZxtVjXf7+fTBh1I
	uBs2WjyKNHi+1MEiu1Jo+mqSTaXQWKKRCYAWw82RIlOdNG95fss6eM9oVtAM7Ijcuj/a4WF++T8i9
	rWqt7aW2Y0SUnSSdd4sOtQg6Wcy9ymzr2uA7oCBmxrEtlFaPyV4x7V2ym0gOF2MG7qbVVO6YnOMA8
	b+/R5le4K5wXBKQVI7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfna-009IKh-2h;
	Fri, 07 Apr 2023 06:42:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnY-009IJQ-2i
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Apr 2023 06:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rvgjszv7qkNvEncCzwl0KVYudw8TWRShvYmCZby+Eo0=; b=bNoY8cFkN8MPcKVYGHCvF5TE43
	bYCKdUTDQHDxu+PclZ0Zriz6QAx4bIsfKCk1KEOtyvR9CZpHUvOo6psHcUuZHvWdSmI2YQq0dplFO
	3++syLRH9ksS3RVMRdCSUPaeWJp5gx/2eylO5qJU4P4bwdBoDdNlUGpqMlGVxztVZyxMqe3gnM1Wn
	9s/5P+s7uwrJ4fnym1JvShStaFsXJntJjuOQWdiu+rsi9WvRftH5zAs/RqhGcqe5ivqH0mFWli3IC
	u3/ScC/fIPTDgsMk+4QgTppWxvkcwtmxpnCcrfGHdu/SOxe4m9uljjtHKV4NKZiHjLlsMtwJ1lmOY
	cE5mZD6Q==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfnQ-00AwYh-30
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 06:42:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id x15so39097702pjk.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Apr 2023 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680849722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvgjszv7qkNvEncCzwl0KVYudw8TWRShvYmCZby+Eo0=;
        b=TgKX1n6f2eE6VFWwZiWyFigsPERBtobVTGwZTG6stpKioFnsoBHEEeA5Jr76gYut8i
         HxWh0k2W3ZHgMTppwLPef+nKqKPGul3ycCnehgVAUGda0JzFIZfCxuQe7JnzTqi7O/0Q
         rRYJ2wgMRzy2HcylojSf1mCFl9OM2nAFjw/MxWMVtX9VYk9m9ylUPTC+s/T667oQrEhB
         1vn3iMll5HmojZ46iz4FWo132iO1U18kJJCWRxAlneormFsa/QB6Bhfn2eQ7RtmlvTX3
         9gU6eD0zUtM1fIJTv0JpfyZr9QkPRL+HLgkRpPJZvMnCeLuRUfvZPahPQ0yHgWMBInck
         NVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680849722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvgjszv7qkNvEncCzwl0KVYudw8TWRShvYmCZby+Eo0=;
        b=TIv6A9vkpsFECFjmfz1lNqP6i79CMifH/x12oDZe1Ct8YcIVmgC8bIU9d8YWmGXMy1
         RS2zXyqS19xz8ssXAUc27zu21BVjjUsDKqQ5pPWeHxHfV/PL8x5I/0UY2semgi2vOO5E
         6KTvxM0+BUR4Xm7b8xsMLp9idIHAFYgjUS8gzb0ix02bjIBl1sK4WXzBh2o3N9faU6R5
         YyGRCwvtI0bOZ4u5r+zLmI97IghlD94Scop4mgXZE+DlZmLDSyvk+hWZYSiV4EShBab6
         DDMT+sHhl/B+K16Z0ac3RBS1dJnHKWJiYgWxYl00YoGwtX/hvDyyVrxidzj28VNvX0nP
         SMfg==
X-Gm-Message-State: AAQBX9c9Kxb9/Uu1QG435A71hVX+d2W3H5zYf1R5eLgTTY1eTe9Crm8j
	7/nWx3z4ktGbau4GyCn7+1EtJmYKRoA=
X-Google-Smtp-Source: AKy350a216gW3xDDYCI/c2igrKKag8nSGh67GofKcJ+F82uQxSbKTLilx2qaLkhc5a5HZrVvHapzsg==
X-Received: by 2002:a05:6a20:4687:b0:d9:a544:e4a1 with SMTP id el7-20020a056a20468700b000d9a544e4a1mr912003pzb.9.1680849722628;
        Thu, 06 Apr 2023 23:42:02 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-119.msd.spmode.ne.jp. [49.98.220.119])
        by smtp.gmail.com with ESMTPSA id k14-20020aa790ce000000b005abc0d426c4sm2309806pfk.54.2023.04.06.23.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 23:42:02 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 8/8] mtd: spi-nor: spansion: Add support for Infineon
Date: Fri,  7 Apr 2023 15:41:04 +0900
Message-Id: <55021d2409bf310692db0ac1c55e71ba406438a7.1680849425.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_074209_128677_9CACA6FF 
X-CRM114-Status: GOOD (  12.09  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

s25hl02gt and s25hs02gt

Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
These parts are
  - Dual-die package parts
  - Not support chip erase
  - 4-byte addressing mode by default
  - Wrong param in SCCR map that needs to be fixed

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index deb93ab6fe98..15f9a80c10b9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -579,6 +579,10 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 		}
 	}
 
+	/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
+	if (nor->params->size == SZ_256M)
+		nor->params->n_dice = 2;
+
 	return cypress_nor_get_page_size(nor);
 }
 
@@ -797,6 +801,10 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
+	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 0, 0)
+		PARSE_SFDP
+		FLAGS(NO_CHIP_ERASE)
+		.fixups = &s25hx_t_fixups },
 	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
@@ -805,6 +813,10 @@ static const struct flash_info spansion_nor_parts[] = {
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
 		.fixups = &s25hx_t_fixups },
+	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 0, 0)
+		PARSE_SFDP
+		FLAGS(NO_CHIP_ERASE)
+		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hl512t",   INFO(0x345a1a,      0, 256 * 1024, 256)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
