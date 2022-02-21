Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5945EC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 07:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afr5Uiba3l/iGPavYPvrC3vK/IEMr6y6uoxR1u2se8c=; b=hxSkQihOt1lNlX
	G8yuQRX1oHfHLgf/b6NxBBSqVLHWEOZOnmJlfvag7/zTjg9tPfEV6eq5bZV+2pbe5h8ZYas8s8NxQ
	HkK/0qkUQJHlwzRxlRS3687LzHvVtZWFpRpitwVvIANfsh5bDdQPGXBoP0WR/GRurgvWIxdanoCA7
	g2ok5yxgwxpKjTlEEOk+q5KgdL0bUdIoqMOuaqdfTv+dSjz+iYnWS7AP6hx8KIaC/t4dLDzvBqzmL
	hTzwFV4XI/6gKxcwSdsXgwOO3bi5vD2aDfEaeJHeFFzCnNx/S4xCo3UD4KZlVLUDChR73k3QWI/L0
	Ky0NsLwphzxO5VEttXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2vm-003x0y-AR; Mon, 21 Feb 2022 07:16:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2vZ-003wz6-J4
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 07:16:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id b8so14307175pjb.4
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 23:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dFlHK+KHaM7etmeP1hutW8cmzLEJmJCTrxR/JpgtHQk=;
 b=loNZ/Wso3/KLIG/VOyfxHAGrLatAOVhMUhyETh/wAl7kL61zIKzdF8kM+10eIo2CMC
 x6Ei5ivmDiwWFWgCyaoi0lOZITTnuPQ5CitHJ8Y2Oov9NaWasmBy54FuU6piq55xSnMK
 snGjLG9Uom8O5ZJXq5PgAPiZNaR0xDvJPSprMIUjpccGj/ejDlLMkbdAusfPoa7mHik7
 F19dGtfsHdnAn2HmMArJpfBPTofvmySYzW+zA6ySbuCgcfPH++M+irh143hZr9l5/MEY
 l/V82FpIcl3ICYnbOqTBJ/5PVM0AQjlNyaFMherMGR/8+h5Y28J4HGbLVynWrKBv36t+
 yyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dFlHK+KHaM7etmeP1hutW8cmzLEJmJCTrxR/JpgtHQk=;
 b=7Jx3EM2+j0V8yPO3v4NEGDHn4Oym2X0j0uOTURRfWbzVDHXYO3q2/9XK29phc8dqhd
 s+6YXh78mvM8NrihyKhBgPwIzsFAXa2pNwLwWAfSFwswIP25Crhwhe74bPuZUj3TdRjx
 RJ1CN4N36haQEBJGkTn5u0nc4lMhCQsnoNUnHbIaZXOjdjv042q6XMb1NZHFJdGOPTRE
 jxlGUSVeKrgJjyiIoDfkK8e1d9FhBK3tkB7TwGt/PYCekN8lVyTMwUyVAmS00KgR9hJ4
 2JmL3ZbX1be9lfc4WVdZx+gwWyu7NWuiJurLr36usP1vWwR2ppYnB1206aFZ95mCfpJ4
 97ug==
X-Gm-Message-State: AOAM530LFYN9W+fOwihVRKKH7d3nODYFzdU8aUM9S0NihConTG/RTMSf
 Tk8EA/nO1zgInkxxi8VsIyqkv2RQCgg=
X-Google-Smtp-Source: ABdhPJz6skDooUJ8YQzQxJl6b4wUHU4bbMbl5e9sfC33/O7PqR03LZ/FRFuRsbs12UDzcAaNKDLJVg==
X-Received: by 2002:a17:902:8e88:b0:14f:b460:ec02 with SMTP id
 bg8-20020a1709028e8800b0014fb460ec02mr4462971plb.35.1645427768542; 
 Sun, 20 Feb 2022 23:16:08 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id f16sm12323326pfa.147.2022.02.20.23.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:16:08 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v8 1/3] mtd: spi-nor: spansion: Add support for Read Any
 Register
Date: Mon, 21 Feb 2022 16:14:10 +0900
Message-Id: <68be63ddb8300438d2d73d63791c0fbd61ce61c9.1645426789.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
References: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_231609_653570_DC460539 
X-CRM114-Status: GOOD (  12.84  )
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

The Read Any Register instruction (65h) is followed by register address
and dummy cycles, then the selected register byte is returned. This patch
adds a spi_mem_op template for that. The spi_mem_op is passed to
spi_nor_read_reg() introduced by:
https://lore.kernel.org/linux-mtd/20220210023334.408926-1-tudor.ambarus@microchip.com/T/#m05d56c77f8d55eb6f3dee4cb138bde4ff390d6c1

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v8:
  - Remove controller_ops
  - Remove spansion_read/write_any_reg()
  - Add spi_mem_op macro for Read Any Register
  
Changes in v7:
  - No change

Changes in v6:
  - Add helper functions for controller_ops
  - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
  - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
    function header comment

Changes in v5:
  - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()

Changes in v4:
  - Fix dummy cycle calculation in spansion_read_any_reg()
  - Modify comment for spansion_write_any_reg()
  
Changes in v3:
  - Cleanup implementation

 drivers/mtd/spi-nor/spansion.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 9bb239f1e142..9040edf7359f 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -20,6 +20,11 @@
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
 /* Spansion/Cypress SPI NOR flash operations. */
+#define SPI_NOR_SPANSION_RD_ANY_REG_OP(naddr, addr, ndummy, ndata, buf)	\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
+		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
+		   SPI_MEM_OP_DATA_IN(ndata, buf, 0))
 #define SPI_NOR_SPANSION_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),		\
 		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
