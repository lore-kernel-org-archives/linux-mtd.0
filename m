Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E518C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DvTVs8GD/jTd46+TRz66u3EL/sNzanTTF303Un16iY4=; b=wGTRqunYME4IpU
	0egOnOKnl4xS+DFdnN3L51g4Z8aMMdWXnrJZck7ojjHTH3gi3daT6Eb281PIMUyY/NIv/Hq0P4TcQ
	oLy8cHssaRB/W2DN7+1lL9egewCleHNcJhPjsn1upKQBzcMK6It8DXAsCJvKKt6qI3TQb42dZZhCG
	aQXe9/ZIKVGB0QbIilsAekF8mqIbOhcAcuQJHcRrhDPRvtknFr1I42nc29cYvg9ZXjGkvWynlr9rO
	8r8LJPJKOpNlxHJYbYoK1GSwx17LaiUbJtqIynXXWM+DA3RLVKrAUqKAU4ZN+/pBSK8/eqawKSoRc
	HXTOefCVz+AcZqT2MnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14X-005xNc-12;
	Wed, 19 Jul 2023 06:54:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM14V-005xME-1j
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2GIqnnpdKb7I9nNR85AQsWNWcw2qSeUJtV+n6+XhZgY=; b=Xd3xfCKCNe/NeILF8SyI6vgwQE
	iJbWPoUjRksXBiStoltTGJz39b/BLvh4hDGYLBzRmMb9rtNO+JDCb3jd0d7qh/ijXsn0qyCJ2MiEM
	bP8CV0maYL/rzoeWfxFMZu0gytsWHKNY6bTpv2FRdXPutafN4PljnwJ8QfCmOdKeNT908auVCHHWg
	mohlXnMxnv+potfkDy4hY4ejmYsx9Zl8AZUba/B5b9zBR0Ep2ZafA4VNJG6/aOd3NiX30/ocamMY3
	Php7O8Lh9976q22mveB1ZdyIxu22XSMOMyv0JPuKqMF5+JUN+Psg/ddS+GFEj632Ift2rh9csDYQc
	QQ8J1BUw==;
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLm4a-00BeSZ-27
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 14:53:10 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-77ac14ff51bso243334839f.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 07:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689691919; x=1692283919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2GIqnnpdKb7I9nNR85AQsWNWcw2qSeUJtV+n6+XhZgY=;
        b=FgiACD5bcvZA+6cd5ApfIEjwVfwqozr0Q2kG/sudwiMboo9Obq3PgIQ5kQm9EmAFWv
         qNZYg+shgkYPyz7ogVTMOLKIi9OwRcFvlqNCluUuvaQUTLoB7R1GX8CUPbDywt/qKGDq
         Y0DA98mNxKrMsoaiGj158YRgEWUB0wCQB8fIY0PSEUJZA5n5lWJJ0DN0GdYqwXjCrgty
         D14g03A/8/lx5ediTE0yCfK1XXPMrqBD876GUt2CowZBA2HpzU7J3J5vz1jY3QQHxpss
         GslAAeMeXYQ4JeCQNilrLYkUte373Qd7z5CkF89IAGNM+Ey/etyQl+JAaYXf1qGPZw1U
         Pe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689691919; x=1692283919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GIqnnpdKb7I9nNR85AQsWNWcw2qSeUJtV+n6+XhZgY=;
        b=jU0fHZpDPuKcc/uFPkkP7jQmY7TmUBwuOuP+8JaZGqhASmp4LQ0bSrrX8XZNidoaMN
         l1FZWIwb6mKUeSZdgsaRnuHMO0bk4PSLZXaGtDmmBqeHhyiHkIWMObn/52MoOpvUgkxF
         hpX/6Ka0LBgTzzrDpGzCQjAIhPMhFbe6L2rEWr3IN/XnefM9DYQXIVPVXdiALmcZOrQ4
         V6z+XyssDi/QbQkRlk9/pPBD6oky+GJz9LFZir3oP2uzFhstp0ZFkZZWhDub7rwee5Gl
         Ssngx9wL8MWnsFZQyyycfkxJCUXl0IHz5G4vukyqhbwxRiS8fWBKH5xVjSpZPVNRPkeh
         pXoA==
X-Gm-Message-State: ABy/qLYyrKTj8GtqO0/l98udt1uXZ/v6jygANV8fF10N6RlIuiISQn1X
	Zyug8328oJVLcdMnRzvKclU=
X-Google-Smtp-Source: APBJJlECvO3EIaJ3EtRZb/2Cg7Zv8tKC1ifI6mf15CtrBD+LtSh97R9MErvVDrgsCD10vQ/acmV+8Q==
X-Received: by 2002:a5e:c113:0:b0:786:26f0:3092 with SMTP id v19-20020a5ec113000000b0078626f03092mr2691239iol.3.1689691918977;
        Tue, 18 Jul 2023 07:51:58 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([103.149.144.245])
        by smtp.gmail.com with ESMTPSA id o5-20020a02cc25000000b0042b4f9ddecasm589106jap.85.2023.07.18.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:51:58 -0700 (PDT)
From: SSunk <ssunkkan@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SSunk <ssunkkan@gmail.com>
Subject: [PATCH] Add support for XMC XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C
Date: Tue, 18 Jul 2023 22:51:32 +0800
Message-Id: <20230718145132.3811-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_155308_826522_23DD4841 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Add support for XMC XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C and do not use the generic spi nor driver.

Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
---
 drivers/mtd/spi-nor/xmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 051411e86339..b2374187ec4f 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -16,6 +16,22 @@ static const struct flash_info xmc_nor_parts[] = {
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH128C", INFO(0x204018, 0, 64 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
+	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+
 };
 
 const struct spi_nor_manufacturer spi_nor_xmc = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
