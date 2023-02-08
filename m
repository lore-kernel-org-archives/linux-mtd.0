Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A76C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XecjJDVZEfhe6c3eF2UJyFZpSwwsoxqsBatG044taBE=; b=tNH388eMxDb/kG
	kO4lIZp/rJ1tiHkZMvT6z617jdVD0TYXIvpi648oHHfu7l45GJ7W3dcxWQZyYaO08x0QbkNsWxkD0
	LSejmprK6lgyGIJPUTyyWa6+PZvOBo91sA0DUMOsqgmJAotmhkQZ4sddFGf75B6hwN2gxt1QeuR2w
	hrqyuqH39x9oYGkZTxdOCD2CdDTUXu/vGk3HwOXniU7ehZVoY2kVNMBPirRxY9w8m7LzNH1ckx65M
	TAAwkykDQ2fd/H7WDBkfRYNOm1qI8oVFCkeTQPfVaNCvAIPQthzDULrWFkRu7BDi+54Zs81kFqW7Y
	4/LFw2dPM7gyK81IPVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdQC-00EEFv-UK; Wed, 08 Feb 2023 05:55:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdQB-00EEE8-4D
	for linux-mtd@bombadil.infradead.org; Wed, 08 Feb 2023 05:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZHNiY1JvtdlHu6p8LZPWwxqI9GHqFd9ZrlFqE/AB1Bs=; b=riG771Ac/lTZ/RnUs7wwG4d+dQ
	3ydUDmFBjvMlQcFeJ4V1gK/Wgwn+6MTqTo4M5vFZDMaiZc628IVMwqNV4a9z2o1yJvFaFSGQKs6NQ
	RNEde9ONfpJnNye8m8f0PFx0dkVrpRiMuWmx9hfqM6AKOWBnbVHs8GtJBNEH7C0PPUms7pQwJgrRv
	ktJjcqNPGL9pKnn4pJRjDp53A77V36WobmKDIaKbWO1BS/mdwrFnBaPg9eEZpbrUrxJrmJ4f6IZ0H
	2UAgYmOUVeUBK9YyIXIwA62h0Xbmco8g1TpeY4U/w7HCb+hrn+knfEwkD5myedCfLJAyhlhyx07Wt
	4JP8lwfg==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPdPT-007EYd-0w
	for linux-mtd@lists.infradead.org;
	Wed, 08 Feb 2023 05:54:25 +0000
Received: by mail-pj1-x1033.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so1248756pjp.0
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 21:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHNiY1JvtdlHu6p8LZPWwxqI9GHqFd9ZrlFqE/AB1Bs=;
        b=T1hdFoGpIwk9brUHWmxz7Hy6LNl4tPDl9ycnmn8oc5kEZd+HBRIsXWiuv8OVRTm4RJ
         MvaRCwk8QIAUzdE7cIdKcsk+0y4Zr5yoz/M31lWfaZ6fhPhMRfZY4jGx8YDhIhQTNYYH
         wD7T53iJfPlgCsbPdF6kNCcg2UpU+c0g2FQsDRTNdDWSSuNFfhjT6uVwpNmhfeKhqXxO
         LST+aBWlWtLjW3066FutwfGh53p4sogANNr8hZ3qRKYgFgrvs4VoEJpT/RCaK2Wr9E/R
         v8CK8iQft2EtLkybe8a0GL3S44j4BNulgTONKQ8JZdk/6D8zTlPpWdop2YNvLykRLXya
         mLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHNiY1JvtdlHu6p8LZPWwxqI9GHqFd9ZrlFqE/AB1Bs=;
        b=w569diHpjP5L67H6IZRmTFeoYny/3jCqrQbTemzXrsQ2bpfaY9zhV/9mUMLz7NWo8I
         Uagjqzpzk5T93/IcbGl7Lsdp8p6HEMayDhKBjUaBkBfoWsEGxsR/0jYKAc+UXS/rjwwn
         TSO5sAfN91UxSsmOZO4AZ4HjK6v7/B2gkkj9bMGcAOwJpkibGAvuiD/O6gy5mxII3Aio
         BA/UaireBHjV2WwhEth5JWg9u/FCYaaIKLckVWbAd7b/NqlNwbq50GlkW9znjyKG5BU7
         /tQUg1A5PWmRoJZ/pv0aWIYkaqJopDHAlf7j3yx9xExQPKi4LMD7s69AysLuCpXOZgZT
         v0dw==
X-Gm-Message-State: AO0yUKUOAl5tt3gXdOZNKa6cUVEqAhaZ+iMM0C7c08uNogk/T0j8eMI/
	Hh8zrW0wv6tUzHHCUUaJV743oQ3bS3Y=
X-Google-Smtp-Source: AK7set9ZU0gb3owkIXaOQEWo+4BavfuWX87SdSmk1sS5w+ZK8k+beE0TmT/kv4NLnjN8/D8bZxJ60Q==
X-Received: by 2002:a05:6a21:38c4:b0:be:bc70:6810 with SMTP id yk4-20020a056a2138c400b000bebc706810mr5013150pzb.5.1675835697090;
        Tue, 07 Feb 2023 21:54:57 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r16-20020a638f50000000b004eca54eab50sm8915954pgn.28.2023.02.07.21.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:54:56 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v2 8/8] mtd: spi-nor: spansion: Add support for Infineon
Date: Wed,  8 Feb 2023 14:53:45 +0900
Message-Id: <e18276a7584b638c8593303d1146e0c2321ab78e.1675835253.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_055423_809135_6D661736 
X-CRM114-Status: GOOD (  13.18  )
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
index 33b44074f941..9a2e4ca5071a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -341,6 +341,10 @@ static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 		}
 	}
 
+	/* Fix the number of dice that is wrongly advertised in 2Gb parts. */
+	if (nor->params->size == SZ_256M)
+		nor->params->num_of_dice = 2;
+
 	cypress_nor_set_page_size(nor);
 }
 
@@ -543,6 +547,10 @@ static const struct flash_info spansion_nor_parts[] = {
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
@@ -551,6 +559,10 @@ static const struct flash_info spansion_nor_parts[] = {
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
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
