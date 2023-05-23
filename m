Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E730C77B73
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 03:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EqSZNeVktqv8Lh9JIm5XWIhfPdMsn7QgGFLbkBcrsQ0=; b=s8FiXBLXd46o0y
	l181MUHSA03vVArrawJ6+vC8UpaL0ww0gQuVgJt10Qc2xnxYV1hAFJRBZ//roX2GTpJK94hf3beNI
	GvCQiSiCYF1s7aQ6viBGpYRQJxMu/i4vb/DqjQk564akvZIqXUHd3csyVlmaHbjh+uruRd9e41RVl
	kCa5LouehWzwG1mYL8tTrBNM1FBx3Hnon4rLJZIuPi+v0/xYoh8b5squO20zq7/G0ZHm3IwRcnu6n
	iGM9f50X2oa/voQ/aFfr0uMLzxmmdCRTiktSMiv2MKlq3vJSYkyNYY8wRLAl7Y10R7ZUjpI7XJLcm
	YxqY1R7FmMDzbQSr/4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1IaS-008mxa-31;
	Tue, 23 May 2023 03:21:24 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1IaP-008mvp-07
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 03:21:23 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 163F22C04A5;
	Tue, 23 May 2023 15:21:05 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1684812065;
	bh=PvacrSuZu2RET2CmOngVt/QPNG7tALbTJoLo7+/4eIc=;
	h=From:To:Cc:Subject:Date:From;
	b=BFamZ64ekRb3dM58kiAyPEuxOGFjByrYaY+BRpA/lKLvTa3YzaeFZebzy0p6JHDc0
	 DogCmal9IN40R2E0RHbaUk+GjrTkx6Z/2jWhjnKRvciiX+rtxWbulbXbTi8DIe3ZRf
	 vEQ/gF/7QFCXNnh0gqn2dPHOq/9jB+FBjqRb06ojzM3rgnYEn4dE5FIJrB4YeJ3Pkk
	 UZWuE/vRSiprfK6nAEyGRyowPGjNHMBDfRfRKs2AmjKJjQ2E19cipc/woc9WnEsRt9
	 rllrn+x9F4Spoy6oGYTjL6D0RscBvmSZRwIofnNYn467x2T3uCTJfHca//EFZx5hfi
	 JWbEtOHGCJEow==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B646c31200000>; Tue, 23 May 2023 15:21:04 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id D64A113EDE9;
	Tue, 23 May 2023 15:21:04 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id D219C283910; Tue, 23 May 2023 15:21:04 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] mtd: rawnand: marvell: ensure timing values are written
Date: Tue, 23 May 2023 15:21:03 +1200
Message-Id: <20230523032103.208213-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=P0xRbXHiH_UA:10 a=P-IC7800AAAA:8 a=txcOHvV6KX-ElXq2eNMA:9 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_202121_553741_9120BB62 
X-CRM114-Status: GOOD (  12.56  )
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

 drivers/mtd/nand/raw/marvell_nand.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index afb424579f0b..3b5e4d5d220f 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2457,6 +2457,12 @@ static int marvell_nfc_setup_interface(struct nand_chip *chip, int chipnr,
 			NDTR1_WAIT_MODE;
 	}
 
+	/*
+	 * Reset nfc->selected_chip so the next command will cause the timing
+	 * registers to be restored in marvell_nfc_select_target().
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
