Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC465C10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 15:55:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C64920724
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 15:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FaTf9mC1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lUJfmMKN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C64920724
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w97WUm4fah1+mRtu+XfZgcZsj8/JOYiu3z99oEAm8Bo=; b=FaTf9mC13t/Bgw
	Ur+1gMtao+S1POn/vIQ1Ir+b6LEq0MU8dNYKGD1fJoCUDYvQ/mdZZY00UvJUfDRqyjVNfK6hU+YK+
	N2hT0uI25FwTeGuPvFQREmn3EA0UtaVKArxgngvWPCDKeO4QX4X3FEMAips3uFGP3MfAmiNFzeXpj
	5Xmb2S6OR33lHMo85iOZIfSa/H8cP5m1xW6RGdsclnGR7D/YZvJDsIrFHiVKHYUzsJrnL4JUq/Ww1
	j87eWPf4bJ5A1QmJTSbgpZlJlDs74IKhCY9ZNolhpfmMDDABDZ3fdTkIMPmCllpHu0swOB30eZiBV
	tZ8F6xyPjWJ/b3NtlOiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCmem-0001Jw-AH; Fri, 13 Mar 2020 15:55:28 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCmWi-0008TZ-EN; Fri, 13 Mar 2020 15:47:15 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DFl31q101748;
 Fri, 13 Mar 2020 10:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584114423;
 bh=ih8EylxDxHqz4oxMaem59i/w5Viy9ZWii8xoQ7cZajI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=lUJfmMKNXDnFom/JXvt7IcSo4wYECOTlnpxgciHpE2uqpr7isLLMBbC+phEjhrljK
 rq+CemuiT+x8Bp/GUIBpCEW7gkQ2NljRJRn3VJHLyzmHRj1fFZ41HDABcNf2MNFrOD
 BqRNVzKlH7VbDI0cr4B3YD6GHndgQseAGOOlrjlU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DFl3GV090171
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Mar 2020 10:47:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 10:47:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 10:47:03 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DFkkSH034352;
 Fri, 13 Mar 2020 10:46:59 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
Subject: [PATCH v3 03/12] spi: spi-mem: allow specifying a command's extension
Date: Fri, 13 Mar 2020 21:16:36 +0530
Message-ID: <20200313154645.29293-4-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200313154645.29293-1-p.yadav@ti.com>
References: <20200313154645.29293-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_084708_591375_6F0F2C96 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
the "command extension". There can be 3 types of extensions in xSPI:
repeat, invert, and hex. When the extension type is "repeat", the same
opcode is sent twice. When it is "invert", the second byte is the
inverse of the opcode. When it is "hex" an additional opcode byte based
is sent with the command whose value can be anything.

So, make opcode a 16-bit value and add a 'nbytes', similar to how
multiple address widths are handled.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 include/linux/spi/spi-mem.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index e3dcb956bf61..731bb64c6ba6 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -69,6 +69,8 @@ enum spi_mem_data_dir {
 
 /**
  * struct spi_mem_op - describes a SPI memory operation
+ * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
+ *		sent MSB-first.
  * @cmd.buswidth: number of IO lines used to transmit the command
  * @cmd.opcode: operation opcode
  * @cmd.dtr: whether the command opcode should be sent in DTR mode or not
@@ -94,9 +96,10 @@ enum spi_mem_data_dir {
  */
 struct spi_mem_op {
 	struct {
+		u8 nbytes;
 		u8 buswidth;
 		u8 dtr : 1;
-		u8 opcode;
+		u16 opcode;
 	} cmd;
 
 	struct {
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
