Return-Path: <SRS0=4NdN=HE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C323C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 13:25:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 127A164F5D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 13:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 127A164F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z0U3EvHcBXiAkoH5vZ9dMv9D7K9wSRh0aC4/iNJoJ58=; b=meXsNvXkLIIm1QkhA2VQsZKve4
	IqCcHPqNShSxV0t2OMWqzi4jlPNOylsSxkhx31ixKH/jLP7xwcQ6qT7DxSOQvIRNZwV9+M15x8rT7
	Qabq/Z8RxVu07eJ28N/NAjCoPRXCKcFBtPsPMVwN6Zbo6DcOq9zWPaMf9RXI04ZRsMPkhSri5Wo3L
	c8G93LMeR6Djs0qTtECcAcr7oTv1Bs66ljb+xDa7C72EFmtX3Y6ES08u1HV6/vm+JzeGjIWY8zlXI
	WLgpuST2/khJq92Oba3dRJoy2+dkdfM21Fxnpefe3x1KAnHG9WqqzcZ9I/XJP/Ez/EnfA/3ishdRD
	ZJ6trr1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6vf1-0007xZ-SO; Tue, 02 Feb 2021 13:24:03 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6veu-0007vw-LW
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2021 13:23:58 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DVQTv61gYzjFj3;
 Tue,  2 Feb 2021 21:22:43 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 21:23:39 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <p.yadav@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: spi-nor: check 4-byte address support when parsing
 4bait
Date: Tue, 2 Feb 2021 21:21:26 +0800
Message-ID: <1612272086-8523-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_082357_218827_A17E8324 
X-CRM114-Status: GOOD (  15.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: john.garry@huawei.com, linuxarm@openeuler.org, prime.zeng@huawei.com,
 yangyicong@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The spi-nor core will convert the address mode to 4-btye,
without checking whether 4-byte address is supported or not.
For example, the 16M s25fs128s1 can work under both 3-byte
and 4-byte address and provides a 4bait table. The spi-nor
will drive the flash under 4-byte address mode after parsing
the 4bait and will cause it unusable on platforms doesn't
support 4-byte.

Add checking of 4-byte address support when parsing the 4bait
table, stop converting the address mode if it's not supported.

The issue maybe addressed by moving the address mode
set and 4-byte operation check out of paring 4bait table[1],
but fix this with this patch to make the flash work properly
on some platform first.

[1] https://lore.kernel.org/linux-mtd/20210129111649.jypytpp7dkywthwh@ti.com/

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
Change since v1:
- address the comments from Pratyush

Link: https://lore.kernel.org/linux-mtd/20210129111649.jypytpp7dkywthwh@ti.com/

 drivers/mtd/spi-nor/sfdp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 6ee7719..46ce389 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -940,6 +940,25 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
 	return ret;
 }
 
+static int spi_nor_spimem_check_4byte_addr(struct spi_nor *nor,
+					   const struct spi_nor_read_command *read)
+{
+	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 0),
+					  SPI_MEM_OP_ADDR(4, 0, 1),
+					  SPI_MEM_OP_DUMMY(0, 1),
+					  SPI_MEM_OP_DATA_IN(0, NULL, 1));
+
+	spi_nor_spimem_setup_op(nor, &op, read->proto);
+
+	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
+			  op.dummy.buswidth / 8;
+
+	if (!spi_mem_supports_op(nor->spimem, &op))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 /**
  * spi_nor_parse_4bait() - parse the 4-Byte Address Instruction Table
  * @nor:		pointer to a 'struct spi_nor'.
@@ -1061,6 +1080,33 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		goto out;
 
 	/*
+	 * Check whether the 4-byte address is supported before converting
+	 * the instruction set to 4-byte.
+	 */
+	if (nor->spimem) {
+		bool support = false;
+
+		for (i = 0; i < SNOR_CMD_READ_MAX; i++) {
+			struct spi_nor_read_command read_cmd;
+
+			memcpy(&read_cmd, &params->reads[i], sizeof(read_cmd));
+
+			read_cmd.opcode = spi_nor_convert_3to4_read(read_cmd.opcode);
+			if (!spi_nor_spimem_check_4byte_addr(nor, &read_cmd)) {
+				support = true;
+				break;
+			}
+		}
+
+		/*
+		 * No supported 4-byte instruction is found, stop parsing the
+		 * 4bait table.
+		 */
+		if (!support)
+			goto out;
+	}
+
+	/*
 	 * Discard all operations from the 4-byte instruction set which are
 	 * not supported by this memory.
 	 */
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
