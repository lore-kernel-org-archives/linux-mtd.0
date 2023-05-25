Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324ECC77B73
	for <linux-mtd@archiver.kernel.org>; Thu, 25 May 2023 00:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TWECaWCmHe/wHtO2eKQlSqDWeSgx69A410mXhVA93Oc=; b=hgqkuG43uztLiw
	uW3R0GTSEnRtv9ELsJMesUS4zaN0ynxxd2D4kLe3pOn8P4ULoXW+GAlqbVnCMFpENYUZThCSfUYha
	Dw6PoUOsCBXDMqP6l0DJZN5fhWu1DTz4X/VauAJLhy2K/ITeLVOg0O1pnsrtohp01c3BweTK+up3m
	ebgNfKA3GDUuZ3f5FQtJ7+izpRnlm8I61RS1Ug780V4kPxkoJmfKhy+Y6c6GDgwRAdLRWt78tX6Qx
	Vvg1OcxECmtS+TM4jSvPXe3Ezzr+g3WLJslW+RFahjdrvt8cG1SfLlw5i2Bs5KAf/pLUU2+cmixce
	QfQdxrozUXOrhsoasuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ytj-00F58C-0X;
	Thu, 25 May 2023 00:32:07 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ytf-00F57K-0S
	for linux-mtd@lists.infradead.org;
	Thu, 25 May 2023 00:32:05 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C401C2C0288;
	Thu, 25 May 2023 12:31:57 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1684974717;
	bh=Lvr1PvxyEMKfKUGJolqQlJ6+ld4nzaPBzJ+1S/SPA/0=;
	h=From:To:Cc:Subject:Date:From;
	b=sNaiXdW98mQypYzw+clMx7vlTcQeyVcQVkVPHoLe6qmSidvGHc7/1NtlxJHC/hOf+
	 /rrhkl+DZC3Z5MhS2nnmwAOyUHRSyjLzIcIcdSV2Yu00qOVzTH6sB0X2p55Rc+IkHq
	 Xr5ZbVi2pUxq5P2vFv9VGxvmGDwEeyehXJlsQntfP1aMoF9NGiVomTcek93lEv05Qf
	 uAQGiYsKDn6D04RifJP6y9SLSNlLCSBuZrvnKgdBX9bJE15tDWuw8IsoWBNWwH5sD0
	 yb8KlJtlFYak7j7MtQAsTiw5LGJjOop0cfi/DnFzEefGfrlxh3y37Bxt7MW/ijq9PC
	 cJE0lS3at4wOg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B646eac7d0000>; Thu, 25 May 2023 12:31:57 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 929A913EDE9;
	Thu, 25 May 2023 12:31:57 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 8E441281CC2; Thu, 25 May 2023 12:31:57 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/2] mtd: rawnand: marvell: ensure timing values are written
Date: Thu, 25 May 2023 12:31:52 +1200
Message-Id: <20230525003154.2303012-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=P-IC7800AAAA:8 a=txcOHvV6KX-ElXq2eNMA:9 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_173203_674821_9696BB0D 
X-CRM114-Status: GOOD (  12.94  )
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

When new timing values are calculated in marvell_nfc_setup_interface()
ensure that they will be applied in marvell_nfc_select_target() by
clearing the selected_chip pointer.

Fixes: b25251414f6e ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This at least gets me to a point where I can illustrated the problem
    reported to me. It appears that despite the chip correctly reporting
    support for SDR timing modes up to 4 the observed tWC is 20ns. I've not
    seen any actual problem running in this state the only complaint is that
    the datasheet says the minimum tWC is 25ns.
    
    If I make a change to my bootloader such that the NAND Clock Frequency
    Select bit (0xF2440700:0) to 1 before booting the kernel _and_ I remove
    the extra factor of 2 from the period_ns calculation I observe tWC of
    about 60ns. If I don't remove the factor of 2 the NAND interface doesn't
    work (can't write BBT).
    
    Changes in v3:
    - none
    Changes in v2:
    - reword comment per suggestion from Miquel, add fixes tag

 drivers/mtd/nand/raw/marvell_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index afb424579f0b..f1fcf136ad03 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2457,6 +2457,12 @@ static int marvell_nfc_setup_interface(struct nand_chip *chip, int chipnr,
 			NDTR1_WAIT_MODE;
 	}
 
+	/*
+	 * Reset nfc->selected_chip so the next command will cause the timing
+	 * registers to be updated in marvell_nfc_select_target().
+	 */
+	nfc->selected_chip = NULL;
+
 	return 0;
 }
 
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
