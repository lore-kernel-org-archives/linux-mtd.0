Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2922C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FG4IGg6xHiRWDLQBxqs1vWQ86M0p4bNFA+odBj1sDQQ=; b=dW/Md8UcEw+qwh
	sDgqTn6eLl/5UMCRsVtEw7FS+akvXak0uuIg+DS7NYMlaxsvppAT6NsJ8iQuLPQgyEOxUCnMANMJt
	10Xd2fe0ZwLSlk4lLEgmXeAHS5/W0QRdW6gzqlfIvWgQKMLGxRvNaLSjMAqnki40u5CxGxIl1Qo5a
	XUE00WTcvpNoJhLgLIrZ38fq20LOBHyxT08bRTs8O4YvAe6/koVJsNRn25O15Lw4NFIuHvFSXZyLa
	0JDaTFs7eGDd/nPHO0iSuEw7U0r/F2F3iBwTKX83S+68ZB10SuS1qNNHgErLCQQH7wlkXjESBuKVF
	WwsyDGkBnbHpbAdKJC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBaZ-00GVaK-D5; Mon, 09 May 2022 22:10:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBaU-00GVXu-59
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 22:10:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id c11so15120643plg.13
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JBUbU3uvMr/pYVL1+JMCfJAjeyoFsD104WopnfoOClU=;
 b=Y7Uxx5QXoBh7ks0HCgfPC4Mlom0rN8+1Ha5Lr3I5SuoyaIlYfgUPuIt7fqTlk/envo
 gsQ2qIVv9tuU78nHRzw638cYfg0f/wUNOLOiGW+fHEomf36AnLIQyJ3R4F+9HjNStjcO
 cyquSofH6U5xIf0DD8Tt1OGa4PDBp2WtSW0kyxvfDJQyUCdrEkJTrKQYEPXw2860sL6v
 oH7qEYO1Mts7lzoVMeuZ7cPFOM6T+QMCZ+rQ3HPDerv6BhEaWWiYV2GJfN4w1b1SmY5p
 M+5C/uDjf+QsT4kOpxsborPSTuO0TPSYHSdfLURA6TMsbblzQvj8KP6QD3JlAfHtYFDV
 NSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JBUbU3uvMr/pYVL1+JMCfJAjeyoFsD104WopnfoOClU=;
 b=WiFpbaHky2ydkXUCF4tODAZew+ok8KAo3amwAQi3DKOM2MxOzgNVNrv/VRhUzbHNxo
 dcmhqE+xQzbME445eorPx7n8+HoMqeUS7zoI231hP33D4khS/xKBegQPaiALpKMWU1MU
 l5kkAdvJkUquFXhW4qn821HpYstGOBsiRaVgEFSTPjljC06H82gckc+NECgoM3P36fFJ
 WQNqI5swFGzyZOuWrjB4240p3MqHHSSHjAYygN42qiaLWdUHWHfIj89RNRqb2fb2QJwy
 bD0CbYuCL9VUPe88Bbh03sS9WXHQDI5pH3KY5ylIW73tAjMTP3F0epXAliU7+HEDE3LK
 W7Qg==
X-Gm-Message-State: AOAM530IVLFRWdd3l7fR5GWAVoqktxCYCOiM1CR23fgvXdNO+gWgKLYy
 93/0HdU+iVEjJ4zXmpSvlsSfRPxHVwk=
X-Google-Smtp-Source: ABdhPJz9ldtlF9l5xTimSgUrn2meBUmFQomdTYbX6v1LjZ7OkVCdNPzp1HVCzGKZmR5Xc++gx8q64w==
X-Received: by 2002:a17:90b:210a:b0:1db:cbc6:ca57 with SMTP id
 kz10-20020a17090b210a00b001dbcbc6ca57mr28363999pjb.69.1652134240782; 
 Mon, 09 May 2022 15:10:40 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056a0002bb00b0050dc76281ebsm9043247pfs.197.2022.05.09.15.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:10:40 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v15 3/8] mtd: spi-nor: sfdp: Clarify that nor->read_{opcode,
 dummy} are uninitialized
Date: Tue, 10 May 2022 07:10:04 +0900
Message-Id: <cdfe160d76401fe538c42b71edb1fe338604c055.1652063152.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_151042_240976_D304EC48 
X-CRM114-Status: GOOD (  11.51  )
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

nor->read_{opcode, dummy} are uninitialized (value zero) at SFDP parsing
time. Clarify that in the code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Tested-By: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 61ae8c8c5237..058ce218d2af 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -178,12 +178,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
 static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 			     size_t len, void *buf)
 {
-	u8 addr_nbytes, read_opcode, read_dummy;
+	u8 addr_nbytes;
 	int ret;
 
-	read_opcode = nor->read_opcode;
 	addr_nbytes = nor->addr_nbytes;
-	read_dummy = nor->read_dummy;
 
 	nor->read_opcode = SPINOR_OP_RDSFDP;
 	nor->addr_nbytes = 3;
@@ -191,9 +189,10 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
 
 	ret = spi_nor_read_raw(nor, addr, len, buf);
 
-	nor->read_opcode = read_opcode;
 	nor->addr_nbytes = addr_nbytes;
-	nor->read_dummy = read_dummy;
+	/* Restore setup to its uninitialized state. */
+	nor->read_opcode = 0;
+	nor->read_dummy = 0;
 
 	return ret;
 }
@@ -690,7 +689,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 	u32 addr;
 	int err;
 	u8 i;
-	u8 addr_nbytes, read_opcode, read_dummy;
+	u8 addr_nbytes;
 	u8 read_data_mask, map_id;
 
 	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
@@ -699,8 +698,6 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 		return ERR_PTR(-ENOMEM);
 
 	addr_nbytes = nor->addr_nbytes;
-	read_dummy = nor->read_dummy;
-	read_opcode = nor->read_opcode;
 
 	map_id = 0;
 	/* Determine if there are any optional Detection Command Descriptors */
@@ -757,8 +754,9 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 out:
 	kfree(buf);
 	nor->addr_nbytes = addr_nbytes;
-	nor->read_dummy = read_dummy;
-	nor->read_opcode = read_opcode;
+	/* Restore setup to its uninitialized state. */
+	nor->read_dummy = 0;
+	nor->read_opcode = 0;
 	return ret;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
