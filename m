Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50F3C10DC1
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfWN4RmNv/EBmg2Yhf2oRYk3E/0cPto1i9+Tosv92jM=; b=Gr1qHLizkHjDlg
	NYSRaaVek+eroJge4Kj1pDpCmO+xXHwHp8R7QaUpqXuvPLQfgWPGNA/DL6bJle1LXQW7iLWZpzKIL
	NTiWCuPaWDVEUnoxYExLzEt7UaeLUS7wFyRsQizOR3bR4LfTdM8rUg0dfaojO2gdvyQeME6yx9Yl1
	vlL6UBBdDIqPiKFe7JC/rwLCE64UuyqzsrxWHaicyczWenV5iyJL2febwtU2R8Df0gVsivaBxPjlI
	WqE/bYf3NLfutGLizpX8btk++8B+kbwg3u6w11uT7l++9BxS0mp0NtBNGK6HshUSWocazx0j/lI+/
	Ry7ys9gHY8C4GgAGgR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZq-00AEX1-26;
	Thu, 30 Nov 2023 08:39:18 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZj-00AESI-25
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 08:39:13 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-35cb61de347so1670315ab.1
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 00:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701333549; x=1701938349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGIOPjWsWXffU/sU+xJxvsbx/tJ6sjXRamjNWghiIh8=;
        b=FTmGK9uywrTRqG6QjWl25PqtDZLCkO3goOOADE7GXMsyIj40BA0SHw6LdzyGjT7dbC
         DDpjXkC0xjLf6hIYOXKUDHZpZ+YtXfJZQAyoB7sMo7/HVx0bWoRg/aZs7KXol/QvKRw8
         gIaK2dvYU20A/L0CPuV0UH8V1NHTSyBWNWtR++2hmYvbVeIJ7ceNEpkyznradhLdj4xz
         x3MF0wIzaAZW6PE2vXyXs/d8d5sOU+i6fgMMrvvxDesnVQkJSXl0CiBXa9UELpmdNepO
         WyvN293QmlsUaylILFQ9gNpSNR2sGTU8wHniECin+AWU65i1yiszkd1a9xFcAFMMipuB
         hsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333549; x=1701938349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGIOPjWsWXffU/sU+xJxvsbx/tJ6sjXRamjNWghiIh8=;
        b=c/w5m8AMb/RTH1AwBPki/86ULvW5+iERLC4cs5TMxDeV86Ls7zcDWwCySSdh4UUT4l
         tqgIhIliwlb8w7safJi7BqpNpaPE9BO9CTu8dbnG2m6hQRglvqE5L4BifUES22i9UUbR
         eYQ2XlaMC9cgPYOu0IjQ3ozYIHaeThUS/UveZqxHJsa8G8N0z8xjjVfTTR9GRXcUcsnw
         yR0kywrjgOhYXUHyAh6TLrM5BgzxGTfsimGka/QWnBOeKJ+VsBS2ALFZJWMgZ++fsUl4
         k3q7Ly0alY1QcR7u52XyVugZskvIHdIWYiS/bz4+iTgTaDBLxBa9m/TWWX40AuHBNfG7
         tOZA==
X-Gm-Message-State: AOJu0Yy++Qg8TXYfKWu3F9RfEHRd2tQIPBatC5DmyliJo3HxLcUAY3cK
	r8O7YXILprVMmXT958GYDjw=
X-Google-Smtp-Source: AGHT+IEhJK7dGIr7sNeAvFO9CyCm05o0U9nWHQMJJnzsx8bbwIaYMSzegHPRpPEQ1VTFLHNJGaOZPw==
X-Received: by 2002:a92:cd4a:0:b0:35c:df90:a7d with SMTP id v10-20020a92cd4a000000b0035cdf900a7dmr12719532ilq.25.1701333549473;
        Thu, 30 Nov 2023 00:39:09 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id ff11-20020a056a002f4b00b00690ca67d429sm680814pfb.100.2023.11.30.00.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:39:09 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 6C69680697;
	Thu, 30 Nov 2023 16:38:46 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v6 4/7] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
Date: Thu, 30 Nov 2023 16:38:51 +0800
Message-Id: <20231130083854.55221-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_003911_679708_BC63E6C6 
X-CRM114-Status: GOOD (  13.76  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.

This info flag will be used as a basis to determine whether
there is byte swapping of data for SPI NOR flash in octal
DTR mode.

The controller driver will check whether byte swapping is supported
to determin whether the corresponding operation are supported, thus
avoiding the generation of unexpected data order.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 drivers/mtd/spi-nor/sfdp.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..2241207556bf 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -650,6 +650,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EOPNOTSUPP;
 	}
 
+	/* Byte order in 8D-8D-8D mode */
+	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
+		nor->flags |= SNOR_F_DTR_SWAB16;
+
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 6eb99e1cdd61..eba760941d43 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -123,6 +123,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
 #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
 #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31) /* Byte order of 16-bit words in 8D-8D-8D mode */
 
 struct sfdp_parameter_header {
 	u8		id_lsb;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
